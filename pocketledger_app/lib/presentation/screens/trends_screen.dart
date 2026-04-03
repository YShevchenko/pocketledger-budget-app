import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/constants.dart';
import '../../core/theme/app_colors.dart';
import '../../data/database/app_database.dart';

class TrendsScreen extends StatefulWidget {
  const TrendsScreen({super.key});

  @override
  State<TrendsScreen> createState() => _TrendsScreenState();
}

class _TrendsScreenState extends State<TrendsScreen> {
  int _periodDays = 30;
  List<_DayStat> _stats = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final db = await AppDatabase.database;
      final now = DateTime.now();
      final start = DateTime(now.year, now.month, now.day)
          .subtract(Duration(days: _periodDays - 1));

      final rows = await db.rawQuery(
        '''
        SELECT
          substr(date, 1, 10) AS day,
          COALESCE(SUM(CASE WHEN isExpense = 1 THEN amount ELSE 0 END), 0) AS total
        FROM $kTransactionsTable
        WHERE date >= ? AND isExpense = 1
        GROUP BY substr(date, 1, 10)
        ORDER BY day ASC
        ''',
        [start.toIso8601String()],
      );

      // Build a full list (fill in zero days)
      final Map<String, double> byDay = {
        for (final r in rows)
          r['day'] as String: (r['total'] as num).toDouble(),
      };

      final stats = <_DayStat>[];
      for (int i = 0; i < _periodDays; i++) {
        final day = start.add(Duration(days: i));
        final key =
            '${day.year}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}';
        stats.add(_DayStat(day: day, total: byDay[key] ?? 0));
      }

      if (mounted) {
        setState(() {
          _stats = stats;
          _isLoading = false;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withAlpha(178),
        automaticallyImplyLeading: false,
        title: Text(
          'SPENDING TRENDS',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
              ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: AppColors.primary),
            onPressed: _loadData,
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          // Period selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                _PeriodChip(
                  label: '7 days',
                  selected: _periodDays == 7,
                  onTap: () => _selectPeriod(7),
                ),
                const SizedBox(width: 8),
                _PeriodChip(
                  label: '30 days',
                  selected: _periodDays == 30,
                  onTap: () => _selectPeriod(30),
                ),
                const SizedBox(width: 8),
                _PeriodChip(
                  label: '90 days',
                  selected: _periodDays == 90,
                  onTap: () => _selectPeriod(90),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Summary card
          if (!_isLoading) _buildSummaryRow(),

          const SizedBox(height: 24),

          // Chart
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 24, 24),
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    )
                  : _buildChart(),
            ),
          ),
        ],
      ),
    );
  }

  void _selectPeriod(int days) {
    if (_periodDays == days) return;
    setState(() => _periodDays = days);
    _loadData();
  }

  Widget _buildSummaryRow() {
    final total = _stats.fold(0.0, (s, d) => s + d.total);
    final nonZero = _stats.where((d) => d.total > 0).length;
    final avgPerDay = nonZero > 0 ? total / nonZero : 0.0;
    final maxDay = _stats.isEmpty
        ? null
        : _stats.reduce((a, b) => a.total > b.total ? a : b);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          _StatCard(
            label: 'TOTAL',
            value: '\$${total.toStringAsFixed(0)}',
            color: AppColors.primary,
          ),
          const SizedBox(width: 12),
          _StatCard(
            label: 'AVG/DAY',
            value: '\$${avgPerDay.toStringAsFixed(0)}',
            color: AppColors.tertiary,
          ),
          const SizedBox(width: 12),
          _StatCard(
            label: 'PEAK',
            value: maxDay != null && maxDay.total > 0
                ? '\$${maxDay.total.toStringAsFixed(0)}'
                : '\$0',
            color: AppColors.secondary,
          ),
        ],
      ),
    );
  }

  Widget _buildChart() {
    if (_stats.isEmpty || _stats.every((s) => s.total == 0)) {
      return Center(
        child: Text(
          'No spending data for this period.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
        ),
      );
    }

    final maxY = _stats.map((s) => s.total).reduce((a, b) => a > b ? a : b);
    final spots = <FlSpot>[];
    for (int i = 0; i < _stats.length; i++) {
      spots.add(FlSpot(i.toDouble(), _stats[i].total));
    }

    // Label interval: show ~5 labels
    final labelInterval = (_periodDays / 5).ceil().toDouble();

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: (_periodDays - 1).toDouble(),
        minY: 0,
        maxY: maxY * 1.2,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: maxY / 4,
          getDrawingHorizontalLine: (_) => FlLine(
            color: AppColors.outlineVariant.withAlpha(80),
            strokeWidth: 1,
          ),
        ),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 44,
              interval: maxY / 4,
              getTitlesWidget: (value, meta) {
                if (value == 0) return const SizedBox.shrink();
                return Text(
                  '\$${value.toInt()}',
                  style: const TextStyle(
                    color: AppColors.onSurfaceVariant,
                    fontSize: 10,
                  ),
                );
              },
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              interval: labelInterval,
              getTitlesWidget: (value, meta) {
                final idx = value.toInt();
                if (idx < 0 || idx >= _stats.length) {
                  return const SizedBox.shrink();
                }
                final day = _stats[idx].day;
                return Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    '${day.month}/${day.day}',
                    style: const TextStyle(
                      color: AppColors.onSurfaceVariant,
                      fontSize: 10,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (_) => AppColors.surfaceContainerHighest,
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((s) {
                final idx = s.x.toInt();
                final day = idx >= 0 && idx < _stats.length
                    ? _stats[idx].day
                    : null;
                final label = day != null
                    ? '${day.month}/${day.day}\n\$${s.y.toStringAsFixed(2)}'
                    : '\$${s.y.toStringAsFixed(2)}';
                return LineTooltipItem(
                  label,
                  const TextStyle(color: AppColors.primary, fontSize: 12),
                );
              }).toList();
            },
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            curveSmoothness: 0.35,
            color: AppColors.primary,
            barWidth: 2.5,
            dotData: FlDotData(
              show: _periodDays <= 30,
              getDotPainter: (spot, percent, bar, index) =>
                  FlDotCirclePainter(
                radius: 3,
                color: AppColors.primary,
                strokeWidth: 0,
              ),
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primary.withAlpha(80),
                  AppColors.primary.withAlpha(0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DayStat {
  final DateTime day;
  final double total;
  const _DayStat({required this.day, required this.total});
}

class _PeriodChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _PeriodChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primary.withAlpha(25)
              : AppColors.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(20),
          border: selected
              ? Border.all(color: AppColors.primary, width: 1.5)
              : Border.all(color: AppColors.outlineVariant.withAlpha(60)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? AppColors.primary : AppColors.onSurfaceVariant,
            fontSize: 12,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: AppColors.onSurfaceVariant,
                fontSize: 9,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

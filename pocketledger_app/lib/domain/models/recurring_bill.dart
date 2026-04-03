class RecurringBill {
  final String id;
  final String envelopeId;
  final String name;
  final double amount;
  final int dayOfMonth;
  final bool isActive;
  final DateTime? lastProcessedDate;
  final DateTime createdAt;

  const RecurringBill({
    required this.id,
    required this.envelopeId,
    required this.name,
    required this.amount,
    required this.dayOfMonth,
    this.isActive = true,
    this.lastProcessedDate,
    required this.createdAt,
  });

  RecurringBill copyWith({
    String? id,
    String? envelopeId,
    String? name,
    double? amount,
    int? dayOfMonth,
    bool? isActive,
    DateTime? lastProcessedDate,
    DateTime? createdAt,
  }) {
    return RecurringBill(
      id: id ?? this.id,
      envelopeId: envelopeId ?? this.envelopeId,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      dayOfMonth: dayOfMonth ?? this.dayOfMonth,
      isActive: isActive ?? this.isActive,
      lastProcessedDate: lastProcessedDate ?? this.lastProcessedDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'envelopeId': envelopeId,
      'name': name,
      'amount': amount,
      'dayOfMonth': dayOfMonth,
      'isActive': isActive ? 1 : 0,
      'lastProcessedDate': lastProcessedDate?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory RecurringBill.fromMap(Map<String, dynamic> map) {
    return RecurringBill(
      id: map['id'] as String,
      envelopeId: map['envelopeId'] as String,
      name: map['name'] as String,
      amount: (map['amount'] as num).toDouble(),
      dayOfMonth: map['dayOfMonth'] as int,
      isActive: (map['isActive'] as int?) == 1,
      lastProcessedDate: map['lastProcessedDate'] != null
          ? DateTime.parse(map['lastProcessedDate'] as String)
          : null,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory RecurringBill.fromJson(Map<String, dynamic> json) =>
      RecurringBill.fromMap(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is RecurringBill && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

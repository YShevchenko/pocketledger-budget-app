import 'package:flutter/material.dart';

class Envelope {
  final String id;
  final String name;
  final double budgetAmount;
  final double spentAmount;
  final int colorValue;
  final String icon;
  final int sortOrder;
  final DateTime createdAt;

  const Envelope({
    required this.id,
    required this.name,
    required this.budgetAmount,
    this.spentAmount = 0.0,
    required this.colorValue,
    this.icon = 'account_balance_wallet',
    this.sortOrder = 0,
    required this.createdAt,
  });

  double get remainingAmount => budgetAmount - spentAmount;
  bool get isOverspent => spentAmount > budgetAmount;
  double get spentPercentage =>
      budgetAmount > 0 ? (spentAmount / budgetAmount).clamp(0.0, 2.0) : 0.0;

  Color get color => Color(colorValue);

  Envelope copyWith({
    String? id,
    String? name,
    double? budgetAmount,
    double? spentAmount,
    int? colorValue,
    String? icon,
    int? sortOrder,
    DateTime? createdAt,
  }) {
    return Envelope(
      id: id ?? this.id,
      name: name ?? this.name,
      budgetAmount: budgetAmount ?? this.budgetAmount,
      spentAmount: spentAmount ?? this.spentAmount,
      colorValue: colorValue ?? this.colorValue,
      icon: icon ?? this.icon,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'budgetAmount': budgetAmount,
      'spentAmount': spentAmount,
      'colorValue': colorValue,
      'icon': icon,
      'sortOrder': sortOrder,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Envelope.fromMap(Map<String, dynamic> map) {
    return Envelope(
      id: map['id'] as String,
      name: map['name'] as String,
      budgetAmount: (map['budgetAmount'] as num).toDouble(),
      spentAmount: (map['spentAmount'] as num?)?.toDouble() ?? 0.0,
      colorValue: map['colorValue'] as int,
      icon: map['icon'] as String? ?? 'account_balance_wallet',
      sortOrder: map['sortOrder'] as int? ?? 0,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory Envelope.fromJson(Map<String, dynamic> json) =>
      Envelope.fromMap(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Envelope && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

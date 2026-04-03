class Transaction {
  final String id;
  final String envelopeId;
  final double amount;
  final String description;
  final DateTime date;
  final String? receiptPath;
  final bool isRecurring;
  final String? recurringBillId;
  final bool isExpense;
  final bool isCleared;

  const Transaction({
    required this.id,
    required this.envelopeId,
    required this.amount,
    this.description = '',
    required this.date,
    this.receiptPath,
    this.isRecurring = false,
    this.recurringBillId,
    this.isExpense = true,
    this.isCleared = false,
  });

  Transaction copyWith({
    String? id,
    String? envelopeId,
    double? amount,
    String? description,
    DateTime? date,
    String? receiptPath,
    bool? isRecurring,
    String? recurringBillId,
    bool? isExpense,
    bool? isCleared,
  }) {
    return Transaction(
      id: id ?? this.id,
      envelopeId: envelopeId ?? this.envelopeId,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      date: date ?? this.date,
      receiptPath: receiptPath ?? this.receiptPath,
      isRecurring: isRecurring ?? this.isRecurring,
      recurringBillId: recurringBillId ?? this.recurringBillId,
      isExpense: isExpense ?? this.isExpense,
      isCleared: isCleared ?? this.isCleared,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'envelopeId': envelopeId,
      'amount': amount,
      'description': description,
      'date': date.toIso8601String(),
      'receiptPath': receiptPath,
      'isRecurring': isRecurring ? 1 : 0,
      'recurringBillId': recurringBillId,
      'isExpense': isExpense ? 1 : 0,
      'isCleared': isCleared ? 1 : 0,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'] as String,
      envelopeId: map['envelopeId'] as String,
      amount: (map['amount'] as num).toDouble(),
      description: map['description'] as String? ?? '',
      date: DateTime.parse(map['date'] as String),
      receiptPath: map['receiptPath'] as String?,
      isRecurring: (map['isRecurring'] as int?) == 1,
      recurringBillId: map['recurringBillId'] as String?,
      isExpense: (map['isExpense'] as int?) != 0, // default true if missing
      isCleared: (map['isCleared'] as int?) == 1,
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      Transaction.fromMap(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Transaction && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

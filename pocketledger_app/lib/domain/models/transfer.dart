class Transfer {
  final String id;
  final String fromEnvelopeId;
  final String toEnvelopeId;
  final double amount;
  final String? note;
  final DateTime date;

  const Transfer({
    required this.id,
    required this.fromEnvelopeId,
    required this.toEnvelopeId,
    required this.amount,
    this.note,
    required this.date,
  });

  Transfer copyWith({
    String? id,
    String? fromEnvelopeId,
    String? toEnvelopeId,
    double? amount,
    String? note,
    DateTime? date,
  }) {
    return Transfer(
      id: id ?? this.id,
      fromEnvelopeId: fromEnvelopeId ?? this.fromEnvelopeId,
      toEnvelopeId: toEnvelopeId ?? this.toEnvelopeId,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fromEnvelopeId': fromEnvelopeId,
      'toEnvelopeId': toEnvelopeId,
      'amount': amount,
      'note': note,
      'date': date.toIso8601String(),
    };
  }

  factory Transfer.fromMap(Map<String, dynamic> map) {
    return Transfer(
      id: map['id'] as String,
      fromEnvelopeId: map['fromEnvelopeId'] as String,
      toEnvelopeId: map['toEnvelopeId'] as String,
      amount: (map['amount'] as num).toDouble(),
      note: map['note'] as String?,
      date: DateTime.parse(map['date'] as String),
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory Transfer.fromJson(Map<String, dynamic> json) =>
      Transfer.fromMap(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Transfer && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

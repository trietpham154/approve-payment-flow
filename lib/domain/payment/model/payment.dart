import 'package:approve_payment_flow/domain/payment/model/payment_status.dart';

class Payment {
  final String id;
  final String recipientName;
  final double amount;
  final String currency;
  final String reference;
  final String? note;
  final PaymentStatus status;
  final DateTime createdAt;
  final DateTime? decidedAt;

  const Payment({
    required this.id,
    required this.recipientName,
    required this.amount,
    required this.currency,
    required this.reference,
    this.note,
    required this.status,
    required this.createdAt,
    this.decidedAt,
  });

  bool get isPending => status.isPending;
  bool get isApproved => status.isApproved;
  bool get isRejected => status.isRejected;

  String get maskedRecipientName {
    final parts = recipientName.trim().split(' ');
    if (parts.isEmpty || parts.first.isEmpty) return '••••';

    final first = parts.first;
    final maskedFirst = first.length > 1
        ? '${first[0]}${'•' * (first.length - 1)}'
        : first;

    if (parts.length > 1) {
      final last = parts.last;
      return '$maskedFirst $last';
    }
    return maskedFirst;
  }

  String get maskedAmount => '$currency ••,••••';

  Payment copyWith({
    String? id,
    String? recipientName,
    double? amount,
    String? currency,
    String? reference,
    String? note,
    PaymentStatus? status,
    DateTime? createdAt,
    DateTime? decidedAt,
  }) {
    return Payment(
      id: id ?? this.id,
      recipientName: recipientName ?? this.recipientName,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      reference: reference ?? this.reference,
      note: note ?? this.note,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      decidedAt: decidedAt ?? this.decidedAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Payment &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          recipientName == other.recipientName &&
          amount == other.amount &&
          currency == other.currency &&
          reference == other.reference &&
          note == other.note &&
          status == other.status &&
          createdAt == other.createdAt &&
          decidedAt == other.decidedAt;

  @override
  int get hashCode => Object.hash(
        id,
        recipientName,
        amount,
        currency,
        reference,
        note,
        status,
        createdAt,
        decidedAt,
      );

  @override
  String toString() =>
      'Payment(id: $id, recipient: $recipientName, amount: $currency $amount, status: $status, ref: $reference)';
}

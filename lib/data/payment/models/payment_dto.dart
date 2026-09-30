import 'package:drift/drift.dart';
import 'package:approve_payment_flow/data/payment/datasources/local/app_database.dart';
import 'package:approve_payment_flow/domain/payment/model/payment.dart';
import 'package:approve_payment_flow/domain/payment/model/payment_status.dart';

extension PaymentsTableDataMapper on PaymentsTableData {
  Payment toDomain() {
    return Payment(
      id: id,
      recipientName: recipientName,
      amount: amount,
      currency: currency,
      reference: reference,
      note: note,
      status: _statusFromString(status),
      createdAt: createdAt,
      decidedAt: decidedAt,
    );
  }

  static PaymentStatus _statusFromString(String rawStatus) {
    return switch (rawStatus.toLowerCase()) {
      'approved' => PaymentStatus.approved,
      'rejected' => PaymentStatus.rejected,
      _ => PaymentStatus.pending,
    };
  }
}

extension PaymentDomainMapper on Payment {
  PaymentsTableCompanion toCompanion() {
    return PaymentsTableCompanion(
      id: Value(id),
      recipientName: Value(recipientName),
      amount: Value(amount),
      currency: Value(currency),
      reference: Value(reference),
      note: Value(note),
      status: Value(status.name),
      createdAt: Value(createdAt),
      decidedAt: Value(decidedAt),
    );
  }
}

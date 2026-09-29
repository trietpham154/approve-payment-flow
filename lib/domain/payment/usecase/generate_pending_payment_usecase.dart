import 'dart:math';
import 'package:approve_payment_flow/core/result.dart';
import 'package:approve_payment_flow/domain/payment/model/payment.dart';
import 'package:approve_payment_flow/domain/payment/model/payment_failure.dart';
import 'package:approve_payment_flow/domain/payment/model/payment_status.dart';
import 'package:approve_payment_flow/domain/payment/repository/payment_approval_repository.dart';

class GeneratePendingPaymentUseCase {
  final PaymentApprovalRepository _repository;
  final Random _random;

  GeneratePendingPaymentUseCase(
    this._repository, [
    Random? random,
  ]) : _random = random ?? Random();

  static final List<({String name, double amount, String note})> _presets = [
    (name: 'Ahmed K.', amount: 1200.0, note: 'Design retainer'),
    (name: 'Sara M.', amount: 340.0, note: 'Cloud infrastructure renewal'),
    (name: 'Leo D.', amount: 900.0, note: 'Office supplies'),
    (name: 'Fatima Z.', amount: 2450.0, note: 'Q3 Security audit fee'),
    (name: 'Omar H.', amount: 175.50, note: 'Domain registry renewal'),
    (name: 'Noor A.', amount: 820.0, note: 'Contractor payment'),
  ];

  Future<Result<Payment, PaymentFailure>> call() {
    final preset = _presets[_random.nextInt(_presets.length)];
    final refNumber = 'PAY-${10000 + _random.nextInt(89999)}';
    final id = 'payment_${DateTime.now().millisecondsSinceEpoch}';

    final payment = Payment(
      id: id,
      recipientName: preset.name,
      amount: preset.amount,
      currency: 'AED',
      reference: refNumber,
      note: preset.note,
      status: PaymentStatus.pending,
      createdAt: DateTime.now(),
    );

    return _repository.createPendingPayment(payment);
  }
}

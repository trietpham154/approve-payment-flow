import 'package:approve_payment_flow/core/result.dart';
import 'package:approve_payment_flow/domain/payment/model/payment.dart';
import 'package:approve_payment_flow/domain/payment/model/payment_failure.dart';

abstract interface class PaymentApprovalRepository {
  Stream<List<Payment>> watchDecidedPayments();

  Stream<Payment?> watchActivePendingPayment();

  Future<Result<Payment, PaymentFailure>> getPaymentById(String id);

  Future<Result<Payment, PaymentFailure>> approvePayment(String id);

  Future<Result<Payment, PaymentFailure>> rejectPayment(String id);

  Future<Result<Payment, PaymentFailure>> createPendingPayment(Payment payment);
}

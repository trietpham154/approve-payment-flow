import 'package:approve_payment_flow/core/result.dart';
import 'package:approve_payment_flow/domain/payment/model/payment.dart';
import 'package:approve_payment_flow/domain/payment/model/payment_failure.dart';
import 'package:approve_payment_flow/domain/payment/repository/payment_approval_repository.dart';

class ApprovePaymentUseCase {
  final PaymentApprovalRepository _repository;

  const ApprovePaymentUseCase(this._repository);

  Future<Result<Payment, PaymentFailure>> call(String id) {
    return _repository.approvePayment(id);
  }
}

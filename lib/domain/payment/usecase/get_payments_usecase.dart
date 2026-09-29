import 'package:approve_payment_flow/domain/payment/model/payment.dart';
import 'package:approve_payment_flow/domain/payment/repository/payment_approval_repository.dart';

class GetPaymentsUseCase {
  final PaymentApprovalRepository _repository;

  const GetPaymentsUseCase(this._repository);

  Stream<List<Payment>> call() {
    return _repository.watchDecidedPayments();
  }
}

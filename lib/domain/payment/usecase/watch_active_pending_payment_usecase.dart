import 'package:approve_payment_flow/domain/payment/model/payment.dart';
import 'package:approve_payment_flow/domain/payment/repository/payment_approval_repository.dart';

class WatchActivePendingPaymentUseCase {
  final PaymentApprovalRepository _repository;

  const WatchActivePendingPaymentUseCase(this._repository);

  Stream<Payment?> call() {
    return _repository.watchActivePendingPayment();
  }
}

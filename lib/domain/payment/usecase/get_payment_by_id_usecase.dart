import 'package:approve_payment_flow/core/result.dart';
import 'package:approve_payment_flow/domain/payment/model/payment.dart';
import 'package:approve_payment_flow/domain/payment/model/payment_failure.dart';
import 'package:approve_payment_flow/domain/payment/repository/payment_approval_repository.dart';

class GetPaymentByIdUseCase {
  final PaymentApprovalRepository _repository;

  const GetPaymentByIdUseCase(this._repository);

  Future<Result<Payment, PaymentFailure>> call(String id) async {
    final result = await _repository.getPaymentById(id);
    return result.fold(
      onSuccess: (payment) {
        if (payment.isPending) {
          return const Failure(
            PaymentAlreadyDecidedFailure(
              'Pending payments cannot be viewed in payment details',
            ),
          );
        }
        return Success(payment);
      },
      onFailure: (failure) => Failure(failure),
    );
  }
}

sealed class PaymentFailure {
  final String message;
  const PaymentFailure(this.message);

  @override
  String toString() => '$runtimeType: $message';
}

final class PaymentNotFoundFailure extends PaymentFailure {
  const PaymentNotFoundFailure([super.message = 'Payment not found']);
}

final class PaymentAuthenticationFailure extends PaymentFailure {
  const PaymentAuthenticationFailure([super.message = 'Device authentication failed or cancelled']);
}

final class PaymentAlreadyDecidedFailure extends PaymentFailure {
  const PaymentAlreadyDecidedFailure([super.message = 'Payment has already been approved or rejected']);
}

final class PaymentStorageFailure extends PaymentFailure {
  const PaymentStorageFailure([super.message = 'Failed to persist payment update']);
}

final class UnexpectedPaymentFailure extends PaymentFailure {
  const UnexpectedPaymentFailure([super.message = 'An unexpected payment error occurred']);
}

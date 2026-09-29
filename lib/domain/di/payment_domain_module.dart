import 'package:approve_payment_flow/core/di/dependency_injection.dart';
import 'package:approve_payment_flow/domain/payment/repository/payment_approval_repository.dart';
import 'package:approve_payment_flow/domain/payment/usecase/approve_payment_usecase.dart';
import 'package:approve_payment_flow/domain/payment/usecase/generate_pending_payment_usecase.dart';
import 'package:approve_payment_flow/domain/payment/usecase/get_home_summary_usecase.dart';
import 'package:approve_payment_flow/domain/payment/usecase/get_payment_by_id_usecase.dart';
import 'package:approve_payment_flow/domain/payment/usecase/get_payments_usecase.dart';
import 'package:approve_payment_flow/domain/payment/usecase/reject_payment_usecase.dart';
import 'package:approve_payment_flow/domain/payment/usecase/watch_active_pending_payment_usecase.dart';

void registerPaymentDomainModule() {
  getIt.registerFactory<GetPaymentsUseCase>(
    () => GetPaymentsUseCase(getIt<PaymentApprovalRepository>()),
  );

  getIt.registerFactory<GetHomeSummaryUseCase>(
    () => GetHomeSummaryUseCase(getIt<PaymentApprovalRepository>()),
  );

  getIt.registerFactory<WatchActivePendingPaymentUseCase>(
    () => WatchActivePendingPaymentUseCase(getIt<PaymentApprovalRepository>()),
  );

  getIt.registerFactory<ApprovePaymentUseCase>(
    () => ApprovePaymentUseCase(getIt<PaymentApprovalRepository>()),
  );

  getIt.registerFactory<RejectPaymentUseCase>(
    () => RejectPaymentUseCase(getIt<PaymentApprovalRepository>()),
  );

  getIt.registerFactory<GetPaymentByIdUseCase>(
    () => GetPaymentByIdUseCase(getIt<PaymentApprovalRepository>()),
  );

  getIt.registerFactory<GeneratePendingPaymentUseCase>(
    () => GeneratePendingPaymentUseCase(getIt<PaymentApprovalRepository>()),
  );
}

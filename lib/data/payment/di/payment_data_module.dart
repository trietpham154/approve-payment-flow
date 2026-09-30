import 'package:approve_payment_flow/core/di/dependency_injection.dart';
import 'package:approve_payment_flow/data/payment/datasources/local/app_database.dart';
import 'package:approve_payment_flow/data/payment/datasources/local/daos/payments_dao.dart';
import 'package:approve_payment_flow/data/payment/repositories/payment_approval_repository_impl.dart';
import 'package:approve_payment_flow/domain/payment/repository/payment_approval_repository.dart';

void registerPaymentDataModule() {
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());
  getIt.registerLazySingleton<PaymentsDao>(
    () => PaymentsDao(getIt<AppDatabase>()),
  );
  getIt.registerLazySingleton<PaymentApprovalRepository>(
    () => PaymentApprovalRepositoryImpl(getIt<PaymentsDao>()),
  );
}

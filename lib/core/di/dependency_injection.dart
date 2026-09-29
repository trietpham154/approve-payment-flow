import 'package:get_it/get_it.dart';
import 'package:approve_payment_flow/core/di/core_module.dart';
import 'package:approve_payment_flow/core/network/di/network_module.dart';
import 'package:approve_payment_flow/core/storage/di/storage_module.dart';
import 'package:approve_payment_flow/domain/di/payment_domain_module.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  registerCoreModule();
  registerNetworkModule();
  registerLocalStoreModule();
  registerPaymentDomainModule();
}

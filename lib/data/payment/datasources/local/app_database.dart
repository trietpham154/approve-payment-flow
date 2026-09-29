import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:approve_payment_flow/data/payment/datasources/local/daos/payments_dao.dart';
import 'package:approve_payment_flow/data/payment/datasources/local/tables/payments_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [PaymentsTable],
  daos: [PaymentsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'payments_db');
  }
}

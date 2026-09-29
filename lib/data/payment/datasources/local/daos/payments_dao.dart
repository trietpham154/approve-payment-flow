import 'package:drift/drift.dart';
import 'package:approve_payment_flow/data/payment/datasources/local/app_database.dart';
import 'package:approve_payment_flow/data/payment/datasources/local/tables/payments_table.dart';

part 'payments_dao.g.dart';

@DriftAccessor(tables: [PaymentsTable])
class PaymentsDao extends DatabaseAccessor<AppDatabase> with _$PaymentsDaoMixin {
  PaymentsDao(super.db);

  Stream<List<PaymentsTableData>> watchDecidedPayments() {
    return (select(paymentsTable)
          ..where((tbl) => tbl.status.isNotValue('pending'))
          ..orderBy([
            (tbl) => OrderingTerm(
                  expression: tbl.decidedAt,
                  mode: OrderingMode.desc,
                ),
            (tbl) => OrderingTerm(
                  expression: tbl.createdAt,
                  mode: OrderingMode.desc,
                ),
          ]))
        .watch();
  }

  Stream<PaymentsTableData?> watchActivePendingPayment() {
    return (select(paymentsTable)
          ..where((tbl) => tbl.status.equals('pending'))
          ..orderBy([
            (tbl) => OrderingTerm(
                  expression: tbl.createdAt,
                  mode: OrderingMode.desc,
                ),
          ])
          ..limit(1))
        .watchSingleOrNull();
  }

  Future<PaymentsTableData?> getPaymentById(String id) {
    return (select(paymentsTable)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertPayment(PaymentsTableCompanion payment) {
    return into(paymentsTable).insert(
      payment,
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<bool> updatePaymentStatus({
    required String id,
    required String status,
    required DateTime decidedAt,
  }) {
    return (update(paymentsTable)..where((tbl) => tbl.id.equals(id)))
        .write(
      PaymentsTableCompanion(
        status: Value(status),
        decidedAt: Value(decidedAt),
      ),
    ).then((rows) => rows > 0);
  }

  Future<int> countPayments() async {
    final count = countAll();
    final query = selectOnly(paymentsTable)..addColumns([count]);
    return query.map((row) => row.read(count)!).getSingle();
  }
}

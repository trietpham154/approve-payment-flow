import 'package:drift/drift.dart';

class PaymentsTable extends Table {
  @override
  String get tableName => 'payments';

  TextColumn get id => text()();
  TextColumn get recipientName => text()();
  RealColumn get amount => real()();
  TextColumn get currency => text()();
  TextColumn get reference => text()();
  TextColumn get note => text().nullable()();
  TextColumn get status => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get decidedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

import 'package:approve_payment_flow/core/result.dart';
import 'package:approve_payment_flow/data/payment/datasources/local/daos/payments_dao.dart';
import 'package:approve_payment_flow/data/payment/models/payment_dto.dart';
import 'package:approve_payment_flow/domain/payment/model/payment.dart';
import 'package:approve_payment_flow/domain/payment/model/payment_failure.dart';
import 'package:approve_payment_flow/domain/payment/model/payment_status.dart';
import 'package:approve_payment_flow/domain/payment/repository/payment_approval_repository.dart';

class PaymentApprovalRepositoryImpl implements PaymentApprovalRepository {
  final PaymentsDao _paymentsDao;

  const PaymentApprovalRepositoryImpl(this._paymentsDao);

  @override
  Stream<List<Payment>> watchDecidedPayments() {
    return _paymentsDao.watchDecidedPayments().map(
          (rows) => rows.map((row) => row.toDomain()).toList(),
        );
  }

  @override
  Stream<Payment?> watchActivePendingPayment() {
    return _paymentsDao
        .watchActivePendingPayment()
        .map((row) => row?.toDomain());
  }

  @override
  Future<Result<Payment, PaymentFailure>> getPaymentById(String id) async {
    try {
      final row = await _paymentsDao.getPaymentById(id);
      if (row == null) {
        return const Failure(PaymentNotFoundFailure());
      }
      return Success(row.toDomain());
    } catch (e) {
      return Failure(PaymentStorageFailure(e.toString()));
    }
  }

  @override
  Future<Result<Payment, PaymentFailure>> approvePayment(String id) async {
    try {
      final existing = await _paymentsDao.getPaymentById(id);
      if (existing == null) {
        return const Failure(PaymentNotFoundFailure());
      }
      if (existing.decidedAt != null) {
        return const Failure(PaymentAlreadyDecidedFailure());
      }

      final decidedAt = DateTime.now();
      final updated = await _paymentsDao.updatePaymentStatus(
        id: id,
        status: 'approved',
        decidedAt: decidedAt,
      );

      if (!updated) {
        return const Failure(PaymentStorageFailure('Failed to update status'));
      }

      final payment = existing.toDomain().copyWith(
            status: PaymentStatus.approved,
            decidedAt: decidedAt,
          );
      return Success(payment);
    } catch (e) {
      return Failure(PaymentStorageFailure(e.toString()));
    }
  }

  @override
  Future<Result<Payment, PaymentFailure>> rejectPayment(String id) async {
    try {
      final existing = await _paymentsDao.getPaymentById(id);
      if (existing == null) {
        return const Failure(PaymentNotFoundFailure());
      }
      if (existing.decidedAt != null) {
        return const Failure(PaymentAlreadyDecidedFailure());
      }

      final decidedAt = DateTime.now();
      final updated = await _paymentsDao.updatePaymentStatus(
        id: id,
        status: 'rejected',
        decidedAt: decidedAt,
      );

      if (!updated) {
        return const Failure(PaymentStorageFailure('Failed to update status'));
      }

      final payment = existing.toDomain().copyWith(
            status: PaymentStatus.rejected,
            decidedAt: decidedAt,
          );
      return Success(payment);
    } catch (e) {
      return Failure(PaymentStorageFailure(e.toString()));
    }
  }

  @override
  Future<Result<Payment, PaymentFailure>> createPendingPayment(
    Payment payment,
  ) async {
    try {
      await _paymentsDao.insertPayment(payment.toCompanion());
      return Success(payment);
    } catch (e) {
      return Failure(PaymentStorageFailure(e.toString()));
    }
  }
}

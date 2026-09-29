import 'package:approve_payment_flow/domain/payment/model/home_summary.dart';
import 'package:approve_payment_flow/domain/payment/repository/payment_approval_repository.dart';

class GetHomeSummaryUseCase {
  final PaymentApprovalRepository _repository;

  const GetHomeSummaryUseCase(this._repository);

  Stream<HomeSummary> call({DateTime? now}) {
    final targetDate = now ?? DateTime.now();
    return _repository.watchDecidedPayments().map((payments) {
      final currentMonthApproved = payments.where((p) {
        if (!p.isApproved) return false;
        final date = p.decidedAt ?? p.createdAt;
        return date.year == targetDate.year && date.month == targetDate.month;
      });

      final total = currentMonthApproved.fold<double>(
        0.0,
        (sum, p) => sum + p.amount,
      );

      final currency = payments.isNotEmpty ? payments.first.currency : 'AED';

      return HomeSummary(
        totalAmount: total,
        count: currentMonthApproved.length,
        currency: currency,
      );
    });
  }
}

class HomeSummary {
  final double totalAmount;
  final int count;
  final String currency;

  const HomeSummary({
    required this.totalAmount,
    required this.count,
    required this.currency,
  });

  static const empty = HomeSummary(
    totalAmount: 0.0,
    count: 0,
    currency: 'AED',
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeSummary &&
          runtimeType == other.runtimeType &&
          totalAmount == other.totalAmount &&
          count == other.count &&
          currency == other.currency;

  @override
  int get hashCode => Object.hash(totalAmount, count, currency);

  @override
  String toString() =>
      'HomeSummary(total: $currency $totalAmount, count: $count)';
}

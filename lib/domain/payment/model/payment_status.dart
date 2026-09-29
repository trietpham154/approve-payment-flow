enum PaymentStatus {
  pending,
  approved,
  rejected;

  bool get isPending => this == PaymentStatus.pending;
  bool get isApproved => this == PaymentStatus.approved;
  bool get isRejected => this == PaymentStatus.rejected;
}

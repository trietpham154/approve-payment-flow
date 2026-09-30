abstract final class Destinations {
  static const splash = '/splash';
  static const home = '/home';
  static const payments = '/payments';

  static const homePaymentDetail = '/home/payment/:id';
  static const paymentDetail = '/payments/:id';

  static String homePaymentDetailPath(String id) => '/home/payment/$id';
  static String paymentDetailPath(String id) => '/payments/$id';
}

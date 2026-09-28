import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:approve_payment_flow/ui/app.dart';

void main() {
  testWidgets('App boots smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: ApprovePaymentFlowApp(),
      ),
    );

    expect(find.byType(ApprovePaymentFlowApp), findsOneWidget);
  });
}

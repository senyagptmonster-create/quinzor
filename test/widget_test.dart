import 'package:flutter_test/flutter_test.dart';
import 'package:quinzor/quinzor_app.dart';

void main() {
  testWidgets('QuinzorApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const QuinzorApp());
    expect(find.text('Quinzor Arcade'), findsOneWidget);
  });
}

import 'package:flutter_test/flutter_test.dart';
import '../lib/main.dart';

void main() {
  testWidgets('Tuban Quest app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const TubanQuestApp());
  });
}
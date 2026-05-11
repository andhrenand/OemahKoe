import 'package:flutter_test/flutter_test.dart';

import 'package:oemah_koe/main.dart';

void main() {
  testWidgets('app shows the home recommendations screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Welcome Back, Renan 👋🏻'), findsOneWidget);
    expect(find.text('Recommend for you'), findsOneWidget);
    expect(find.text('Find base on your location'), findsOneWidget);
  });
}

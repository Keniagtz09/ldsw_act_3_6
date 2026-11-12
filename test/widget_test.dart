import 'package:flutter_test/flutter_test.dart';
import 'package:ldsw_act_3_6/main.dart';

void main() {
  testWidgets('Carga la pantalla principal correctamente', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Cine Suwon'), findsOneWidget);
  });
}
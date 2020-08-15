import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app_bloc/main.dart';

void main() {
  testWidgets('todo widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    var textField = find.byType(TextField);
    expect(textField, findsOneWidget);
    var button = find.text('ADD TODO');
    expect(button, findsOneWidget);
    var list = find.byType(ListView);
    expect(list, findsOneWidget);

    await tester.enterText(textField, 'tester todo text');
    expect(find.text('tester todo text'), findsOneWidget);
    await tester.tap(button);
    await tester.pump();
    expect(find.text('tester todo text'), findsOneWidget);
  });
}

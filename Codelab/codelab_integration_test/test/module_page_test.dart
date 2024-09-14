import "dart:math";

import "package:dicodingacademy/provider/done_module_provider.dart";
import "package:dicodingacademy/ui/module_page.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:provider/provider.dart";

void main() {

  Widget createHomeScreen() => ChangeNotifierProvider<DoneModuleProvider>(
    create: (context) => DoneModuleProvider(),
    child: MaterialApp(
      home: ModulePage(),
    ),
  );

  testWidgets("Testing if the ListView show up", (WidgetTester tester) async {
    await tester.pumpWidget(createHomeScreen());
    expect(find.byType(ListView), findsOneWidget);
  });
  
  testWidgets("Test done button", (tester) async {
    // Me-render widget
    await tester.pumpWidget(createHomeScreen());
    // Mencari item ElevatedButton dalam index pertama, and doing tap
    await tester.tap(find.byType(ElevatedButton).first);
    // Rebuild ui after tapping
    await tester.pumpAndSettle();
    // asertation if there's 2 widget inside done module.
    expect(find.byIcon(Icons.done), findsNWidgets(2));
  });

}
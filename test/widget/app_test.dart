import 'package:flutter/material.dart';
import 'package:flutter_instagram_example/src/ui/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _createApp() => MaterialApp(
  home: App(),
);

void main() {
  testWidgets("APP UI 바텀 네비게이션 테스트", (testWidget) async {
    await testWidget.pumpWidget(_createApp());

    expect(find.byType(BottomNavigationBar), findsOneWidget);
    expect(find.byIcon(Icons.home), findsAtLeast(5));
  });
}
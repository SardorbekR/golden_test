import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:golden_test/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('Golden test', (WidgetTester tester) async {
    await loadAppFonts();
    // await _loadPageForGolden(tester);
    await multiScreenGolden(
      tester,
      "main",
      customPump: (tester) => tester.pumpWidget(MyApp()),
      devices: [
        Device.iphone11,
        Device.phone.copyWith(name: "smallPhone"),
        const Device(
          name: "custom_device",
          devicePixelRatio: 2,
          size: Size(540, 960),
        ),
      ],
    );
    // await multiScreenGolden(find.byType(MyApp), matchesGoldenFile('main.png'));
    // expect(find.text('0'), findsOneWidget);
  });
}

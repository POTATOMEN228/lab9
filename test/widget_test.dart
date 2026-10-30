import 'package:flutter_test/flutter_test.dart';
import 'package:tasks/main.dart';

void main() {
  testWidgets('SmartCatalogApp renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const SmartCatalogApp());

    expect(find.textContaining('Smart Catalog'), findsOneWidget);
    expect(find.text('Wireless Headphones'), findsOneWidget);
  });

  testWidgets('Swiping item shows SnackBar with "Отменить" and restores on tap', (WidgetTester tester) async {
    await tester.pumpWidget(const SmartCatalogApp());

    // Find the first product tile
    final item = find.text('Wireless Headphones');
    expect(item, findsOneWidget);

    // Swipe from right to left to dismiss
    await tester.drag(item, const Offset(-500, 0));
    await tester.pumpAndSettle();

    // Verify item is removed from UI
    expect(find.text('Wireless Headphones'), findsNothing);

    // Verify SnackBar appears with "Отменить"
    expect(find.text('Товар "Wireless Headphones" удален'), findsOneWidget);
    final undoButton = find.text('Отменить');
    expect(undoButton, findsOneWidget);

    // Tap "Отменить" button
    await tester.tap(undoButton);
    await tester.pumpAndSettle();

    // Verify item is restored
    expect(find.text('Wireless Headphones'), findsOneWidget);
  });
}

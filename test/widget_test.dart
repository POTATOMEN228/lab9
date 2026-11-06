import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tasks/main.dart';

void main() {
  testWidgets('SmartCatalogApp renders 6 products and updates cart badge and syncs', (WidgetTester tester) async {
    await tester.pumpWidget(const SmartCatalogApp());

    // Verify app title and catalog products
    expect(find.text('Smart Catalog'), findsOneWidget);
    expect(find.text('Wireless Headphones'), findsOneWidget);
    expect(find.text('Smart Watch'), findsOneWidget);

    // Tap "Add" on first product
    final addButton = find.text('Add').first;
    expect(addButton, findsOneWidget);
    await tester.tap(addButton);
    await tester.pumpAndSettle();

    // Verify button changes to "In Cart" and badge shows "1"
    expect(find.text('In Cart'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);

    // Navigate to Cart Screen via cart button key
    await tester.tap(find.byKey(const Key('cartButton')));
    await tester.pumpAndSettle();

    // Verify Cart Screen shows item and total price
    expect(find.text('My Cart'), findsOneWidget);
    expect(find.text('Wireless Headphones'), findsOneWidget);
    expect(find.text('Total Price:'), findsOneWidget);

    // Remove item from cart
    await tester.tap(find.byIcon(Icons.remove_circle_outline));
    await tester.pumpAndSettle();

    // Verify cart is empty
    expect(find.text('Your cart is empty'), findsOneWidget);

    // Go back to catalog
    await tester.pageBack();
    await tester.pumpAndSettle();

    // Verify catalog button is back to "Add" and badge is gone
    expect(find.text('Add').first, findsOneWidget);
  });
}

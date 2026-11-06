# Implementation Plan - Multi-Screen Global Cart with Live Badge

Implement a Multi-Screen Global Cart app using `provider` (`ChangeNotifierProvider` and `CartProvider`), featuring 6 products in a Catalog (Screen 1) with live AppBar cart badge, and a Cart View (Screen 2) with individual removal, total price calculation, "Clear All", and immediate two-way synchronization between screens.

## User Review Required

> [!NOTE]
> We will add the `provider` package to `pubspec.yaml` for state management via `ChangeNotifierProvider` and `CartProvider`.

## Open Questions

- None. Requirements are clear from the task description and image.

## Proposed Changes

### Dependencies
#### [MODIFY] [pubspec.yaml](file:///C:/Users/user/Desktop/androidtest/tasker-%209/pubspec.yaml)
- Add `provider: ^6.1.2` dependency.

### Models
#### [NEW] [product.dart](file:///C:/Users/user/Desktop/androidtest/tasker-%209/lib/models/product.dart)
- Define `Product` class with `id`, `title`, `price`, `category`, `rating`, `isFavorite`, etc.

### Providers
#### [NEW] [cart_provider.dart](file:///C:/Users/user/Desktop/androidtest/tasker-%209/lib/providers/cart_provider.dart)
- Create `CartProvider` extending `ChangeNotifier`.
- Maintain a list of 6 seed products in the catalog.
- Maintain cart state (set or list of cart products/quantities or boolean `isInCart` per product).
- Methods: `toggleCart(Product product)`, `removeFromCart(Product product)`, `clearCart()`, total price getter, cart item count getter.

### Screens
#### [NEW] [catalog_screen.dart](file:///C:/Users/user/Desktop/androidtest/tasker-%209/lib/screens/catalog_screen.dart)
- Screen 1 (Catalog): Display 6 products.
- Each product card has title, price, category, rating, and an "Add to Cart" / "In Cart" toggle button.
- AppBar features a live cart badge showing total items in cart and an action button to navigate to Screen 2 (`CartScreen`).

#### [NEW] [cart_screen.dart](file:///C:/Users/user/Desktop/androidtest/tasker-%209/lib/screens/cart_screen.dart)
- Screen 2 (Cart View): Show list of selected products in cart.
- Individual removal buttons for each item.
- Total price calculation.
- "Clear All" button.
- Immediate sync with Catalog screen.

### App Entry Point
#### [MODIFY] [main.dart](file:///C:/Users/user/Desktop/androidtest/tasker-%209/lib/main.dart)
- Wrap `MaterialApp` in `ChangeNotifierProvider<CartProvider>`.
- Set home to `CatalogScreen`.

### Tests
#### [MODIFY] [widget_test.dart](file:///C:/Users/user/Desktop/androidtest/tasker-%209/test/widget_test.dart)
- Test `CartProvider` state changes.
- Test Screen 1 rendering 6 products and live badge.
- Test adding items to cart, navigating to Screen 2, removing items, clearing cart, and two-way sync.

## Verification Plan

### Automated Tests
- Run `flutter test` to verify all widget and unit tests pass successfully.

### Manual Verification
- Run the app via Flutter and inspect UI interactions.

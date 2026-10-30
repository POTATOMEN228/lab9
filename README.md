# Lab 8 - Smart Catalog Application

A modern, responsive Smart Catalog application built with Flutter & Material 3. This application demonstrates list/grid switching, swipe-to-delete with undo SnackBar, fake network pull-to-refresh, empty state, and modular project structure.

## 📱 Features

- **List & Grid View Switch**: Toggle between 1-column list tile view and 2-column grid card view.
- **Swipe-to-Delete**: Swipe items from right to left to remove them from the catalog.
- **Undo SnackBar**: A floating 10-second notification appears at the bottom with an "Отменить" action to restore deleted items.
- **Pull-to-Refresh**: Simulated network refresh that prepends new products to the catalog.
- **Empty State**: Displays a clean empty view with a "Reset Catalog" button when all items are cleared.
- **Modular Project Structure**: Clean separation of `models/`, `data/`, `widgets/`, and `screens/`.

## 🛠️ Built With

- **Flutter**: ^3.13.2 (Dart SDK)
- **Material Design 3**: Modern UI components and styling

## 🚀 Getting Started

### Prerequisites

Ensure you have installed:
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Android Studio / VS Code with Flutter extension

### Installation & Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/POTATOMEN228/lab8.git
   cd lab8
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the application:**
   ```bash
   flutter run
   ```

## 📂 Project Structure

```
lib/
├── data/
│   └── seed_data.dart
├── models/
│   └── product.dart
├── screens/
│   └── catalog_screen.dart
├── widgets/
│   ├── dismiss_background.dart
│   ├── empty_state.dart
│   ├── product_grid_card.dart
│   └── product_list_tile.dart
└── main.dart
```

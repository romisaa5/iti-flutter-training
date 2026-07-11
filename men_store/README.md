# Men Store 🛍️

A Flutter e-commerce app for browsing and shopping men's fashion, electronics, and lifestyle products. Built with a clean, feature-first architecture using **Cubit (flutter_bloc)** for state management and **Dio** for networking.

---

## ✨ Features

### 🔐 Authentication
- **Login** — users sign in with email/password against the backend `auth/login` endpoint.
- **Sign Up** — new users can create an account.

### 🧭 Discover
- Browse all products in a responsive 2-column grid.
- Search bar 
- Category chips generated dynamically from the fetched products (no hardcoded category list).
- Pull-to-fetch product list on screen load via `ProductsCubit`.
- **Shimmer loading state** while products are being fetched.
- **Error state** with a retry button if the request fails.
- Empty state when a category has no products.

### 🛒 Product Details
- Full-size image carousel (swipeable, with page indicator dots).
- Product title, category badge, and description.
- Price displayed in a highlighted box.
- "Add to Cart" action.

### 🎨 Design System
- Centralized color palette (`LightAppColors`, `LightThemeData`) and typography (`AppTextStyles`, `AppFonts`, `FontWeightHelper`) so every screen uses consistent spacing, colors, and font weights.
- Shared UI kit in `core/widgets`: `AppButton`, `AppInput`, `AppImages`, and `AuthRichText` (used across Login/Sign Up for the "Don't have an account? Sign up" style links).
- Custom bottom navigation bar (Home / Cart / Account).
- Form validation via `AppValidators` and `AppRegex` (email/password rules, etc.).
- Centralized navigation via `AppNavigator` and dependency injection via a service locator (`ServiceLocator`, `get_it`-style).

---

## 🏗️ Architecture

The app follows a **feature-first** structure. Each feature owns its data layer, business logic, and UI:

```
lib/
├── core/
│   ├── di/
│   │   └── service_locater.dart         # get_it-style service locator: registers ApiService, repos, etc.
│   ├── helpers/
│   │   ├── app_navigator.dart           # Centralized push/pop/replace navigation helpers
│   │   ├── app_regex.dart               # Email/password/phone regex patterns
│   │   ├── app_validators.dart          # Form field validators built on top of app_regex
│   │   └── extensions.dart              # Context/String/etc. extension methods
│   ├── network/
│   │   ├── api_client.dart              # ApiService — shared Dio calls (login, sign up, products, ...)
│   │   ├── dio_factory.dart             # Builds the configured Dio instance (base URL, interceptors, timeouts)
│   │   ├── dio_helper.dart              # get/post/put/delete wrappers around the Dio instance
│   │   └── token_storage.dart           # Persists/reads the access & refresh tokens
│   ├── theme/
│   │   ├── app_colors/
│   │   │   ├── light_app_colors.dart
│   │   │   └── light_theme_data.dart    # ThemeData wiring the palette + text styles into a MaterialApp theme
│   │   └── app_texts/
│   │       ├── app_fonts.dart
│   │       ├── app_text_styles.dart
│   │       └── font_weight_helper.dart
│   └── widgets/
│       ├── app_button.dart              # Shared primary/secondary button
│       ├── app_images.dart              # Network/asset image wrapper with placeholder + error states
│       ├── app_input.dart               # Shared text field (used by Login/Sign Up forms)
│       └── auth_rich_text.dart          # "Don't have an account? Sign up" style rich text links
│
├── features/
│   ├── auth/
│   │   ├── login/
│   │   │   ├── data/models/login_request_model.dart
│   │   │   ├── data/repo/           # AuthRepo
│   │   │   ├── presentation/cubit/  # LoginCubit + LoginState
│   │   │   └── presentation/screens/login_screen.dart
│   │   └── signup/
│   │       ├── data/models/signup_request_model.dart
│   │       ├── data/repo/
│   │       ├── presentation/cubit/
│   │       └── presentation/screens/signup_screen.dart
│   │
│   ├── home/
│   │   ├── data/
│   │   │   ├── models/product_model.dart
│   │   │   ├── models/category_model.dart
│   │   │   └── repo/products_repo.dart
│   │   └── presentation/
│   │       ├── cubit/products_cubit.dart + products_state.dart
│   │       ├── discover_screen.dart
│   │       ├── product_details_screen.dart
│   │       └── widgets/
│   │           ├── discover_search_bar.dart
│   │           ├── discover_category_list.dart
│   │           ├── discover_product_grid.dart
│   │           ├── discover_error_view.dart
│   │           ├── discover_body.dart
│   │           ├── category_chip.dart
│   │           ├── product_grid_Item.dart
│   │           ├── product_shimmer_item.dart
│   │           └── products_grid_shimmer.dart
│   │
│   └── nav_bar/
│       └── custom_bottom_nav.dart
│
└── main.dart
```

**Data flow (example: Discover screen):**

```
UI (DiscoverScreen)
   │  reads/dispatches
   ▼
ProductsCubit  ──calls──▶  ProductsRepo  ──calls──▶  ApiService  ──HTTP──▶  Dio / API
   │                              │
   │                        parses JSON into ProductModel
   ▼
ProductsState (Initial / Loading / Success / Failure)
   │
   ▼
UI rebuilds via BlocBuilder (shimmer → grid → error)
```

The same pattern applies to **Login** and **Sign Up**: a request model → `ApiService` call (built with `DioFactory`/`DioHelper`) → repo wraps the result → a `Cubit` exposes `Initial / Loading / Success / Failure` states → the screen reacts with `BlocBuilder`/`BlocListener` (e.g. save the token via `TokenStorage` and navigate to Discover on successful login using `AppNavigator`, or show a snackbar on failure).

Repos and services aren't constructed inline in the widget tree — they're registered once in `ServiceLocator` (`core/di/service_locater.dart`) and resolved wherever they're needed.

---

## 🧰 Tech Stack

| Purpose              | Package                  |
|----------------------|---------------------------|
| State management     | `flutter_bloc` (Cubit)    |
| Networking           | `dio` (via `DioFactory`/`DioHelper`) |
| Dependency injection | `get_it` (via `ServiceLocator`) |
| Token persistence    | `shared_preferences` / `flutter_secure_storage` (via `TokenStorage`) |
| Loading skeletons    | `shimmer`                 |
| Responsive sizing    | `flutter_screenutil`      |

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_screenutil: ^5.9.3
  flutter_bloc: ^8.1.6
  dio: ^5.7.0
  shimmer: ^3.0.0
  get_it: ^7.7.0
  flutter_secure_storage: ^9.2.2
```

---

## 🌐 API

Products are served from the **Platzi Fake Store API**:

```
Base URL: https://api.escuelajs.co/api/v1/
GET  /products        → list all products
POST /auth/login      → login (email, password) → access_token / refresh_token
```

---

## 🚀 Getting Started

```bash
git clone https://github.com/romisaa5/iti-flutter-training/
cd men_store
flutter pub get
flutter run
```

Make sure, in `main()` before `runApp()`:
1. `setupServiceLocator()` (in `core/di/service_locater.dart`) is called to register `ApiService`, repos, and `TokenStorage`.
2. `DioFactory` builds the Dio instance (base URL, interceptors, timeouts) that `DioHelper` wraps.

---

## 📱 Screens Overview

| Screen           | Description                                              |
|------------------|-----------------------------------------------------------|
| Login            | Email + password sign in                                  |
| Sign Up          | New account registration                                  |
| Discover         | Product grid, search bar, category filter                 |
| Product Details  | Image carousel, description, price, add to cart           |

---


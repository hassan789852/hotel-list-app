# 🏝️ Privilee Venues Flutter App

A Flutter app for discovering venues such as pools, gyms, and beaches, featuring a modern UI, deep linking support, map integration, shimmer loading, and full test coverage. Built with Riverpod, Dio-based simulation, and custom error handling.

---

## ✨ Features

### 💡 Core Functionality
- Category-based filtering of venues
- GridView layout optimized for mobile
- Google Maps support with dynamic markers and info windows
- Deep linking (App Links / Universal Links)
- Floating action button (FAB) animation on scroll
- Smooth shimmer animation while content is loading

---


# ⚙️ CI/CD Pipeline

This project uses **GitHub Actions** for continuous integration and automated builds.

### ✅ Workflow: `Build & Upload (Android, iOS)`

Triggers:
- On every `push` or `pull_request` to the `main` branch

### 🧱 Key Steps:
- ✅ Set up Java (Zulu 18.x)
- ✅ Set up Flutter (v3.27.1, stable channel)
- ✅ Restore pub packages
- ✅ Build Android APK (`flutter build apk`)
- ✅ Build iOS IPA (`flutter build ipa --no-codesign`)
- ✅ Archive iOS build directory (`tar -czf ios_build.tar.gz ios`)

> Note: Artifact upload and test steps are included but currently commented. You can enable them to:
> - Run `flutter test` on each PR
> - Upload builds to GitHub using `actions/upload-artifact@v3`

The GitHub Actions workflow is defined in `.github/workflows/build.yml`.

## 🎬 UI/UX Animations

| Feature                   | Description                                              |
|--------------------------|----------------------------------------------------------|
| 🔄 Shimmer Animation      | While venue data is loading                              |
| ⬆⬇ Scroll FAB Animation  | FAB hides on scroll down, reappears on scroll up         |
| 🧱 GridView               | Responsive card layout for venues                        |


## 🦸 Hero Animation

The app includes a **Hero animation** to provide smooth, seamless transitions between venue tiles and their detailed view.

### ✨ Where it's used:
- When navigating from the venue card (in GridView) to the Venue Details Page
- The image smoothly transitions using a shared `Hero` tag

### ✅ Benefit:
- Adds visual continuity and polish to the navigation experience
- Enhances user engagement with natural feeling motion


---

## 🔗 Deep Linking (App Links / Universal Links)

Deep linking is enabled using the [`app_links`](https://pub.dev/packages/app_links) package.

- **Android**: via `intent-filter` and hosted `assetlinks.json`
- **iOS**: via `Associated Domains` and hosted `apple-app-site-association`
- **Centralized logic**: all deep links are parsed in `DeepLinkService`

### 🧠 Example

```dart
DeepLinkService().init(navigatorKey); // Initializes listener
```

When the app receives a link like `https://privilee/item/123`, it automatically navigates to:  custom page

```
ProductPage(productId: 123)
```

> ⚠️ Note: This requires server-side files hosted at:
> - Android: `https://example.com/.well-known/assetlinks.json`
> - iOS: `https://example.com/.well-known/apple-app-site-association`

---

## 🧪 Testing

This project includes:

| Test Type         | What It Covers                                  |
|------------------|--------------------------------------------------|
| ✅ Unit Tests     | Business logic, filters, state manipulation      |
| ✅ Widget Tests   | UI components and interaction behavior           |
| ✅ Integration    | Deep links, screen transitions, FAB + bottom sheet |

### 📂 Example Structure

```
test/
├── controller/
│   ├── venue_list_filter_controller_test.dart
│   └── venue_list_screen_controller_test.dart
├── filter_test/
│   └── filter_category_chips_test.dart
├── map_test/
│   ├── map_controller_test.dart
│   └── place_info_window_test.dart
├── fixtures/
│   ├── gyms.json
│   └── hotels.json
```



Sure! Here's a clean `README.md` section to describe your **simulated load more** logic:

---

## 🔄 Simulated Load More (Pagination)

A simulated pagination mechanism is added in the `VenueListScreenController` to mimic "load more" behavior typically seen in real APIs.

### 🧪 Purpose
Since the current project loads local JSON files (not using a backend API), this simulation helps visualize how pagination would work when integrated with an actual endpoint.

### 🧩 How It Works
- The controller keeps track of:
  - `currentPage`
  - `pageSize`
- A method `loadNextPage()` appends more items from the full dataset into the visible list.
- A `ScrollController` listener triggers this method when the user scrolls near the bottom.

This makes the UI feel like it’s loading more data, even though all data exists locally.

> ✅ When integrating with a backend, this logic can be extended by calling paginated API endpoints like `/venues?page=2&limit=10`.



---

## 🧰 Backend Simulation

Because this project doesn't use a live backend, we simulate network requests inside the controller by loading static JSON files like `gyms.json` or `hotels.json`.

📁 Example:
```dart
await rootBundle.loadString('assets/json/gyms.json');
```

This allows fast UI testing and logic validation without external APIs.

---

## 🚀 Advanced API Simulation with Dio

For apps that want to see how the same logic would work with real APIs, we've included:

### 📁 `lib/core/base_dio/base_dio.dart`

```dart
final response = await baseDio.get(
  subUrl: "/venues",
  model: VenueModel(),
  isListOfModel: true,
);
```

- Uses Dio to fetch and deserialize models
- Integrates with a generic `DataState<T>` wrapper to separate success/failure

### 🧠 Response Structure

#### ✅ Success:
```dart
class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data);
}
```

#### ❌ Failure:
```dart
class DataFailed<T> extends DataState<T> {
  const DataFailed(ExceptionResponse error);
}
```

### 📁 Error Handling

Located in:
- `lib/core/base_dio/exception_handler.dart`
- `lib/core/base_dio/data_state.dart`

Provides:
- Centralized `ExceptionResponse` class
- Localized error codes for:
    - No internet
    - Timeout
    - Cancelled request
    - Certificate error
    - Unknown issues

```dart
switch (dioException.type) {
  case DioExceptionType.receiveTimeout:
    return ExceptionResponse(statusCode: -3, exceptionMessages: ["Receive timeout"]);
}
```

> All handled errors bubble up through `DataFailed` and can be shown in your UI.

---

## 🚀 Getting Started

```bash
flutter pub get
flutter run
```

To run tests:

```bash
flutter test
flutter test integration_test/
```

---

## 📌 Requirements

| Platform | Setup |
|----------|-------|
| Android  | `assetlinks.json` hosted at `.well-known/` |
| iOS      | `apple-app-site-association` hosted        |

> If hosted server files are not configured, deep linking may not open the app.

---

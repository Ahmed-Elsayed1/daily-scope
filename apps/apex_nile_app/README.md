# Apex Nile App

This Flutter app composes the feature packages in the monorepo and exposes global UI concerns such as theming, routing, and navigation.

## Running locally

```bash
cd apps/apex_nile_app
flutter pub get
flutter run \
  --dart-define=NEWS_API_KEY=your_news_api_key \
  --dart-define=OPENWEATHER_API_KEY=your_openweather_key
```

## Architecture highlights

- `lib/src/core` – dependency injection, routing, connectivity, persistence.
- `lib/src/design_system` – color/typography/spacing tokens + `ThemeData`.
- `lib/src/widgets` – application shell widgets with bottom navigation + offline banner.
- `lib/src/features/dashboard` – simple overview surface stitching together feature states.

Each feature Cubit lives inside its respective package (`packages/*_module`) and is wired in `AppDependencies`.

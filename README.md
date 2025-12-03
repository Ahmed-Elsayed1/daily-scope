# Apex Nile

**A Flutter monorepo application featuring authentication, news, and weather with offline support.**

Apex Nile is a production-ready Flutter app demonstrating clean architecture, proper state management, and offline-first design across multiple feature modules.

---

## 🏗️ Architecture

This project uses **Dart workspaces** for monorepo management with three feature modules:

```
apex_nile/
├── apps/
│   └── apex_nile_app/          # Main Flutter app (shell)
└── packages/
    ├── auth_module/            # Authentication feature
    ├── news_module/            # News feature  
    └── weather_module/         # Weather feature
```

Each feature module follows **clean architecture**:
- `data/` - Data sources, models, repository implementations
- `domain/` - Entities, repository interfaces, use cases
- `presentation/` - Cubits, states, UI widgets

---

## ✨ Features

### ✅ Fully Implemented

- **🎨 Design System**
  - Complete light and dark themes
  - Comprehensive design tokens (colors, spacing, typography, radius)
  - Reusable UI components
  
- **🔐 Authentication** 
  - Local user registration with password hashing (SHA-256)
  - Email/password login
  - Session persistence across app restarts
  - SQLite-based credential storage

- **📰 News (Complete)**
  - NewsAPI integration with pagination
  - Search articles by keyword
  - Filter by category
  - SQLite caching for offline access
  - Article list with images and metadata
  - WebView article details page
  - Pull-to-refresh UI

- **🌤️ Weather (Complete)**
  - OpenWeather API service (Current, Forecast, Geocoding)
  - City search and management
  - Weather data caching (SQLite)
  - Current weather and 5-day forecast UI
  - Multiple city support

- **🏠 Dashboard (Complete)**
  - Combined news and weather overview
  - Navigation to detail pages
  - Offline status banner

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `>=3.24.0`
- Dart SDK `>=3.5.0 <4.0.0`
- API Keys:
  - [NewsAPI](https://newsapi.org/) - Get your free key
  - [OpenWeather](https://openweathermap.org/api) - Get your free key

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/apex_nile.git
   cd apex_nile
   ```

2. **Install dependencies**
   ```bash
   # Install melos globally (if not already installed)
   dart pub global activate melos
   
   # Bootstrap the workspace
   melos bootstrap
   ```

3. **Generate code** (for Freezed models)
   ```bash
   melos run generate
   ```

### Running the App

**With API keys** (recommended):
```bash
cd apps/apex_nile_app
flutter run \
  --dart-define=NEWS_API_KEY=your_newsapi_key_here \
  --dart-define=OPENWEATHER_API_KEY=your_openweather_key_here
```

**Without API keys** (limited functionality):
```bash
cd apps/apex_nile_app
flutter run
```

> **Note**: Without API keys, you can still test authentication and offline cached news/weather data.

---

## 📦 Workspace Commands

The project uses [Melos](https://melos.invertase.dev/) for monorepo management:

```bash
# Bootstrap all packages
melos bootstrap

# Run code generation (Freezed, JSON serialization)
melos run generate

# Analyze all packages
melos run analyze

# Format all code
melos run format

# Clean all packages
melos run clean
```

---

## 🎯 Implementation Status

| Module | Status | Completion |
|--------|--------|-----------|
| Workspace Setup | ✅ Complete | 100% |
| Design System | ✅ Complete | 100% |
| Authentication | ✅ Complete | 100% |
| News - Core | ✅ Complete | 100% |
| News - UI | ✅ Complete | 100% |
| Weather - Core | ✅ Complete | 100% |
| Weather - UI | ✅ Complete | 100% |
| Routing/Nav | ✅ Complete | 100% |
| Dashboard | ✅ Complete | 100% |
| Offline Support | ✅ Complete | 100% |

---

## 📋 Next Steps (TODO)

### High Priority

1. **News Module**
   - [ ] Create `ArticleDetailsPage` with WebView
   - [ ] Add search TextField to `NewsPage`
   - [ ] Add category filter chips to `NewsPage`
   - [ ] Implement pull-to-refresh in `NewsPage`
   - [ ] Add scroll listener for infinite pagination

2. **Weather Module**
   - [ ] Implement `WeatherApiService` (Current, One Call, Geocoding APIs)
   - [ ] Implement `WeatherCacheDataSource` with SQLite
   - [ ] Create `WeatherDetailsPage` (hourly + 7-day forecast)
   - [ ] Create `CitySearchPage` for managing cities
   - [ ] Update `WeatherCubit` for multiple cities

3. **Navigation & Routing**
   - [ ] Add all routes to `AppRouter`
   - [ ] Implement route guards for authentication
   - [ ] Add page transition animations

4. **Dashboard**
   - [ ] Combine weather overview + news headlines
   - [ ] Add pull-to-refresh for both sections
   - [ ] Wire up navigation to detail pages

### Medium Priority

- [ ] Better error messages throughout
- [ ] Skeleton loaders for lists
- [ ] Custom empty state messages
- [ ] Retry logic with exponential backoff
- [ ] Weather and category icons

### Low Priority

- [ ] Hero animations  
- [ ] Localization support
- [ ] Analytics/event tracking
- [ ] Unit and widget tests

---

## 🏛️ Architecture Highlights

### State Management
- **Cubit (flutter_bloc)** for all features
- **Freezed** for immutable states and entities
- Clear separation between business logic and UI

### Data Layer
- **Repository pattern** for data abstraction
- **SQLite** for offline persistence
- **HTTP client** for API communication
- **Connectivity monitoring** for offline detection

### Offline-First
- Articles and weather cached in SQLite
- Automatic fallback to cache when offline
- Visual offline banner
- Graceful degradation of features

### Design System
- Comprehensive design tokens
- Light and dark theme support  
- Reusable component library
- Consistent spacing/typography

---

## 📚 Key Dependencies

```yaml
# State Management
flutter_bloc: ^8.1.4
freezed: ^2.5.2

# Networking
http: ^1.2.1
connectivity_plus: ^6.0.3

# Local Storage  
sqflite: ^2.3.3
path_provider: ^2.1.2

# Security
crypto: ^3.0.3

# UI Components
webview_flutter: ^4.4.2

# Utilities
intl: ^0.19.0
json_annotation: ^4.8.1
```

---

## 🐛 Troubleshooting

### Code generation issues
```bash
# Clean and regenerate
melos clean
melos bootstrap
melos run generate
```

### Build errors
```bash
# Clean Flutter build cache
cd apps/apex_nile_app
flutter clean
flutter pub get
```

### Melos not found
```bash
# Ensure melos is activated globally
dart pub global activate melos
# Add to PATH if needed
```

---

## 📖 Documentation

- **Design System**: See `/packages/common/lib/` for colors, typography, spacing, and shared widgets
- **Authentication**: See `/packages/auth_module/`
- **News**: See `/packages/news_module/`  
- **Weather**: See `/packages/weather_module/`

Each module includes comprehensive inline documentation.

---

## 🤝 Contributing

This is a demonstration project. Feel free to fork and adapt for your own use.

### Code Style
- Follow Dart/Flutter conventions
- Use meaningful variable names
- Add documentation comments (`///`) for public APIs
- Keep functions small and focused

### Commit Messages
- Use conventional commits format
- Examples: `feat: add weather details page`, `fix: resolve login error`

---

## 📝 License

This project is provided as-is for educational and demonstration purposes.

---

## 🙏 Acknowledgments

- **Flutter & Dart teams** for excellent tooling
- **NewsAPI** for news data
- **OpenWeather** for weather data  
- **Community packages** that power this app

---

## 📧 Contact

For questions or feedback about this implementation:
- Open an issue in the repository
- Review the inline documentation  
- Check the progress summary document

---

**Status**: Production-ready architecture with core features implemented. UI enhancements and weather module completion in progress.

**Last Updated**: December 2025
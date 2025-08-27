# Yandex Maps Implementation Example / Пример реализации Yandex карт

[English](#english) | [Русский](#русский)

---

## English

### Overview

### Features
- **Custom Map Widget**: Reusable `FlutterMapWidget` with lifecycle management
- **Station Markers**: Dynamic markers with different states (active/inactive)
- **Clustering**: Automatic grouping of nearby markers with custom cluster appearance
- **Interactive Elements**: Tap listeners for markers and clusters
- **State Management**: BLoC pattern implementation for map state
- **Theme Support**: Automatic dark/light theme switching
- **Performance Optimized**: Proper MapKit lifecycle management

### Key Components

#### 1. FlutterMapWidget
- Handles Yandex MapKit initialization and cleanup
- Manages app lifecycle events (onResume/onInactive)
- Automatic theme switching based on system theme

#### 2. Station Markers System
- **Default Markers**: Different icons for working/non-working stations
- **Selected Markers**: Special appearance for selected stations
- **Custom Clustering**: Circular clusters with station count display

#### 3. Event Listeners
- `StationTapListener`: Handles marker tap events
- `ClusterListenerImpl`: Manages cluster appearance and behavior

### Architecture Highlights
- **Clean Architecture**: Separation of concerns with dedicated widgets
- **State Management**: BLoC pattern for reactive programming
- **Asset Management**: Organized image assets with type-safe access
- **Lifecycle Management**: Proper resource cleanup and memory management

### Technical Implementation
```dart
// Custom map widget with lifecycle management
FlutterMapWidget(
  onMapCreated: (MapWindow window) {
    // Initialize map features
  },
  onMapDispose: () {
    // Cleanup resources
  },
)
```

### Dependencies
- `yandex_maps_mapkit_lite`: Yandex Maps SDK
- `flutter_bloc`: State management
- `auto_route`: Navigation
- `lucide_icons_flutter`: Icon library

### Installation
```bash
flutter pub get
```

### Usage
This is a demonstration project showcasing advanced Yandex Maps integration patterns. The code can be adapted for various location-based applications including:
- Station/point finder apps
- Delivery services
- Real estate applications
- Tourism and navigation apps

---

## Русский

### Обзор
Этот проект демонстрирует профессиональную реализацию Yandex карт во Flutter с продвинутыми функциями, включая кластеризацию, кастомные маркеры и управление состоянием.

### Функции
- **Кастомный виджет карты**: Переиспользуемый `FlutterMapWidget` с управлением жизненным циклом
- **Маркеры станций**: Динамические маркеры с разными состояниями (активные/неактивные)
- **Кластеризация**: Автоматическая группировка близких маркеров с кастомным внешним видом
- **Интерактивные элементы**: Слушатели нажатий для маркеров и кластеров
- **Управление состоянием**: Реализация паттерна BLoC для состояния карты
- **Поддержка тем**: Автоматическое переключение темной/светлой темы
- **Оптимизация производительности**: Правильное управление жизненным циклом MapKit

### Ключевые компоненты

#### 1. FlutterMapWidget
- Обрабатывает инициализацию и очистку Yandex MapKit
- Управляет событиями жизненного цикла приложения (onResume/onInactive)
- Автоматическое переключение темы в зависимости от системной темы

#### 2. Система маркеров станций
- **Обычные маркеры**: Разные иконки для работающих/неработающих станций
- **Выбранные маркеры**: Специальный внешний вид для выбранных станций
- **Кастомная кластеризация**: Круглые кластеры с отображением количества станций

#### 3. Слушатели событий
- `StationTapListener`: Обрабатывает события нажатия на маркеры
- `ClusterListenerImpl`: Управляет внешним видом и поведением кластеров

### Архитектурные особенности
- **Чистая архитектура**: Разделение ответственности с выделенными виджетами
- **Управление состоянием**: Паттерн BLoC для реактивного программирования
- **Управление ассетами**: Организованные изображения с типобезопасным доступом
- **Управление жизненным циклом**: Правильная очистка ресурсов и управление памятью

### Техническая реализация
```dart
// Кастомный виджет карты с управлением жизненным циклом
FlutterMapWidget(
  onMapCreated: (MapWindow window) {
    // Инициализация функций карты
  },
  onMapDispose: () {
    // Очистка ресурсов
  },
)
```

### Зависимости
- `yandex_maps_mapkit_lite`: Yandex Maps SDK
- `flutter_bloc`: Управление состоянием
- `auto_route`: Навигация
- `lucide_icons_flutter`: Библиотека иконок

### Установка
```bash
flutter pub get
```

### Использование
Это демонстрационный проект, показывающий продвинутые паттерны интеграции Yandex карт. Код может быть адаптирован для различных приложений на основе местоположения, включая:
- Приложения для поиска станций/точек
- Службы доставки
- Приложения недвижимости
- Туристические и навигационные приложения

### Автор
Код, демонстрирующий лучшие практики работы с Yandex картами во Flutter.
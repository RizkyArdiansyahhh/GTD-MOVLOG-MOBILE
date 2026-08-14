# Project Structure & Directory Guidelines — GTD Logistics Mobile App

This document defines the exact filesystem directory layout and file placement rules for **GTD Logistics Mobile App**.

---

## 1. Top-Level Workspace Structure

```text
gtd_mobile_app/
├── .ai/                      # AI Agent context, decision records (ADRs), roadmap tasks
├── docs/                     # Comprehensive project documentation
├── AGENTS.md                 # Master instruction for AI coding agents
├── android/                  # Android native project files
├── ios/                      # iOS native project files
├── lib/                      # Flutter Dart source code
├── test/                     # Unit, widget, and integration tests
├── pubspec.yaml              # Flutter dependencies and configuration
└── README.md
```

---

## 2. Detailed `lib/` Directory Structure

```text
lib/
├── main.dart                 # App entrypoint (initializes Riverpod ProviderScope, runs App)
│
├── core/                     # Cross-cutting utilities & app-wide singletons
│   ├── constants/            # App constants (dimensions, keys, mock delays)
│   ├── errors/               # Error failure types & exceptions
│   ├── router/               # GoRouter configuration & route definitions
│   ├── theme/                # Theme data, color scheme, typography tokens
│   └── utils/                # Date formatters, string helpers, validators
│
├── shared/                   # Shared UI & cross-feature domain items
│   ├── models/               # Shared domain entities (e.g. User, Address)
│   └── widgets/              # Reusable UI components
│       ├── app_bar/          # Custom app bars
│       ├── buttons/          # Primary, secondary, icon buttons
│       ├── cards/            # Common card containers
│       ├── dialogs/          # Standard alert & confirm dialogs
│       ├── inputs/           # Standard text form fields & selectors
│       ├── states/           # Loading, empty, and error state widgets
│       └── status_badge/     # Logistics status badges
│
└── features/                 # Modular domain feature folders
    ├── auth/                 # Feature: Authentication
    ├── dashboard/            # Feature: Operations Summary & Analytics
    ├── shipment/             # Feature: Shipment Management
    ├── delivery/             # Feature: Field Delivery & Proof of Delivery (POD)
    └── profile/              # Feature: User Profile & Account Settings
```

---

## 3. Feature Directory Standard Structure

Every feature module inside `lib/features/<feature_name>/` MUST strictly adhere to the following internal layout:

```text
lib/features/<feature_name>/
├── data/                     # Data Layer
│   ├── datasources/          # Data sources (Mock data sources, API data sources)
│   │   └── mock/             # Mock data files & JSON fixtures
│   ├── models/               # DTOs / JSON models with serialization logic
│   └── repositories/         # Concrete repository implementations (e.g. MockShipmentRepository)
│
├── domain/                   # Domain Layer
│   ├── entities/             # Pure Dart domain entities
│   └── repositories/         # Abstract repository interfaces (e.g. ShipmentRepository)
│
└── presentation/             # Presentation Layer
    ├── providers/            # Riverpod state providers, Notifiers, State classes
    ├── screens/              # Top-level screen pages (e.g. ShipmentListScreen)
    └── widgets/              # Feature-specific private widgets (e.g. ShipmentFilterSheet)
```

---

## 4. Prohibited Folder Layouts (Anti-Patterns)

To avoid folder sprawl and inconsistent project organization, AI agents are **STRICTLY PROHIBITED** from creating top-level directories such as:

❌ `lib/screens/`  
❌ `lib/pages/`  
❌ `lib/controllers/`  
❌ `lib/services/`  
❌ `lib/providers/`  
❌ `lib/views/`  

All feature-specific screens, providers, and data logic **MUST** be placed within their corresponding feature directory in `lib/features/<feature_name>/`. Shared elements used across multiple features must be placed in `lib/shared/`.

---

## 5. File Naming Conventions

* **Screens**: `*_screen.dart` (e.g. `shipment_list_screen.dart`, `login_screen.dart`)
* **Widgets**: `*_widget.dart` or `*_card.dart` (e.g. `shipment_card.dart`, `custom_button.dart`)
* **Repository Contracts**: `*_repository.dart` (e.g. `shipment_repository.dart`)
* **Mock Repositories**: `mock_*_repository.dart` (e.g. `mock_shipment_repository.dart`)
* **API Repositories**: `api_*_repository.dart` (e.g. `api_shipment_repository.dart`)
* **Providers / State**: `*_provider.dart` or `*_notifier.dart` (e.g. `shipment_providers.dart`)
* **Entities**: `*.dart` or `*_entity.dart` (e.g. `shipment.dart`, `delivery_task.dart`)
* **DTO / Models**: `*_model.dart` or `*_dto.dart` (e.g. `shipment_model.dart`)

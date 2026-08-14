# System Architecture — GTD Logistics Mobile App

This document outlines the architecture design for **GTD Logistics Mobile App**.

---

## 1. Architectural Pattern

The application follows a **Feature-First + Clean Layered Architecture**:

* **Feature-First**: Code is organized primarily by domain feature modules (`auth`, `shipment`, `delivery`, etc.) rather than technical role (`controllers/`, `views/`, `models/`).
* **Layered Architecture**: Each feature module is internally separated into 3 clear layers:
  1. **Presentation Layer** (`presentation/`): UI Screens, Widgets, Riverpod State Controllers/Notifiers.
  2. **Domain Layer** (`domain/`): Core Entities, Value Objects, and abstract Repository Interfaces.
  3. **Data Layer** (`data/`): Data Transfer Objects (DTOs), Data Sources, and concrete Repository Implementations.

```text
lib/
├── core/                  # Cross-cutting concerns: Theme, Constants, Utils, Router
├── shared/                # App-wide reusable UI components & shared models
└── features/              # Modular domain features
    ├── auth/
    │   ├── data/
    │   ├── domain/
    │   └── presentation/
    ├── dashboard/
    ├── shipment/
    ├── delivery/
    └── profile/
```

---

## 2. Data & State Flow Architecture

### Current Phase (Mock Data Phase):

```text
┌─────────────────────────────────────────────────────────────┐
│                    Presentation Layer                       │
│  UI Widget  ──▶  Riverpod Provider / AsyncNotifier          │
└──────────────────────────────┬──────────────────────────────┘
                               │ (depends on abstract interface)
                               ▼
┌─────────────────────────────────────────────────────────────┐
│                       Domain Layer                          │
│          Abstract Repository Interface (e.g. ShipmentRepository) │
└──────────────────────────────▲──────────────────────────────┘
                               │ (implements interface)
                               │
┌──────────────────────────────┴──────────────────────────────┐
│                        Data Layer                           │
│        Concrete Mock Repository (MockShipmentRepository)   │
│                              │                              │
│                              ▼                              │
│               Mock Data Source / Static Data                │
└─────────────────────────────────────────────────────────────┘
```

### Future Phase (Laravel REST API Phase):

```text
┌─────────────────────────────────────────────────────────────┐
│                    Presentation Layer                       │
│  UI Widget  ──▶  Riverpod Provider / AsyncNotifier          │
└──────────────────────────────┬──────────────────────────────┘
                               │ (no change required!)
                               ▼
┌─────────────────────────────────────────────────────────────┐
│                       Domain Layer                          │
│          Abstract Repository Interface (e.g. ShipmentRepository) │
└──────────────────────────────▲──────────────────────────────┘
                               │ (swapped implementation)
                               │
┌──────────────────────────────┴──────────────────────────────┐
│                        Data Layer                           │
│        Concrete API Repository (ApiShipmentRepository)      │
│                              │                              │
│                              ▼                              │
│             Remote Data Source (Dio HTTP Client)            │
│                              │                              │
│                              ▼                              │
│             Laravel 12 REST API + Sanctum + PostgreSQL      │
└─────────────────────────────────────────────────────────────┘
```

---

## 3. Abstract Repository Interface Pattern

To guarantee seamless transition from Mock Data to Real Backend APIs without touching UI components:

1. **Define the Abstract Contract in Domain**:
   ```dart
   // lib/features/shipment/domain/repositories/shipment_repository.dart
   abstract class ShipmentRepository {
     Future<List<Shipment>> getShipments();
     Future<Shipment> getShipmentDetail(String id);
   }
   ```

2. **Provide Mock Implementation in Data Layer**:
   ```dart
   // lib/features/shipment/data/repositories/mock_shipment_repository.dart
   class MockShipmentRepository implements ShipmentRepository {
     @override
     Future<List<Shipment>> getShipments() async {
       await Future.delayed(const Duration(milliseconds: 600)); // Simulate delay
       return mockShipmentList;
     }
     ...
   }
   ```

3. **Expose Provider via Riverpod Interface Binding**:
   ```dart
   // lib/features/shipment/presentation/providers/shipment_providers.dart
   final shipmentRepositoryProvider = Provider<ShipmentRepository>((ref) {
     // Return mock implementation now
     return MockShipmentRepository();
     // Future swap: return ApiShipmentRepository(ref.watch(dioProvider));
   });
   ```

---

## 4. Layer Responsibilities

| Layer | Folder | Responsibilities | Dependencies |
|---|---|---|---|
| **Presentation** | `presentation/` | Renders UI, receives user inputs, listens to Riverpod state providers, displays loading/empty/error states. | Domain Layer (Entities & Repository Interfaces) |
| **Domain** | `domain/` | Encapsulates pure business entities, value objects, abstract repository contracts. Pure Dart code. | Independent (No Flutter UI or Dio dependency) |
| **Data** | `data/` | Implements repository contracts, handles DTO mappings, JSON serialization, API calls (Dio), local cache, mock data sources. | Domain Layer, External packages (Dio, Freezed) |
| **Core** | `core/` | Global themes, color tokens, router configuration (GoRouter), common utilities, constants. | Shared across features |
| **Shared** | `shared/` | Shared UI components (custom buttons, cards, status badges, skeletons). | Core |

---

## 5. Architectural Quality Guarantees

* **UI Agnostic of Data Origin**: Widgets do not know whether data originates from mock memory or a remote PostgreSQL database via REST API.
* **Testability**: Riverpod providers bound to repository interfaces enable painless unit and widget testing by overriding providers.
* **Separation of Concerns**: Presentation never makes raw HTTP/Dio requests or direct mock data parses.

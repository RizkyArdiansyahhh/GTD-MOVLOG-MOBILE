# Architecture Decision Records (ADR) — GTD Logistics Mobile App

This file records all key technical decisions made for **GTD Logistics Mobile App**.

---

### ADR-001: Mobile Application Framework
* **Status**: `ACCEPTED`
* **Decision**: Use **Flutter (Dart)** as the cross-platform mobile application framework.
* **Rationale**: Fast UI rendering, single codebase for iOS and Android, rich widget ecosystem for enterprise logistics app requirements.

---

### ADR-002: State Management Library
* **Status**: `ACCEPTED`
* **Decision**: Use **Flutter Riverpod** (`flutter_riverpod`) as the sole state management solution.
* **Rationale**: Compile-time safe, testable provider overrides, clear separation between UI widgets and async state controllers (`AsyncNotifier`).

---

### ADR-003: Backend Technology Choice
* **Status**: `ACCEPTED`
* **Decision**: **Laravel 12 REST API** with **PostgreSQL** database as the backend platform.
* **Rationale**: Proven enterprise REST framework, robust ORM, built-in API authentication with Sanctum.

---

### ADR-004: Backend as Single Source of Truth
* **Status**: `ACCEPTED`
* **Decision**: **Laravel API is the primary source of truth** for all business rules, calculations, authorizations, and data validation.
* **Rationale**: Prevents logic duplication between client and server; Flutter client handles presentation and UI state only.

---

### ADR-005: Feature-First + Clean Architecture Pattern
* **Status**: `ACCEPTED`
* **Decision**: Organize codebase by feature (`lib/features/<feature>/`), with internal 3-layer breakdown (`presentation`, `domain`, `data`).
* **Rationale**: Ensures modular scalability, isolates feature changes, and prevents massive top-level directory clutter (`screens/`, `controllers/`).

---

### ADR-006: Mock Repository Pattern During API Unavailability
* **Status**: `ACCEPTED`
* **Decision**: Use abstract Repository Interfaces implemented by Mock Repositories while Laravel API is under development.
* **Rationale**: Allows rapid UI/UX, navigation, and state management development without waiting for backend API deployment.

---

### ADR-007: Isolation of Mock Data from UI Widgets
* **Status**: `ACCEPTED`
* **Decision**: Mock data must be kept strictly inside Mock Repositories or mock data files.
* **Rationale**: Prevents coupling UI components to mock implementations and ensures UI is 100% ready for API integration.

---

### ADR-008: Zero-UI-Rewrite API Transition Strategy
* **Status**: `ACCEPTED`
* **Decision**: Bind Riverpod providers to abstract repository interfaces rather than concrete mock classes.
* **Rationale**: Swapping `MockRepository` with `ApiRepository` when the API arrives will require zero changes to UI widgets or presentation controllers.

---

### ADR-009: Future Authentication Protocol
* **Status**: `ACCEPTED`
* **Decision**: Plan for **Laravel Sanctum Bearer Token** authentication. Exact authentication contract and endpoints remain **`TBD`** until Laravel API contract is finalized.
* **Rationale**: standard Laravel authentication mechanism for REST APIs.

---

### ADR-010: Secure Storage for Auth Credentials
* **Status**: `ACCEPTED`
* **Decision**: Use **Flutter Secure Storage** (`flutter_secure_storage`) to persist authentication tokens on mobile devices.
* **Rationale**: KeyChain (iOS) and KeyStore (Android) hardware-backed secure token encryption.

---

### ADR-011: Declarative Routing Library
* **Status**: `ACCEPTED`
* **Decision**: Use **GoRouter** (`go_router`) for app navigation and deep linking.
* **Rationale**: Official Flutter package for declarative URL-based routing, deep link handling, and nested navigation support.

---

### ADR-012: Brand Color Palette & Typography Standard
* **Status**: `ACCEPTED`
* **Decision**: Official brand palette is **GTD Navy `#1C2D44`** (Primary) and **GTD Gold `#F8C944`** (Secondary/Accent). Official typography font family is **Plus Jakarta Sans** (Google Fonts `plusJakartaSans`).
* **Rationale**: Enterprise logistics visual identity with high contrast readability and modern UI presentation.

---

### ADR-013: Centralized Shared UI Component Library
* **Status**: `ACCEPTED`
* **Decision**: Build all reusable UI widgets in `lib/shared/widgets/` (`GtdButton`, `GtdTextField`, `GtdCard`, `GtdStatusBadge`, `GtdLoading`, `GtdEmptyState`, `GtdErrorState`). Feature screens must reuse these components rather than re-creating one-off button/card implementations.
* **Rationale**: Guarantees visual consistency, high scannability, central theme enforcement, and rapid UI development. Status badge values are presentation defaults and do not assume backend API contracts.

---

### ADR-014: Authentication UI & Mock Presentation State Machine
* **Status**: `ACCEPTED`
* **Decision**: Implement `SplashScreen` and `LoginScreen` reusing shared GTD components (`GtdButton`, `GtdTextField`, `GtdCard`). Login state is driven by Riverpod `LoginNotifier` (`AsyncValue<bool?>`) interacting with `AuthRepository` interface and `MockAuthRepository`. No `isAuthenticated()` method, token persistence, or fake Sanctum response schemas are created until the Laravel API contract is published.
* **Rationale**: Maintains clean presentation/API boundaries so real authentication can be connected in Phase 4 without modifying UI widgets or screens.

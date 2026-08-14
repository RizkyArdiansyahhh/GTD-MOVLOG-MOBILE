# AGENTS.md — Master Instruction for AI Coding Agents

> **Project Identity**: GTD Logistics Mobile App  
> **Repository Type**: Flutter Mobile Application Client  
> **Status**: IN DEVELOPMENT (UI / UX / State Management with Mock Data)

---

## 1. Documentation Hierarchy & Source of Truth

When reading or modifying this repository, AI coding agents must follow this explicit documentation authority hierarchy:

```text
AGENTS.md (Master Rules & Governance)
    ↓
docs/ (Detailed Architecture, Project Structure, UI Guidelines, Features, Status)
    ↓
.ai/ (Agent Context, ADR Decisions, Roadmap Tasks)
    ↓
Source Code (`lib/`) (Ground Truth of Current Implementation)
```

### Important Rule on Source Code Reality:
* `AGENTS.md` and `docs/` govern rules, standards, and design intent.
* However, **the actual source code in `lib/` represents the truth of current implementation state**.
* If existing code differs from documentation, **inspect and understand the actual code first**. Do not blindly overwrite working code or force stale documentation assumptions.

---

## 2. Executive Summary & Purpose

GTD Logistics Mobile App is an enterprise logistics and shipment management client built for field logistics operations, drivers, dispatchers, and operations staff.

* **Flutter App Role**: Mobile client responsible for presentation, user interaction, navigation, local cache, and client-side UI states.
* **Laravel Backend Role**: **Source of truth for all business logic, data persistence, validation rules, authorization, and workflow rules.**

> ⚠️ **CRITICAL NOTICE**: **The Laravel REST API is currently NOT AVAILABLE.**  
> Current development is focused **exclusively on UI/UX, navigation, reusable components, loading/empty/error states, and Riverpod state management using Mock Repositories.**

---

## 3. Technology Stack

| Category | Library / Tech | Purpose / Note |
|---|---|---|
| Framework | Flutter (Dart SDK ^3.8) | Mobile Application Client |
| State Management | Flutter Riverpod (`flutter_riverpod`) | Sole state management solution |
| Routing | GoRouter (`go_router`) | Declarative navigation & routing |
| HTTP Client | Dio (`dio`) | Ready for future API integration (not active yet) |
| Secure Storage | Flutter Secure Storage (`flutter_secure_storage`) | For future auth token storage |
| Data Models | Freezed / JSON Serializable | Immutable data classes & serializations |
| Backend | Laravel 12 REST API + Sanctum + PostgreSQL | **Source of Truth (NOT READY YET)** |

---

## 4. Architecture Rules

The codebase strictly uses **Feature-First Architecture** combined with **Clean Layered Architecture** per feature:

```text
lib/
├── core/                  # Global utilities, theme, constants, router, error handling
├── shared/                # App-wide reusable widgets, shared domain models, common UI state
└── features/              # Feature modules
    ├── auth/              # Feature: Authentication
    │   ├── data/          # DTOs, Data Sources, Mock Repositories
    │   ├── domain/        # Entities, Repository Interfaces (abstract)
    │   └── presentation/  # Screens, Widgets, Riverpod Controllers/Providers
    ├── dashboard/
    ├── shipment/
    ├── delivery/
    └── profile/
```

### Core Architecture Directives:
1. **Repository Interface Pattern**:
   * UI must communicate **ONLY** with abstract Repository interfaces (`ShipmentRepository`).
   * Never couple Riverpod providers directly to concrete mock implementation classes.
   * `UI -> Riverpod Provider -> Repository Interface -> Mock Repository Implementation -> Mock Data`.
   * Swapping `MockShipmentRepository` with `ApiShipmentRepository` in the future must require **ZERO changes to the UI layer**.

2. **Feature Scoping**:
   * Each domain feature (`auth`, `shipment`, `delivery`, etc.) must live in its own `lib/features/<feature_name>` folder.
   * Do NOT create random top-level folders like `screens/`, `pages/`, `controllers/`, or `services/`. Refer to `docs/PROJECT_STRUCTURE.md`.

---

## 5. Mandatory Agent Rules

Every AI coding agent operating on this project MUST strictly obey the following 10 rules:

### Rule 1 — Do Not Over-Engineer
Do not create speculative abstractions, wrapper classes, or premature design patterns that are not explicitly requested or required by the current scope.

### Rule 2 — Do Not Invent APIs
The Laravel API is not ready. **NEVER guess API endpoints, request/response formats, status codes, or fake backend URLs.** Do not create fake HTTP servers or mock REST endpoints.

### Rule 3 — Mock Data Separation Only
Mock data is allowed and encouraged for UI development. However, **mock data MUST be isolated inside Mock Repositories or mock data files (`data/datasources/mock/`)**. Never hardcode mock JSON or static list literals inside Flutter UI Widgets.

### Rule 4 — No Business Logic Duplication
Do not re-implement complex backend business logic (e.g. tax calculations, complex shipment state transition rules, invoicing logic) inside Flutter. Flutter handles presentation and client-side UI state; business logic belongs to Laravel.

### Rule 5 — Reusable UI Components
If a UI element (button, card, status badge, search bar, empty state, loading skeleton) is used in more than one place, extract it into `lib/shared/widgets/`.

### Rule 6 — Single State Management (Riverpod)
Riverpod is the designated state management library for this project. Do NOT introduce secondary state management tools (e.g. Bloc, Provider, GetX, MobX).

### Rule 7 — Don't Modify Unrelated Files
When tasked with building or editing a specific component/feature, modify **ONLY** the relevant files. Do not format, refactor, or edit unrelated files across the workspace.

### Rule 8 — Preserve Architecture
Before creating any new file, consult `docs/ARCHITECTURE.md` and `docs/PROJECT_STRUCTURE.md`. Respect the `data`, `domain`, and `presentation` layer boundaries.

### Rule 9 — API-Ready UI Design
All presentation widgets and Riverpod state controllers designed today using Mock Repositories must be fully API-ready. They must accept data models that cleanly match expected domain entities without requiring UI rewrites when the real API arrives.

### Rule 10 — Don't Assume Requirements (Mark as TBD)
If a business workflow, field definition, or UI style guideline is not fully specified, explicitly mark it as `TBD` in documentation or code comments. Do not treat personal assumptions as finalized requirements.

---

## 6. Naming Conventions & Code Style

* **Files & Directories**: `snake_case.dart` (e.g. `shipment_card.dart`, `shipment_repository.dart`)
* **Classes & Enums**: `PascalCase` (e.g. `ShipmentDetailScreen`, `ShipmentRepository`, `ShipmentStatus`)
* **Variables & Functions**: `camelCase` (e.g. `getShipmentList`, `isLoading`, `currentUser`)
* **Riverpod Providers**: `camelCase` ending with `Provider` (e.g. `shipmentListNotifierProvider`, `authRepositoryProvider`)
* **Freezed / JSON Models**: Explicit `@JsonSerializable` or `@freezed` annotations using `snake_case` field mappings matching expected backend convention.

---

## 7. UI, State & Error Handling Guidelines

* **Loading States**: Use standard skeleton loaders or `CircularProgressIndicator` wrapped in dedicated UI components. Never leave a screen blank during async data fetching.
* **Empty States**: Display clear empty state widgets with friendly messages and actions when data lists are empty.
* **Error States**: Handle errors gracefully using Riverpod's `AsyncValue` (`when`, `maybeWhen`). Show user-friendly error banners or retry buttons.
* **Responsive Layouts**: Design mobile-first, ensuring layouts display properly across various screen sizes (small smartphones up to tablets).

---

## 8. Authentication & Permissions Rules

* **Current Phase**: Authentication state is simulated using Riverpod and `MockAuthRepository`.
* **Future Integration**: Authentication will utilize Laravel Sanctum tokens stored securely via `Flutter Secure Storage` and attached via Dio interceptors (`Authorization: Bearer <TOKEN>`).
* **Exact Auth Flow**: Marked as **`TBD until Laravel API contract is finalized`**. Do not invent custom token refresh or login payload logic ahead of API delivery.

---

## 9. Next Action Guidance for AI Agents

After completing any task:
1. Provide a concise summary of created or modified files.
2. Report validation and analysis results.
3. Highlight any open questions or `TBD` items requiring user input.
4. **STOP and wait for user instruction before starting the next phase or feature.**

# Development Status — GTD Logistics Mobile App

This document records the exact development phase, current active focus, and explicit boundaries for **GTD Logistics Mobile App**.

---

## 1. Current Project Status Matrix

| Component | Status | Note / Guidance |
|---|---|---|
| **Flutter App Setup** | `IN DEVELOPMENT` | Project created; initial foundation & docs being established. |
| **UI / UX Design** | `IN DEVELOPMENT` | Active focus on screens, layouts, micro-interactions, responsive design. |
| **Navigation & Routing** | `IN DEVELOPMENT` | Setting up GoRouter declarative routes and sub-routes. |
| **State Management** | `IN DEVELOPMENT` | Using Riverpod (`AsyncNotifier`, `Provider`, `Notifier`). |
| **Mock Repositories & Data** | `ALLOWED & ACTIVE` | Mock data isolated inside Mock Repositories. |
| **Laravel 12 REST API** | `NOT READY` | Backend API is under development by backend team. |
| **Real API Integration** | `NOT STARTED` | Waiting for backend API endpoints and final API contracts. |

---

## 2. Current Phase Focus Areas

Development during this phase is strictly focused on:

1. **Presentation & UI Quality**:
   * Clean, professional enterprise logistics layout.
   * Responsive spacing, typography, and color tokens.
   * Smooth navigation transitions using `go_router`.

2. **Reusable UI Component Library**:
   * Status badges (e.g. `Pending`, `In Transit`, `Delivered`, `Failed`).
   * Reusable action buttons, cards, text fields, search bars.
   * Standardized loading skeletons, empty state placeholders, and error retry widgets.

3. **State Management & Mock Data Architecture**:
   * Defining pure Dart domain entities and model structures.
   * Implementing abstract repository contracts (`ShipmentRepository`, `DeliveryRepository`, `AuthRepository`).
   * Building Mock Repositories (`MockShipmentRepository`, `MockDeliveryRepository`) with simulated async network latency.
   * Managing UI states using Riverpod (`AsyncValue` for loading, data, error states).

---

## 3. Explicit Anti-Goals (What NOT to do right now)

To keep the codebase clean and avoid technical debt, AI agents must **NEVER**:

* ❌ **Do NOT create fake REST API endpoints or local HTTP mock servers.**
* ❌ **Do NOT invent speculative API endpoint paths** (e.g. `/api/v1/shipments/tracking-fake`).
* ❌ **Do NOT invent fake JSON response bodies or backend payloads** and pretend they are official contracts.
* ❌ **Do NOT hardcode mock JSON or static list literals inside Flutter UI Widgets.**
* ❌ **Do NOT implement backend business logic or complex database validation inside Flutter.**
* ❌ **Do NOT start Real API integration until backend endpoints and contracts are finalized.**

---

## 4. Phase Transition Roadmap

```text
Current Stage:
Phase 1: Foundation & Docs  ──▶  Phase 2: UI/UX & Mock Repositories  ──▶  Phase 3: Finalize UI Specs
                                                                                   │
                                                                                   ▼
Future Stage:                                                            Laravel API Delivered
Phase 4: Swap Mock Repositories with ApiRepositories (Dio)  ◀──────────────────────┘
```

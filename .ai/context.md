# AI Agent Project Context — GTD Logistics Mobile App

> **Quick Summary for AI Agents**:  
> Read this context before performing any coding or refactoring task in this repository.

---

## 1. Project Background & Target Users
* **App Name**: GTD Logistics Mobile App (`gtd_mobile_app`)
* **Domain**: Enterprise Logistics, Shipment Tracking, and Field Delivery Operations.
* **Target Users**: Couriers / Drivers, Logistics Dispatchers, Field Operators.

---

## 2. Technical Stack & Role Boundaries
* **Mobile Client**: Built with **Flutter (Dart SDK ^3.8)**.
* **State Management**: **Flutter Riverpod** (`flutter_riverpod`).
* **Navigation**: **GoRouter** (`go_router`).
* **HTTP Client**: **Dio** (Prepared for future API integration).
* **Token Storage**: **Flutter Secure Storage** (Prepared for future auth tokens).
* **Backend**: **Laravel 12 REST API + Sanctum + PostgreSQL** (Serves as Source of Truth).

---

## 3. Critical Current State Constraints
1. **Laravel REST API is NOT READY YET.**
2. **Current Development Focus**:
   * UI/UX Design & Layouts
   * Declarative Navigation
   * Reusable UI Component Library (`lib/shared/widgets/`)
   * Riverpod State Management
   * Mock Repositories (`MockShipmentRepository`, etc.)
   * UI States: Loading skeletons, Empty states, Error retries, Responsive design.

---

## 4. Key Architectural Rule for AI Agents
```text
UI Component  ──▶  Riverpod Provider  ──▶  Abstract Repository Interface  ──▶  Mock Repository Implementation
```
* **UI widgets MUST depend ONLY on abstract repository interfaces.**
* Mock data MUST be isolated inside Mock Repositories (`lib/features/<feature>/data/datasources/mock/`).
* Never place raw mock JSON or list literals inside UI widgets.
* Never invent fake REST endpoints, fake backend servers, or guessed API contracts.
* Always check `AGENTS.md` and `docs/PROJECT_STRUCTURE.md` before adding files.

# Development Tasks & Roadmap — GTD Logistics Mobile App

This document tracks the phased development roadmap for **GTD Logistics Mobile App**.

---

## Roadmap Phases Overview

```text
Phase 1: Foundation Setup  ──▶  Phase 2: Auth UI  ──▶  Phase 3: Main Features UI  ──▶  Phase 4: API Integration (WAITING FOR API)
```

---

## Phase 1 — Foundation & Core Infrastructure

- [x] Establish AI Agent Documentation & Rules (`AGENTS.md`, `docs/`, `.ai/`)
- [x] Flutter foundation package setup (`pubspec.yaml`: `flutter_riverpod`, `go_router`, `google_fonts`)
- [x] Core directory structure setup (`lib/core/`, `lib/shared/`, `lib/features/`)
- [x] App Theme & Design Tokens setup (`lib/core/theme/`: `#1C2D44`, `#F8C944`, Plus Jakarta Sans)
- [x] GoRouter Router configuration (`lib/core/router/app_router.dart`)
- [x] Riverpod root initialization in `main.dart` (`ProviderScope` + `MaterialApp.router`)
- [x] Shared reusable UI components (`lib/shared/widgets/`):
  - [x] Custom primary/secondary buttons (`gtd_button.dart`)
  - [x] Custom text input fields (`gtd_text_field.dart`)
  - [x] Custom cards (`gtd_card.dart`)
  - [x] Logistics Status Badges (`gtd_status_badge.dart` - presentation defaults)
  - [x] Loading (`gtd_loading.dart`), Empty state (`gtd_empty_state.dart`), and Error retry widgets (`gtd_error_state.dart`)
- [ ] Mock Data Architecture Foundation (`lib/features/auth/domain/`, etc.)

---

## Phase 2 — Authentication UI & Simulated State

- [ ] Splash Screen UI & session check simulation
- [ ] Login Screen UI (Email/Username, Password, validation rules)
- [ ] Login loading state & error banner presentation
- [ ] `MockAuthRepository` & Auth Riverpod `NotifierProvider`
- [ ] Login flow simulation & navigation redirect to Dashboard
- [ ] Logout dialog & session reset simulation

---

## Phase 3 — Main Application UI & Mock Repositories

- [ ] **Dashboard Module** (`lib/features/dashboard/`):
  - [ ] Summary Banner & Shift status UI
  - [ ] Shipment & Delivery metrics cards
  - [ ] Recent Activity Feed list & item widgets
  - [ ] `MockDashboardRepository` & Dashboard Riverpod state
- [ ] **Shipment Module** (`lib/features/shipment/`):
  - [ ] Shipment List Screen with search bar & status filter chips
  - [ ] Shipment Card item widget
  - [ ] Shipment Detail Screen (Package info, status timeline)
  - [ ] `ShipmentRepository` interface & `MockShipmentRepository`
- [ ] **Delivery Module** (`lib/features/delivery/`):
  - [ ] Assigned Delivery List Screen
  - [ ] Delivery Task Detail Screen
  - [ ] Update Delivery Status Sheet / Modal
  - [ ] Proof of Delivery (POD) UI placeholder (Recipient name, Signature placeholder, Photo placeholder)
  - [ ] `DeliveryRepository` interface & `MockDeliveryRepository`
- [ ] **Profile Module** (`lib/features/profile/`):
  - [ ] Profile Screen UI (User details, Vehicle info, Employee ID)
  - [ ] Account Settings Screen UI (Theme toggle, Language selector placeholder)
  - [ ] Logout confirmation dialog

---

## Phase 4 — Real API Integration

> **STATUS: WAITING FOR LARAVEL REST API**

- [ ] *DO NOT START UNTIL LARAVEL API CONTRACT IS FINALIZED*
- [ ] Implement Dio HTTP Client & Auth Bearer Token Interceptor
- [ ] Implement `Flutter Secure Storage` token persistence service
- [ ] Implement `ApiAuthRepository`
- [ ] Implement `ApiShipmentRepository`
- [ ] Implement `ApiDeliveryRepository`
- [ ] Swap Riverpod provider bindings from Mock Repositories to API Repositories
- [ ] End-to-end authentication & live data integration testing

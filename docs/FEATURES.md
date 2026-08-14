# Feature Specifications — GTD Logistics Mobile App

This document details the mobile app feature breakdown for **GTD Logistics Mobile App**.

> ℹ️ Any feature or field marked as **`TBD`** is unconfirmed and subject to final specification. AI agents must not assume final behavior for `TBD` items.

---

## 1. Feature Breakdown

### 1.1 Authentication (`lib/features/auth/`)
* **Splash Screen**:
  * Displays brand logo, application version, and initializes initial app state.
  * Checks authentication status via `AuthRepository`.
* **Login Screen**:
  * Form inputs for User Credentials (Email/Username and Password).
  * Form validation (required fields, valid format).
  * Password visibility toggle.
  * Submit action triggering authentication notifier.
  * Loading state (button spinner / disabled state) and Error message display (toast/banner).
* **Logout Workflow**:
  * Clears user session and resets Riverpod auth providers.
  * Navigates user back to Login screen.
* **Session State Management**:
  * Maintains current authenticated user state (`Authenticated`, `Unauthenticated`, `Loading`).
* **Current User Profile Snapshot**:
  * User basic info (Name, Role: Driver / Dispatcher / Operator, Avatar).

---

### 1.2 Dashboard (`lib/features/dashboard/`)
* **Operations Summary Banner**:
  * Welcome greeting and active shift / role status.
* **Shipment Statistics Cards**:
  * Count breakdown: Total Shipments, In Transit, Delivered Today, Pending Pickup.
* **Delivery Statistics Cards**:
  * Delivery performance indicators: Assigned Tasks, Completed, Failed/Delayed.
* **Recent Activity Feed**:
  * Timeline feed of recent shipment status updates or assigned tasks.
  * Quick tap to navigate to detailed shipment or delivery view.

---

### 1.3 Shipment Management (`lib/features/shipment/`)
* **Shipment List Screen**:
  * Paginated/scrollable list of shipments.
  * Search bar (search by Waybill / Tracking Number / Recipient name).
  * Status filter chips (`All`, `Pending`, `In Transit`, `Delivered`, `Exception`).
  * Shipment card summary displaying waybill number, origin, destination, current status badge, and date.
* **Shipment Detail Screen**:
  * Full shipment overview (Sender details, Recipient details, Package dimensions/weight).
  * Real-time / Timeline status history.
  * Assigned driver and vehicle info (`TBD`).
  * Action buttons (e.g. View Delivery Task, Contact Recipient).

---

### 1.4 Field Delivery & Proof of Delivery (POD) (`lib/features/delivery/`)
* **Assigned Deliveries Screen**:
  * Task list specifically assigned to the logged-in courier/driver.
  * Route order optimization view (`TBD`).
* **Delivery Detail Screen**:
  * Destination address with map integration link (`TBD`).
  * Recipient contact button (call/WhatsApp) (`TBD`).
  * Delivery package summary.
* **Update Delivery Status**:
  * Change status (e.g. `Arrived at Location`, `Delivery Successful`, `Delivery Failed`).
  * Select failure reason dropdown if delivery fails (`TBD`).
* **Proof of Delivery (POD)**:
  * Recipient signature capture view (`TBD`).
  * Photo proof upload (camera capture / gallery picker) (`TBD`).
  * Recipient name input field.

---

### 1.5 Profile & Settings (`lib/features/profile/`)
* **User Profile Screen**:
  * User personal details (Full Name, Employee ID, Phone Number, Vehicle Number).
  * User role badge.
* **Account Settings**:
  * App language selection (`TBD`).
  * Dark mode / Light mode toggle (`TBD`).
  * Change password option (`TBD`).
* **Session Termination**:
  * Logout button with confirmation dialog.

---

## 2. Feature Status Overview

| Feature | Sub-Feature | Status | Notes |
|---|---|---|---|
| **Auth** | Splash & Login UI | `PLANNED` | Phase 2 task |
| **Auth** | Session Riverpod Provider | `PLANNED` | Mocked initially |
| **Dashboard** | Metrics & Activity Feed UI | `PLANNED` | Phase 3 task |
| **Shipment** | List, Search & Detail UI | `PLANNED` | Phase 3 task |
| **Delivery** | Assigned Tasks & POD UI | `PLANNED` | Phase 3 task |
| **Delivery** | Signature Capture / Photo POD | `TBD` | Unconfirmed specs |
| **Profile** | User Profile & App Settings | `PLANNED` | Phase 3 task |

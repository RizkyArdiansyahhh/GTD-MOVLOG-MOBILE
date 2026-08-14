# API Integration Plan — GTD Logistics Mobile App

This document outlines the future API integration strategy between **GTD Logistics Mobile App** (Flutter Client) and **GTD Backend** (Laravel 12 REST API).

> ⚠️ **CRITICAL REMINDER**: **The Laravel REST API IS NOT AVAILABLE AT THIS TIME.**  
> Do NOT guess API endpoint paths, HTTP response formats, status codes, or fake backend servers.

---

## 1. Expected Future Architecture

```text
Flutter Mobile App Client
        │
        ▼
   Dio Package (HTTP Client)
        │
        ▼
   Dio Interceptor (Injects Bearer Token & Handles Global Errors)
        │
        ▼
   Laravel 12 REST API
        │
        ▼
   Laravel Sanctum Authentication
        │
        ▼
   PostgreSQL Database
```

---

## 2. Future Authentication Strategy

### Planned Auth Flow (High-Level):

```text
User Enters Credentials on Login Screen
                  │
                  ▼
          Call Login Endpoint (Dio POST)
                  │
                  ▼
      Receive Response containing Sanctum Token
                  │
                  ▼
     Persist Token in Flutter Secure Storage
                  │
                  ▼
 Attach Token to Dio Interceptor (Authorization: Bearer <TOKEN>)
                  │
                  ▼
    Navigate User to Main App Dashboard
```

> ℹ️ **Status Notice**:  
> `Future authentication: Laravel Sanctum`  
> `Exact authentication flow: TBD until Laravel API contract is finalized.`  
> Agents must not write hardcoded token refresh loops or custom token schemas before the backend contract is published.

---

## 3. Data Source Transition Strategy

When the backend API becomes available in the future:

1. **Step 1 — Create API Data Source & Models**:
   * Implement `RemoteDataSource` using `Dio`.
   * Create `@freezed` / `JSON Serializable` DTO models.

2. **Step 2 — Implement Concrete API Repository**:
   * Implement `ApiShipmentRepository` implementing `ShipmentRepository` interface.
   * `class ApiShipmentRepository implements ShipmentRepository`.

3. **Step 3 — Swap Riverpod Provider Binding**:
   ```dart
   // Change provider binding from Mock to API implementation:
   final shipmentRepositoryProvider = Provider<ShipmentRepository>((ref) {
     return ApiShipmentRepository(ref.watch(shipmentRemoteDataSourceProvider));
   });
   ```

4. **Step 4 — ZERO UI Refactoring Required**:
   * Because UI widgets and Riverpod state controllers depend exclusively on `ShipmentRepository` interface and pure domain entities, **the entire UI layer remains untouched during API activation.**

---

## 4. Current Mock Guidelines

During the present phase:
* All network requests are simulated by **Mock Repositories** returning static/generated mock domain objects.
* Simulated network delay (`Future.delayed(const Duration(milliseconds: 600))`) should be included in Mock Repositories to exercise UI loading skeletons and Riverpod `AsyncValue` handling.

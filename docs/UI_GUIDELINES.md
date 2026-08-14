# UI & UX Guidelines — GTD Logistics Mobile App

This document provides design principles, typography, color tokens, and UI component standards for **GTD Logistics Mobile App**.

---

## 1. Core UI Principles

1. **Clean & Professional**: Enterprise logistics aesthetic designed for fast operation by drivers, dispatchers, and warehouse personnel under field conditions.
2. **Mobile-First & High Scannability**: Use high-contrast status badges, clear visual hierarchy, and large readable typography.
3. **Consistent Component Design**: Every screen must use standardized shared components (`lib/shared/widgets/`).
4. **Predictable UX Feedback**: Every user action must trigger visual feedback (loading spinners, skeleton shimmers, error retry states, empty state illustrations).

---

## 2. Color System Tokens (Official Brand Palette)

> 🎨 **Official Brand Design Tokens**:
> Primary Brand Color: `#1C2D44` (GTD Deep Navy)  
> Secondary Brand Color: `#F8C944` (GTD Accent Gold/Yellow)  
> Font Family: **Plus Jakarta Sans** (Google Fonts `plusJakartaSans`)

| Token Name | Hex Code / Material Color | Usage |
|---|---|---|
| `primary` | `#1C2D44` (GTD Deep Navy) | App Bar, Primary Buttons, Active Navigation, Headers |
| `primaryVariant` | `#111C2B` | Hover/Pressed states, Darker background elements |
| `secondary` | `#F8C944` (GTD Gold / Yellow) | Accent buttons, active highlights, badges, CTA callouts |
| `secondaryVariant` | `#E0B236` | Secondary hover/pressed state |
| `surface` | `#FFFFFF` | Card backgrounds, dialog containers |
| `background` | `#F8FAFC` (Slate 50) | Main screen background |
| `textPrimary` | `#1C2D44` (GTD Navy / Slate 900) | High-emphasis headers and body text |
| `textSecondary` | `#64748B` (Slate 500) | Subtitles, labels, secondary metadata |
| `border` | `#E2E8F0` (Slate 200) | Card borders, text field outlines, dividers |
| **Status Tokens** | | |
| `statusPending` | `#F8C944` (GTD Gold / Amber) | Pending pickup / Unassigned status |
| `statusInTransit` | `#3B82F6` (Blue 500) | In Transit / On the way status |
| `statusSuccess` | `#10B981` (Emerald 500) | Delivered / Completed status |
| `statusError` | `#EF4444` (Red 500) | Failed / Delivery Exception / Error alert |

---

## 3. Typography & Spacing Scale

### Font Family: **Plus Jakarta Sans**
All text styles across the app MUST use **Plus Jakarta Sans** (via `google_fonts` package: `GoogleFonts.plusJakartaSans()`).

### Typography Hierarchy (Material 3 TextTheme):
* **Display Large**: 32px, Bold (700), `#1C2D44` (Main headings, summary figures)
* **Headline Medium**: 20px, Semi-Bold (600), `#1C2D44` (Screen titles, card titles)
* **Body Large**: 16px, Regular (400), `#1C2D44` (Primary list items, form field text)
* **Body Medium**: 14px, Regular (400), Slate 600 (Secondary descriptive text)
* **Label Small**: 12px, Medium (500), Slate 500 (Captions, status badges, timestamp labels)

### Spacing System (8px Grid Scale):
* `xs`: 4px
* `sm`: 8px
* `md`: 16px (Standard padding/margin for screens and card bodies)
* `lg`: 24px (Section spacing)
* `xl`: 32px (Header margins)

### Border Radius Scale:
* `radiusSm`: 6px (Input fields, small buttons)
* `radiusMd`: 12px (Cards, dialog containers, status badges)
* `radiusLg`: 16px (Bottom sheets, modal cards)

---

## 4. UI Component Guidelines

### Buttons (`lib/shared/widgets/buttons/`)
* **Primary Button**: Filled background (`primary`), white text, height 48px, radius 8px.
* **Secondary Button**: Outlined border (`primary`), transparent background, text `primary`.
* **Text Button**: Borderless button for minor actions (e.g. `Skip`, `Cancel`).
* **Disabled State**: Opacity 0.5, pointer events disabled.

### Text Fields (`lib/shared/widgets/inputs/`)
* Outlined style with `border` color in idle state, transitioning to `primary` on focus.
* Include clear error message support below the field when validation fails.
* Provide clear prefix/suffix icon support (e.g. search icon, password toggle eye icon).

### Cards (`lib/shared/widgets/cards/`)
* Background `surface` (`#FFFFFF`).
* Radius `12px`.
* Light elevation or 1px subtle border (`#E2E8F0`).
* Padding `16px`.

### App Bar & Navigation
* **Top App Bar**: Simple, clean layout with back arrow navigation and screen title.
* **Bottom Navigation Bar**: 4 to 5 main feature tabs (`Dashboard`, `Shipment`, `Delivery`, `Profile`).

### Status Badges (`lib/shared/widgets/status_badge/`)
* Rounded pill shape (radius `12px` or fully rounded `50px`).
* Soft pastel background with strong foreground text (e.g., Soft Amber background `#FEF3C7` with `#D97706` text for Pending).

### Asynchronous UI States (`lib/shared/widgets/states/`)
* **Loading State**: Custom Shimmer skeleton loader matching card dimensions.
* **Empty State**: Centered container with clean logistics icon, title, description, and primary retry/action button.
* **Error State**: Friendly error card with refresh icon button (`Try Again`).

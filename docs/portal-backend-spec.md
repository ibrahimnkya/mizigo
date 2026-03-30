# Mizigo Platform Specification

## 1) Purpose and Scope
This document defines **production-ready specifications** for:

1. **Portal (Frontend)**: roles, capabilities, access boundaries, and UX/security behavior.
2. **Backend API**: service architecture, endpoint contracts, validation rules, security controls, and operational constraints.

This is the baseline implementation contract for Engineering, QA, and Product.

---

## 2) System Architecture Overview

### 2.1 Tenancy Model
The system is multi-tenant and hierarchical:

- **Super Admin (Platform)**: global scope across all organizations.
- **Organization (Tenant)**: one customer/company (e.g., logistics operator).
- **Station**: branch, depot, or warehouse under one organization.
- **Users**:
  - **Admin**: scoped to one organization.
  - **Operator**: scoped to one station (and implicitly one organization).

### 2.2 Core Architecture Components
- **Portal Web App**: role-aware UI (Super Admin, Admin, Operator views).
- **API Service**: stateless REST API with JWT-based auth.
- **Relational Database**: canonical source for organizations, stations, users, cargo, pricing, payments.
- **Audit Service/Middleware**: immutable append-only logs for all write actions.
- **Integration Layer**: external SMS, payment providers, and third-party service connectors.

### 2.3 Required Cross-Cutting Principles
- Multi-tenant isolation on every query and mutation.
- Soft-delete for business entities.
- RBAC policy enforcement at API layer.
- Audit logging for all data writes and security-sensitive actions.
- Idempotency on callback and selected write endpoints.

---

## 3) Portal Specification (Frontend Roles & Capabilities)

## 3.1 Common Frontend Requirements (All Roles)
- Session handling via access + refresh token flow.
- Auto logout after **3 days of inactivity**.
- Route guards by role + permission.
- Organization and station context visible in app shell.
- Standardized error surfaces:
  - Validation errors (field-level)
  - Permission denied
  - Tenant scope mismatch
  - Conflict/duplicate data
- Activity timestamp tracking for idle timeout policy.

## 3.2 Super Admin Portal

### Scope
Global platform scope across all organizations.

### Capabilities

#### A) Organization Management
- Create organization
- Update organization profile and status
- Soft-delete organization
- Activate / deactivate organization

#### B) Station Management
- Create stations under selected organization
- Update station details
- Soft-delete station
- Assign station admins

#### C) Fleet Management
- Add/edit fleet records per organization
- Assign fleet to stations

#### D) User Management
- Create organization admins
- View all users across platform
- Suspend/deactivate users

#### E) Roles & Permissions
- Create and manage roles
- Create and manage permissions
- Assign permissions to roles dynamically

#### F) Integrations
- Configure SMS gateway credentials and templates
- Configure payment provider credentials
- Configure third-party API keys/webhooks

#### G) Audit Logs
- View system-wide logs
- Filter by user, role, organization, date range, entity/action

## 3.3 Admin Portal (Organization-Level)

### Scope
Restricted to exactly one organization.

### Capabilities

#### A) User Management
- Create admins (with limited delegated permissions)
- Create operators
- Assign users to stations
- Activate/deactivate users in same organization

#### B) Pricing Management
Define and maintain pricing rules by:
- Weight
- Route
- Cargo type
- Urgency
- Package size
- Declared value band (optional surcharge/insurance model)

#### C) Cargo Management
View and manage organization cargo statuses:
- All Cargo
- Received
- In Transit
- At Station
- Delivered

Track by tracking number and cargo ID.

#### D) Reports (Read-Only)
- Cargo reports
- Station performance reports
- Operator performance reports

#### E) Payments (Read-Only)
- Pay-to-Go
- To-Pay
- Completed/settled payments

## 3.4 Operator Portal (Station-Level)

### Scope
Restricted to one station.

### Capabilities

#### A) Cargo Operations
- Receive cargo
- Dispatch/send cargo
- Mark cargo as delivered

For **Receive Cargo**, the Operator form must capture:
- Receiving Station (auto-populated from logged-in user's `stationId`, not user-editable)
- Destination Station
- Package Name
- Declared Value
- Weight
- Condition (`BRAND_NEW`, `REFURBISHED`, `USED`)
- Cargo Type (`PARCEL`, `PALLET`, `CONTAINER`, `FRAGILE_GOODS`)
- Urgency (`EXPRESS`, `STANDARD`, `MGR`)
- Package Size (`DOCUMENT`, `A3`, `SIZE_1`, `SIZE_2`, `SIZE_3`)
- Cargo Description (optional)
- Sender Name
- Sender Phone
- Receiver Name
- Receiver Phone

Enum descriptions:
- `condition`
  - `BRAND_NEW`: Unused, factory-sealed item
  - `REFURBISHED`: Restored, tested and certified
  - `USED`: Previously owned, functional condition
- `packageSize`
  - `DOCUMENT`: A4-sized paper, lightweight
  - `A3`: Small packets, soft parcels
  - `SIZE_1`: Small box, approx. 30cm x 30cm x 30cm
  - `SIZE_2`: Medium box, approx. 50cm x 50cm x 50cm
  - `SIZE_3`: Large box, approx. 70cm x 70cm x 70cm

Receive Cargo workflow:
- When all required fields are submitted, cargo is created with default status **`PENDING`** (unpaid).
- API must return calculated **price/charge** in the create response.
- API must auto-generate a **Cargo OTP** for delivery verification and store it securely (hashed).
- After payment confirmation, status changes to **`RECEIVED`** and API returns updated cargo object.

#### B) Tracking Updates
- Update cargo movement/status timeline

#### C) Delivery Flow (Operator UX)
1. Enter tracking ID.
2. If found, display cargo card (booking-card style summary) with CTA **Deliver Cargo**.
3. On clicking **Deliver Cargo**, prompt for **Cargo OTP**.
4. If OTP verification succeeds, cargo status updates to **`DELIVERED`** (complete).

#### D) Dispatch Flow (Operator UX)
1. Select cargo.
2. Select train.
3. Click dispatch.
4. Cargo status updates to **`IN_TRANSIT`**.

#### E) Printing
- Print receipts
- Reprint receipts with mandatory watermark: **"REPRINTED"**

## 3.5 Frontend Permission Matrix (Minimum)

| Capability | Super Admin | Admin | Operator |
|---|---:|---:|---:|
| Manage organizations | ✅ | ❌ | ❌ |
| Manage stations (cross-org) | ✅ | ❌ | ❌ |
| Manage users in org | ✅ | ✅ | ❌ |
| Manage pricing | ✅ | ✅ | ❌ |
| Cargo receive/send/deliver | ✅ | ✅ (if granted) | ✅ |
| View audit logs (global) | ✅ | ❌ | ❌ |
| View organization reports | ✅ | ✅ | ❌ |
| Configure integrations | ✅ | ❌ | ❌ |

> Note: Admin cargo write actions are optional and should be controlled via granular permissions.

---

## 4) Authentication & Security Specification

## 4.1 Operator Authentication (OTP)
- Login via phone + OTP
- OTP length: **6 digits**
- OTP expiry: **5 minutes**
- OTP must be stored hashed (never plaintext)
- First login must force OTP change
- Max OTP reset attempts: **5 per rolling 7 days**; account is locked when exceeded

### Operator Login Response Payload
```json
{
  "userId": "",
  "role": "operator",
  "stationId": "",
  "organizationId": ""
}
```

## 4.2 Admin Authentication
- Login via email/phone + password
- Password hash with strong KDF (Argon2id or bcrypt with approved work factor)
- Access token + refresh token issuance

### Admin Login Response Payload
```json
{
  "userId": "",
  "role": "admin",
  "permissions": [],
  "stationId": null
}
```

## 4.3 Token and Session Policy
- Access token TTL: short-lived (recommended 15-30 mins)
- Refresh token TTL: long-lived (recommended 7-30 days)
- Refresh token rotation on use
- Revoke refresh token on logout
- Inactivity timeout: auto logout after 3 days without activity

## 4.4 Account and Security Controls
- Account lock on OTP reset abuse
- Rate limiting for auth endpoints
- IP/device fingerprint logging on sensitive auth events
- Audit logs for login success/failure, resets, lock/unlock, permission changes

---

## 5) Data Model Specification (Core Entities)

## 5.1 Required Core Tables
- organizations
- stations
- fleets
- users
- roles
- permissions
- role_permissions
- cargo
- cargo_tracking
- pricing
- payments
- audit_logs
- app_versions
- integrations

## 5.2 Mandatory Columns and Conventions
Every business table must include:
- `id` (UUID recommended)
- `organization_id` (required for tenant-scoped entities)
- `created_at`
- `updated_at`
- `deleted_at` (nullable soft-delete timestamp)

### Tenant Exceptions
Global platform tables may omit `organization_id` only when logically global (e.g., permission catalog, app_versions if global).

## 5.3 Suggested Integrity Rules
- `stations.organization_id` FK -> `organizations.id`
- `users.organization_id` FK -> `organizations.id`
- `users.station_id` nullable for admins, required for operators
- `cargo.organization_id` and `cargo.station_id` mandatory
- Unique constraints:
  - organization code
  - station code within organization
  - tracking number globally or organization-scoped (choose one and enforce)

---

## 6) Backend Service Design

## 6.1 API Standards
- Base path: `/api/v1`
- Content type: `application/json`
- Time format: ISO-8601 UTC
- Pagination: `page`, `limit`, `sort`, `order`
- Filtering via query parameters
- Consistent response envelope:

```json
{
  "success": true,
  "data": {},
  "meta": {},
  "error": null
}
```

Error response:

```json
{
  "success": false,
  "data": null,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid payload",
    "details": []
  }
}
```

## 6.2 Middleware Stack
1. Request ID + structured logging
2. Auth (JWT/OTP session)
3. Tenant scope resolver
4. RBAC authorization
5. Input validation
6. Idempotency (selected endpoints)
7. Audit logger (POST/PUT/PATCH/DELETE)
8. Global error handler

## 6.3 Multi-Tenant Enforcement Rules
- Super Admin can operate across tenants.
- Admin/operator can only access records where `organization_id` matches token context.
- Operator station-level actions must match `station_id` in token context.
- Any scope mismatch returns HTTP 403.

---

## 7) API Endpoint Specifications

## 7.1 Organizations
- `POST /organizations`
- `GET /organizations`
- `GET /organizations/:id`
- `PUT /organizations/:id`
- `DELETE /organizations/:id` (soft-delete)

Rules:
- Super Admin only for create/update/delete.
- Deactivate organization blocks new operator/admin sessions.

## 7.2 Stations
- `POST /stations`
- `GET /stations`
- `PUT /stations/:id`
- `DELETE /stations/:id`
- `POST /stations/:id/assign-admin`

Rules:
- Station must belong to target organization.
- Assigned admin must belong to same organization.

## 7.3 Admins
- `POST /admins`
- `GET /admins`
- `PUT /admins/:id`
- `DELETE /admins/:id`

Rules:
- Admin CRUD scoped to organization unless Super Admin.
- Prevent self-demotion if user is last active org admin (safety rule).

## 7.4 Operators
- `POST /operators`
- `GET /operators`
- `PUT /operators/:id`
- `DELETE /operators/:id`
- `POST /operators/send-otp`
- `POST /operators/verify-otp`
- `POST /operators/change-otp`

Rules:
- Operator must be bound to a station.
- Phone number unique per organization or globally (must choose and enforce).

## 7.5 Authentication

### Operator Auth
- `POST /auth/operator/login`
- `POST /auth/operator/reset-otp`
- `POST /auth/operator/change-otp`

### Admin Auth
- `POST /auth/admin/login`
- `POST /auth/admin/refresh-token`
- `POST /auth/admin/logout`

Rules:
- Reset OTP increments weekly counter.
- Lock account after 5 resets in rolling 7-day window.

## 7.6 Cargo
- `POST /cargo/receive`
- `POST /cargo/send`
- `POST /cargo/deliver`
- `POST /cargo/:id/verify-delivery-otp`
- `GET /cargo/track/:trackingNumber`
- `GET /cargo/:id`

Rules:
- Valid status transitions only:
  - `PENDING -> RECEIVED -> IN_TRANSIT -> AT_STATION -> DELIVERED`
  - Any status can move to `CANCELED` if cancellation policy allows.
- Invalid transition returns HTTP 409.
- Every status write must append to `cargo_tracking`.
- Cargo must carry both:
  - `paymentStatus` (`PENDING`, `PAID`, `FAILED`, `REFUNDED` as applicable)
  - `status` (`RECEIVED`, `IN_TRANSIT`, `DELIVERED`, `CANCELED`, `AT_STATION`)
- `AT_STATION` means received cargo currently at the user's station and not canceled, not delivered, and not in transit.

### Receive Cargo Request Contract (`POST /cargo/receive`)
Required fields:
- `destinationStationId`
- `packageName`
- `declaredValue`
- `weight`
- `condition` (`BRAND_NEW` | `REFURBISHED` | `USED`)
- `cargoType` (`PARCEL` | `PALLET` | `CONTAINER` | `FRAGILE_GOODS`)
- `urgency` (`EXPRESS` | `STANDARD` | `MGR`)
- `packageSize` (`DOCUMENT` | `A3` | `SIZE_1` | `SIZE_2` | `SIZE_3`)
- `senderName`
- `senderPhone`
- `receiverName`
- `receiverPhone`

Optional fields:
- `cargoDescription`

Enum definitions:
- `condition`
  - `BRAND_NEW`: Unused, factory-sealed item
  - `REFURBISHED`: Restored, tested and certified
  - `USED`: Previously owned, functional condition
- `packageSize`
  - `DOCUMENT`: A4-sized paper, lightweight
  - `A3`: Small packets, soft parcels
  - `SIZE_1`: Small box, approx. 30cm x 30cm x 30cm
  - `SIZE_2`: Medium box, approx. 50cm x 50cm x 50cm
  - `SIZE_3`: Large box, approx. 70cm x 70cm x 70cm

Server-derived fields:
- `receivingStationId` from authenticated operator/admin station context
- `organizationId` from authenticated user tenant context
- Initial `status = PENDING`
- Auto-generated `deliveryOtp` (hashed at rest, plaintext only returned once in secured response/channel)

Behavior:
1. Validate required fields and tenant/station scope.
2. Calculate price using active pricing rules with these inputs from cargo details:
   - Route (`receivingStationId -> destinationStationId`)
   - Declared value
   - Weight
   - Cargo type
   - Urgency
   - Package size
3. Persist cargo record with `status = PENDING`.
4. Generate and persist delivery OTP metadata (hash + expiry).
5. Return cargo summary + computed price.

Example response (pending/unpaid):
```json
{
  "success": true,
  "data": {
    "cargo": {
      "id": "uuid",
      "trackingNumber": "MZG-000001",
      "status": "PENDING"
    },
    "pricing": {
      "currency": "TZS",
      "amount": 12500
    }
  }
}
```

### Payment Confirmation Behavior
When payment is completed for a `PENDING` cargo:
1. Payment record is marked successful.
2. Cargo status is updated to `RECEIVED`.
3. Updated cargo object is returned in response.

### Dispatch Cargo Behavior (`POST /cargo/send`)
Required action inputs:
- cargo selection (`cargoId`)
- transport selection (`trainId`)

Behavior:
1. Validate cargo is dispatchable (e.g., `RECEIVED` or `AT_STATION`).
2. Attach dispatch/transport metadata (`trainId`, dispatched by, timestamp).
3. Update cargo status to `IN_TRANSIT`.
4. Append tracking event and return updated cargo object.

### Deliver Cargo Behavior (OTP-Gated)
Delivery must be OTP-verified:
1. User enters tracking number and system fetches cargo.
2. UI shows cargo card with CTA **Deliver Cargo**.
3. User submits cargo OTP via verification endpoint.
4. If OTP valid and not expired, set cargo status to `DELIVERED` and return updated cargo object.
5. If OTP invalid/expired, return HTTP 400/401 and do not change status.

## 7.7 Reports
- `GET /reports/cargo`
- `GET /reports/stations`
- `GET /reports/operators`

Supported filters:
- date range
- status
- organization
- station
- operator

Rules:
- Admin/operator cannot query outside organization scope.

## 7.8 Pricing
- `POST /pricing`
- `PUT /pricing/:id`
- `GET /pricing`

Example model:
```json
{
  "basePrice": 1000,
  "pricePerKg": 500,
  "route": "DAR-MWANZA"
}
```

Rules:
- Only one active pricing rule for same route/cargo type/date-window combination.

### Pricing Determination Inputs (Runtime)
Cargo price computation must use:
- Route (receiving station from logged-in user context + destination station from request)
- Declared value
- Weight
- Cargo type (`PARCEL` | `PALLET` | `CONTAINER` | `FRAGILE_GOODS`)
- Urgency (`EXPRESS` | `STANDARD` | `MGR`)
- Package size (`DOCUMENT` | `A3` | `SIZE_1` | `SIZE_2` | `SIZE_3`)

### Admin Pricing Configuration Requirements
Admin pricing setup must allow defining price rules using the same factors used at runtime:
- Route pair (from station -> to station)
- Weight bands/slabs
- Declared value bands (for surcharge or insurance)
- Cargo type multipliers/base prices
- Urgency multipliers
- Package size multipliers/base prices

The rule engine must ensure deterministic pricing: for any given input set, exactly one active rule outcome should be selected (or fail with explicit configuration error if ambiguous/missing).

## 7.9 Payments
- `GET /payments/providers`
- `GET /payments/:id`
- `POST /payments/bulk-status`
- `POST /payments/callback`

Rules:
- Callback endpoint must verify signature.
- Callback processing must be idempotent.

## 7.10 Audit Logs
- `GET /audit-logs`

Captured fields:
- `userId`
- `role`
- `action`
- `entity`
- `timestamp`
- `metadata`

Rules:
- Super Admin has global read.
- Organization Admin reads only within own organization.

## 7.11 Roles & Permissions
- `POST /roles`
- `GET /roles`
- `POST /permissions`
- `GET /permissions`
- `POST /roles/:id/assign-permissions`

Rules:
- Privileged permission assignment requires Super Admin unless explicitly delegated.

## 7.12 App Versioning
- `POST /app-versions`
- `GET /app-versions`
- `GET /app-versions/latest`
- `GET /app-versions/:id`
- `GET /app-versions/check-update`

Response example:
```json
{
  "latestVersion": "2.0.1",
  "forceUpdate": true,
  "downloadUrl": ""
}
```

Rules:
- If client version < minimum supported version, server returns `forceUpdate = true`.

---

## 8) Business Rules & Restrictions

## 8.1 Printing Restrictions
- Receipt reprints must include watermark `REPRINTED`.
- Reprint event logged in audit trail with reason (optional but recommended).

## 8.2 Security Restrictions
- OTP reset limit: 5 per rolling week.
- Exceeded limit -> account lock.
- Unlock requires admin action or policy-driven cooldown.

## 8.3 Idle Timeout
- 3 days inactivity triggers token invalidation and forced login.

## 8.4 Update Enforcement
- App update checks at login and periodically during session.
- Force update blocks transactional actions until update completed.

---

## 9) Non-Functional Requirements

- Availability target: >= 99.9%
- P95 API latency target: < 300ms for non-report endpoints
- Full observability:
  - structured logs
  - error tracking
  - metrics + dashboards
- Backup and restore policy for DB and integrations config
- Data retention and privacy policy for audit logs and PII

---

## 10) Engineering Implementation Notes

1. **Soft Delete**: never hard-delete critical entities; filter `deleted_at IS NULL` by default.
2. **Audit Middleware**: enforce write logging globally for POST/PUT/PATCH/DELETE.
3. **OTP Handling**: hash OTP, 5-minute expiry, no OTP in logs.
4. **Tenant Safety**: derive organization scope from token, never trust client-supplied `organization_id` alone.
5. **Migration Strategy**: add constraints/indexes for tenant-aware query performance (`organization_id`, `station_id`, `status`, `created_at`).

---

## 11) Open Decisions (Must Be Finalized Before Build Freeze)

- Should phone number uniqueness be global or organization-scoped?
- Should tracking number uniqueness be global or organization-scoped?
- Can Admin perform cargo write operations by default, or only via explicit permission grants?
- Account unlock policy after OTP lock: automatic cooldown, admin unlock, or both?
- App versioning scope: per platform (web/mobile), per OS, or both?

---

## 12) Backend Implementation Plan (Step-by-Step)

This section breaks the backend build into sequential phases so teams can implement and validate incrementally.

### Step 1: Backend Foundation (Must Complete First)
Scope:
- Service bootstrap with `/api/v1` base path
- Shared response/error envelope
- Global error handler
- Request validation layer
- Auth + tenant context middleware skeleton

Deliverables:
- Health endpoint + versioned API root
- Standard error codes (`VALIDATION_ERROR`, `UNAUTHORIZED`, `FORBIDDEN`, `NOT_FOUND`, `CONFLICT`)
- Middleware chain wired in required order

Definition of Done:
- Every endpoint returns standardized envelope.
- Invalid payloads fail with consistent 400 error shape.
- Authenticated requests expose `userId`, `role`, `organizationId`, `stationId` in request context.

### Step 2: Identity, Roles, and Tenant Guardrails
Scope:
- Admin/operator auth endpoints
- OTP generation/verification/change/reset
- Role/permission read + assignment APIs
- Tenant and station scope enforcement

Definition of Done:
- OTP hashing + expiry + reset-limit lock rule enforced.
- Permission checks block unauthorized writes.
- Cross-tenant access attempts consistently return 403.

### Step 3: Master Data APIs
Scope:
- Organizations, stations, admins, operators
- Soft-delete behavior and list filtering (`deleted_at IS NULL`)
- Audit log capture for write operations

Definition of Done:
- CRUD endpoints functional with tenant-safe filters.
- Soft-deleted records hidden by default.
- Audit records created for POST/PUT/DELETE actions.

### Step 4: Cargo Core Lifecycle
Scope:
- `POST /cargo/receive`, `POST /cargo/send`, `POST /cargo/deliver`
- Delivery OTP verification flow
- Cargo tracking timeline writes
- Status and paymentStatus state machine rules

Definition of Done:
- Receive creates cargo in `PENDING` and returns computed price.
- Payment completion moves cargo to `RECEIVED`.
- Dispatch updates status to `IN_TRANSIT`.
- Delivery requires valid OTP and sets `DELIVERED`.

### Step 5: Pricing + Payments Integration
Scope:
- Pricing CRUD and rule selection
- Payment provider listing and status endpoints
- Callback signature verification + idempotent processing

Definition of Done:
- Runtime pricing matches admin-configured rule factors.
- Duplicate payment callbacks do not create duplicate effects.
- Payment state changes are reflected in cargo `paymentStatus`.

### Step 6: Reporting, Audit UI APIs, and Hardening
Scope:
- Reports endpoints with filters
- Audit-log query endpoints
- Rate limits, observability dashboards, and performance tuning

Definition of Done:
- Reports return correct tenant-scoped aggregates.
- Audit logs queryable by user/role/org/date/entity/action.
- P95 latency target validated for non-report endpoints.

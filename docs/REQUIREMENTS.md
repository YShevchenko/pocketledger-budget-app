# PocketLedger Requirements

**Document:** REQUIREMENTS.md  
**Product:** PocketLedger  
**Publisher:** Heldig Lab  
**Source of Truth:** [SPEC.md](./SPEC.md)  

## Purpose

This document enumerates the functional requirements (FR) and high-level non-functional requirements (NFR) for PocketLedger (v1.0).

---

## 1. Functional Requirements

### 1.1 Transaction Entry (FR-001 to FR-010)

| ID | Requirement | Priority |
|---|---|---|
| FR-001 | The system shall provide a custom, oversized numeric keypad for rapid transaction entry. | High |
| FR-002 | The system shall allow assigning an entered amount to a specific Envelope. | High |
| FR-003 | The system shall allow users to add an optional text note to a transaction. | High |
| FR-004 | The system shall differentiate between Expenses (deductions) and Income (additions). | High |

> **Note:** Split transactions (splitting a single transaction across multiple envelopes) are deferred to v2.

### 1.2 Envelope Management (FR-011 to FR-020)

| ID | Requirement | Priority |
|---|---|---|
| FR-011 | The system shall display a dashboard of all active envelopes, showing Budgeted, Spent, and Remaining amounts. | High |
| FR-012 | Envelopes with negative balances shall be highlighted in red (Overspent). | High |
| FR-013 | The system shall allow users to move money between envelopes to cover overspending (Rule 3). | High |
| FR-014 | The system shall carry over unspent envelope balances to the next month automatically. | High |

### 1.3 Ledger & History (FR-021 to FR-030)

| ID | Requirement | Priority |
|---|---|---|
| FR-021 | The system shall display a chronological list of all transactions (the Ledger). | High |
| FR-022 | The system shall allow users to edit or delete past transactions, recalculating balances instantly. | High |
| FR-023 | The system shall allow users to mark transactions as "Cleared" (reconciled with their actual bank statement). | Medium |

### 1.4 Premium Features (FR-031 to FR-040)

| ID | Requirement | Priority |
|---|---|---|
| FR-031 | The system shall lock the creation of > 5 envelopes behind a $19.99 one-time Premium unlock. | High |
| FR-032 | The system shall allow Premium users to set up Recurring Bills that automatically log on their due date. | High |
| FR-033 | The system shall allow Premium users to attach camera photos (Receipts) to transactions. | High |
| FR-034 | The system shall validate the Premium unlock locally via RevenueCat without requiring an account. | High |

### 1.5 Export & Data (FR-041 to FR-050)

| ID | Requirement | Priority |
|---|---|---|
| FR-041 | The system shall allow users to export the entire ledger to a CSV file. | High |
| FR-042 | The system shall allow users to export/import the full SQLite database as JSON for device migration. | Critical |

---

## 2. Non-Functional Requirements (High-Level)

| ID | Category | Requirement |
|---|---|---|
| NFR-001 | **Privacy** | **Zero-Backend:** No financial data, transactions, or receipts shall ever be transmitted to Heldig Lab servers or Plaid. |
| NFR-002 | **Monetization** | Freemium with a single $19.99 non-consumable unlock. No subscriptions or ads. |
| NFR-003 | **Performance** | The custom numpad must register taps and animate in < 16ms (60fps) to feel like a physical calculator. |
| NFR-004 | **Offline** | 100% of the application's features must work in Airplane Mode. |

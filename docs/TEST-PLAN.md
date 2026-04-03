# PocketLedger Test Plan

**Document:** TEST-PLAN.md  

## 1. Strategy
The primary risk is **Data Corruption** and **Math Errors**. If the app loses a transaction or miscalculates a balance, the user loses all trust.

## 2. Testing Tiers
- **Unit Tests:** Exhaustively test the sum aggregations. (e.g., Initial $100 - $20 expense + $10 refund = $90 remaining). Ensure floating-point math issues are handled (use cents/integers for DB storage, format on UI).
- **Integration Tests:** SQLite DB read/write speeds, especially during JSON export/import.
- **E2E Tests:** Ensure a transaction entered via the Numpad correctly deducts from the target envelope on the Dashboard.
- **Manual QA:** Test the custom numpad for "ghost touches" or dropped inputs when typing rapidly.
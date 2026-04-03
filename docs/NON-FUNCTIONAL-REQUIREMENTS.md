# PocketLedger Non-Functional Requirements

**Document:** NON-FUNCTIONAL-REQUIREMENTS.md  
**Product:** PocketLedger  

## 1. Privacy & Security (NFR-100)
- **NFR-101 (Zero-Knowledge):** No financial data shall leave the device.
- **NFR-102 (No Accounts):** The app must function fully anonymously without Plaid or email login.
- **NFR-103 (App Lock):** The app must support an optional FaceID/TouchID/PIN lock on launch.

## 2. Performance (NFR-200)
- **NFR-201 (Input Latency):** The custom numpad must react instantly (< 16ms) to avoid input buffering issues.
- **NFR-202 (Aggregation Speed):** Summing the current month's transactions for the dashboard must complete in < 50ms, even with 10,000+ rows.

## 3. Reliability (NFR-300)
- **NFR-301 (Offline):** 100% functionality must be available without Wi-Fi.
- **NFR-302 (Data Integrity):** The SQLite database must use WAL (Write-Ahead Logging) to prevent corruption if the app is killed during a transaction save.
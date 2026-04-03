# PocketLedger UI/UX Specification

**Document:** UI-UX-SPEC.md  
**Product:** PocketLedger  

## 1. Design Philosophy
- **Frictionless Input:** Manual budgeting fails when entry is tedious. The "Add Transaction" screen is the most important part of the app. It must look like a beautiful, tactile calculator.
- **Financial Clarity:** Positive numbers are Green. Negative numbers are Red. Neutral balances are Grey/White.

## 2. Color Palette
- **Background (Light Mode):** `#F4F7F6` (Cool grey-white).
- **Background (Dark Mode):** `#1E1E1E` (Dark grey).
- **Income/Available:** `#27AE60` (Emerald Green).
- **Expense/Empty:** `#E74C3C` (Alizarin Red).

## 3. Screens (Vibecodable)
1. **The Dashboard:** A top card showing "Total Available Cash". Below, a 2-column grid of "Envelopes" (Groceries, Rent, Fun). Each shows a progress bar. A giant `+` FAB.
2. **Transaction Entry (The Numpad):** The screen is dominated by a huge custom numeric keypad. The top shows the current amount. Above the keypad are horizontally scrolling chips to select the Envelope.
3. **The Ledger:** A chronological list of transactions. Simple, clean typography.
4. **Envelope Detail:** Tapping an envelope shows its specific ledger and a button to "Move Money" from another envelope.
5. **Settings:** Toggles for FaceID lock, Export/Import Data (JSON), and the $19.99 Premium Unlock.

## Error & Edge States

- **Empty state (no envelopes):** "Create your first envelope to start budgeting" with a large `+` button centered on the dashboard. No progress bars or balance cards are shown until the first envelope exists.
- **Empty state (no transactions):** "No transactions yet. Use the numpad to log your first expense." Shown inside an envelope detail view when it has zero transactions.
- **Overspent envelope:** The envelope card turns red with the negative balance displayed prominently. Below the balance, a prompt reads: "Move money from another envelope or adjust your budget." Tapping the prompt opens the Move Money flow.
- **Recurring transaction failed to auto-log:** A missed badge (small red dot with count) appears on the dashboard next to the affected envelope. Tapping it reveals the missed transaction with an option to manually confirm or dismiss.
- **Import validation failure:** Alert dialog: "This file doesn't match the expected PocketLedger format." Single "OK" button to dismiss. No data is modified.
- **Export success:** Toast notification at the bottom of the screen: "Data exported successfully." The system share sheet opens automatically so the user can save or send the file.
- **Delete All Data confirmation:** Two-step confirmation flow. First alert: "Delete all envelopes, transactions, and settings?" with "Cancel" and "Delete Everything" buttons. Second alert (after tapping Delete Everything): "This cannot be undone. Are you sure?" with "Cancel" and "Yes, Delete All" in destructive red.
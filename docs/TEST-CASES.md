# PocketLedger Detailed Test Cases

**Document:** TEST-CASES.md  

## 1. The Numpad & Math (TC-100)
### TC-101: Floating Point Accuracy
1. Enter $10.01.
2. Add a second transaction for $0.02.
3. **Expected:** The total deduction is exactly $10.03, not $10.0299999.

### TC-102: Rapid Input
1. Tap "1", "2", "3", "4", "5" as fast as physically possible.
2. **Expected:** The display reads "$123.45". No numbers are dropped.

## 2. Envelope Logic (TC-200)
### TC-201: Overspending Color Change
1. Create a "Coffee" envelope with $10 budget.
2. Log a $12 transaction to "Coffee".
3. **Expected:** The envelope balance shows "-$2.00" and the UI element turns Red.

### TC-202: Money Movement
1. Move $5 from "Groceries" to the overspent "Coffee" envelope.
2. **Expected:** "Coffee" balance is now +$3.00 and turns Green. "Groceries" is reduced by $5.

## 3. Envelope Management (TC-100 continued)

### TC-103: Create Envelope with Name and Budget
1. Tap "Add Envelope" on the dashboard.
2. Enter name "Groceries" and budget amount "$400".
3. Tap "Save".
4. **Expected:** The "Groceries" envelope appears on the dashboard showing $400 Budgeted, $0 Spent, $400 Remaining in green.

### TC-104: Log Transaction via Numpad
1. Open the numpad entry screen.
2. Tap "1", "2", ".", "5", "0" to enter $12.50.
3. Select the "Groceries" envelope from the list.
4. Swipe to confirm the transaction.
5. **Expected:** The transaction is logged. "Groceries" envelope now shows $12.50 Spent and $387.50 Remaining. The ledger displays the new entry with the correct amount and envelope.

### TC-105: Overspend an Envelope
1. Create a "Dining" envelope with $20 budget.
2. Log a transaction of $25 to "Dining" via the numpad.
3. **Expected:** The "Dining" envelope balance shows "-$5.00". The envelope UI element turns red (overspent state). The dashboard total reflects the overspending.

### TC-106: Move Money Between Envelopes
1. Create "Groceries" with $400 and "Dining" with $100.
2. Navigate to "Move Money" and transfer $50 from "Groceries" to "Dining".
3. **Expected:** "Groceries" Remaining decreases by $50. "Dining" Remaining increases by $50. Neither envelope's "Budgeted" or "Spent" columns change — only "Remaining" is affected.

### TC-107: Add Recurring Transaction (Premium)
1. Unlock Premium.
2. Navigate to Recurring Bills and tap "Add".
3. Enter "Netflix", $15.99/month, due date the 15th.
4. Save the recurring bill.
5. Advance the system date to the 15th of the current month.
6. **Expected:** A transaction of $15.99 is automatically logged to the assigned envelope on the due date. The envelope balance deducts $15.99 and the ledger shows the entry with a "Recurring" badge.

### TC-108: Premium Gate — 6th Envelope
1. On a free-tier account, create 5 envelopes (the maximum).
2. Tap "Add Envelope" to create a 6th.
3. **Expected:** A paywall modal appears presenting the $19.99 one-time Premium unlock. The 6th envelope is not created. Dismissing the paywall returns the user to the dashboard with 5 envelopes.

### TC-109: Premium Gate — Receipt Photo
1. On a free-tier account, log a transaction.
2. In the transaction detail, tap "Attach Receipt" (camera icon).
3. **Expected:** A paywall modal appears presenting the $19.99 one-time Premium unlock. No camera or photo picker opens. Dismissing the paywall returns to the transaction detail without an attachment.

### TC-110: View Spending Trends Chart
1. Create 2 envelopes and log at least 5 transactions across both over 3 different dates.
2. Navigate to the "Trends" / "Reports" screen.
3. **Expected:** A spending chart is displayed showing transaction totals grouped by date. The sum of all charted data points matches the total spent amounts in the envelope dashboard. Tapping a data point shows a breakdown by envelope.

### TC-111: Attach Receipt Photo to Transaction (Premium)
1. Unlock Premium.
2. Log a new transaction for $45.00 to "Groceries".
3. In the transaction detail, tap "Attach Receipt".
4. Take a photo or select one from the photo library.
5. Save.
6. **Expected:** The receipt image thumbnail appears in the transaction detail view. Tapping the thumbnail opens a full-screen preview of the receipt. The image persists across app restarts.

### TC-112: Export All Data as JSON
1. Create 3 envelopes, 5 transactions, and 1 recurring bill.
2. Navigate to Settings > Export Data > JSON.
3. Save the file.
4. Open the exported JSON file and inspect contents.
5. **Expected:** The JSON contains all 3 envelopes (with names, budgets), all 5 transactions (with amounts, dates, notes, envelope assignments), and the recurring bill definition. No fields are missing or null unexpectedly.

### TC-113: Import JSON Backup
1. Export data as JSON per TC-112.
2. Navigate to Settings > "Delete All Data" and confirm.
3. Navigate to Settings > Import Data.
4. Select the previously exported JSON file.
5. **Expected:** All 3 envelopes, 5 transactions, and the recurring bill are fully restored. Envelope balances match the pre-export state. The ledger shows all transactions in correct chronological order.

### TC-114: Delete All Data
1. Create 3 envelopes and log 5 transactions.
2. Navigate to Settings > "Delete All Data".
3. Confirm the destructive action.
4. **Expected:** The app returns to the empty first-launch state. The dashboard shows zero envelopes. The ledger is empty. A check of the SQLite database confirms all tables are cleared.

### TC-115: Month Rollover — Budget Reset
1. Create a "Groceries" envelope with $400 budget.
2. Log $350 in transactions during the current month.
3. Advance the system date to the 1st of the next month.
4. Relaunch the app.
5. **Expected:** Based on default carry-over settings, the unspent $50 carries over and "Groceries" shows $450 Remaining ($400 new budget + $50 carry-over). If carry-over is disabled in settings, the balance resets to exactly $400.

### TC-116: Edit Existing Transaction Amount
1. Log a transaction for $50.00 to "Groceries".
2. Open the transaction in the ledger and tap "Edit".
3. Change the amount from $50.00 to $30.00.
4. Save.
5. **Expected:** The transaction now shows $30.00 in the ledger. The "Groceries" envelope balance immediately recalculates — Remaining increases by $20.00 (the difference). No duplicate or ghost transactions are created.

### TC-117: Delete Transaction
1. Log a transaction for $25.00 to "Dining".
2. Open the transaction in the ledger.
3. Tap "Delete" and confirm.
4. **Expected:** The transaction is removed from the ledger. The "Dining" envelope Remaining increases by $25.00. The transaction does not appear anywhere in the app. The Trends chart (if viewed) no longer includes the deleted amount.

## 4. Data Portability (TC-300)
### TC-301: JSON Export/Import
1. Create 3 envelopes and 5 transactions.
2. Export JSON to the local filesystem.
3. Clear all app data.
4. Import the JSON file.
5. **Expected:** All 3 envelopes and 5 transactions are restored perfectly.
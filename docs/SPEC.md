# PocketLedger Product Spec

## 1. Product Identity

### 1.1 Working Product Name
PocketLedger (Manual Envelope Budgeting)

### 1.2 Product Category
Mobile finance utility for manual, envelope-based budget tracking.

### 1.3 Product Type
Privacy-first, offline iOS and Android app built with React Native and Expo.

### 1.4 Core Identity Statement
PocketLedger believes automated bank syncing makes you poor. When an app (like Mint or Copilot) categorizes your spending automatically, you lose the psychological pain of handing over money. PocketLedger forces manual entry, but makes it frictionless with a massive, calculator-style UI. It uses the proven Envelope System (YNAB, Dave Ramsey) without requiring a $100/year subscription. It keeps all your financial data exclusively on your device.

## 2. Vision Statement

The personal finance market is dominated by apps that hoard your bank credentials via Plaid, analyze your spending to sell credit cards, and lock basic budgeting behind recurring fees. The vision for PocketLedger is to be the ultimate offline financial tool: a private ledger that you buy once, control completely, and rely on to actively engage with your money.

## 3. Core Concept

The user opens the app and is greeted by a massive numpad.
1. **Type amount:** "$12.50"
2. **Select Envelope:** Tap "Groceries" chip.
3. **Optional Note:** "Publix".
4. **Swipe to log.**

The dashboard shows Envelopes (e.g., "Dining Out: $40 left of $200"). When an envelope is empty, it turns red. Users must actively move money between envelopes if they overspend.

## 4. Target Audience
- Privacy-conscious individuals who refuse to hand over bank credentials.
- Cash-envelope budgeters who want a digital equivalent.
- Dave Ramsey followers focused on debt snowballing.
- Users tired of $100/year subscriptions for budgeting tools.

## 5. Monetization Strategy

**Freemium (One-Time IAP)**
- **Free Tier:** Core numpad entry, basic ledger, up to 5 envelopes. Good for simple expense tracking.
- **Premium Tier ($19.99 One-Time):** Unlocks unlimited envelopes, recurring transactions (subscriptions/bills), advanced charts/trends, and the ability to attach receipt photos to transactions.
- **Why this maximizes revenue:** The $20 price point is a steal compared to YNAB ($109/yr). Users see the ROI instantly. The lack of Plaid API fees and server hosting means 100% gross margin.

## 6. Marketing & User Acquisition Strategy
**Classification:** Tier 3 Danger Zone (High Finance CPIs)
**Primary Ad Platforms:** Organic TikTok, Apple Search Ads (long-tail keywords). *Avoid broad Facebook Finance ads (CPI too high).*
**Targeting:** Dave Ramsey followers, YNAB churners, privacy advocates.
**Core Hook:** "Automated bank syncing makes you lazy and sells your data. Take back control with manual envelope budgeting. No Plaid. No $100/yr fees."
**Geographic Strategy:** EU markets (Germany/Switzerland) where Plaid/Open Banking is viewed with suspicion. Highlight "100% Local SQLite".


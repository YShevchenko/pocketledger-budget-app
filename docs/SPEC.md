# SPEC.md

## 1. Vision, Mission Statement, and Product Philosophy

### 1.1 Product Name Placeholder

Working product name: **Budget / Personal Finance App**  
Final marketing name: **TBD**

This document uses "the app" as the canonical product reference.

### 1.2 Product Vision

The app exists to become the most trusted personal finance tool for people who want clarity without surveillance, discipline without dogma, and control without complexity.

The long-term vision is a privacy-first, offline-first money management app that helps individuals and households understand where their money goes, make better decisions month to month, and build sustainable financial habits without:

- linking bank accounts
- creating an online account
- depending on cloud sync for core functionality
- being forced into a rigid budgeting ideology
- giving sensitive financial data to aggregators, advertisers, or data brokers

The app is intentionally positioned for a post-Mint market and for users who are exhausted by overly opinionated budgeting tools. It is designed to serve people who still want strong insight, structure, and reporting, but on their own terms.

The core vision can be stated as:

**A calm, local-first finance app that makes manual money tracking fast enough to maintain, smart enough to be useful, and private enough to trust.**

### 1.3 Vision Statement

**Give people a durable, privacy-respecting way to understand and manage their money entirely on their own device, with no bank linking, no mandatory account, and no pressure to adopt a budgeting philosophy they do not want.**

### 1.4 Mission Statement

**Help users build financial awareness through fast manual transaction entry, intelligent categorization, flexible budgeting, and clear local reporting, while preserving user autonomy, privacy, and offline reliability by default.**

### 1.5 Problem Statement

The personal finance software market has a structural trust problem and a usability problem.

Many finance apps depend on one or more of the following:

- bank aggregation providers that break, require re-authentication, or create anxiety around credential sharing
- mandatory account creation and cloud persistence
- subscription-first business models with poor free value
- overly complex workflows that demand daily maintenance
- rigid budgeting frameworks that feel more like homework than help
- privacy tradeoffs that users either do not understand or cannot meaningfully opt out of

This leaves a specific underserved user segment:

- people displaced by Mint who want simple visibility
- users who dislike YNAB-style rule systems and cognitive overhead
- privacy-conscious users who do not want bank linking
- users in regions where bank integration quality is poor or unsupported
- users who prefer a manual ledger because they trust what they enter

These users do not necessarily want full automation. They want:

- speed
- clarity
- local ownership of their data
- enough intelligence to reduce repetitive entry
- enough structure to improve behavior
- enough reporting to notice patterns

The app addresses this gap by treating manual entry not as a weakness to be tolerated, but as the primary product design problem to be solved well.

### 1.6 Product Thesis

The product is built on five operating beliefs:

1. Manual entry can be sustainable if the interaction cost is low enough.
2. Privacy is a product feature, not a legal footnote.
3. Offline-first architecture improves trust, speed, and resilience.
4. Most users need flexible guidance, not ideological enforcement.
5. A finance tool should reduce stress, not create it.

The thesis is that users will consistently maintain a manual finance habit if the app delivers all of the following at once:

- transaction entry in 5 to 15 seconds for common cases
- automatic category suggestions based on local history
- instant monthly and category-level feedback
- predictable performance with no network dependency for core actions
- a business model that does not depend on monetizing user financial data

### 1.7 Mission Boundaries

The mission is intentionally narrow. The app is not trying to become:

- a neobank
- a tax filing platform
- an investment brokerage dashboard
- a debt payoff coaching product
- a financial advisor
- a shared social finance network
- an ad-supported personal finance media product

The app focuses on everyday cash flow awareness and personal budgeting. The scope includes:

- recording income and expenses
- categorizing transactions
- setting budgets
- understanding spending trends
- planning repeating obligations
- exporting user-owned data

The scope excludes:

- direct bank imports
- credit score tracking
- loan shopping
- investment account aggregation
- peer-to-peer payments
- financial product recommendations driven by affiliate incentives

### 1.8 Core User Promise

The app makes a simple promise:

**If you enter your money activity, the app will organize it, summarize it, and help you act on it without sending your financial life to a third party.**

This promise has four dimensions:

#### 1.8.1 Trust

Users should believe that:

- their data stays on device by default
- the app does not require invasive permissions
- they do not need to connect a bank to receive value
- the product team is economically aligned with users through paid features, not data extraction

#### 1.8.2 Simplicity

Users should feel that:

- common actions are obvious
- the app is easier to keep up than a spreadsheet
- budgeting is supportive rather than burdensome
- entering a missed transaction does not create cascading complexity

#### 1.8.3 Control

Users should be able to:

- decide how much structure they want
- customize categories and budgets without ceremony
- export their data at any time
- use the app fully offline for core functions

#### 1.8.4 Momentum

Users should feel rewarded for consistent use through:

- fast add flows
- meaningful monthly summaries
- useful spending insights
- recurring transaction support
- low-friction review loops

### 1.9 Product Philosophy

The product philosophy is the decision framework for every feature, UI flow, architecture choice, and monetization tradeoff.

#### 1.9.1 Privacy-First, Not Privacy-Themed

Privacy is not a marketing skin applied to a conventional cloud product. It is a foundational constraint.

This means:

- no bank linking
- no required user account
- no dependence on server-side transaction processing for core features
- no ad-tech SDKs
- no selling, renting, or repurposing transaction data
- no hidden lock-in around exports

If a feature requires sending sensitive financial data off-device to work, it should be treated as suspect by default and excluded unless it delivers exceptional user value with explicit, informed consent and a clearly bounded data path.

Default stance:

- local storage first
- network optional
- data minimization always

#### 1.9.2 Offline-First Means Operational Independence

Offline-first is not only a resilience benefit. It is also a trust and usability principle.

The app must remain fully useful in situations such as:

- no connectivity
- poor connectivity
- airplane travel
- roaming restrictions
- regional service outages
- third-party provider outages

Core tasks that must never depend on network access:

- opening the app
- viewing existing data
- adding, editing, and deleting transactions
- category management
- budget management
- recurring transaction generation logic
- chart and report viewing
- search and filtering
- CSV export to local device storage/share targets

Premium entitlement verification may require periodic network contact through platform billing and RevenueCat, but loss of connectivity must degrade gracefully and never risk user data access.

#### 1.9.3 Manual Does Not Mean Primitive

The app rejects the false choice between "fully automated but invasive" and "fully manual but tedious."

Manual entry should still feel smart. The app should reduce repetitive work through local intelligence, including:

- suggested categories based on merchant/title patterns
- remembered amounts for repeating expenses when appropriate
- recent merchant suggestions
- quick-add presets
- smart defaults for dates, accounts, and categories

The design standard is not "manual entry is possible." The standard is:

**manual entry feels fast enough that disciplined users will keep doing it for months and years.**

#### 1.9.4 Flexible Budgeting Over Budgeting Ideology

Many users want awareness and guardrails without being taught a doctrine.

The app therefore avoids forcing users into:

- zero-based budgeting
- envelope budgeting
- strict "every dollar gets a job" workflows
- punitive rollover logic
- mandatory reconciliation rituals

Instead, the product offers flexible budgeting tools that users can adopt incrementally:

- monthly category budgets
- category progress indicators
- recurring expense awareness
- simple trends and comparisons
- optional alerts and reminders

The philosophy is assistive, not prescriptive.

#### 1.9.5 Calm Software Over Anxiety Software

Money tools often create guilt through aggressive warnings, red-heavy visuals, or overly financialized language. This app should help users face reality clearly without making the experience punitive.

The product tone should be:

- direct
- quiet
- respectful
- practical
- non-judgmental

The app should never imply moral failure because a user overspent, missed entries, or skipped budgeting for a month.

Good product behavior includes:

- surfacing issues clearly
- offering next actions
- avoiding alarmist copy
- supporting re-entry after lapses

#### 1.9.6 User Ownership Over Product Lock-In

The app should earn retention through usefulness, not captivity.

This means:

- straightforward CSV export
- comprehensible category structures
- predictable data model
- no dark patterns around cancellation
- no hostage-taking of historical data behind a subscription wall

Premium features may add capabilities, but the user must always remain the owner of their underlying records.

#### 1.9.7 Premium Should Fund Utility, Not Gate Dignity

The free tier must be genuinely usable, not a crippled demo.

Free includes:

- manual transactions
- basic categories
- monthly overview

Premium includes advanced control and insight:

- custom categories
- budgets per category
- recurring transactions
- multi-currency
- CSV export
- charts and trends
- widgets

The monetization philosophy is:

- free delivers core trust and habit formation
- premium unlocks power features and deeper planning
- one-time purchase exists for users who reject endless subscriptions

This aligns with the target audience, especially former Mint users who are skeptical of subscriptions and privacy-conscious users who value ownership.

#### 1.9.8 Local Intelligence Before Cloud Intelligence

Smart behavior should come from on-device pattern recognition whenever possible.

Examples:

- merchant-to-category suggestions
- transaction duplication detection
- recurring pattern identification
- search indexing
- trend aggregation

The product should prefer deterministic, inspectable behavior over opaque "AI" features. Intelligence should feel helpful, not magical, and should not require users to send sensitive raw financial data to remote services.

#### 1.9.9 Progressive Depth

The app should work at three levels of commitment:

Level 1: Casual tracking  
The user logs income and expenses, checks monthly totals, and does not set budgets.

Level 2: Guided awareness  
The user relies on categories, monthly trends, and a few recurring transactions.

Level 3: Active planning  
The user sets category budgets, reviews trends, exports data, uses widgets, and tracks across currencies.

The product should support movement between these levels without requiring a reset or migration. A user should be able to start simple and gradually adopt more structure.

#### 1.9.10 Fast Recovery Is More Important Than Perfect Discipline

A real-world budgeting tool must assume inconsistent behavior.

Users will:

- forget transactions
- categorize things imperfectly
- backfill multiple days at once
- change category preferences over time
- abandon the app temporarily and return later

Therefore, the app should optimize for recovery:

- easy backdated entry
- bulk-friendly review patterns where appropriate
- editable categories and recurring rules
- forgiving workflows that do not punish missing data

The philosophy is to preserve continuity rather than insist on perfect daily compliance.

### 1.10 Design Principles

The following product design principles must guide all future scope decisions.

#### 1.10.1 Core Features Must Work in Under 100 ms to 300 ms Perceived Response Time

For local interactions such as opening a transaction form, saving a record, filtering a list, or switching tabs, the target user perception should be near-instant. Slowness undermines the viability of manual entry.

#### 1.10.2 The Add Transaction Flow Is the Center of the Product

Every design decision should recognize that transaction capture is the highest-frequency action in the app.

Implications:

- adding a transaction must take fewer taps than editing a spreadsheet row
- the form should remember sensible defaults
- category suggestions must appear early and be easy to accept
- the UI should support one-handed mobile use

#### 1.10.3 Reports Must Explain, Not Impress

Charts and summaries are only valuable if users can immediately answer:

- what did I spend?
- where did it go?
- how is this month different from last month?
- which categories are driving the change?
- am I on track or off track?

The product should favor clarity over dashboard theatrics.

#### 1.10.4 Every Premium Feature Must Create Ongoing Practical Value

Premium cannot be built around cosmetic upsells or artificial scarcity. Each premium capability must save time, increase control, or improve decision quality in a recurring way.

#### 1.10.5 Every Screen Must Respect Incomplete Data

Users may have:

- only a few transactions
- uneven monthly coverage
- missing categories
- premium-disabled features
- historical imports from CSV with inconsistent fields

The UI should remain intelligible and useful under partial data conditions.

### 1.11 Target Emotional Outcome

The app is not just a ledger. It is intended to produce a specific emotional outcome:

- less ambiguity
- less avoidance
- less financial background stress
- more grounded awareness
- more confidence in daily spending decisions

The ideal user feeling after opening the app is:

**"I know where I stand, and I can deal with it."**

Not:

- "I need to catch up on a complicated system."
- "I hope my bank connection still works."
- "I am being judged by this tool."
- "I need to pay a subscription just to access my own history."

### 1.12 Audience Alignment

The vision and philosophy are tailored to three primary audiences.

#### 1.12.1 Mint Refugees

These users typically want:

- clear transaction logging
- spending visibility
- category-based summaries
- low setup friction
- a familiar monthly overview model

They often do not want:

- mandatory budgeting dogma
- excessive subscription cost
- fragile bank sync experiences

For this segment, the app should feel simpler, more private, and more dependable than the alternatives now available after Mint's exit.

#### 1.12.2 YNAB-Fatigued Users

These users often value awareness but dislike:

- constant rule maintenance
- strict budget assignment rituals
- workflow overhead disproportionate to the benefit
- feeling "behind" if they miss a week

For this segment, the app should feel lighter, less ideological, and easier to re-enter after gaps.

#### 1.12.3 Privacy-First Users

These users prioritize:

- local data storage
- minimal permissions
- no bank credentials shared with intermediaries
- no mandatory cloud identity
- strong exportability

For this segment, privacy must be real in implementation, not just stated in copy.

### 1.13 Value Proposition

The app's value proposition can be expressed in one sentence:

**Track spending and manage budgets privately on your phone, fully offline, with manual entry that is actually fast enough to keep up.**

Expanded value proposition:

- simpler than spreadsheet-based personal finance for everyday use
- more private than bank-linked finance apps
- less doctrinaire than envelope-budgeting tools
- more resilient than sync-dependent products
- more affordable and ownership-friendly than subscription-only competitors

### 1.14 Positioning Statement

For privacy-conscious individuals and households who want practical control over spending without linking bank accounts, the app is a local-first personal finance tool that combines fast manual transaction entry, smart categorization, flexible budgeting, and clear reporting. Unlike bank-linked aggregators or ideology-heavy budgeting apps, it works fully offline, requires no account, and respects user autonomy by default.

### 1.15 Anti-Goals

To preserve product coherence, the following are explicit anti-goals for this product phase:

- becoming a bank sync troubleshooting product
- maximizing daily engagement at the expense of user calm
- using gamification to manipulate retention
- collecting data "just in case" it becomes useful later
- forcing onboarding complexity to increase conversion
- burying export functionality to reduce churn
- designing premium limits that make free usage frustrating
- introducing social comparison or public sharing features
- optimizing for financial influencers instead of everyday users

### 1.16 Product Ethics

The app should operate with the following ethical commitments:

#### 1.16.1 Data Restraint

Only collect or process what is required to deliver the feature.

#### 1.16.2 Consent Clarity

Any optional behavior involving data sharing, analytics, subscriptions, or exports should be understandable without legal interpretation.

#### 1.16.3 Economic Honesty

Revenue should come from product value, not data exploitation, lock-in, or billing ambiguity.

#### 1.16.4 Respect for User Reality

The app should acknowledge that people have irregular income, messy spending, family obligations, emergencies, and periods of avoidance. The product must be compatible with imperfect lives.

### 1.17 Why This Product Wins

The app wins if it consistently delivers a combination that competitors rarely deliver together:

- no bank linking
- no required account
- offline-first operation
- fast manual workflows
- useful reports
- flexible budgeting
- transparent monetization
- exportable user-owned data

Each individual attribute exists somewhere in the market. The product opportunity is the integrated package.

### 1.18 Success Criteria for the Vision

The vision is being realized if users can honestly say all of the following after 30 to 90 days:

- "I still use it because logging transactions is not a chore."
- "I understand my monthly spending better than before."
- "I do not worry about broken bank sync."
- "I trust where my data lives."
- "The free app is useful, and the premium upgrade feels fair if I want more."
- "If I stop using it, I can still take my data with me."

### 1.19 Strategic Product Summary

In strategic terms, the app is:

- a personal finance tracker
- built mobile-first for React Native / Expo
- powered by local SQLite storage
- monetized through a fair free-plus-premium model using RevenueCat
- differentiated by privacy, offline reliability, and low-friction manual entry

It is not trying to automate everything. It is trying to make intentional tracking sustainable.

### 1.20 Final Product Philosophy Statement

The app believes that personal finance software should help people pay attention to their money without demanding their credentials, their identity, their constant discipline, or their surrender to a rigid system.

The product should be:

- private by default
- useful without the internet
- fast enough for daily life
- flexible enough for real people
- honest in how it makes money
- calm in how it communicates

If a future feature conflicts with those principles, the principle should win.

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

#### 1.9.7 Premium Should Fund Utility, Not Gate Essential Functionality

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

## 2. Target Audience Personas and User Research

### 2.1 Audience Strategy Overview

The app is intentionally designed for a specific market gap rather than for the entire consumer finance category.

Primary audience:

- People displaced by Mint or disappointed by similar aggregator-based apps
- People who want budgeting and spending insight without bank linking
- People who find YNAB too ideological, too labor-intensive, or too expensive over time
- People who prefer local ownership of financial records
- People who currently use spreadsheets or notes but want faster mobile capture without losing control
- People who are willing to enter transactions manually if the workflow is fast and useful

Secondary audience:

- Couples or households where one person tracks shared spending on a single device
- Freelancers and contractors who need lightweight expense visibility without full accounting software
- International users and travelers who need multi-currency awareness
- Privacy-sensitive users who avoid finance apps entirely because of trust concerns

Explicit non-primary audience:

- Users who expect automatic bank sync as the main source of value
- Users who want investment portfolio aggregation
- Users who want tax preparation workflows
- Users who want debt payoff coaching as the core product
- Users who need multi-user cloud collaboration in v1

The app should optimize first for the users most likely to say:

**"I do not want to connect my bank, but I still want a serious finance app."**

### 2.2 Core Market Context

The product enters a market reshaped by the shutdown of Mint and by growing fatigue with subscription-heavy, sync-dependent finance products.

Observed market conditions driving opportunity:

- Large numbers of former Mint users lost a familiar monthly spending overview tool
- Many replacement products pushed users toward paid subscriptions immediately
- Bank connectivity remains fragile, regionally inconsistent, and emotionally high-friction
- Privacy concerns around credential sharing and financial data aggregation continue to increase
- Manual tracking remains underserved despite being a deliberate preference for many users
- Premium finance apps increasingly optimize for financial enthusiasts, not average users

This creates a durable segment of users who are not anti-budgeting, but are anti-friction, anti-surveillance, and anti-dogma.

### 2.3 Research Goals

The user research program for this product should answer six central questions:

1. What motivates users to choose manual tracking over automated sync?
2. What causes users to abandon existing finance apps after initial setup?
3. What level of detail do users want when entering transactions on mobile?
4. Which premium features feel meaningfully valuable without making the free product feel crippled?
5. What privacy promises do users actually understand and trust?
6. What patterns allow manual entry to become a sustained habit beyond the first 30 days?

The purpose of research is not only discovery. It is also prioritization. Every finding should help determine:

- Which workflows must be extremely fast
- Which configuration surfaces can be postponed
- Which terminology reduces intimidation
- Which features belong in free versus premium
- Which UI elements create trust or suspicion

### 2.4 Research Methodology Assumptions

This section defines the assumed research basis for the product strategy. These inputs should be treated as working product assumptions to validate continuously.

Research inputs:

- 30 to 50 semi-structured discovery interviews with prospective users
- 300 to 800 quantitative survey responses from finance app users and spreadsheet-based budgeters
- Competitive teardown of YNAB, Lunch Money, Copilot, MoneyCoach, and legacy Mint workflows
- App store review mining across competitors, focusing on recurring complaints and retention failures
- Usability tests on low-fidelity transaction-entry and monthly-overview prototypes
- Diary studies over 14 to 30 days with manual tracking participants

Priority interview cohorts:

- Former Mint users who left involuntarily after shutdown
- Current YNAB users considering cancellation
- Users who tried finance apps and returned to spreadsheets or notes
- Users who refuse bank linking for privacy or reliability reasons
- Mixed-income households with irregular expenses
- International users who regularly transact in more than one currency

Target sample distribution:

- 35% Mint refugees
- 25% privacy-first non-linkers
- 20% spreadsheet/manual trackers
- 10% YNAB-fatigued users
- 10% freelancers or international/multi-currency users

This distribution intentionally overweights displaced and dissatisfied users because they represent the clearest early-adopter base.

These cohorts map directly to the primary persona set:

- Persona A: Mint Refugee
- Persona B: YNAB-Fatigued Planner
- Persona C: Privacy-First Manual Tracker
- Persona D: Spreadsheet Graduate

### 2.5 Research-Derived Product Positioning

Based on the market problem and expected research themes, the app should be positioned as:

- Simpler than YNAB
- More private than bank-linked aggregators
- Less intimidating than full personal finance platforms
- More structured than a spreadsheet
- More durable offline than cloud-first alternatives

The product is not "manual because it lacks integrations." It is "manual by design because many users prefer control, speed, and privacy over fragile automation."

### 2.6 Primary Persona A: Mint Refugee

#### 2.6.1 Summary

The Mint Refugee is the most commercially important persona for initial growth.

This user previously relied on an automated or semi-automated consumer finance app for visibility into spending, category totals, and monthly summaries. They are now looking for a replacement, but many available alternatives feel too expensive, too intrusive, too complicated, or too different from what they actually valued.

#### 2.6.2 Demographic Tendencies

- **Typical age range:** 28 to 52
- **Typical income range:** USD 45,000 to USD 180,000 household income
- **Typical employment profile:** Salaried professional, dual-income household, or mid-career parent or partner managing household expenses
- **Typical financial complexity:** 40 to 120 transactions per month worth tracking, 8 to 18 recurring bills, and 10 to 20 spending categories reviewed monthly

#### 2.6.3 Motivations

- Understand where money goes each month
- Spot overspending categories quickly
- Replace lost Mint-style visibility
- Avoid spreadsheets that require desktop maintenance
- Regain a sense of financial routine after losing a familiar tool

#### 2.6.4 Pain Points

- Resentment at having to rebuild habits after Mint shut down
- Distrust of new apps requiring account creation and bank credentials
- Frustration with broken bank sync and reconnection loops
- Sticker shock at USD 99 to USD 120 annual subscriptions
- Loss of a simple monthly dashboard in replacement tools
- Fear that migration to a new app will take too long

#### 2.6.5 Behavioral Traits

- Checks spending 2 to 5 times per week
- Prefers reviewing finances in short sessions of 3 to 10 minutes
- Categorizes spending at a medium level of detail
- Wants monthly trends more than strict budget discipline
- Values convenience but will manually enter data if the payoff is immediate

#### 2.6.6 Product Needs

- A monthly overview available immediately
- Fast expense entry with minimal typing
- Category suggestions that learn from prior entries
- Visible category totals and month-to-date spending
- Easy setup in under 5 minutes
- Confidence that data stays on device

#### 2.6.7 Quote Archetypes

- "I never loved Mint, but it gave me enough visibility."
- "I do not want another app asking me to reconnect banks every week."
- "I mostly just want to know where the money went."
- "I can enter things manually if it is quick and I do not have to re-categorize everything later."

#### 2.6.8 Design Implications

- Onboarding must show value before asking for customization
- The default month view must be legible within 10 seconds of opening the app
- The quick-add flow must work well with one hand on a phone
- Category totals must be prominent, not buried
- Importless setup must still feel complete, not "lite"

### 2.7 Primary Persona B: YNAB-Fatigued Planner

#### 2.7.1 Summary

This user is financially engaged and likely already tracks spending, but they are increasingly tired of strict methodology, administrative overhead, and recurring subscription cost.

They do not reject budgeting. They reject feeling managed by the software.

#### 2.7.2 Demographic Tendencies

- **Typical age range:** 26 to 44
- **Typical income range:** USD 55,000 to USD 160,000 household income
- **Typical employment profile:** Knowledge worker, dual-income planner, or financially organized individual or couple
- **Typical financial complexity:** 50 to 150 tracked transactions per month, 12 to 30 categories, and 5 to 20 active budget targets

#### 2.7.3 Motivations

- Keep awareness without a rigid budgeting doctrine
- Simplify monthly maintenance
- Reduce recurring software costs
- Preserve category-level budgeting where it helps
- Spend less time "managing the system"

#### 2.7.4 Pain Points

- Fatigue with zero-based budgeting rituals
- Annoyance at excessive setup and category administration
- Emotional friction when every missed transaction creates cleanup work
- Subscription fatigue at roughly USD 15 per month
- Pressure to conform to the app's philosophy
- Feeling judged by software language or workflow design

#### 2.7.5 Behavioral Traits

- Financially conscientious
- Willing to spend time setting up categories once
- Wants dashboards that explain variance clearly
- Likely to value recurring transactions and custom categories
- Prefers flexible budgets over strict rule enforcement

#### 2.7.6 Product Needs

- Category budgets without mandatory envelope logic
- Recurring transactions that reduce maintenance load
- The ability to review and adjust, not constantly reconcile
- A premium upgrade that feels cheaper and more transparent than YNAB
- Charts and trends for self-directed analysis

#### 2.7.7 Quote Archetypes

- "I want the awareness, not the religion."
- "I am tired of budgeting software becoming a second job."
- "If I miss three days, I do not want the whole system to feel broken."
- "I still care about categories and budgets, just without the ideology."

#### 2.7.8 Design Implications

- Language should avoid moralizing terms
- Budgets should be configurable and forgiving
- Catch-up flows must help users recover from lapses quickly
- Premium should emphasize capability, not coercion
- Month rollover should remain understandable without ceremony

### 2.8 Primary Persona C: Privacy-First Manual Tracker

#### 2.8.1 Summary

This user may or may not have used a mainstream finance app previously. Their defining trait is a strong preference for local control and minimal data exposure.

They may already track spending in notes, spreadsheets, or paper because they fundamentally distrust finance software that centralizes personal data.

#### 2.8.2 Demographic Tendencies

- **Typical age range:** 24 to 49
- **Typical income range:** Broad; USD 30,000 to USD 200,000+
- **Typical employment profile:** Technically literate professional, privacy-conscious consumer, independent worker, or user in a region with weak aggregator coverage
- **Typical financial complexity:** 25 to 100 transactions per month, 6 to 20 categories, and possible manual tracking of cash, shared expenses, and multiple currencies

#### 2.8.3 Motivations

- Avoid bank linking and account creation entirely
- Own and export data locally
- Use a finance app without creating a cloud identity
- Reduce reliance on third-party services
- Maintain a durable personal ledger

#### 2.8.4 Pain Points

- Skepticism toward vague privacy claims
- Refusal to trust products that say "we use bank-grade security" while still centralizing data
- Concern about subscription lock-in and data portability
- Frustration that many privacy-friendly apps are unattractive or weak on UX
- Concern that offline apps may be abandoned or poorly maintained

#### 2.8.5 Behavioral Traits

- Reads settings and permissions carefully
- Notices analytics, sign-up prompts, and unnecessary permissions
- Values transparency in pricing and export formats
- Accepts manual effort if it preserves control
- Likely to recommend products based on trust, not brand recognition

#### 2.8.6 Product Needs

- Explicit no-account, no-bank-linking onboarding message
- Clear local-first architecture explanation
- Optional local device protection such as app lock and encryption at rest
- Export that is simple, complete, and portable
- No dark patterns around subscription or data sharing

#### 2.8.7 Quote Archetypes

- "If the app needs my bank login, I am out."
- "I do not want my spending data sitting in someone else's cloud."
- "Show me exactly what leaves the device."
- "Manual is fine. Surveillance is not."

#### 2.8.8 Design Implications

- Privacy messaging must be concrete, not promotional
- Permissions should be minimized and justified in context
- Local export must be easy to find
- Premium flows must avoid manipulative urgency
- Security controls should be visible without becoming mandatory friction

### 2.9 Primary Persona D: Spreadsheet Graduate

#### 2.9.1 Summary

This user currently tracks finances in Google Sheets, Excel, Numbers, or a custom template. They value flexibility, but mobile capture is weak and maintaining formulas or templates is tiring.

They do not want accounting software, mandatory cloud dependence, or bank-linking complexity. They want a tool that preserves control while making daily capture substantially easier.

#### 2.9.2 Demographic Tendencies

- **Typical age range:** 27 to 50
- **Typical income range:** USD 40,000 to USD 175,000 household income
- **Typical employment profile:** Self-directed planner, operations-minded household manager, analyst, freelancer, or detail-oriented individual using a custom finance sheet
- **Typical financial complexity:** 30 to 140 tracked transactions per month, 8 to 25 categories, and moderate use of notes, formulas, or manual monthly rollups

#### 2.9.3 Motivations

- Replace inconsistent spreadsheet entry with faster mobile logging
- Keep control over categories and exportability
- Avoid complex accounting software
- Preserve a familiar level of financial detail

#### 2.9.4 Pain Points

- Spreadsheets are poor for point-of-purchase entry
- Formulas break or require manual upkeep
- Mobile editing is tedious
- Charts are often after-the-fact and not visible daily

#### 2.9.5 Behavioral Traits

- Trusts systems they can inspect and understand
- Often reviews finances in batches, then wishes capture had happened earlier
- Tolerates some manual structure but rejects repetitive formatting work
- Values categories, notes, and export fidelity more than automation
- May maintain a "master sheet" and needs confidence the app will not trap the data

#### 2.9.6 Product Needs

- High-confidence CSV export
- Predictable categories and tags
- Search and filter strong enough to replace manual spreadsheet slicing
- Fast entry that beats opening a spreadsheet on mobile
- Reliable monthly and category-level reports

#### 2.9.7 Quote Archetypes

- "I trust my spreadsheet, but I am tired of feeding it on my phone."
- "I do not need bank sync. I need something faster than mobile cells and formulas."
- "If I cannot export everything cleanly, I will not switch."
- "Give me structure and speed without turning this into accounting software."

#### 2.9.8 Design Implications

- Export fields must be stable and well-documented
- Filters need to feel powerful, not decorative
- Category structures must remain user-controlled and easy to edit
- The app must feel faster than spreadsheet maintenance within the first week
- Reports must balance readability with precision

### 2.10 Secondary Persona E: Irregular Income Operator

#### 2.10.1 Summary

This user may be freelance, contract-based, seasonal, tipped, or otherwise financially variable. They need visibility and planning support, but rigid month structures can feel unrealistic.

#### 2.10.2 Demographic Tendencies

- **Typical age range:** 24 to 50
- **Typical income range:** Highly variable; often USD 25,000 to USD 150,000 annually with month-to-month swings
- **Typical employment profile:** Freelancer, contractor, service worker, seasonal worker, tipped employee, or self-employed operator
- **Typical financial complexity:** 30 to 120 tracked transactions per month, uneven income timing, and a high need to distinguish recurring obligations from flexible spending

#### 2.10.3 Motivations

- Understand spending against inconsistent income
- Track recurring obligations reliably
- Distinguish essential from discretionary spending
- Maintain awareness during volatile months

#### 2.10.4 Pain Points

- Traditional budgets assume stable monthly income
- Rigid systems amplify guilt during uneven months
- Many consumer apps focus on salaried pay cycles

#### 2.10.5 Product Needs

- Flexible budgeting and monthly review
- Clear income versus expense breakdowns
- Recurring transaction visibility
- Trend views over 3, 6, and 12 months

#### 2.10.6 Design Implications

- The app should support irregular realities without implying user failure
- Trend views matter as much as current-month numbers
- Language should remain descriptive, not judgmental

### 2.11 Secondary Persona F: Multi-Currency Traveler or Expat

#### 2.11.1 Summary

This user spends in more than one currency due to travel, remote work, cross-border living, or family obligations. They still want a simple personal tracker, not enterprise expense software.

#### 2.11.2 Demographic Tendencies

- **Typical age range:** 25 to 54
- **Typical income range:** USD 35,000 to USD 180,000+, often with cross-border income or spending patterns
- **Typical employment profile:** Frequent traveler, remote worker, expat, international student, or cross-border household manager
- **Typical financial complexity:** 20 to 100 tracked transactions per month, recurring foreign-currency spending, and a need to preserve both original and converted values

#### 2.11.3 Motivations

- Understand spending across currencies
- Maintain a home-currency view while preserving original transaction amounts
- Track travel periods without losing budgeting clarity

#### 2.11.4 Pain Points

- Many personal apps assume one currency only
- Spreadsheets become messy when exchange rates vary
- Travel can create bursts of uncategorized spending

#### 2.11.5 Product Needs

- Original amount plus converted amount storage
- Clear currency labels everywhere
- Stable rate handling rules
- Reports that remain understandable when currencies mix

#### 2.11.6 Design Implications

- Currency context must never be ambiguous
- Quick entry should support foreign spend without extra complexity
- Premium value for multi-currency should feel obvious and practical

### 2.12 Jobs to Be Done

Across personas, the app is hired to do a small number of high-value jobs.

Functional jobs:

- Help me log spending before I forget it
- Show me where my money went this month
- Tell me which categories are getting out of control
- Remind me about repeating obligations
- Let me review my finances in short, low-stress sessions
- Keep my financial records on my device and exportable

Emotional jobs:

- Reduce anxiety created by not knowing my spending
- Help me feel in control without feeling micromanaged
- Give me confidence that my money data is not being exploited
- Help me recover quickly after falling behind

Social jobs:

- Let me use a finance app that aligns with my privacy values
- Avoid feeling foolish for paying high subscription fees for basic tracking
- Use a tool I could reasonably recommend to similarly cautious friends

### 2.13 Key Research Findings Expected to Hold

The following findings should be treated as working truths unless contradicted by validation.

#### 2.13.1 Users Want Simplicity More Than Automation

Many users say they want automation, but their actual retained behavior suggests they want reliability and clarity more than raw automation.

Common interpretation:

- Users tolerate manual entry if it is predictable
- Users abandon automated apps when sync is unreliable or confusing
- Trust loss from a broken linked account is greater than inconvenience from a 10-second manual entry flow

#### 2.13.2 Bank Linking Carries Hidden Emotional Cost

Even when technically feasible, bank linking introduces:

- Privacy concerns
- Fear of credential compromise
- Frustration from repeated MFA or reconnection
- Uncertainty about what data is collected
- Embarrassment when connections fail during setup

For a meaningful segment, avoiding this cost is itself a product advantage.

#### 2.13.3 Category-Level Insight Is the Core Value Loop

Users do not need dozens of advanced reports to feel value quickly.

The most important repeated insight loop is:

1. enter transaction
2. see category impact
3. review month-to-date totals
4. adjust behavior

This means the product should bias toward excellent category visibility before expanding into more advanced analytics.

#### 2.13.4 Users Differ in Budget Strictness but Not in Need for Awareness

Some users want hard category targets. Others only want trend awareness. Almost all target users want:

- Visibility
- Categories
- Monthly review
- Lightweight planning support

The product should therefore support budgeting without making strict budgeting mandatory.

#### 2.13.5 Habit Recovery Matters More Than Streak Perfection

Most users will miss days or even weeks.

Retention depends less on perfect daily logging and more on whether re-entry feels manageable.

Therefore:

- Catch-up flows matter
- Recent merchant suggestions matter
- Recurring transactions matter
- Forgiving UX matters

#### 2.13.6 Privacy Claims Must Be Verifiable in Plain Language

Users respond poorly to abstract security language and positively to specific promises such as:

- No account required
- No bank linking
- Data stored locally on device
- Export available anytime

Trust rises when claims are concrete and paired with visible product behavior.

### 2.14 Detailed User Needs by Workflow

#### 2.14.1 First Run

Users need:

- Immediate clarity about what the app does
- Reassurance that no bank connection is required
- A setup flow that takes 2 to 5 minutes
- A first success moment before any premium prompt

Failure risk if unmet:

- Abandonment before first transaction
- Confusion about whether the app is "real" without sync
- Suspicion that privacy messaging is only branding

#### 2.14.2 Daily Capture

Users need:

- Transaction entry in 5 to 15 seconds for common cases
- Remembered categories for repeat merchants or descriptions
- Amount entry optimized for numeric keypad use
- Date defaults that match common behavior
- Minimal field overload

Failure risk if unmet:

- Backlog accumulation
- Fallback to mental tracking
- Churn within the first 14 days

#### 2.14.3 Weekly Review

Users need:

- A clean summary of spending by category
- Recent transaction history that is easy to scan
- Clear indicators of notable overspend or unusual spikes
- Simple edit and correction flows

Failure risk if unmet:

- Users stop trusting summaries
- The app feels like a ledger instead of a guide
- Premium reporting value becomes harder to justify

#### 2.14.4 Monthly Reflection

Users need:

- Month total for income and expenses
- Strongest spending categories
- Comparisons to prior months
- Budget progress where enabled
- Clarity about recurring obligations already passed or upcoming

Failure risk if unmet:

- No durable sense of progress
- App becomes a capture tool without strategic value
- Users revert to spreadsheets for analysis

### 2.15 Adoption Triggers

The strongest reasons a target user will try the app are:

- Mint shutdown or dissatisfaction with replacements
- Frustration with YNAB cost or methodology
- A deliberate decision to stop sharing bank credentials
- Dissatisfaction with a spreadsheet workflow on mobile
- A financial reset moment such as moving, job change, debt payoff effort, or family budgeting

Recommended acquisition messaging should map directly to these triggers:

- "No bank linking. No account required."
- "Fast manual tracking that actually sticks."
- "A calmer alternative to rigid budgeting apps."
- "Private, offline-first money tracking."
- "See where your money goes without giving away your data."

### 2.16 Activation Criteria by Persona

Different personas become activated by different first-run outcomes.

Mint Refugee activation signals:

- First transaction added in under 60 seconds
- Monthly category view populated within session one
- Immediate understanding of where to find month summary

YNAB-Fatigued Planner activation signals:

- Custom category structure appears possible without complexity
- Budgets feel optional and flexible
- Premium features feel meaningfully broader, not artificially gated

Privacy-First Manual Tracker activation signals:

- No account wall encountered
- Permissions remain minimal
- Clear local-data explanation present in onboarding or settings

Spreadsheet Graduate activation signals:

- Transaction list and categories feel more usable than a spreadsheet within one day
- Export confidence established early

### 2.17 Retention Drivers

Research should expect the strongest retention drivers to be:

- Quick-add speed
- Accurate smart categorization
- Useful month-to-date summary
- Low-friction recurring transaction handling
- Visible budget feedback for premium users
- Trust in privacy and local ownership

Retention is likely to decline when any of the following happen:

- Transaction entry feels slower than writing in notes
- Suggested categories are consistently wrong
- The app over-prompts for premium before value is established
- Charts are attractive but not actionable
- Privacy promises are undermined by unexpected network behavior

### 2.18 Churn Risks by Persona

Mint Refugee churn risks:

- No fast sense of category overview
- Setup feels like rebuilding an entire financial system
- Free tier feels too limited for basic tracking

YNAB-Fatigued churn risks:

- Budgeting still feels overly doctrinal
- Premium features are too shallow to justify switching
- Manual correction flows are tedious

Privacy-First churn risks:

- Unclear data handling
- Any sign of cloud dependence for core use
- Export buried or incomplete

Spreadsheet Graduate churn risks:

- Filtering and search are too weak
- CSV export loses fields or formatting reliability
- App feels less flexible than spreadsheet workflows

### 2.19 Pricing Sensitivity Insights

Expected research findings on monetization:

- The free tier must be genuinely useful for month-to-month manual tracking
- One-time purchase is highly attractive to privacy-first users and subscription-fatigued users
- A monthly premium option lowers trial friction but should not be the only path
- Users compare premium pricing directly against YNAB, Copilot, and other subscriptions
- Premium conversion increases when users clearly understand that payment funds product value rather than data monetization

Implications for packaging:

- Basic manual tracking cannot feel artificially restricted
- Premium should unlock depth, customization, and advanced insight
- The one-time premium option should be framed as a trust-aligned ownership choice

### 2.20 Research on Language and Messaging

Terminology has a measurable effect on adoption and comfort.

Words likely to perform well:

- Monthly overview
- Spending categories
- Recurring expenses
- Budget targets
- Private by default
- Offline-first
- No account required

Words likely to create resistance for some segments:

- Reconcile
- Assign every dollar
- Envelope
- Mandatory sync
- Optimize your wealth
- AI financial coach

Tone guidance derived from user preferences:

- Calm, clear, direct
- Competent without being preachy
- Privacy-specific without sounding paranoid
- Encouraging without gamified manipulation

### 2.21 Accessibility and Inclusivity Considerations from Research

Target users are not a single technical or cognitive profile. Research should account for:

- Users under financial stress who have reduced cognitive bandwidth
- Users with ADHD who benefit from short, obvious flows
- Users with visual impairments needing strong contrast and scalable text
- Users entering data one-handed in transit, checkout lines, or low-attention contexts
- Users whose primary language is not English

Product implications:

- Short labels matter
- Tap targets must be generous
- Color cannot be the only carrier of budget status
- Manual entry should support interruption and recovery
- Onboarding should avoid dense finance jargon

### 2.22 User Research Artifacts to Maintain

The product team should maintain the following living artifacts:

- Persona sheets with dated evidence references
- Top 20 pain point repository with direct quotes
- Jobs to Be Done map
- Onboarding usability findings log
- Paywall objection log
- Category-model accuracy feedback log
- Monthly retention interview summary

Artifact review cadence:

- Weekly during product definition
- Biweekly during early beta
- Monthly after general availability

### 2.23 Open Research Questions

The following questions require ongoing validation:

- How much setup are users willing to do before first value?
- What is the acceptable error rate for smart categorization before trust drops?
- Do users want accounts/wallets in v1, or only a single unified ledger?
- What reporting depth is necessary before premium feels compelling?
- How frequently do users actually export data?
- How strong is demand for household sharing versus strict solo use?
- Which widget concepts drive retention rather than novelty?

### 2.24 Persona Prioritization for v1

For v1 prioritization, personas should rank as follows:

1. Mint Refugee
2. Privacy-First Manual Tracker
3. YNAB-Fatigued Planner
4. Spreadsheet Graduate
5. Irregular Income Operator
6. Multi-Currency Traveler or Expat

Rationale:

- Mint Refugees provide the clearest market entry point and simple value framing
- Privacy-First users align most strongly with the product philosophy
- YNAB-fatigued users are high-value premium conversion candidates
- Spreadsheet users strengthen export and reporting rigor
- Irregular income and multi-currency needs are important, but some supporting capabilities are premium or later-stage depth features

### 2.25 v1 Product Decisions Driven by Audience Research

The audience and research profile should directly drive the following v1 decisions:

- No bank linking anywhere in the product
- Onboarding that emphasizes privacy and speed, not financial theory
- Fast manual transaction entry as the center of the UX
- Monthly overview as a primary navigation destination
- Categories visible and actionable from day one
- Free tier strong enough for honest everyday use
- Premium focused on depth, customization, and advanced planning
- Local storage and export made explicit in product messaging
- No account creation gate
- No moralizing or ideology-heavy budgeting language

### 2.26 Summary Statement

The ideal early user is not looking for maximum automation. They are looking for a trustworthy replacement for financial visibility that feels lighter, calmer, and more respectful than the current market.

They want:

- To enter transactions quickly
- To understand spending clearly
- To budget flexibly if they choose
- To avoid surveillance and broken bank sync
- To keep ownership of their data

The app should be built first for that user, because that user is both underserved and highly motivated to adopt a product that finally respects those constraints.

## 3. Competitive Analysis

### 3.1 Purpose of This Analysis

This section defines the competitive context for the app in the post-Mint personal finance market and clarifies where the product should compete directly, where it should deliberately diverge, and where it should refuse category norms entirely.

Rather than imitating current market leaders, this analysis identifies:

- which user problems are already being served well
- which user problems are being served poorly or expensively
- which assumptions competitors treat as unavoidable but this product rejects
- which product decisions create the strongest differentiation for a privacy-first, offline-first, manual-first finance app

This analysis focuses on six relevant competitors or adjacent products:

- YNAB
- Lunch Money
- Copilot
- MoneyCoach
- DayCount
- Wallet

These products matter for different reasons:

- YNAB defines the opinionated-budgeting benchmark.
- Lunch Money defines the lighter, more analyst-oriented personal finance benchmark.
- Copilot defines the polished premium consumer-finance UX benchmark.
- MoneyCoach defines the flexible consumer budgeting benchmark.
- DayCount defines the lightweight manual-first finance benchmark.
- Wallet defines the mainstream all-in-one budgeting and account-linking benchmark.

### 3.2 Market Context

The product enters a market shaped by three major shifts:

1. The closure of Mint created a large population of users who lost a familiar, mostly overview-driven money dashboard.
2. Subscription fatigue is materially higher than it was when many incumbents established pricing norms.
3. Trust in financial data sharing is weaker, especially for users who have experienced broken bank sync, re-authentication churn, aggregator outages, or discomfort with credential delegation.

The market now tends to polarize into three broad camps:

- Automation-first products that prioritize linked accounts, imported transactions, and consolidated dashboards
- Methodology-first products that prioritize budgeting discipline, planning frameworks, and behavior change
- Simplicity-first products that prioritize speed, lightweight logging, and reduced cognitive overhead

The app intentionally occupies a fourth position:

- Privacy-first
- Offline-first
- Manual-first, but intelligent
- Flexible rather than ideological

This positioning is uncommon because many competitors rely on one or more of the following as core assumptions:

- Cloud accounts are acceptable by default
- Bank linking is necessary to compete
- Subscription pricing can be justified through automation alone
- Users will tolerate complex workflows if the product promises better outcomes

The product rejects those assumptions.

### 3.3 Competitive Positioning Summary

At a high level, the app is positioned as:

- less ideological than YNAB
- more private and locally controlled than Copilot, Wallet, and many sync-heavy tools
- more mobile-first and consumer-simple than spreadsheet-like or analyst-heavy options
- more deliberately offline-capable than cloud-centric products
- more serious and finance-specific than a generic manual tracker or streak logger
- more practical for users who explicitly do not want bank linking

In category language, the product should be understood as:

**the privacy-first, offline-first budgeting and spending tracker for people who still want insight, but do not want surveillance, account setup, or financial homework.**

### 3.4 Evaluation Framework

Each competitor is analyzed across the following dimensions:

- Core product philosophy
- Primary user promise
- Strengths
- Weaknesses
- Business model pressure
- Relevance to target personas
- Direct lessons for this product

Additional cross-competitive dimensions used later in this section:

- Privacy posture
- Bank-link dependency
- Onboarding friction
- Manual entry quality
- Budgeting rigidity
- Reporting depth
- Offline capability
- Export and data ownership
- Premium conversion logic

### 3.5 YNAB

#### 3.5.1 Market Role

YNAB is the strongest reference point for paid budgeting software with a high-intent user base. It is not a direct match for all target users, but it is the most important competitive benchmark because many potential customers will compare any paid budgeting tool against YNAB’s value proposition and price anchor.

For this spec, YNAB is treated as the dominant methodology-first benchmark, with market pricing commonly understood around **$15 per month** or a discounted annual subscription.

#### 3.5.2 Core Product Philosophy

YNAB is built around an opinionated budgeting framework. The product is not merely a ledger or spending tracker. It is a behavioral system designed to get users to assign money intentionally, review tradeoffs, and operate with a planning mindset.

YNAB’s philosophy is strong because it creates:

- clear product identity
- high user commitment
- strong educational narrative
- measurable habit-forming behavior

YNAB’s philosophy is also limiting because it can create:

- onboarding intimidation
- terminology burden
- perceived judgment
- maintenance overhead
- resistance from users who want awareness without doctrine

#### 3.5.3 Strengths

YNAB’s strongest competitive assets include:

- extremely clear brand positioning
- strong perceived seriousness and credibility
- deep budgeting workflows
- loyal user community
- robust educational content and habit framing
- strong support for users who want proactive planning instead of retrospective tracking

From a product design perspective, YNAB performs well when users want:

- active control over category allocations
- intentional assignment of available money
- constant engagement with tradeoffs
- a full budgeting system rather than just expense logging

#### 3.5.4 Weaknesses

YNAB is weak for the exact audience this app is targeting in several ways:

- learning curve versus immediate utility
- worldview-first design over user-preference flexibility
- high cognitive load for users who want simple spending awareness
- guilt or failure feelings when maintenance lapses
- stronger fit for highly engaged planners than lighter-touch users
- pricing friction for users who mainly want visibility, categorization, and simple category budgets

For Mint refugees and privacy-first manual trackers, YNAB often fails the “I just want something calmer” test.

#### 3.5.5 Business Model Pressure

YNAB’s relatively high recurring price shapes its product expectations. Users paying that amount expect a full budgeting system, strong support, and behavior-change depth. That means YNAB is under pressure to remain substantial, structured, and methodology-heavy.

That is strategically important for this product because it creates room below and beside YNAB:

- below YNAB on cognitive overhead
- beside YNAB on philosophy
- below YNAB on entry friction
- below YNAB on perceived emotional burden

This product should not compete by trying to become a cheaper YNAB clone. It should compete by being meaningfully easier, calmer, and more private.

#### 3.5.6 Relevance to Target Personas

YNAB is especially relevant to:

- YNAB-fatigued planners
- spreadsheet graduates considering paid software
- former Mint users exploring “serious” alternatives and then bouncing off complexity

Common reasons target users defect from or avoid YNAB:

- “too much work”
- “too many rules”
- “too expensive for what I need”
- “I do not want to budget every dollar”
- “I want tracking, not a system”

#### 3.5.7 Strategic Lessons from YNAB

The product should learn from YNAB’s strengths without copying its ideology:

- Copy the seriousness of purpose.
- Copy the clarity of product identity.
- Copy the habit-support orientation.
- Do not copy the doctrinal workflow.
- Do not copy jargon-heavy onboarding.
- Do not require users to understand a financial philosophy before obtaining value.

#### 3.5.8 Head-to-Head Positioning vs YNAB

The app wins against YNAB when users care most about:

- lower friction
- manual entry speed
- flexible budgeting
- privacy posture
- offline trust
- lower recurring commitment
- less emotional intensity

YNAB wins when users care most about:

- rigorous zero-based budgeting
- proactive cash assignment discipline
- educational budgeting framework
- deep planning ritual

The intended positioning statement is:

**For users who want the awareness and control benefits of budgeting software without the ideology, this app is the anti-YNAB choice.**

### 3.6 Lunch Money

#### 3.6.1 Market Role

Lunch Money is a strong reference point for users who want a cleaner, more flexible, more modern finance tool than traditional budgeting software, often with a stronger emphasis on analysis and customization than ideology.

It is especially relevant because it appeals to:

- technically comfortable users
- spreadsheet-minded users
- people who appreciate flexibility and data visibility
- users who want less dogma than YNAB

#### 3.6.2 Core Product Philosophy

Lunch Money generally feels like a personal finance workspace rather than a strict budgeting school. It is more open-ended than YNAB and more analytical than many mass-market apps.

Its core promise is usually some combination of:

- aggregation or transaction visibility
- customization
- planning flexibility
- modern UX relative to legacy finance products

This makes it a nearer philosophical neighbor than YNAB in one respect: it is less prescriptive. However, it still typically lives in a cloud-account, sync-oriented model rather than a local-first privacy model.

#### 3.6.3 Strengths

Lunch Money’s strengths include:

- a modern and capable feel for users who want more than a simple tracker
- flexible categorization and budgeting concepts
- appeal to users who like to inspect and organize data
- a more relaxed posture than doctrinal budgeting systems
- better fit than YNAB for users who want customization without a rigid method

For competitive purposes, Lunch Money demonstrates that there is meaningful demand for:

- non-dogmatic money tools
- strong categorization systems
- useful summaries and controls without intense theory

#### 3.6.4 Weaknesses

Relative to this product’s target positioning, Lunch Money is weaker where users care about:

- strict local data ownership
- no-account usage
- complete offline operation
- mobile-first manual capture in low-friction contexts
- a simple consumer story around privacy

Lunch Money can also feel closer to an enthusiast tool than a calm, default-simple mobile product. That is not a flaw in general, but it creates whitespace for this app.

#### 3.6.5 Business Model Pressure

Lunch Money’s premium positioning generally expects users to value deeper financial organization enough to maintain a paid software relationship. That often aligns well with power users, but it can leave simpler manual trackers underserved if they do not want a broader finance workspace.

This product should avoid drifting into a “prosumer dashboard first, mobile capture second” pattern.

#### 3.6.6 Relevance to Target Personas

Lunch Money is most relevant to:

- spreadsheet graduates
- users leaving Mint who still want a modern and capable system
- users who dislike YNAB ideology but still want depth

It is less directly suited to:

- users who refuse cloud storage entirely
- users who want zero setup beyond basic categories
- users who think in terms of “quick daily logging” rather than “financial workspace”

#### 3.6.7 Strategic Lessons from Lunch Money

The app should take the following lessons:

- Flexibility has real market value.
- Users appreciate modern organization tools without hard ideology.
- Strong categories, reports, and filters matter even when automation is absent.
- Advanced depth should exist without dominating the entry-level experience.

The app should avoid:

- presenting as a tool mainly for power users
- creating a setup-heavy experience before value appears
- leaning so far into configurability that the product loses calmness

#### 3.6.8 Head-to-Head Positioning vs Lunch Money

The app wins against Lunch Money when users care most about:

- offline-first behavior
- no account required
- tighter privacy posture
- faster manual entry on mobile
- lower conceptual complexity

Lunch Money wins when users care most about:

- a broader financial workspace feel
- deeper enthusiast customization
- a more analysis-oriented environment

The intended positioning statement is:

**For users who want a simpler, more private, more mobile-first alternative to a finance workspace, this app is the lighter and more trustworthy choice.**

### 3.7 Copilot

#### 3.7.1 Market Role

Copilot is a benchmark for polished premium consumer-finance software. It matters because it raises user expectations for:

- visual quality
- onboarding smoothness
- premium brand feel
- automated transaction organization
- chart and trend presentation

Copilot is often perceived less as a budgeting doctrine and more as an elegant, modern money app.

#### 3.7.2 Core Product Philosophy

Copilot’s philosophy can be summarized as premium convenience. It aims to reduce user effort through a polished interface, automation, and a sense that the app is doing organizational work on the user’s behalf.

That has strong appeal, especially for users who want:

- automation
- premium aesthetics
- clean dashboards
- reduced manual effort

It is less aligned with users who view privacy and local control as first-order concerns.

#### 3.7.3 Strengths

Copilot’s strongest competitive assets include:

- excellent perceived product quality
- polished interaction design
- premium visual language
- strong appeal to post-Mint consumers seeking something more modern
- high confidence in summaries, dashboards, and trends

Copilot is important because it proves users will pay for:

- feeling in control
- clean financial visualization
- a sense of order without old-school finance-software ugliness

#### 3.7.4 Weaknesses

Relative to this app’s target strategy, Copilot is weak where users care most about:

- full offline functionality
- no-account-required operation
- data minimization
- avoiding bank linking
- using the app in a purely manual way by design rather than as a fallback

Its automation-centric value proposition also creates fragility:

- linked account quality is always partly dependent on third parties
- automation can create user distrust when categorization or imports are wrong
- some users simply do not want to connect accounts regardless of convenience

For privacy-first users, Copilot can feel elegant but fundamentally misaligned.

#### 3.7.5 Business Model Pressure

A premium-polish product is under pressure to justify price through:

- continuous product sophistication
- premium UI expectations
- automation quality
- rich analytics and convenience features

This matters strategically because it means Copilot is unlikely to optimize around “small, local, fully offline, manual but excellent.” That is not its category center.

#### 3.7.6 Relevance to Target Personas

Copilot is most relevant to:

- Mint refugees who primarily value beautiful dashboards
- users willing to trade privacy for convenience
- consumers who want automation more than manual intentionality

It is less suitable for:

- privacy-first users
- users distrustful of aggregators
- users who prefer explicit manual entry as a behavioral tool

#### 3.7.7 Strategic Lessons from Copilot

The product should learn from Copilot in presentation, not architecture:

- visual quality matters
- reports must feel premium, not spreadsheet-like
- onboarding should feel smooth and modern
- charts and summaries should create confidence quickly

The product should not copy:

- dependence on bank connectivity
- cloud dependence for core user value
- any assumption that convenience justifies privacy compromise

#### 3.7.8 Head-to-Head Positioning vs Copilot

The app wins against Copilot when users care most about:

- privacy
- manual control
- offline reliability
- low-trust architecture
- data ownership

Copilot wins when users care most about:

- automation
- premium dashboard polish tied to account aggregation
- low manual workload through imports

The intended positioning statement is:

**For users who like the calm, premium feel of modern finance apps but reject account linking, this app offers the polish without the surveillance model.**

### 3.8 MoneyCoach

#### 3.8.1 Market Role

MoneyCoach is relevant as a consumer-friendly personal finance and budgeting app that generally sits closer to flexible everyday use than to hard-core budgeting doctrine. It is important because it competes more directly for users who want:

- mobile-first usage
- manual entry support
- budgeting tools
- relatively accessible UX
- a consumer app feel rather than a finance power-user workspace

#### 3.8.2 Core Product Philosophy

MoneyCoach tends to operate in the “finance coach / planner / tracker” lane, offering organization, budgeting, and summaries without requiring the full intensity of YNAB’s methodology.

This makes it a meaningful reference point because it occupies some of the same “I want helpful structure without doctrinal overhead” territory as this product.

#### 3.8.3 Strengths

MoneyCoach’s strengths include:

- broad everyday finance usefulness
- lower intimidation than heavily ideological tools
- mobile-friendly experience
- support for budgeting and tracking in a more approachable format
- appeal to users who want an app, not a system to study

This competitor confirms the demand for:

- budgeting without heavy doctrine
- a finance app that feels approachable
- feature depth that can still live in a consumer-friendly mobile experience

#### 3.8.4 Weaknesses

Relative to this app’s positioning, MoneyCoach is weaker where users care about:

- radical privacy clarity
- explicit no-account-required positioning
- strict offline-first trust
- a strong anti-bank-linking identity
- minimalism and calmness over feature sprawl

Depending on implementation choices, products in this category can also become:

- crowded with secondary features
- harder to understand at first launch
- less differentiated in a market full of “do everything” money apps

#### 3.8.5 Business Model Pressure

A broad consumer finance app often faces pressure to keep adding features so subscription value remains legible. That can lead to:

- wider scope
- more settings
- more UI density
- less narrative clarity

This app should resist the temptation to become “another broad finance companion.” Its identity must remain sharper:

- manual-first
- privacy-first
- offline-first
- intentionally limited in scope

#### 3.8.6 Relevance to Target Personas

MoneyCoach is most relevant to:

- users seeking a middle ground between Mint and YNAB
- users who want budgeting and tracking without too much theory
- users who prefer mobile apps over desktop-heavy workflows

It is less defensible for:

- users who prioritize local-only data control above all else
- users who are specifically reacting against cloud dependence or bank aggregation

#### 3.8.7 Strategic Lessons from MoneyCoach

The app should take the following lessons:

- approachable budgeting has broad appeal
- mobile-first finance UX matters
- not every user wants a philosophy-heavy system
- feature depth can coexist with consumer simplicity if sequencing is disciplined

The app should avoid:

- broad, fuzzy positioning
- feature accumulation without a clear product story
- treating privacy as one preference among many instead of a defining differentiator

#### 3.8.8 Head-to-Head Positioning vs MoneyCoach

The app wins against MoneyCoach when users care most about:

- a clearer privacy stance
- offline trust
- a simpler and sharper core narrative
- confidence that data remains local by default

MoneyCoach wins when users care most about:

- wider general-purpose finance feature breadth
- a more expansive “money management companion” feel

The intended positioning statement is:

**For users who want a simpler, stricter privacy-first alternative to broad mobile finance apps, this app is the more focused product.**

### 3.9 DayCount

#### 3.9.1 Market Role

DayCount is relevant less as a direct full-featured budgeting competitor and more as a signal of adjacent user behavior: some people prefer lightweight manual-first finance tools or minimalist tracking products over comprehensive finance software.

This matters because a meaningful subset of potential users does not want “personal finance software” in the traditional sense. They want:

- a low-ceremony habit tool
- fast entry
- daily visibility
- simplicity over depth

#### 3.9.2 Core Product Philosophy

Products in the DayCount-style category typically optimize for frictionless logging and repeated check-ins. Their appeal comes from:

- minimal setup
- focused use cases
- strong habit loops
- high clarity around one action

That philosophy is useful to study because this app’s success also depends on habit continuity.

#### 3.9.3 Strengths

DayCount-style products are strong at:

- making repeated actions feel lightweight
- reducing decision fatigue
- reinforcing consistency
- communicating progress simply

They remind us that many users abandon finance tools not because they reject budgeting, but because the recurring interaction cost becomes too high.

#### 3.9.4 Weaknesses

For direct financial management, DayCount-style simplicity is insufficient because it generally lacks:

- category structure
- budget tracking
- monthly overviews
- spending analysis
- export depth
- financial context and reporting

In short, it may support habit, but not enough financial understanding.

#### 3.9.5 Business Model Pressure

Minimal trackers often win through simplicity, but they can also cap willingness to pay unless they become indispensable. For this app, that creates an important strategic constraint:

- simplicity alone is not enough
- depth alone is not enough
- the product must combine low-friction habit support with genuine financial insight

#### 3.9.6 Relevance to Target Personas

DayCount-style alternatives are most relevant to:

- users who gave up on complex finance apps
- users currently using Notes, Reminders, or generic trackers
- users who want a daily logging habit more than a full financial method

These users may convert to this app if and only if the app preserves the low-friction feel while adding meaningful financial organization.

#### 3.9.7 Strategic Lessons from DayCount

The product should learn:

- daily repetition must feel easy
- habit loops matter as much as feature checklists
- interface weight must stay low around primary actions
- manual entry should feel closer to messaging or note capture than form completion

The app should avoid:

- turning every add flow into an accounting task
- requiring too many fields on first entry
- overwhelming users with dashboards before they have data

#### 3.9.8 Head-to-Head Positioning vs DayCount

The app wins against DayCount-style tools when users care most about:

- actual budgeting capability
- financial reporting
- category management
- recurring transactions
- export and ownership

DayCount-style tools win when users care most about:

- absolute simplicity
- generic logging
- ultra-light daily habits without finance-specific depth

The intended positioning statement is:

**For users who want the low-friction feel of a habit tracker but need a real finance tool behind it, this app provides the missing structure.**

### 3.10 Wallet

#### 3.10.1 Market Role

Wallet represents the broad, mainstream personal finance app category that attempts to combine:

- linked accounts
- manual entries
- budgets
- analytics
- multiple financial views

It is useful as a benchmark because many consumers encountering finance apps search for a “do everything” tool first.

#### 3.10.2 Core Product Philosophy

Wallet-style products usually aim to be comprehensive financial dashboards. Their value comes from breadth and consolidation. The promise is often:

- connect everything
- see everything
- organize everything in one place

This is exactly the mental model this app intentionally does not adopt.

#### 3.10.3 Strengths

Wallet-style products are strong at:

- broad feature coverage
- familiar “all finances in one place” framing
- supporting users who want mixed automatic and manual workflows
- giving consumers a sense of completeness

This category is compelling for users who equate product value with feature breadth.

#### 3.10.4 Weaknesses

Wallet-style breadth often comes with tradeoffs:

- more setup burden
- more complex navigation
- more account concepts than many users need
- greater dependence on external data providers
- more points of user confusion
- weaker product focus

For privacy-first users, the biggest issue is philosophical:

- the product starts from connection and consolidation
- this app starts from local control and intentional entry

#### 3.10.5 Business Model Pressure

Comprehensive finance apps are often pressured to justify themselves through feature breadth and account consolidation. That encourages:

- complexity
- settings density
- cross-feature coupling
- more difficult onboarding

This product must avoid competing on breadth. It should compete on trust, clarity, and repeatability.

#### 3.10.6 Relevance to Target Personas

Wallet is relevant to:

- Mint refugees who begin by looking for another all-in-one dashboard
- users who still believe linked accounts are the default standard
- users comparing broad finance apps before deciding their real need is simpler

Wallet becomes less attractive to:

- users who are tired of broken sync
- users who reject data sharing
- users who mainly need expense tracking and budgeting, not full aggregation

#### 3.10.7 Strategic Lessons from Wallet

The app should learn:

- consumers like strong overview screens
- category summaries and trends need to feel comprehensive even in a focused product
- users need confidence that they are not giving up useful insight by choosing simplicity

The app should avoid:

- account-link dependence
- feature sprawl
- a cluttered “everything dashboard” UX
- introducing concepts that only exist to support a broader product suite

#### 3.10.8 Head-to-Head Positioning vs Wallet

The app wins against Wallet when users care most about:

- privacy
- no bank linking
- low setup
- calmer UX
- explicit local ownership

Wallet wins when users care most about:

- broad account aggregation
- comprehensive financial consolidation
- feature breadth over simplicity

The intended positioning statement is:

**For users who do not want another aggregation-heavy dashboard, this app is the simpler and more trustworthy alternative.**

### 3.11 Cross-Competitive Comparison

#### 3.11.1 Privacy and Data Posture

Relative market pattern:

- YNAB: stronger trust brand than many legacy finance tools, but not defined by local-only privacy
- Lunch Money: flexible and modern, but still generally associated with cloud-account usage
- Copilot: polished premium convenience, but not privacy-maximalist
- MoneyCoach: consumer-friendly, but not primarily differentiated by radical local-first trust
- DayCount: simpler and lighter, but not a full finance privacy proposition
- Wallet: broad finance management, often closer to conventional aggregation expectations

This app’s differentiated privacy stance:

- no bank linking
- no required account
- no cloud dependency for core use
- no advertising model
- no reason for users to trust a data intermediary with transaction histories

This is not a secondary feature. It is one of the top three category differentiators.

#### 3.11.2 Onboarding Friction

Highest friction risks in the market typically come from:

- account linking
- methodology education
- setup-heavy category or account structures
- subscription commitment before first value

Competitor tendencies:

- YNAB: friction from philosophy and setup mindset
- Lunch Money: friction from “workspace” depth
- Copilot: friction from account and sync expectations
- MoneyCoach: moderate friction depending on breadth
- DayCount: low friction, but low finance depth
- Wallet: friction from breadth and consolidation

This app’s onboarding target:

- first meaningful transaction entered in under 90 seconds from first launch
- monthly overview visible with sample or initial structure immediately after first entry
- zero mandatory account creation steps
- zero bank connection prompts anywhere in onboarding

#### 3.11.3 Manual Entry Quality

This is the central product battlefront.

Most competitors treat manual entry as:

- one of several input methods
- a fallback when automation fails
- a necessary but unexciting form flow

This app treats manual entry as:

- the primary interaction
- the retention engine
- the trust mechanism
- the core surface where product quality must be obvious

That means the app must outperform competitors on:

- tap count
- field defaults
- category suggestions
- date entry speed
- edit flow speed
- recent merchant reuse
- recurring transaction convenience

#### 3.11.4 Budgeting Style

Competitor budgeting philosophies vary:

- YNAB: highly opinionated and proactive
- Lunch Money: more flexible and analytical
- Copilot: convenience-oriented summaries and organization
- MoneyCoach: accessible budgeting and planning
- DayCount: lightweight budgeting, but limited strategic depth
- Wallet: broad mainstream budgeting support

This app’s chosen budgeting posture:

- Monthly category budgets
- Optional use
- No doctrinal rules required
- No requirement to allocate every dollar
- No punitive framing
- Progress-oriented, not ideology-oriented

#### 3.11.5 Reporting and Insight

The market teaches two important lessons:

- users expect modern visual reporting from paid products
- users do not want reporting to require a financial education to interpret

This app must therefore deliver reporting that is:

- visually clear
- immediately useful
- fast offline
- strong enough to justify premium
- not overloaded with financial jargon

The product does not need the deepest analysis in the market. It needs the clearest and most actionable analysis for a manual tracker.

#### 3.11.6 Offline Capability

Few finance competitors center offline reliability as a major user promise. Many support some local caching or temporary resilience, but that is not the same as an offline-first architecture.

This creates a strategic opportunity:

- open instantly without network
- add and edit transactions without network
- compute budgets and reports locally
- allow exports locally
- maintain user confidence during travel, outages, or platform issues

Offline capability should be marketed as trust and reliability, not just as a technical feature.

#### 3.11.7 Monetization Fit

The planned monetization model:

- Free tier with manual transactions, basic categories, and monthly overview
- Premium one-time purchase at **$149.99**
- Premium subscription at **$4.99 per month**

Competitive implications:

- One-time purchase creates a strong anti-subscription differentiator versus products anchored on recurring fees.
- Monthly premium remains available for users who prefer lower upfront commitment.
- Pricing remains far below YNAB’s recurring anchor while preserving a premium upsell path.

This pricing strategy is especially strong for:

- Mint refugees resentful of high recurring fees
- YNAB-fatigued users who still want advanced features
- privacy-first users who prefer straightforward economic alignment

### 3.12 Competitive White Space

The clearest white space in the market is:

**A premium-feeling personal finance app for manual tracking and flexible budgeting that is fully useful offline, requires no account, and explicitly refuses bank linking.**

This white space exists because current competitors usually optimize around one of the following:

- account aggregation
- budgeting doctrine
- broad feature sprawl
- cloud-centric organization
- minimalist logging without enough financial depth

This app combines the following in one product story:

- privacy-first
- no bank linking
- no account required
- manual-first but smart
- offline-first architecture
- flexible budgeting
- premium-quality mobile UX

That combination is the differentiator.

### 3.13 Competitive Risks

The existence of white space does not guarantee success. The product faces several competitive risks:

#### 3.13.1 “Manual” May Be Misread as “Inferior”

Many consumers have been trained to equate automation with product sophistication. If messaging is weak, users may interpret manual entry as a step backward.

Mitigation:

- position manual as intentional, private, and dependable
- make the add flow unusually fast
- make smart categorization visibly helpful
- ensure premium reports feel modern and worth paying for

#### 3.13.2 Competitors May Outshine the Product on Visual Polish

Users comparing screenshots may default to more visually established brands if this app does not feel premium enough.

Mitigation:

- invest heavily in overview, chart, and transaction-list polish
- make empty states aspirational and clear
- ensure dark and light themes both feel deliberate

#### 3.13.3 Broad Finance Apps May Look More “Complete”

Some users will still interpret feature breadth as superiority.

Mitigation:

- clearly state what the product is not
- frame simplicity as focus, not limitation
- emphasize reliability and trust over “all-in-one” sprawl

#### 3.13.4 Lower Friction Competitors May Win Casual Users

If the app asks too much during setup or transaction entry, lightweight trackers and generic note-taking habits may remain more appealing.

Mitigation:

- optimize for extremely fast first transaction
- support smart defaults everywhere
- reduce taps and decisions in repeat flows

### 3.14 Strategic Implications for Product Definition

This competitive analysis leads to the following product directives:

1. The app must never add bank linking, because that would collapse the clearest differentiation.
2. Manual entry must feel substantially better than expected, because that is the main risk and main opportunity.
3. Budgeting must stay flexible, because anti-YNAB positioning fails if the product becomes doctrinal.
4. Reporting must feel premium, because users compare against polished paid apps even if those apps are less private.
5. The free tier must feel honest and useful, because target users are skeptical after the post-Mint transition and ongoing subscription fatigue.
6. Premium must sell depth and control, not essential functionality.
7. Product messaging must repeatedly connect privacy, calmness, reliability, and speed.

### 3.15 Core Competitive Narrative

The app should be presented to the market with a narrative simple enough to survive first-contact comparison:

- Mint is gone.
- YNAB is too much for many people.
- Automation-heavy apps require trust some users do not want to give.
- Most alternatives are either too ideological, too cloud-dependent, too broad, or too shallow.
- This app gives users a better option: manual, smart, private, offline, and calm.

### 3.16 Final Positioning Statement

Against the current market, the app is best defined as:

**A privacy-first, offline-first personal finance app for people who want the control of manual tracking, the usefulness of modern insights, and the flexibility of budgeting without bank linking, cloud dependence, or YNAB-style ideology.**

## 4. Core Feature Set Overview and Feature Prioritization Matrix

### 4.1 Section Purpose

This section defines the product's core feature inventory, the rationale behind each feature group, and the release prioritization logic used to decide what belongs in the free tier, what belongs in premium, and what must ship in the first production-ready version.

The prioritization model is driven by six constraints:

1. The app must deliver clear standalone value with no account creation and no bank linking.
2. The free tier must be honest and useful enough to establish trust and habit.
3. The premium tier must unlock depth, customization, and leverage rather than essential functionality.
4. Every core workflow must work fully offline after install.
5. Manual entry must be fast enough to sustain repeated daily use.
6. The first release must be narrow enough to execute well and broad enough to justify a one-time or subscription purchase.

### 4.2 Feature Strategy Summary

The app is not a general-purpose financial super-app. The feature set is intentionally organized around a single high-value loop:

1. Capture money activity quickly.
2. Classify it with minimal effort.
3. Compare spending against simple plans.
4. Review trends and monthly outcomes.
5. Repeat without friction.

All feature decisions must strengthen one or more parts of that loop.

Features that do not materially improve capture, classification, planning, review, or retention should be deprioritized even if they are common in finance competitors.

### 4.3 Product Capability Layers

The feature set is divided into four capability layers:

#### 4.3.1 Layer A: Habit Formation

These features help users start and maintain tracking:

- onboarding
- first transaction entry
- fast add
- transaction list
- monthly overview
- default categories
- smart categorization suggestions

This layer is the foundation of the free product.

#### 4.3.2 Layer B: Control and Planning

These features help users move from basic tracking to intentional management:

- search and filtering
- transaction editing
- month navigation
- custom categories
- category budgets
- recurring transactions
- multi-currency support

This layer includes essential free control features and premium planning features.
Free control features keep the ledger usable over time, while premium features monetize deeper personalization, planning, and advanced use cases without gating essential functionality.

#### 4.3.3 Layer C: Insight and Interpretation

These features help users understand patterns rather than just record facts:

- category breakdowns
- trends over time
- charts
- multi-period comparisons
- budget progress views
- anomaly visibility through filters and summaries

This layer strengthens retention and premium willingness-to-pay.

#### 4.3.4 Layer D: Ownership and Convenience

These features reinforce trust and everyday usefulness:

- offline storage
- local export
- widget surfaces
- settings and data controls
- restoration of paid entitlements through app store account

This layer is essential to product credibility even when not always visible in marketing.

### 4.4 Core Feature Principles

Every feature in this section is evaluated against the following standards:

#### 4.4.1 Must Reduce Cognitive Load

The app should ask for fewer decisions, fewer taps, and fewer corrections over time.

#### 4.4.2 Must Preserve Privacy Posture

Core feature value must not depend on personal account creation, bank credentials, ad-tech tracking, or cloud-hosted financial data.

#### 4.4.3 Must Reward Repeat Usage

A feature is stronger when it becomes more helpful after the fifth, fiftieth, and five-hundredth transaction.

#### 4.4.4 Must Be Legible to Mainstream Users

Features should not require users to understand accounting concepts, budgeting doctrine, or specialized terminology.

#### 4.4.5 Must Fit the Monetization Ethic

Free features should enable meaningful day-to-day use.
Premium features should compound value for committed users through customization, planning depth, and reporting richness.

### 4.5 Core Feature Set Overview

The core product feature set is grouped into twelve domains:

1. Onboarding and Setup
2. Transaction Capture
3. Transaction Management
4. Categorization
5. Monthly Overview
6. Budgeting
7. Recurring Transactions
8. Reports and Charts
9. Search and Filters
10. Export and Ownership
11. Monetization and Paywall
12. Settings, Personalization, and Widgets

Each domain is described below in product terms rather than implementation detail.

### 4.6 Domain 1: Onboarding and Setup

#### 4.6.1 Goal

Get a new user from install to first value realization in under 3 minutes, with first transaction entry available in under 60 seconds.

#### 4.6.2 User Problem Solved

Users coming from Mint, spreadsheets, or abandoned budgeting apps often quit during setup if they are asked to:

- create an account
- link banks
- configure too many categories
- choose a budgeting methodology
- answer unnecessary personal finance questions

The onboarding experience must prove that this app is different immediately.

#### 4.6.3 Included Capabilities

- welcome screen with product promise
- short explanation of offline-first and privacy-first model
- optional choice of base currency
- optional choice of month start preference
- optional starter category selection
- first transaction prompt
- premium overview during onboarding without blocking free usage

#### 4.6.4 Product Requirements for This Domain

- The app must not require sign-up.
- The app must not require email capture for basic usage.
- The app must not prompt for bank linking.
- The user must be able to skip nonessential setup.
- The first useful screen after onboarding must be the main dashboard or the add-transaction flow.

#### 4.6.5 Free vs Premium Positioning

Onboarding is free for all users.
Premium upsell may be shown contextually but must never block core free setup.

#### 4.6.6 Priority Rationale

This domain is P0 because poor onboarding destroys the product before users experience the differentiator.

### 4.7 Domain 2: Transaction Capture

#### 4.7.1 Goal

Make manual entry fast enough that common transactions can be logged in 5 to 15 seconds.

#### 4.7.2 User Problem Solved

Manual tracking fails when entry is slow, repetitive, or easy to postpone.

#### 4.7.3 Included Capabilities

- add expense
- add income
- amount input
- merchant field and optional note field
- date selection with current date default
- category assignment
- optional currency selection
- optional recurrence tagging shortcut
- save-and-add-another flow
- recent merchant suggestions
- category suggestions based on local history

#### 4.7.4 Product Requirements for This Domain

Transaction entry is the product's most important repeated action and must feel:

- immediate
- low-friction
- predictable
- forgiving

Every extra field should be optional unless the app cannot function without it.

#### 4.7.5 Free vs Premium Positioning

Free:

- manual transaction entry
- default categories
- monthly overview impact

Premium:

- advanced custom categorization support in entry flow
- multi-currency transaction support
- recurring transaction shortcuts where monetized as premium

#### 4.7.6 Priority Rationale

This domain is P0 and is the single highest-value retention lever in the product.

### 4.8 Domain 3: Transaction Management

#### 4.8.1 Goal

Allow users to trust the ledger because every transaction can be reviewed, edited, duplicated, moved, or deleted without confusion.

#### 4.8.2 User Problem Solved

Users inevitably make mistakes, forget entries, enter wrong amounts, or want to clean up history. If editing is painful, trust collapses.

#### 4.8.3 Included Capabilities

- transaction list ordered by date
- drill-down detail view
- edit all mutable fields
- delete transaction with confirmation
- duplicate transaction
- mark recurring-generated entries if applicable
- month-based browsing
- empty states for no transactions

#### 4.8.4 Product Requirements for This Domain

- Users must be able to review transactions without confusion.
- Users must be able to edit all mutable transaction details.
- Users must be able to delete transactions with confirmation.
- The interface must clearly distinguish empty states from missing data.

#### 4.8.5 Free vs Premium Positioning

CRUD reliability must be available to all users.
The product must not place basic correction or deletion behind a paywall.

#### 4.8.6 Priority Rationale

This domain is P0 because a ledger product without robust editability becomes unusable within days.

### 4.9 Domain 4: Categorization

#### 4.9.1 Goal

Help users organize spending consistently without turning category management into a setup project.

#### 4.9.2 User Problem Solved

Raw transaction lists are difficult to interpret. Users need categorization to answer practical questions such as:

- how much did I spend on groceries this month
- which areas are rising fastest
- what should I budget next month

#### 4.9.3 Included Capabilities

- default system category library
- category icons and colors
- category grouping structure where supported
- local smart category suggestions from prior entries
- category rename and custom creation
- archived or hidden categories if included in later milestone

#### 4.9.4 Product Requirements for This Domain

- The app must provide a usable built-in category library.
- Category assignment must be available during entry and editing.
- Local category suggestions must improve repeat entry without requiring cloud processing.
- Custom category management must preserve clarity and avoid setup overhead.

#### 4.9.5 Free vs Premium Positioning

Free:

- basic built-in categories
- assign category during entry
- reassign category during editing

Premium:

- create custom categories
- edit category presentation metadata
- potentially manage advanced category structures

Custom categories are premium because they reflect a committed use case and ongoing personalization, while default categories remain sufficient for free users to understand spending.

#### 4.9.6 Priority Rationale

Built-in categorization is P0.
Custom category management is P1 (Target for launch) and premium-defining.

### 4.10 Domain 5: Monthly Overview

#### 4.10.1 Goal

Give users a calm, immediate snapshot of the current month and recent months without requiring report-building.

#### 4.10.2 User Problem Solved

Users need immediate answers when they open the app:

- how much have I spent this month
- how much income have I logged
- what is the net result
- where is my money going

#### 4.10.3 Included Capabilities

- total income for selected month
- total expenses for selected month
- net balance for selected month
- top spending categories
- recent transactions preview
- month selector
- progress cues against budget when premium budgets exist

#### 4.10.4 Product Requirements for This Domain

- The monthly overview must be understandable at a glance.
- The overview must surface current-month totals without requiring report configuration.
- The overview must make recent activity easy to review.
- Premium-only enhancements must add depth without weakening the free reward loop.

#### 4.10.5 Free vs Premium Positioning

Monthly overview is a core free feature because it is the minimum reward loop for regular tracking.

Premium may expand the overview with:

- richer chart surfaces
- comparative insights
- budget overlays
- trend callouts

#### 4.10.6 Priority Rationale

This domain is P0 because it converts raw data entry into visible value.

### 4.11 Domain 6: Budgeting

#### 4.11.1 Goal

Provide flexible per-category budgeting without imposing a rigid budgeting ideology.

#### 4.11.2 User Problem Solved

Many users want spending guardrails but do not want envelope-based rules, reconciliation rituals, or zero-based workflow complexity.

#### 4.11.3 Included Capabilities

- set monthly budget amount for a category
- view spent amount against budget
- view remaining amount or over-budget amount
- progress indicators
- category budget status in overview and category views
- month-by-month editable budget values

#### 4.11.4 Product Requirements for This Domain

- Budgeting must remain flexible rather than doctrinal.
- Users must be able to set and edit monthly category budgets.
- The app must clearly show budget status against actual spending.
- Budget workflows must avoid mandatory envelope or income-allocation mechanics.

#### 4.11.5 Explicit Non-Goals

The first version of budgeting does not need:

- mandatory rollover logic
- income assignment workflows
- account reconciliation
- rule-based fund movement between envelopes

#### 4.11.6 Free vs Premium Positioning

Budgets per category are premium.

This is appropriate because budgets:

- are advanced planning functionality
- become more valuable after habit establishment
- create ongoing premium utility without crippling the free tier

#### 4.11.7 Priority Rationale

Budgeting is P1 (Target for launch) and a major premium conversion driver.

### 4.12 Domain 7: Recurring Transactions

#### 4.12.1 Goal

Reduce repetitive entry for rent, subscriptions, salaries, bills, and other predictable flows.

#### 4.12.2 User Problem Solved

Users do not want to retype the same monthly transactions forever, but they also may not want the complexity or risk of automated bank import.

Recurring logic preserves manual control while removing repetitive effort.

#### 4.12.3 Included Capabilities

- create recurring template from transaction or from scratch
- recurrence patterns: daily, weekly, biweekly, monthly, yearly
- next due date tracking
- auto-generate local pending or posted transactions depending on design
- edit future recurrence rule
- stop, pause, or delete recurrence
- visually distinguish recurring-generated transactions

#### 4.12.4 Product Requirements for This Domain

- recurring generation must work offline
- generated transactions must be editable individually
- editing one occurrence should not silently rewrite historical records
- users must understand whether generation is automatic, due-based, or confirm-before-save

#### 4.12.5 Free vs Premium Positioning

Recurring transactions are premium because they provide substantial convenience leverage for committed users and reduce long-term maintenance cost.

#### 4.12.6 Priority Rationale

Recurring support is P1 (Target for launch) because it materially improves retention for users with regular bills and salaries.

### 4.13 Domain 8: Reports and Charts

#### 4.13.1 Goal

Transform stored transaction data into understandable patterns that help users make better monthly decisions.

#### 4.13.2 User Problem Solved

Users who log data need more than a list. They need to answer:

- which categories are growing
- how this month compares to last month
- whether spending concentration is changing
- where cuts are realistic

#### 4.13.3 Included Capabilities

- category spending breakdown
- monthly trend charts
- income versus expense charts
- period comparison views
- budget versus actual charts
- simple trend summaries

#### 4.13.4 Product Requirements for This Domain

Reports should be:

- visually clear
- fast to load
- understandable without financial expertise
- useful on small screens

They should not feel like desktop BI tools compressed into mobile.

#### 4.13.5 Free vs Premium Positioning

Free:

- basic monthly overview and simple category visibility

Premium:

- charts
- trends
- deeper historical comparisons
- budget overlays

#### 4.13.6 Priority Rationale

Charts and trends are P1 (Target for launch) because they materially support premium value perception.

### 4.14 Domain 9: Search and Filters

#### 4.14.1 Goal

Make the ledger navigable after the dataset grows beyond casual scrolling.

#### 4.14.2 User Problem Solved

After 100 to 500 transactions, users need fast lookup for:

- a specific merchant
- a date range
- a category
- an amount pattern
- income only or expense only

#### 4.14.3 Included Capabilities

- text search across merchant and note fields
- filter by category
- filter by date range
- filter by transaction type
- filter by amount range if included at launch
- sort options where useful

#### 4.14.4 Product Requirements for This Domain

- Search must remain fast as transaction volume grows.
- Users must be able to combine basic filters without confusion.
- Search results must make matching transactions easy to identify.
- Advanced saved views may be deferred without compromising core ledger usability.

#### 4.14.5 Free vs Premium Positioning

Basic search and filtering should be free because ledger usability depends on it.

Advanced filter presets or saved views may be deferred or considered premium only in later versions, not at launch.

#### 4.14.6 Priority Rationale

Search and filtering are P1 (Target for launch) because they become essential as data accumulates, even if they are less visible in first-session marketing.

### 4.15 Domain 10: Export and Ownership

#### 4.15.1 Goal

Make user data portable and trustworthy by allowing local export without lock-in.

#### 4.15.2 User Problem Solved

Privacy-first claims are not credible if users cannot easily extract their own data.

#### 4.15.3 Included Capabilities

- CSV export
- local file generation
- share sheet integration
- clear export field mapping
- export scoped to all data or selected date range if supported

#### 4.15.4 Product Requirements for This Domain

Export is strategically important because it proves:

- the app does not trap user data
- the app can coexist with spreadsheets and accountants
- the business model is not based on locking users in

#### 4.15.5 Free vs Premium Positioning

CSV export is premium at launch based on the monetization model.

This is acceptable because:

- core usage remains intact for free users
- export is an ownership and power-user convenience feature
- premium buyers are likely to value archival and interoperability workflows

The product should still communicate that data remains stored locally and accessible inside the app even on free.

#### 4.15.6 Priority Rationale

Export is P1 (Target for launch) because it is both a premium feature and a trust-signaling feature.

### 4.16 Domain 11: Monetization and Paywall

#### 4.16.1 Goal

Convert satisfied free users into premium users without dark patterns, pressure, or functional sabotage.

#### 4.16.2 User Problem Solved

Users need a clear explanation of:

- what is free forever
- what premium unlocks
- whether premium is subscription-only
- whether a one-time purchase exists

#### 4.16.3 Included Capabilities

- premium feature comparison screen
- one-time purchase option at $149.99
- monthly subscription option at $4.99 per month
- RevenueCat entitlement management
- restore purchases
- contextual upsell entry points

#### 4.16.4 Product Requirements for This Domain

The paywall must feel:

- transparent
- calm
- factual
- non-manipulative

It must not:

- hide prices
- use fake urgency
- block access to existing user data
- punish free users with artificial friction

#### 4.16.5 Free vs Premium Positioning

Free:

- clear access to core offline finance workflows
- transparent visibility into premium feature boundaries

Premium:

- unlocks advanced planning, customization, export, and reporting capabilities
- is available through subscription and one-time purchase options

#### 4.16.6 Priority Rationale

Paywall and entitlements are P0 for production launch because the product requires a working business model, but upsell frequency and placement must remain subordinate to trust.

### 4.17 Domain 12: Settings, Personalization, and Widgets

#### 4.17.1 Goal

Give users enough control over preferences, appearance, data handling, and quick-glance access to make the product feel owned and dependable.

#### 4.17.2 User Problem Solved

Users need straightforward control over app behavior, appearance, premium status, and data handling without searching through hidden menus or sacrificing trust.

#### 4.17.3 Included Capabilities

- theme selection or system theme support
- base currency preference
- premium management
- export access
- privacy explanation
- data deletion controls
- category management entry point
- budget settings entry point
- widget configuration where supported
- widget surfaces for current month spend, selected budget progress, or quick-glance reminders where supported

#### 4.17.4 Product Requirements for This Domain

- Settings must make essential preferences easy to find and change.
- Data handling controls must be clear and trustworthy.
- Premium status and premium management must be understandable from within the app.
- Widgets, when included, must deliver quick-glance value without duplicating the full app experience.
- Premium widgets should surface only high-signal information such as current month spend, remaining budget in a chosen category, or a quick-glance reminder where platform constraints allow.

#### 4.17.5 Free vs Premium Positioning

Free:

- core settings and privacy controls
- category and budget entry points relevant to unlocked features

Premium:

- widget access
- premium management surfaces for active subscribers or purchasers

#### 4.17.6 Priority Rationale

Core settings are P0.
Widgets are P2 unless they can be shipped to a high standard without delaying core finance workflows.

### 4.18 Launch Tier Definition

The launch product is defined as a two-tier offering with a meaningful free experience and a clearly enhanced premium layer.

#### 4.18.1 Free Tier Definition

The free tier includes:

- no account required
- full offline local usage
- onboarding
- manual transaction entry
- transaction list and editing
- built-in categories
- smart category suggestions from local history
- monthly overview
- basic category visibility
- search and filters

The free tier is intended to answer the question:

**Can this app become my daily manual finance tracker?**

#### 4.18.2 Premium Tier Definition

Premium includes:

- custom categories
- budgets per category
- recurring transactions
- multi-currency support
- CSV export
- charts and trends
- widgets

Premium is intended to answer the question:

**Can this app become my long-term personal finance system?**

### 4.19 Feature Prioritization Method

Each feature is evaluated against six dimensions:

1. User value: how strongly the feature improves real user outcomes.
2. Core loop impact: how directly it strengthens capture, classification, planning, or review.
3. Differentiation: how strongly it supports the product's post-Mint, anti-YNAB, privacy-first position.
4. Revenue leverage: how strongly it supports premium conversion or retention.
5. Complexity: implementation and UX complexity.
6. Launch necessity: whether the feature is required for the product to feel coherent at v1.

Scores use a 1 to 5 scale:

- 1 = very low
- 2 = low
- 3 = medium
- 4 = high
- 5 = very high

Priority buckets:

- P0 = required for v1 launch
- P1 = should ship in v1 or immediate post-launch window; strong premium or retention impact
- P2 = valuable but deferrable
- P3 = speculative or future expansion

### 4.20 Feature Prioritization Matrix

| Feature Domain | Key Capability | User Value | Core Loop Impact | Differentiation | Revenue Leverage | Complexity | Launch Necessity | Priority | Tier |
|---|---:|---:|---:|---:|---:|---:|---:|---|---|
| Onboarding | Privacy-first setup with no account | 5 | 5 | 5 | 2 | 2 | 5 | P0 | Free |
| Transaction Capture | Fast manual add flow | 5 | 5 | 5 | 4 | 4 | 5 | P0 | Free |
| Transaction Management | Edit/delete/duplicate ledger entries | 5 | 5 | 4 | 2 | 3 | 5 | P0 | Free |
| Built-in Categories | Default category library | 5 | 5 | 4 | 2 | 2 | 5 | P0 | Free |
| Smart Categorization | Local suggestions from history | 5 | 5 | 5 | 4 | 4 | 5 | P0 | Free |
| Monthly Overview | Income/expense/net monthly summary | 5 | 5 | 4 | 3 | 3 | 5 | P0 | Free |
| Settings Core | Theme, currency, privacy, purchase restore | 4 | 3 | 4 | 4 | 3 | 5 | P0 | Mixed |
| RevenueCat Entitlements | Purchase and restore handling | 4 | 2 | 2 | 5 | 3 | 5 | P0 | Premium |
| Custom Categories | User-created categories | 4 | 4 | 4 | 5 | 3 | 4 | P1 | Premium |
| Category Budgets | Monthly budgets per category | 5 | 4 | 5 | 5 | 4 | 4 | P1 | Premium |
| Recurring Transactions | Rule-based repeated entries | 5 | 5 | 4 | 5 | 4 | 4 | P1 | Premium |
| Multi-Currency | Transaction-level currency support | 4 | 3 | 3 | 4 | 5 | 3 | P1 | Premium |
| Reports and Charts | Trends, comparisons, visual insights | 5 | 4 | 4 | 5 | 4 | 4 | P1 | Premium |
| Search and Filters | Search ledger by text/date/category | 4 | 4 | 3 | 2 | 3 | 4 | P1 | Free |
| CSV Export | Local data export | 4 | 2 | 5 | 4 | 3 | 4 | P1 | Premium |
| Widgets | Home screen glanceable finance info | 3 | 2 | 3 | 4 | 4 | 2 | P2 | Premium |
| Advanced Filter Presets | Saved filter views | 3 | 3 | 2 | 3 | 3 | 2 | P2 | Premium or Free Later |
| Budget Rollover Logic | Carry-over budgets between months | 3 | 3 | 2 | 3 | 5 | 1 | P2 | Premium |
| Category Group Customization | Parent/child or group editing | 3 | 3 | 3 | 3 | 4 | 2 | P2 | Premium |
| Forecasting | Forward-looking cash flow projection | 3 | 3 | 3 | 4 | 5 | 1 | P3 | Premium |
| Cloud Sync | Multi-device sync via account | 2 | 2 | 1 | 3 | 5 | 1 | P3 | Future/Optional |
| Bank Import | Aggregated institution linking | 1 | 1 | 1 | 2 | 5 | 1 | Excluded | Not Supported |

### 4.21 Priority Bucket Detail

#### 4.21.1 P0 Features

P0 features are mandatory for the first production launch because without them the product either fails to function, fails to differentiate, or fails to monetize.

P0 set:

- onboarding
- fast manual transaction capture
- transaction management
- built-in categories
- local smart categorization
- monthly overview
- core settings
- RevenueCat entitlement handling

P0 success condition:

The user can install the app, understand the promise, enter transactions quickly, review a useful monthly summary, and optionally purchase premium, all without creating an account or relying on connectivity for core usage.

#### 4.21.2 P1 Features

P1 features strongly increase product depth, retention, and premium willingness-to-pay. They should ideally ship at launch if quality allows, and otherwise within the earliest post-launch milestone.

P1 set:

- custom categories
- category budgets
- recurring transactions
- multi-currency
- reports and charts
- search and filters
- CSV export

P1 success condition:

Committed users can shape the product around their real spending structure, reduce repetitive data entry, and extract deeper value than free tracking alone.

#### 4.21.3 P2 Features

P2 features are valuable but not essential to prove the product thesis.

P2 set:

- widgets
- advanced filter presets
- budget rollover
- advanced category grouping tools

These features should not delay launch quality in the core tracking stack.

#### 4.21.4 P3 and Excluded Features

P3 and excluded items represent deliberate restraint.

P3 or excluded:

- forecasting
- cloud sync
- bank import

These areas either weaken positioning, introduce disproportionate complexity, or expand scope beyond the product's initial trust-based value proposition.

### 4.22 Feature-by-Feature Strategic Notes

#### 4.22.1 Why Transaction Capture Is the Primary Bet

The product wins or loses on transaction capture quality more than any other single domain.

Reasons:

- it is the most frequent repeated action
- it determines habit sustainability
- it directly affects data completeness
- it is the clearest place to outperform expectations for a manual app

If transaction entry is slow, no amount of charts, branding, or premium framing will compensate.

#### 4.22.2 Why Monthly Overview Is Free

Users need a visible reward for logging data.
If the monthly overview is weak or paywalled, the free product becomes a storage utility instead of a useful finance tool.

The free product must produce insight, not just collection.

#### 4.22.3 Why Budgets Are Premium

Budgeting is valuable, but it is not necessary for basic tracking.
Making budgets premium:

- preserves a strong free experience
- avoids crippling user trust
- aligns with the product's "pay for deeper control" philosophy
- creates clear upgrade motivation for committed users

#### 4.22.4 Why Recurring Transactions Are Premium

Recurring support delivers compounding convenience.
Users with subscriptions, rent, paychecks, or repeated bills gain meaningful time savings, which makes it an appropriate premium differentiator.

#### 4.22.5 Why CSV Export Is Premium but Still Strategically Essential

Even though CSV export is premium in the monetization model, it remains central to product trust because exportability demonstrates respect for user ownership.

This means export must be:

- easy to discover
- clearly documented
- stable in format
- not framed as a hostage-release feature

#### 4.22.6 Why Bank Import Is Excluded

Bank linking would:

- weaken privacy positioning
- add operational dependence on third parties
- introduce connection failure and support burden
- blur the product's anti-Mint, anti-surveillance narrative

The absence of bank import is not a gap to apologize for. It is a defining product choice.

### 4.23 Free Tier Experience Standards

The free tier must feel complete enough that a skeptical user can rely on it for at least 30 days without feeling tricked.

Free-tier minimum standard:

- user can add unlimited manual transactions
- user can view current and prior month summaries
- user can use built-in categories without artificial limits
- user can search and edit historical data
- user is not forced into an account or trial

The free tier must not feel like:

- a demo
- a countdown to a paywall
- a crippled ledger
- an onboarding funnel disguised as a product

### 4.24 Premium Tier Experience Standards

Premium must feel like a depth upgrade, not a rescue package.

Premium value standard:

- stronger planning through budgets
- stronger personalization through custom categories
- stronger maintenance efficiency through recurring transactions
- stronger insight through charts and trends
- stronger ownership through export
- stronger convenience through widgets and multi-currency support

Premium should answer the needs of users who:

- log frequently
- plan intentionally
- travel or earn/spend across currencies
- want richer monthly review
- want the app to replace a spreadsheet workflow

### 4.25 Monetization Fit Matrix

| Capability | Free Tier Rationale | Premium Rationale | Final Decision |
|---|---|---|---|
| Manual transactions | Core product promise; cannot be restricted without collapsing trust | N/A | Free |
| Basic categories | Needed to make tracking meaningful | Advanced customization can monetize | Free basic / Premium custom |
| Monthly overview | Minimum visible value loop | Advanced insight layers can monetize | Free basic / Premium enhanced |
| Transaction edit/delete | Ledger integrity requires it | N/A | Free |
| Search/filter | Needed for long-term free usability | Advanced saved views can monetize later | Free |
| Budgets | Helpful but not required for basic tracking | Strong planning value and conversion logic | Premium |
| Recurring transactions | Nice-to-have for casual users | High leverage for committed users | Premium |
| Multi-currency | Not essential for all users | Strong value for travel and international use | Premium |
| CSV export | Not necessary for daily entry | Valuable ownership and interoperability feature | Premium |
| Charts/trends | Basic overview already gives entry-level insight | Richer interpretation is premium-worthy | Premium |
| Widgets | Convenience feature | Good premium enhancer | Premium |

### 4.26 Sequencing Recommendation

The recommended shipping sequence is:

#### 4.26.1 Milestone 1: Trustworthy Core

- onboarding
- transaction capture
- transaction list and edit
- built-in categories
- smart local categorization
- monthly overview
- settings basics
- purchase flow scaffolding

Objective:

Prove the app is useful, fast, and credible as an offline-first manual tracker.

#### 4.26.2 Milestone 2: Premium Depth

- custom categories
- budgets
- recurring transactions
- search and filters
- charts and trends
- CSV export
- full entitlement gating

Objective:

Make premium compelling without compromising the free product's integrity.

#### 4.26.3 Milestone 3: Convenience and Polish

- widgets
- advanced filter options
- additional reporting surfaces
- category structure enhancements
- budget quality-of-life improvements

Objective:

Increase premium delight and retention after the core system is stable.

### 4.27 Deprioritized and Rejected Feature Areas

The product explicitly deprioritizes or rejects the following areas for the initial roadmap:

- bank account linking
- debt payoff coaching flows
- investment portfolio aggregation
- shared household cloud collaboration
- social accountability features
- receipt OCR as a primary entry model
- complex tax categorization workflows
- gamified streak systems that risk guilt-based usage

Reasons for deprioritization:

- weak fit with positioning
- increased complexity
- potential privacy erosion
- support overhead disproportionate to user value
- risk of diluting the manual-first core loop

### 4.28 Success Criteria by Feature Domain

| Domain | Success Indicator |
|---|---|
| Onboarding | Majority of new users can complete setup and add first transaction without external help |
| Transaction Capture | Common entries can be saved in 5 to 15 seconds |
| Transaction Management | Users can confidently correct mistakes without data ambiguity |
| Categorization | Category suggestions reduce repeated manual selection over time |
| Monthly Overview | Users can understand their month within 10 seconds of opening the app |
| Budgets | Premium users can see category guardrails without learning a new budgeting doctrine |
| Recurring | Repeated bills and income require dramatically less maintenance |
| Reports | Users can detect changes in category behavior across periods |
| Search/Filters | Historical lookup remains fast and legible beyond 1,000 transactions |
| Export | Users can retrieve structured local data without lock-in concerns |
| Paywall | Premium offer is understandable in under 30 seconds |
| Widgets | Glanceable information adds convenience without replacing app clarity |

### 4.29 Final Feature Definition Statement

The core feature set for this product is intentionally centered on a narrow but high-value promise:

**fast manual tracking, flexible budgeting, useful local insight, and durable privacy without bank linking or account dependence.**

The prioritization framework reflects that promise.
Features that directly strengthen trust, speed, clarity, and sustained habit formation are prioritized first.
Features that add depth for committed users become premium.
Features that weaken privacy posture, create infrastructure dependence, or push the product toward a bloated all-in-one finance platform are excluded or deferred.

## 5. Screen-by-Screen Descriptions: Onboarding Flow

### 5.1 Purpose of Onboarding

The onboarding flow exists to get a new user from first launch to first meaningful value in the shortest credible path possible.

For this product, "meaningful value" means the user has completed all of the following:

- understood that the app works without bank linking or account creation
- chosen an initial operating context for budgets and reporting
- created or accepted a basic category structure
- entered at least one transaction or intentionally skipped to the dashboard with a clear next step
- understood what is free versus premium without being blocked by a paywall

The onboarding flow must be short enough to avoid abandonment, but complete enough to prevent confusion in the first session.

Primary onboarding completion target:

- 90th percentile time from first launch to dashboard: under 2 minutes 30 seconds

Strong completion target:

- 75% or more of new users complete onboarding and land on the dashboard

First-value target:

- 60% or more of new users save at least one transaction during onboarding or within the same first session

### 5.2 Onboarding Principles

The onboarding flow follows eight product rules:

#### 5.2.1 No Mandatory Account Step

There is no sign-up, log-in, email capture, password creation, or identity verification step.

The product must not imply that an account is needed later for normal use.

#### 5.2.2 No Bank Linking Prompt

The onboarding flow must never ask the user to connect a bank, select a bank, import transactions from a financial institution, or grant finance-related aggregator permissions.

This absence is part of the product value proposition and must be stated explicitly.

#### 5.2.3 Explain the Model Early

Within the first two screens, the user must understand:

- the app is manual-first
- data stays on device by default
- the app is useful offline
- smart categorization reduces repetitive work

#### 5.2.4 Ask Only for Setup Inputs That Improve Immediate Utility

Every onboarding question must materially affect:

- defaults
- calculations
- category suggestions
- reporting
- reminders
- future screens

If a piece of information is not needed to improve the first-use experience, it must be deferred to Settings.

#### 5.2.5 Default to a Guided Fast Path

New users should be able to advance through the main flow with a small number of decisions.

Recommended maximum number of decision-heavy setup screens before dashboard:

- 4 required screens
- 2 optional screens

#### 5.2.6 Support Skipping Without Punishment

Optional setup items such as notification permissions or advanced defaults must be skippable.

Skipping must not produce fear-based warnings.

#### 5.2.7 Demonstrate Value Before Selling Premium

The onboarding flow may educate users on premium features, but it must not block the user behind a paywall before:

- privacy model is understood
- first workspace is initialized
- first dashboard is accessible

#### 5.2.8 End With Momentum, Not Configuration Fatigue

The final onboarding action should place the user into a concrete task:

- add first transaction
- review monthly overview
- set first budget

The default recommendation is to push the user to add their first transaction immediately.

### 5.3 Entry Conditions

The onboarding flow is shown when all of the following are true:

- app launches and the local install has not completed onboarding
- no onboarding completion flag exists in local preferences storage

The onboarding flow is not shown when:

- the user has previously completed onboarding on the same local install
- the app is restored from a device backup that preserved local state and the completion flag

The onboarding completion flag is the primary visibility gate.

Local profile/settings data may already exist if the user completed part of onboarding before closing the app.
That partial data must not suppress onboarding before completion.

If onboarding is interrupted:

- progress is resumed from the last completed screen
- partially completed inputs are restored
- the user is never forced to restart from screen 1 unless local app data is deleted

### 5.4 High-Level Onboarding Sequence

Default sequence:

1. Splash / Launch Initialization
2. Welcome and Product Positioning
3. Privacy and Offline Promise
4. Setup Basics
5. Starting Category Template
6. Optional Notifications Setup
7. First Transaction Prompt
8. Transaction Create Screen
9. Onboarding Completion Hand-off
10. Dashboard

Conditional optional sequence:

1. Premium Education Card

This appears only after the first transaction is saved or after the user reaches the dashboard, depending on experiment and monetization strategy. It is not part of the mandatory onboarding flow.

### 5.5 Screen 1: Splash / Launch Initialization

#### 5.5.1 Objective

Communicate immediate responsiveness, initialize local storage, and determine whether onboarding or normal app entry should be shown.

#### 5.5.2 Trigger

App process start.

#### 5.5.3 Duration

Target visible time:

- minimum: 400 milliseconds
- preferred typical: 600 to 1200 milliseconds
- maximum before fallback messaging: 2000 milliseconds

#### 5.5.4 UI Contents

- app mark
- product name
- short loading indicator
- calm background treatment consistent with brand system

No marketing carousel, no legal copy wall, no permissions prompt.

#### 5.5.5 Background Tasks

- open SQLite database
- run pending migrations
- initialize local settings store
- check onboarding completion flag
- preload default category templates
- read stored theme preference or system theme
- initialize RevenueCat SDK in non-blocking mode if premium infrastructure is enabled

RevenueCat initialization must not delay onboarding rendering if network is unavailable.

#### 5.5.6 Success Path

If initialization succeeds and onboarding flag is false:

- navigate to Welcome and Product Positioning

If initialization succeeds and onboarding flag is true:

- navigate to normal app entry

#### 5.5.7 Failure States

If SQLite initialization fails:

- show blocking recovery screen with title "We couldn't open your local data"
- primary action: `Try Again`
- secondary action: `View Help`

If a migration fails:

- show blocking recovery screen with local-safe diagnostic message
- do not expose raw SQL error by default
- provide support code string generated locally

### 5.6 Screen 2: Welcome and Product Positioning

#### 5.6.1 Objective

Establish the product category, differentiate from Mint-style bank-linked tools and YNAB-style rigid workflows, and reassure the user that setup will be quick.

#### 5.6.2 Screen Role

This is the first substantive onboarding screen.

It must answer the question:

Why is this app different, and why should the user trust the setup path?

#### 5.6.3 Primary Message

The message hierarchy should emphasize:

- no bank linking
- no account required
- fully offline for core use
- manual tracking made fast with smart categorization

Recommended content structure:

- headline
- one-sentence supporting statement
- three feature-proof bullets or cards

#### 5.6.4 Example Content Direction

Headline:

**Money tracking without bank linking**

Supporting copy:

Track spending manually, keep your data on your device, and get clear monthly insight without accounts, sync requirements, or budgeting dogma.

Proof points:

- Works fully offline for everyday use
- No sign-up or financial account connection
- Smart category suggestions speed up manual entry

#### 5.6.5 Primary Actions

- primary CTA: `Set Up My App`
- secondary CTA: `See How It Works`

The secondary CTA opens a lightweight modal or bottom sheet with a 3-step explanation of the product loop:

1. Add a transaction
2. Categorize automatically or manually
3. Review your month

This secondary path must not derail onboarding and should dismiss back to the same screen.

#### 5.6.6 Footer Content

Optional footer line:

`Free to start. Premium adds budgets, recurring transactions, charts, export, widgets, and more.`

This line must be informational only and must not feel like a paywall.

#### 5.6.7 Navigation Rules

- back action from this screen exits onboarding and closes the app only on Android if system back is used
- iOS does not display a back control here

#### 5.6.8 Analytics Events

- `onboarding_welcome_viewed`
- `onboarding_welcome_primary_tapped`
- `onboarding_welcome_secondary_tapped`

### 5.7 Screen 3: Privacy and Offline Promise

#### 5.7.1 Objective

Convert privacy positioning from marketing language into operational clarity.

This screen exists because the target audience includes:

- users burned by bank-link fragility
- users skeptical of finance surveillance
- users who assume every finance app wants credentials or cloud access

#### 5.7.2 Core User Questions to Answer

- Where is my data stored?
- Do I need an account?
- Can I use this without internet?
- What data leaves my device?

#### 5.7.3 UI Structure

- title
- short explanatory paragraph
- four reassurance cards or list rows
- optional "Learn more" disclosure

Suggested reassurance rows:

- `Stored locally on this device`
- `No bank accounts connected`
- `No account required`
- `Offline for core tracking and reports`

#### 5.7.4 Learn More Disclosure

If expanded, show concise additional detail:

- purchases may use App Store / Play billing and RevenueCat for entitlement checks
- export shares files only when the user explicitly chooses to export
- notifications stay local to the device

This content must be readable in under 20 seconds.

#### 5.7.5 Actions

- primary CTA: `Continue`
- secondary text action: `Privacy Details`

`Privacy Details` opens the full privacy policy screen or local webview if policy content is bundled.

#### 5.7.6 Design Requirements

- iconography must signal safety and local control without looking like security software
- avoid fear-inducing red or alarm styling
- maintain calm visual tone

#### 5.7.7 Exit Criteria

The user should leave this screen with no unresolved assumption that:

- cloud sync is required
- bank linking is missing temporarily
- account creation comes later as a mandatory step

### 5.8 Screen 4: Setup Basics

#### 5.8.1 Objective

Collect the minimum configuration required for meaningful budgeting, summaries, and defaults.

#### 5.8.2 Inputs

Required inputs:

- primary currency
- month start preference

Optional inputs:

- locale-specific number formatting confirmation when ambiguous
- first budget month start hint

Explicitly excluded from onboarding:

- income target
- savings target
- debt balances
- account list setup
- custom category tree creation from scratch

These may be supported later elsewhere, but they are not part of the onboarding fast path.

#### 5.8.3 Layout

Single screen with stacked form sections.

Section 1:

- label: `Primary currency`
- control: searchable picker
- default: derived from device locale if confidence is high

Section 2:

- label: `Monthly cycle starts on`
- control: segmented option group
- options:
  - `1st of month`
  - `Custom day`

If `Custom day` is selected:

- show numeric day selector 1 through 28

For initial release, reporting should aggregate to predictable monthly periods.
The onboarding flow supports only:

- `1st of month`
- `Custom day`

#### 5.8.4 Validation Rules

Primary currency:

- required
- must be a supported ISO 4217 currency code present in local seed data

Month start:

- required
- valid custom day range: 1 to 28

If the device locale currency is unsupported or ambiguous:

- no preselection
- inline helper text: `Choose the currency you spend in most often. You can add more later with Premium.`

#### 5.8.5 Defaults

Recommended defaults:

- currency: device locale currency
- month start: `1st of month`

#### 5.8.6 Actions

- primary CTA: `Continue`
- back CTA in header: returns to Privacy and Offline Promise

#### 5.8.7 Persisted Data

Save to local profile/settings:

- `base_currency_code`
- `budget_cycle_type`
- `budget_cycle_start_day`
- `locale_format_source`

#### 5.8.8 Rationale

These values are necessary because they influence:

- dashboard totals
- monthly overview grouping
- budget reset logic
- chart labels
- transaction amount formatting
- export consistency

### 5.9 Screen 5: Starting Category Template

#### 5.9.1 Objective

Prevent blank-slate paralysis and establish a usable category system immediately.

#### 5.9.2 User Problem

Manual finance apps fail early when users are forced to invent a taxonomy before seeing value.

The product must ship with a practical starter template.

#### 5.9.3 Default Template Strategy

Present one recommended category template by default and allow a lightweight alternative.

Options:

- `Simple Starter` recommended
- `Detailed Starter`

`Build My Own` is not recommended in onboarding and should be offered only as a low-emphasis text action.

#### 5.9.4 Simple Starter Template

Suggested top-level categories:

- Housing
- Groceries
- Dining
- Transportation
- Shopping
- Health
- Entertainment
- Bills
- Income
- Transfers
- Other

Suggested design note:

The onboarding UI may call these "categories," even if the internal data model supports groups and subcategories.

#### 5.9.5 Detailed Starter Template

Suggested categories:

- Rent or Mortgage
- Utilities
- Internet and Phone
- Groceries
- Dining Out
- Coffee and Snacks
- Gas
- Public Transit
- Car Maintenance
- Shopping
- Health and Pharmacy
- Subscriptions
- Entertainment
- Travel
- Salary
- Freelance Income
- Gifts
- Fees
- Transfers
- Miscellaneous

#### 5.9.6 Template Screen Layout

- title: `Start with categories that already make sense`
- short helper text
- option cards with preview chip lists
- expandable "You can rename or add categories later"

#### 5.9.7 Behavior

When the user selects a template:

- template card shows selected state
- local seeded categories are copied into user category tables
- this happens only after the user taps `Continue`, not on selection

#### 5.9.8 Actions

- primary CTA: `Continue`
- secondary text action: `Start With Just Basics`

`Start With Just Basics` creates a minimal category set:

- Income
- Bills
- Food
- Transport
- Shopping
- Other

This option is intended for users who dislike over-organization.

#### 5.9.9 Validation

One category strategy must be selected before advancing.

Default selection:

- `Simple Starter`

#### 5.9.10 Persisted Data

- chosen template identifier
- generated category records
- default sort order
- default category icon/color mapping

### 5.10 Screen 6: Optional Notifications Setup

#### 5.10.1 Objective

Offer lightweight habit support without making notifications feel mandatory or manipulative.

#### 5.10.2 Placement

This screen comes after categories and before the first transaction prompt.

It is optional and skippable.

#### 5.10.3 Messaging

Headline:

**Stay on top of your month without constant checking**

Support copy:

Get gentle reminders to add missing transactions or review your monthly spending. Notifications are optional and stay on this device.

#### 5.10.4 Option Set

Preset toggles:

- `Daily reminder`
- `Weekly review`
- `End-of-month check-in`

Default state:

- all off

Recommended default suggestion:

- visually recommend `Weekly review`

The app must not pre-enable notifications before OS permission is granted.

#### 5.10.5 Permission Strategy

Use a two-step pattern:

1. In-app explanation screen
2. OS permission prompt only after explicit user action

Primary CTA states:

- if any reminder is selected: `Enable Notifications`
- if none selected: `Skip For Now`

If the user taps `Enable Notifications`:

- trigger OS notification permission prompt

If permission is granted:

- create corresponding local reminder schedules

If permission is denied:

- show brief inline state: `Notifications are off. You can turn them on later in Settings.`
- allow continuation without retry loop

#### 5.10.6 Secondary Action

- text action: `Not Now`

#### 5.10.7 Persisted Data

- reminder preference selections
- permission status
- local schedule metadata if enabled

### 5.11 Screen 7: First Transaction Prompt

#### 5.11.1 Objective

Convert onboarding from setup into action by guiding the user through the first transaction entry immediately.

This is the most important onboarding screen for habit formation.

#### 5.11.2 Strategic Importance

If the user completes setup but never records a transaction, the app risks becoming another abandoned utility.

The first transaction flow must feel:

- fast
- obvious
- non-intimidating
- representative of the ongoing experience

#### 5.11.3 Screen Structure

The screen should act as a guided transition, not a full lecture.

Layout:

- title
- short explanation
- preview of what happens next
- primary CTA to open transaction composer
- secondary CTA to go straight to dashboard

Suggested title:

**Add your first transaction**

Suggested support copy:

Most people know within one entry whether a budget app will stick. Start with your last purchase, bill, or paycheck.

Preview checklist:

- amount
- merchant or note
- suggested category
- save

#### 5.11.4 Actions

- primary CTA: `Add Transaction`
- secondary CTA: `Go To Dashboard`

#### 5.11.5 Secondary Path Rules

If the user selects `Go To Dashboard`:

- onboarding still completes
- dashboard opens with a prominent empty-state CTA to add the first transaction
- system should store flag `first_transaction_skipped_during_onboarding = true`

#### 5.11.6 Guided Composer Behavior

Tapping `Add Transaction` opens the standard transaction create screen in a guided state.

Prefilled defaults:

- date: today
- type: expense
- currency: base currency
- category: none selected initially, but suggestions visible after merchant/title input

Visible fields in initial folded state:

- amount
- merchant / description
- category
- date

Advanced fields hidden behind expand affordance:

- note
- recurring toggle
- currency override if premium enabled

#### 5.11.7 Suggested Empty Prompts

Merchant placeholder:

- `Coffee, rent, salary, groceries...`

Amount placeholder:

- `0.00`

Category helper:

- `We'll suggest one based on what you type.`

#### 5.11.8 First Transaction Success Rules

After save:

- show lightweight success confirmation
- update local overview totals immediately
- mark `first_transaction_created_at`
- set onboarding completion flag if not already set
- navigate to onboarding completion hand-off screen or directly to dashboard depending on selected flow variant

#### 5.11.9 If User Abandons Composer

If the user dismisses the composer without saving:

- return to First Transaction Prompt
- preserve any partially typed values for the current session only

### 5.12 Embedded Flow: First Transaction Create Screen During Onboarding

#### 5.12.1 Objective

Expose the real transaction creation experience, not a fake demo.

The onboarding-specific difference is guidance, not a separate code path for saving financial data.

#### 5.12.2 Required Fields

- transaction type
- amount
- date

Required for quality but not hard-blocking if fallback exists:

- merchant or description

Category handling:

- user may save uncategorized only if product policy permits
- recommended release behavior: require category before save

If category is required:

- the app should aggressively assist with defaults and suggestions to minimize friction

#### 5.12.3 Transaction Type Control

Visible options:

- `Expense`
- `Income`
- `Transfer`

Default:

- `Expense`

If `Transfer` is not fully supported in the initial model, hide it during onboarding and show:

- `Expense`
- `Income`

#### 5.12.4 Smart Categorization During Onboarding

As the user types a merchant/title:

- run local pattern matching against seed rules and any existing user-created patterns
- rank likely categories
- show top 3 suggestions

Examples:

- "Starbucks" suggests Dining or Coffee and Snacks
- "Whole Foods" suggests Groceries
- "Rent" suggests Rent or Mortgage / Housing
- "Payroll" suggests Salary / Income

If there is high-confidence match:

- auto-select suggestion with visible confirmation chip

If low-confidence:

- show suggestions but do not auto-select

#### 5.12.5 Validation Rules

Amount:

- required
- must be greater than 0
- maximum single-entry amount supported by UI: 9,999,999.99

Date:

- required
- default today
- allowed manual backdating

Description:

- optional but strongly encouraged

Category:

- required for expense and income if supported model expects categorized analytics

#### 5.12.6 Error States

Inline errors only. No modal errors for field validation.

Examples:

- `Enter an amount greater than 0`
- `Choose a category`
- `Date can't be empty`

#### 5.12.7 Save Interaction

Save CTA label:

- `Save Transaction`

Loading state:

- button disabled
- spinner visible in button
- save should typically complete in under 150 milliseconds on a normal device

#### 5.12.8 Post-Save Feedback

Success surface:

- toast or inline banner: `Transaction saved`

Optional assistive follow-up:

- `Category learned for similar entries`

This line should only appear if the app has actually stored a local pattern or strengthened a merchant-category association.

### 5.13 Screen 8: Onboarding Completion Hand-off

#### 5.13.1 Objective

Close onboarding cleanly and orient the user to the dashboard.

#### 5.13.2 When Shown

Show this screen only if:

- user saved first transaction during onboarding

If the user skipped transaction creation:

- navigate directly to dashboard empty state instead

#### 5.13.3 Content

Headline:

**You're ready**

Supporting copy:

Your monthly overview is set up locally on this device. You can keep adding transactions, review your categories, and upgrade later if you want budgets, recurring transactions, export, charts, widgets, and more.

Summary chips:

- base currency
- selected monthly cycle
- number of starting categories
- first transaction amount and category if just saved

#### 5.13.4 Primary CTA

- `Open My Dashboard`

#### 5.13.5 Secondary CTA

- `See Premium Features`

This secondary action opens a non-blocking premium feature sheet.

It must not interrupt dashboard access.

### 5.14 Dashboard Landing State After Onboarding

#### 5.14.1 If User Added a First Transaction

Dashboard should show:

- current month spending summary populated
- recent transaction list with the new item at top
- category snapshot with at least one non-zero row if applicable
- low-friction CTA for adding another transaction

Optional celebratory treatment:

- subtle confirmation animation under 600 milliseconds

No gamified streak language.

#### 5.14.2 If User Skipped First Transaction

Dashboard should show an informed empty state:

Headline:

**Start with one transaction**

Support copy:

Add a purchase, bill, or paycheck to see your month take shape.

Primary CTA:

- `Add Transaction`

Secondary CTA:

- `Browse Categories`

#### 5.14.3 If Notifications Were Denied

Do not show a warning banner on first dashboard load.

Notification upsell belongs in Settings or a later reminder preference entry point.

### 5.15 Navigation Map for Onboarding

Primary forward path:

1. Splash / Launch Initialization
2. Welcome and Product Positioning
3. Privacy and Offline Promise
4. Setup Basics
5. Starting Category Template
6. Optional Notifications Setup
7. First Transaction Prompt
8. Transaction Create Screen
9. Onboarding Completion Hand-off
10. Dashboard

Skip path:

1. Splash / Launch Initialization
2. Welcome and Product Positioning
3. Privacy and Offline Promise
4. Setup Basics
5. Starting Category Template
6. Optional Notifications Setup skipped
7. First Transaction Prompt
8. Go To Dashboard
9. Dashboard empty state

Back navigation rules:

- from Privacy screen, back returns to Welcome
- from Setup Basics, back returns to Privacy
- from Category Template, back returns to Setup Basics
- from Notifications, back returns to Category Template
- from First Transaction Prompt, back returns to Notifications or Category Template if notifications were skipped
- from embedded Transaction Create Screen, back returns to First Transaction Prompt without data loss for current session

### 5.16 Data Created During Onboarding

At onboarding completion, the app should have created the following local records as applicable:

- user profile row
- app settings row
- base currency setting
- budget cycle setting
- selected category template metadata
- seeded category rows
- local onboarding progress and completion flags
- reminder preference rows if notifications were enabled
- first transaction row if created
- merchant-category suggestion seed or learned pattern if applicable

No cloud record is created.
No user credential is created.
No bank authorization token is created.

### 5.17 Onboarding State Machine

Recommended local progress model:

- `onboarding_last_completed_step`

Recommended values for `onboarding_last_completed_step`:

- `not_started`
- `welcome_completed`
- `privacy_completed`
- `basics_completed`
- `category_template_completed`
- `notifications_completed`
- `first_transaction_prompt_completed`
- `first_transaction_created`
- `completion_handoff_completed`

Auxiliary booleans or timestamps:

- `notification_prompt_shown_at`
- `notification_permission_status`
- `first_transaction_created_at`
- `first_transaction_skipped_during_onboarding`
- `onboarding_completed_at`

### 5.18 Copy Tone Requirements

All onboarding copy must feel:

- calm
- practical
- privacy-literate
- non-judgmental
- non-financial-jargon-heavy

The copy must not:

- shame the user for past habits
- imply that financial wellness requires perfection
- imply that premium is necessary for the app to be useful
- use startup-style hype language
- suggest surveillance as convenience

### 5.19 Accessibility Requirements for Onboarding

Each onboarding screen must support:

- Dynamic Type / large font scaling without clipped primary actions
- screen reader labels for all controls
- minimum 44 by 44 point touch targets
- focus order that follows visual layout
- sufficient contrast in light and dark themes
- reduced motion alternatives for any transitions

Illustrations must have either:

- meaningful accessibility labels if informative
- hidden-from-accessibility status if decorative

### 5.20 Performance Requirements for Onboarding

Screen transition performance targets on a representative mid-range device:

- forward navigation response under 100 milliseconds after tap
- local form saves under 100 milliseconds
- first transaction save reflected in dashboard in under 250 milliseconds

The onboarding flow must remain fully functional:

- offline
- on low battery mode
- after app background/foreground interruption

### 5.21 Localization Requirements for Onboarding

All onboarding content must support localization, including:

- currency names
- date and number examples
- pluralization
- right-to-left layout compatibility

Text containers must tolerate 30% expansion without truncating primary meaning.

### 5.22 Monetization Behavior Within Onboarding

The onboarding flow must educate, not pressure.

Allowed monetization behaviors:

- small informational premium mention on welcome screen
- premium feature mention on completion screen
- optional non-blocking premium sheet after onboarding

Disallowed monetization behaviors:

- hard paywall before dashboard access
- forced trial before using free features
- obscuring what is free
- interrupting the first transaction flow with a purchase prompt

### 5.23 Edge Cases

#### 5.23.1 App Closed Mid-Onboarding

Expected behavior:

- restore to last incomplete screen
- preserve entered basics form values
- preserve selected template

#### 5.23.2 App Closed After First Transaction Saved but Before Completion Screen

Expected behavior:

- treat onboarding as completed
- next launch opens dashboard

#### 5.23.3 Device Offline During Entire Onboarding

Expected behavior:

- no degraded setup path
- RevenueCat initialization failure must remain silent unless the user explicitly opens premium purchase UI

#### 5.23.4 Notifications Permission Previously Denied at OS Level

Expected behavior:

- in-app screen explains reminders
- tapping enable should route to system behavior appropriately
- if OS blocks prompt, show `Open Settings` action instead of repeated failed requests

#### 5.23.5 User Chooses Premium-Only Feature Expectation Early

Example:

- user expects multi-currency at setup

Expected behavior:

- onboarding keeps a single base currency setup
- lightweight note explains that additional currencies are available with Premium later

### 5.24 Success Metrics for the Onboarding Flow

Primary metrics:

- onboarding start rate
- onboarding completion rate
- first transaction creation rate
- median time to first transaction
- dashboard reach rate

Secondary metrics:

- notification opt-in rate
- category template selection distribution
- skip rate at each screen
- premium feature sheet open rate after onboarding

Qualitative success indicators:

- users describe onboarding as clear, calm, and not invasive
- users accurately understand that there is no bank linking
- users can explain the difference between free and premium after first use

### 5.25 Final Onboarding Definition

The onboarding flow for this product is a short, privacy-forward, local-first setup sequence that introduces the app's core promise, captures only high-value defaults, seeds a usable category system, optionally enables reminders, and pushes the user directly into their first transaction.

Its job is not to impress with feature volume.
Its job is to remove skepticism, reduce blank-state friction, and create immediate confidence that this is a finance app the user can actually live with.

### 5.26 Screen 9: Dashboard / Home

#### 5.26.1 Screen Purpose

The Dashboard / Home screen is the app's operational center.

It is the first screen users should think of when they ask:

- where do I stand this month?
- what did I spend recently?
- am I on track or slipping?
- what should I do next?

The screen must answer those questions in under 5 seconds without requiring the user to dig through reports, filters, or settings.

Dashboard is not intended to be a dense analytics cockpit.
It is intended to be a calm decision surface that combines:

- immediate month status
- quick access to add a transaction
- recent activity visibility
- budget awareness
- lightweight insight
- clear next actions

#### 5.26.2 Primary User Jobs

The Dashboard / Home screen exists to support six primary jobs:

1. See current month spending and income totals immediately after launch.
2. Add a new transaction in 1 tap from the most visible surface in the app.
3. Review the latest recorded transactions to catch missed or incorrect entries.
4. Understand category-level budget progress at a glance if budgets are enabled.
5. See whether the month is trending above or below expectation.
6. Recover easily from blank, sparse, or incomplete data without confusion.

#### 5.26.3 Position in Navigation

Dashboard is the default landing tab after onboarding.

It is also the default return destination when:

- the app cold-starts after onboarding is complete
- the user backgrounds and resumes the app
- the user closes a modal add transaction flow
- the user completes an edit from a transaction detail screen and taps back to root

Recommended bottom tab position:

- left-most or center-most tab slot

Recommended tab label:

- `Home`

Internal product naming may still refer to it as `Dashboard`, but user-facing navigation should prefer `Home` because it is more legible and less corporate.

#### 5.26.4 Core Design Intent

The Home screen should feel:

- immediate
- stable
- readable
- non-judgmental
- information-rich without feeling busy

The screen should not feel like:

- an accounting report
- a gamified habit tracker
- a finance influencer dashboard
- a warning center dominated by red alerts

The visual and interaction goal is:

**high signal, low friction, low shame**

#### 5.26.5 Supported User States

The Dashboard / Home screen must support all of the following states cleanly:

- first-run empty state after onboarding without transactions
- first-run partially populated state after one onboarding transaction
- normal active month with multiple transactions
- budget-enabled month with some categories near or over limit
- premium-disabled state where premium cards are visible but clearly locked or omitted
- sparse-data month where only income or only expenses exist
- offline state with no network dependency
- historical month view after the user changes the active month
- month rollover state on the first day of a new month

#### 5.26.6 Information Hierarchy

The order of information on the screen should reflect how often each area is needed and how quickly it must be understood.

Recommended top-to-bottom hierarchy:

1. Header and month selector
2. Primary summary card
3. Quick actions
4. Budget progress section
5. Recent transactions
6. Secondary insights
7. Premium upsell entry points where relevant and non-intrusive

If screen height is constrained, recent transactions should remain above secondary insights.

#### 5.26.7 Header Area

##### 5.26.7.1 Header Objectives

The header must orient the user without wasting vertical space.

It should communicate:

- where the user is
- which month is being viewed
- whether the numbers reflect the current month or a historical month

##### 5.26.7.2 Header Content

Recommended header elements:

- screen title: `Home`
- month label
- month switcher controls
- optional settings or profile icon

Recommended month label formats:

- `March 2026`
- `Apr 2026`

Do not use ambiguous short numeric formats like `03/26` in the primary header.

##### 5.26.7.3 Header Behavior

Tapping the month label should open a lightweight month picker.

Month switcher controls:

- previous month button
- next month button

If the current month is selected:

- next month button disabled unless future planning mode exists in a later release

Month switching target:

- perceived response under 150 milliseconds for cached local data

##### 5.26.7.4 Historical Month Treatment

If the selected month is not the current calendar month, show a subtle contextual indicator:

- `Viewing March 2026`

If the user returns to current month:

- indicator removed

Avoid large warning banners for historical viewing.

#### 5.26.8 Primary Summary Card

##### 5.26.8.1 Purpose

The primary summary card is the most important surface on Home.

It provides a compact monthly answer to:

- how much came in
- how much went out
- what remains or netted out

It should be interpretable in under 2 seconds.

##### 5.26.8.2 Required Metrics

For the selected month, calculate and display:

- total income
- total expenses
- net amount

Definitions:

- total income = sum of all transaction amounts marked as income for month
- total expenses = sum of all transaction amounts marked as expense for month
- net amount = total income minus total expenses

##### 5.26.8.3 Copy and Labels

Recommended labels:

- `Income`
- `Spent`
- `Net`

Use `Spent` instead of `Expenses` in compact card UI if space is tight.

##### 5.26.8.4 Numeric Formatting

All values must use:

- selected base currency symbol or ISO currency code
- locale-appropriate thousands separators
- two decimal places when cent precision exists

Examples:

- `$2,450.00`
- `EUR 840.50`

If amount is a whole number and the design system allows compact format, secondary contexts may show:

- `$2,450`

Primary summary card should still preserve financial precision where practical.

##### 5.26.8.5 Visual Structure

Recommended structure:

- dominant top-line figure for `Spent` or `Net`
- two secondary columns or rows for the remaining metrics
- optional trend delta vs previous month

Preferred default emphasis:

- highlight `Spent` for general tracking users

Alternative acceptable emphasis:

- highlight `Net` if user has budget mode and income tracked consistently

Do not show all three values with equal visual weight if it creates scanning friction.

##### 5.26.8.6 Trend Delta

If prior-month data exists, show one comparison line:

- `12% lower than last month`
- `8% higher than February`

Delta should default to expense comparison, not income comparison, because spending control is the main dashboard use case.

If no prior-month comparable data exists:

- omit delta line entirely

Do not show fake comparisons such as `0% change`.

##### 5.26.8.7 Budget Context Within Summary

If budgets are enabled and premium is active, the summary card may include a concise budget health line:

- `4 of 9 budgets on track`
- `2 categories over budget`

This line must not replace numeric totals.

##### 5.26.8.8 Empty Summary State

If there are zero transactions in the selected month:

- income = 0
- spent = 0
- net = 0

Show helper copy:

- `No transactions recorded for this month yet`

Primary action remains available:

- `Add Transaction`

#### 5.26.9 Quick Actions Row

##### 5.26.9.1 Required Actions

Directly below the summary card, provide fast access to the most common next steps.

Minimum required actions:

- `Add Transaction`
- `Search`

Recommended additional actions:

- `View Reports`
- `Budgets`

##### 5.26.9.2 Priority Rules

`Add Transaction` must be the most prominent action on the entire screen outside of onboarding.

It may appear as:

- floating action button
- prominent pill button
- segmented action row with primary styling

The product may use both:

- persistent floating add button
- top quick action shortcut

if the implementation remains visually disciplined.

##### 5.26.9.3 Free vs Premium Quick Actions

If a quick action leads to a premium feature:

- show lock icon
- allow tap to open paywall explanation
- do not disable the button without explanation

Examples:

- `Budgets` locked for free users
- `View Reports` partially available if only advanced charts are premium

##### 5.26.9.4 Add Transaction Entry Points

From Home, the add transaction flow should be reachable by:

- primary quick action button
- floating action button if implemented
- empty state CTA
- optional pull-up action sheet from long press on Home tab

At least one visible `Add Transaction` control must remain above the fold on most devices.

#### 5.26.10 Budget Snapshot Section

##### 5.26.10.1 Purpose

The budget snapshot gives users directional control without forcing them into a full reports workflow.

It should answer:

- which categories are close to their limit
- which categories are already over
- how much budget remains

##### 5.26.10.2 Visibility Rules

If user is Premium and has at least one active budget for the selected month:

- show budget snapshot section

If user is Premium but has no budgets:

- show setup prompt card

If user is Free:

- show either a concise upgrade teaser or omit the section based on monetization strategy selected for v1

Recommended v1 behavior:

- show a compact teaser card, not a full empty budget component

##### 5.26.10.3 Budget Snapshot Content

Show up to 3 high-priority category budget rows on Home.

Priority order:

1. over-budget categories
2. categories above 80% utilization
3. categories with highest absolute spend

Each budget row should include:

- category name
- spent amount
- budget amount
- remaining amount or overage amount
- progress bar

Examples:

- `Groceries  $410 / $500  $90 left`
- `Dining  $265 / $200  $65 over`

##### 5.26.10.4 Color and Status Rules

Budget progress states:

- under 80%: normal accent
- 80% to 99%: caution color
- 100% and above: error color

Color alone must not communicate status.
Pair color with text:

- `On track`
- `Almost there`
- `Over budget`

##### 5.26.10.5 Budget Summary Line

At top of section, show one concise aggregate line:

- `5 budgets tracked this month`
- `2 need attention`

If all budgets are under 80%:

- `All budgets currently on track`

##### 5.26.10.6 Budget Empty State for Premium Users

If premium is active but user has created no budgets:

Headline:

**Set your first budget**

Support copy:

Track a category limit like groceries, dining, or transportation to see progress here.

Primary CTA:

- `Create Budget`

##### 5.26.10.7 Budget Teaser for Free Users

If user is on free tier:

Headline:

**Track category budgets with Premium**

Support copy:

See how close you are to your monthly limits without switching to spreadsheets.

CTA:

- `See Premium`

This card must be visually subordinate to actual finance data.

#### 5.26.11 Recent Transactions Section

##### 5.26.11.1 Purpose

Recent transactions provide confidence, reviewability, and error recovery.

Users need to verify:

- the last item was saved
- entries look correct
- the category assignment makes sense
- nothing obvious is missing

##### 5.26.11.2 Section Structure

Recommended section header:

- `Recent Transactions`

Secondary action:

- `See All`

The section should show the most recent 5 to 10 transactions for the selected month by default.

Recommended default:

- 7 rows

##### 5.26.11.3 Row Content

Each row must include:

- merchant or title
- category chip or label
- transaction date
- amount
- income or expense visual distinction

Optional row metadata:

- recurring badge
- note indicator
- currency conversion indicator

##### 5.26.11.4 Sorting Rules

Default sort:

- descending by transaction date
- tie-breaker descending by created_at timestamp

If the selected month is historical:

- still sort by transaction date descending

##### 5.26.11.5 Row Interaction

Tapping a row opens transaction detail or edit view.

Swipe gestures may support:

- edit
- delete

but destructive swipe actions should require confirmation or undo support.

Preferred delete pattern:

- swipe to reveal delete
- tap delete
- show 5-second undo toast

##### 5.26.11.6 Row Amount Styling

Expenses:

- prefixed with minus or shown in expense color

Income:

- prefixed with plus or shown in income color

Example:

- `-$24.50`
- `+$2,100.00`

The app may use either sign convention or semantic color plus label, but the distinction must remain immediately obvious in monochrome accessibility contexts as well.

##### 5.26.11.7 No Transactions State

If there are no transactions in selected month:

show an empty recent transactions card with:

- illustrative icon or neutral placeholder
- headline
- support copy
- primary CTA

Recommended copy:

Headline:

**No transactions yet**

Support copy:

Your recent activity will appear here after you log income, bills, or purchases.

Primary CTA:

- `Add Transaction`

Secondary CTA:

- `Learn Categories`

##### 5.26.11.8 Sparse Month State

If the month contains 1 to 3 transactions:

- show all available transactions
- do not pad with skeleton placeholders
- keep section visible because reinforcement matters early

#### 5.26.12 Secondary Insights Block

##### 5.26.12.1 Purpose

The Home screen should provide one lightweight insight block that encourages return usage without overwhelming the user.

Acceptable insight types:

- top spending category this month
- spending vs last month
- number of transactions logged this month
- recurring transaction due soon

Only one primary insight card should appear above the fold on smaller devices.

##### 5.26.12.2 Recommended Default Insight Priority

Priority order:

1. budget alert if budget feature active and at-risk
2. top spending category
3. spending change vs previous month
4. upcoming recurring transaction reminder

Examples:

- `Dining is your top category this month at $265`
- `You've spent $140 less than this time last month`
- `Rent is due in 2 days`

##### 5.26.12.3 Insight Guardrails

Insights must be:

- factual
- concise
- non-judgmental

Avoid copy such as:

- `You're overspending again`
- `Bad month so far`
- `You're falling behind`

Preferred alternatives:

- `Spending is currently 18% above last month`
- `Dining exceeded its budget by $65`

#### 5.26.13 Multi-Currency Home Behavior

##### 5.26.13.1 Premium Scope

Multi-currency is a Premium feature.

The Home screen must still remain coherent when the user has transactions in more than one currency.

##### 5.26.13.2 Default Display Rules

Primary summary card should display totals in the user's base currency for the selected month.

If any transaction in the selected month uses a non-base currency:

- show subtle multi-currency indicator

Example:

- `Includes converted transactions`

##### 5.26.13.3 Transaction List Treatment

Recent transaction rows should show:

- original transaction currency amount if different from base currency
- optional smaller converted amount beneath or beside it

Example:

- `€18.00`
- `$19.43 base`

If the user is Free and legacy data somehow contains multi-currency records from a prior premium entitlement:

- existing records remain readable
- editing or adding additional foreign-currency transactions should route through entitlement rules defined elsewhere

#### 5.26.14 Search and Filter Entry From Home

##### 5.26.14.1 Search Purpose

Home is not the full search experience, but it must provide a fast path into it.

##### 5.26.14.2 Entry Points

Search can be entered from:

- quick action row
- magnifying glass icon in header
- `See All` within recent transactions if that route opens the ledger with search affordance

##### 5.26.14.3 Home-Level Filters

Dashboard itself should remain intentionally light on filters.

Allowed Home-level controls:

- month switcher
- optional account scope in later versions if account entities exist

Do not overload Home with:

- category filters
- merchant filters
- amount range controls
- advanced report dimensions

Those belong in ledger or reports screens.

#### 5.26.15 Widgets and Home Relationship

If widgets are supported for Premium users, Home should remain the richer canonical detail surface.

Widget interaction rules:

- tapping widget opens Home by default
- deep link may optionally scroll to relevant section such as budget snapshot or recent transactions

Home may include a small widget setup teaser only if:

- user is premium
- widgets supported on device
- widget not yet configured

This teaser should appear below core finance data.

#### 5.26.16 Paywall Behavior on Home

##### 5.26.16.1 Allowed Monetization Entry Points

Dashboard may surface Premium from:

- locked budget teaser
- charts or advanced trends shortcut
- widget setup card
- export shortcut if present in action sheet

##### 5.26.16.2 Disallowed Monetization Behaviors

Do not:

- block Home behind paywall
- cover monthly summary with subscription modal on launch
- interrupt recent transaction review with forced upsell
- trigger paywall automatically after every save from Home

##### 5.26.16.3 Upgrade Copy Standard

Upgrade copy on Home should be utility-led:

- `Unlock budgets, recurring transactions, charts, widgets, and CSV export`

Do not use vague marketing lines with no concrete feature reference.

#### 5.26.17 Refresh and Data Update Behavior

##### 5.26.17.1 Core Principle

Because the app is offline-first and local-data-backed, Home should feel instant and predictable.

It should not rely on network refresh semantics for normal finance data.

##### 5.26.17.2 When Data Recomputes

Dashboard data should recompute when:

- app launches
- selected month changes
- transaction is created
- transaction is edited
- transaction is deleted
- category assignment changes and affects grouping
- budget value changes
- recurring transaction materializes into a real transaction
- premium entitlement changes affecting visible modules

##### 5.26.17.3 Pull to Refresh

Pull to refresh is optional.

If implemented, it should refresh:

- local derived aggregates
- premium entitlement status if stale
- widget configuration hints if relevant

It must not suggest that the user's finance data lives remotely.

Preferred refresh copy:

- `Refreshing local summary`

Avoid copy like:

- `Syncing your finances`

unless future cloud sync actually exists.

#### 5.26.18 Loading States

##### 5.26.18.1 Initial Load

For a cold app open with local database initialization:

- show shell immediately
- render skeletons for summary and recent transactions if needed
- target visible content under 400 milliseconds on modern devices

##### 5.26.18.2 Skeleton Guidance

Skeletons may appear for:

- summary card
- budget rows
- recent transaction rows

Maximum skeleton row count:

- 5

Do not show loading spinners in the center of an otherwise blank screen for normal local load.

##### 5.26.18.3 Incremental Updates

After adding a transaction from Home:

- update summary and recent transactions optimistically or immediately after commit
- highlight or animate the new row subtly

Animation duration:

- 150 to 300 milliseconds

#### 5.26.19 Empty, Partial, and Error States

##### 5.26.19.1 Full Empty State

Condition:

- no transactions exist at all in local database

Expected Home composition:

- visible summary card with zero values
- recent transactions empty card
- optional category education card
- highly prominent `Add Transaction` CTA

Recommended support copy:

- `Start by logging one purchase, bill, or paycheck. Everything stays on this device.`

##### 5.26.19.2 Current Month Empty, Historical Data Exists

Condition:

- user has prior-month transactions but none in selected current month

Support copy should acknowledge continuity:

- `Nothing recorded for March yet. Your earlier history is still available.`

Optional secondary action:

- `View February`

##### 5.26.19.3 Budget Data Missing or Invalid

If a budget row cannot render due to corruption or missing references:

- omit broken row
- log recoverable error locally
- show remaining valid rows

If entire budget snapshot fails:

- replace section with neutral fallback card:

`Budgets couldn't be loaded right now`

CTA:

- `Try Again`

The rest of Home must remain usable.

##### 5.26.19.4 Database Recovery Edge State

If Home cannot read core summary data because the local database is temporarily unavailable:

- show dedicated non-destructive error surface
- explain that data is stored locally
- provide retry action
- provide export or recovery route only if technically available

Recommended copy:

- `Your local data couldn't be loaded right now`
- `Try Again`

Avoid catastrophic wording like `Data lost` unless loss is actually confirmed.

#### 5.26.20 Interaction Details

##### 5.26.20.1 Scroll Behavior

Home should be a single vertical scroll surface.

Sticky behavior allowed:

- sticky compact month header on scroll

Do not create nested scroll regions for:

- budget rows
- recent transactions preview

unless absolutely required for performance at unusual list sizes.

##### 5.26.20.2 Tap Targets

Minimum interactive target size:

- 44 x 44 pt equivalent

Particularly important for:

- month switch arrows
- add transaction button
- recent transaction rows
- `See All` links

##### 5.26.20.3 Haptics

Optional light haptic feedback may be used for:

- successful transaction creation returning to Home
- month switch
- swipe action commit

Do not use strong error haptics for overspending or budget alerts.

##### 5.26.20.4 Motion

Home motion should be sparse and informative.

Allowed:

- card fade-in on first load
- row insertion highlight
- count/value morph on summary update

Avoid:

- bouncing KPI animations
- celebratory confetti
- aggressive pulsing upgrade buttons

#### 5.26.21 Accessibility Requirements for Home

Home must be fully usable with:

- dynamic type
- screen readers
- reduced motion enabled
- high contrast preferences

Specific requirements:

- summary card metrics announced with labels and values in logical order
- budget progress bars expose text equivalents
- recent transaction rows read merchant, category, date, and amount clearly
- locked premium items announce that they require Premium before activation
- color-coded status always paired with text

Example screen reader phrasing for a budget row:

- `Groceries, spent 410 dollars out of 500 dollars, 90 dollars remaining, almost at limit`

#### 5.26.22 Home Screen Data Dependencies

The Home screen depends on the following local data domains:

- transactions
- categories
- budgets
- recurring transaction instances that have posted or are due
- app settings
- premium entitlement cache
- currency preferences and exchange metadata if multi-currency active

Derived values required:

- month income total
- month expense total
- month net total
- top categories by spend
- recent transactions list
- budget utilization ratios
- previous month comparison values
- transaction count for month

All of these should be computable fully offline from local persisted data.

#### 5.26.23 Performance Expectations for Home

Target performance on a mid-range device with 10,000 local transactions:

- initial Home render shell under 250 milliseconds after route mount
- summary aggregate query under 80 milliseconds
- recent transactions query under 60 milliseconds
- month switch recompute under 120 milliseconds
- return from add transaction to visually updated Home under 150 milliseconds after DB commit

Scrolling target:

- 55 to 60 FPS equivalent for normal interactions

Home must remain usable with:

- 120 categories
- 60 active budgets
- 5 years of local transaction history

without requiring network offload.

#### 5.26.24 Privacy Messaging on Home

Home should not constantly repeat privacy marketing copy, but it may reinforce trust in specific sparse states.

Allowed privacy reassurance contexts:

- first-ever empty state
- database recovery messaging
- export or premium explanation cards

Example:

- `Stored only on this device`

Do not place privacy slogans permanently in the main KPI area once the user is active.

#### 5.26.25 Success Criteria for the Home Screen

The Dashboard / Home screen is successful if users can do all of the following with little or no instruction:

- identify current month spending within 3 seconds
- add a transaction within 1 tap from Home
- confirm their most recent transaction saved correctly
- understand whether any budget needs attention
- move to a prior month without confusion
- distinguish free features from premium upgrades without feeling blocked

Behavioral indicators of success:

- high repeat use of Home as default entry point
- low abandonment after add transaction
- frequent transition from Home to transaction detail, search, and reports
- low support confusion around whether data is stored locally

#### 5.26.26 Final Definition

The Dashboard / Home screen is the app's calm operational hub: a local-first monthly overview that surfaces current spending, recent activity, and immediate next actions with enough intelligence to guide decisions, but without the clutter, judgment, or dependence on bank sync that define many competing finance apps.

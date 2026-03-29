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

# 13n micro-dogfood · site-context fixture

FIXTURE. The product is the invented log-search API from `loop/evidence/12b-contracts/docs-dev-tool-compile.md`, extended with a site inventory for site-context testing only. Nothing here is a real site; no content from this file may be reused as proof anywhere.

This file is what Phase 2 step 1 writes on this property: the output shape follows the pinned site-architecture skill (marketingskills 2.3.0), whose context gathering covers business context, current state, content inventory, and navigation, condensed to the fields the contract compiler consumes.

## Page inventory

As it is:

- `/` : the homepage being rewritten this pass (this run's page).
- `/pricing` : live; published usage rates, free-tier cap, enterprise contact form.
- `docs.loghound.example` : full documentation, including the key-to-first-call quickstart.
- `console.loghound.example` : the product console; where an issued key lands the new user.

As it should be:

- `/` rewritten this pass to the compiled contract.
- `/security` : planned, next quarter; the economic buyer's data-handling and SLA depth. Flagged as separate work in this file; nothing in this pass builds it.

## Nav policy inputs

Site navigation exists and is stable: Docs, Pricing, Sign in. Nothing in the inventory argues for striking or adding items on this page.

## This page's slot and URL

`/`, the site root. URL fixed; nothing to choose.

## Pricing page fork

A full pricing page exists and is live at `/pricing`. Rates do not need to live on the homepage.

## Thank-you buildability

Not buildable in this pass. The conversion (key issued, first call run) lands the reader in the console, which the product owns; there is no page slot for this skill to fill.

## Split-vs-straddle ruling

The brief tempts a merge: `docs-dev-tool-landing` for the practitioner and `saas-homepage` for the economic buyer who approves the invoice. Ruling: split. The practitioner page compiles alone against `docs-dev-tool-landing`; the economic buyer's depth (security posture, SLA, procurement) is the planned `/security` page, listed above as flagged separate work. Data handling stays a section on this page regardless, because the practitioner raises that objection too.

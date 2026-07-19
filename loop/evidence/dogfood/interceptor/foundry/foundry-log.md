# foundry-log.md: Interceptor

Per-property memory. Phase 6 appends after every run; Phases 0 and 2 read the newest entry's open items and learnings as binding inputs. This is the product's first run, so there is no prior entry to carry forward.

## Run 1 (started 2026-07-18, page-foundry v3.0 dogfood)

- Mode: build. Archetype: oss-project, confirmed at Phase 2.
- Status: complete through the ship gates. Phase 0 intake to Phase 6 build ran across the DOGFOOD slices; the render gates (1, 4, 5) closed at DOGFOOD-7c-2. Deliverable page: `pages/interceptor/index.html` on `pages/interceptor/theme.css`. Gate report of record: `loop/evidence/dogfood/7c-2/gate-report.md`.
- Prior state adopted: none. First run for this product; no v2.x artifacts to migrate.
- Skeleton (set at Phase 2, for the next run's anti-template check): hero, answer block, problem, mechanism with a before-and-after contrast, quickstart (densest), data handling and safety, honest comparison, not-for, why now, project status, FAQ, close. Axes: demo-led, install-affordance, interleaved proof, compressed. The next run varies at least one axis or records why it holds.
- Conversion score: rendered independent MECLABS C=20 (M4 V4 I2 F3 A3), the cold read of record on the built page. Builder self was 31; the gap is integrity-constrained optimism on I, V, and A, not a fixable copy defect (see the gate report Gate 1). No prior page, so there is no measured field baseline for this property yet; C=20 is the design-heuristic diagnosis, not a measured metric.
- Open items carried forward:
  - The core stealth claim is vendor-stated with no published independent reproduction, and adoption proof is zero. Both cap the conversion score (V and A) and both are honest `[TK]`s the page manages by candor. If independent reproduction or real adoption lands, the next run can lift V and A without fabrication; until then the page must not.
  - Real-ship fonts: bundle two IBM Plex `woff2` files with a preload and a metric-matched `size-adjust` fallback. This run renders on system fallback (no swap, no CLS), so it is deferred, not broken.
  - Deploy origin and link destinations: `interceptor.example` is a reserved placeholder for the canonical and OG origin; the owner sets the real origin and points Docs, Community, and License at their final URLs at deploy.
  - The "via Interceptor" renders are owed: this run captured them headless because the screen was locked (OWNER-REVIEW). A morning unlocked rerun captures the same views through Interceptor proper.
- Learnings for the next run:
  - A pre-build conversion audit that predicts a deferred `[TK]` element will "recover" the score can be wrong about which factor moves. Here the install affordance recovered F only; I and V held because their ceilings were the unproven core claim and the no-manufactured-incentive stance, not the `[TK]`s. Score the rendered page cold before believing the recovery, and never close a residual gap by inventing proof.
  - Terminal output blocks with `overflow-x: auto` truncate their longest line off the right edge at every width, not just on mobile. Soft-wrap them (`white-space: pre-wrap`) so the proof stays whole; a real terminal soft-wraps anyway. The render gate caught this; a token plan did not.

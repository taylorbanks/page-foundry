# 12b micro-dogfood · event-webinar compile

FIXTURE. The session below is invented for compiler testing only. Proof REQUIREMENTS only, never proof content; the schema block shows field WIRING, not real values. The point of this compile is to exercise the new question-1 mapping, the replay-policy constraint, and the Event schema seam into Gate 6.

Fixture brief, in full: a free 60-minute live workshop teaching incident-review facilitation, hosted by a consultant with prior recorded sessions, on a stated date three weeks out, capped at 200 seats by the platform plan. A replay goes to registrants. Traffic: the host's mailing list plus one partner newsletter. No `foundry-log.md` exists for this property.

## The five questions

1. **Conversion:** registration against a real date. → `event-webinar`, per the compiler's new question-1 mapping. Not `campaign-landing`: nothing is sold, so the offer jobs never join (the paid-ticket merge in the boundary note stays dormant).
2. **Relationship:** one-time session; the goal behind the goal is attendance, so the calendar-add path is in scope.
3. **Traffic:** two adjacent single sources (host list, partner newsletter); message match binds to both sends.
4. **Awareness state:** host-led arrivals dominate from the mailing list; the partner send brings topic-led readers who need the payoff made concrete. Both of the contract's states arrive.
5. **Decision weight:** a calendar hour, not money; density: compressed. Three weeks out, value does the selling; the date's native urgency takes over as it nears.

## Filled contract

**Goal.** Registration, measured through to attendance; the reminder path and calendar add are part of the conversion.

**Buyer entry states.** Host-led (logistics fast) and topic-led (payoff first), per the brief's two sends.

**Jobs, kept or struck.**

- 5-second test with the date in it: KEPT; date, start time, named timezone, 60 minutes, platform, registration in view.
- Sell the session, not the topic: KEPT; the walk-away stated concretely for the topic-led reader.
- Why live beats the recording: KEPT; live facilitation practice is the in-the-room thing.
- Replay policy stated plainly: KEPT; registrants get the replay, and the page says so rather than hiding it to force attendance.
- Presenter established: KEPT; prior recorded sessions exist, so the past-session clip is the taste-it artifact.
- Native urgency: KEPT; real date, real 200-seat cap (platform plan), both checkable. No deadline exists, so none is claimed.
- Logistics objections: KEPT; free, browser-only attendance, recorded, cameras off for attendees.
- Post-conversion: KEPT; confirmation lands the calendar file immediately, names the reminder cadence, built to `thank-you-post-conversion` in the same pass.

**Proof requirements.** Presenter credibility plus a past-session clip; attendee quotes only when real and attributed; registered count only when creditable.

**CTA policy.** Registration as the single action; name and email only. Navigation: none; both sources are single-intent sends.

**Ordering constraints.** The shared ten, plus the archetype's three: date in the hero, replay policy before the final ask, and the paid-ticket constraint dormant (free session).

**Axes.** Narrative shape: offer-led for the host-led majority (the session is the offer), with the payoff made concrete early for the partner-send reader. Hero form: copy-plus-CTA carrying the date line. Proof strategy: concentrated; one heavy artifact (the past-session clip). Density: compressed.

**Log.** None exists; defaults stand, and the contract says so.

**Schema wiring (Gate 6 seam).** The Phase 2 spec supplies the `Event` template's values from this contract: `startDate`/`endDate` from the dated hero (ISO 8601 with the named timezone), `eventAttendanceMode` online, `location` as the platform URL, `organizer` as the host, and NO `offers` block, because nothing is priced; the ship-gates rule (omit fields you cannot fill with real values) is what makes the free case legal.

## What this compile proves

Question 1's new mapping routes a dated registration page to `event-webinar` and keeps the free case out of `campaign-landing`; the replay-policy job and constraint produce an honest answer to the attend-or-wait objection; the schema note wires contract values into Gate 6's `Event` template with the offers block correctly absent for a free session.

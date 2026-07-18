# 12c micro-dogfood · ecommerce-product compile

FIXTURE. The product below is invented for compiler testing only. This file contains proof REQUIREMENTS, never proof content; no review, count, or photo reference appears here or may be reused anywhere. The point of this compile is to exercise the new question-1 mapping and the contract's boundary against `campaign-landing`, the archetype that previously absorbed product-sales briefs regardless of context.

Fixture brief, in full: a waxed-canvas work backpack sold in a small maker's own store, alongside the maker's other bags. Two sizes, three colors. Mid-range price for the category. The store's platform computes review scores and holds customer photos. Traffic: category search, some paid social for the flagship colorway, and browsers moving between the store's own product pages. No `foundry-log.md` exists for this property.

## The five questions

1. **Conversion:** add-to-cart on a product that lives in a store. → `ecommerce-product`, per the compiler's new question-1 mapping. Not `campaign-landing`: the page sits inside a store with nav, sibling products, and a cart, and its traffic is mixed; the mapping's own boundary line (one campaign source, one audience) points the other way here.
2. **Relationship:** one-time purchase; no aliveness to prove, no cadence to promise.
3. **Traffic:** mixed (category search, paid social on one colorway, in-store browsers). The paid-social slice binds message match to the advertised colorway: those arrivals open on that variant.
4. **Awareness state:** product-aware dominates; search and ad arrivals want confirmation and logistics, and in-store browsers are mid-comparison against the maker's other bags.
5. **Decision weight:** light-to-mid; a considered purchase but not a committee one. Density: compressed.

## Filled contract

**Goal.** Add-to-cart on the backpack, either size, any colorway.

**Buyer entry states.** All three contract states arrive per the brief: search/ad confirmers, sibling-comparison browsers, and returners with a considered cart. The ad-traffic message-match note binds to the flagship colorway.

**Jobs, kept or struck.**

- Gallery as it is (angles, scale, zoom, customer photos beside studio): KEPT; the fixture supplies no photos, per the fabrication rule; the compile records the requirement.
- Buy box with truthful variant updates: KEPT; two sizes and three colors make variant truth load-bearing.
- Logistics beside the box (shipping cost and time, returns, warranty): KEPT; this is the contract's center for a store this size.
- Fit answer: KEPT in volume terms (what fits inside, on-body scale), the bag equivalent of a size chart.
- Reviews with volume, recency, photos, negatives included: KEPT; the platform computes them, and they appear as computed.
- Facts that prevent the return (dimensions, materials, care): KEPT.
- Sibling differentiation: KEPT; the store carries other bags, and the browser needs the one-line answer to why this one.

**Axes.**

- Narrative shape: offer-led; product-aware arrivals get the product, the price, and the logistics without a persuasion arc in front.
- Hero form: product-in-hero; the gallery is the demonstration and the page opens on it.
- Proof strategy: interleaved; the inventory is many small pieces (review notes, fit remarks, photos) that work beside the claims they back, with the review section as the anchor.
- Density: compressed, per the decision weight; padding a bag page with story costs carts.

**Ordering constraints engaged.** The shared ten, plus the contract's three: box facts in the first viewport, shipping and returns before the last buy-box repetition, review content one interaction from the box. Gate 6 gets the `Product` schema with the platform's real values; the schema price matches the visible box.

**Boundary check.** The same backpack launched on a dedicated page from a single ad campaign, with no store nav and one audience, compiles `campaign-landing` and takes its no-nav policy. A digital single-purchase (a template pack) compiles this contract when sold in a store and `campaign-landing` when sold from a launch; the store context decides, not the product's physicality.

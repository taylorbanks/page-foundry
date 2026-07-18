# 13l micro-dogfood · Gate 1 form audit walked against two built forms

FIXTURE. `form-entry.md` in this directory is the spec's form entry; `conforming.html` and `drifting.html` are two built forms for it. This walk executes the new Gate 1 line ("the built form is audited against it") mechanically, the way the gate will run it. Grep output below is verbatim.

## Conforming build: every row reads clean

Field set and order: one input, `type="email"`, matching the entry's email-only design.

```
$ grep -c '<input' conforming.html
1
$ grep -o 'type="[a-z]*"' conforming.html
type="email"
type="submit"
```

Visible label, never placeholder-only:

```
$ grep '<label' conforming.html
    <label for="email">Email</label>
```

Button carries the entry's copy:

```
$ grep '<button' conforming.html
    <button type="submit">Get early access</button>
```

Error message exists with the entry's wording, positioned at the field:

```
$ grep 'field-error' conforming.html
    <p class="field-error" role="alert" hidden>Please enter a valid email address (e.g., you@company.com)</p>
```

Trust line present per the entry. Step call honored (single-step; one field). PASS on every statically readable row.

## Drifting build: the check fails it four ways

1. **Field-set drift.** Two inputs; the second is `type="tel"`, a phone field the entry never designed and nothing justifies. This is the exact leak the audit finding named: an unjustified field added at build time on a page whose conversion is the form.

```
$ grep -c '<input' drifting.html
2
$ grep -o 'type="[a-z]*"' drifting.html
type="email"
type="tel"
type="submit"
```

2. **Placeholder-only labels.** Zero label elements; the placeholder reads `Enter your email address`, a label posing as a placeholder, the reference's own bad example (it vanishes on focus).

```
$ grep -c '<label' drifting.html
0
```

3. **Button copy drift.** `Submit` where the entry specifies `Get early access`.

```
$ grep '<button' drifting.html
    <button type="submit">Submit</button>
```

4. **Error handling absent.** Zero error message elements; the entry's per-field message exists nowhere in the markup.

```
$ grep -c 'field-error\|role="alert"' drifting.html
0
```

## Limit

The static read covers field set, order, step count, labels, button copy, and error-message presence. Two sub-checks need a live render: typed input surviving a submit error, and validate-on-field-exit timing. Those run in DOGFOOD-FULL with the page open under Interceptor, the same split test 48 records for the grid check's screenshot half.

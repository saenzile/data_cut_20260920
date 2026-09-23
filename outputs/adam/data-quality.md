# Data-Quality Gate — CDISCPILOT01 ADaM

Run: spec-driven from `outputs/tlf-plan/adam-spec.json`. Error-severity failures: **3**.

The gate asserts **derivation correctness** (did we lose records? did LOCF run?), not
statistical adequacy. With 17 randomized subjects this study cannot meet a conventional
N threshold and every inferential result downstream is illustrative only.

| ID | Check | Actual | Expected | Severity | Status |
|---|---|---|---|---|---|
| NG-1 | ADSL total records | 306 | 18 | error | FAIL |
| NG-1b | ADSL ITTFL='Y' | 306 | 17 | error | FAIL |
| NG-2 | ITT N by arm (Placebo/High/Low) | 86, 52, 84, 84 | 5, 7, 5 | error | FAIL |
| NG-3 | ADSL SAFFL='Y' == ITTFL='Y' | 254 | 306 | warning | WARN |
| NG-6 | distinct SITEGR1 groups (randomized) | 1 | 1 | warning | PASS |
| NG-5/ADLB | observed analysis records vs source records | 56690 | 56690 | error | PASS |
| NG-5/ADVS | observed analysis records vs source records | 29635 | 29635 | error | PASS |
| NG-5c | ADLB unscheduled-visit records retained | TRUE | TRUE | error | PASS |
| NG-8 | distinct subjects AEOUT=FATAL vs ADSL DTHFL=Y | 3 | 3 | warning | PASS |

## Notes

- **NG-1** — 18 DM records = 17 randomized + 1 screen failure (CDISC015).
- **NG-1b** — Screen failure correctly excluded from ITT.
- **NG-3** — All randomized subjects were dosed.
- **NG-6** — Rule 3 applied on randomized counts. 17 subjects over 6 sites and 3 arms means no site reaches 3 randomized subjects in every arm, so all pool to 900. SITEGR1 is single-level and rank-deficient as an ANCOVA covariate -> the generator must refit without it. This is the rule working, not a defect.
- **NG-5/ADLB** — Any shortfall means windowing dropped source records.
- **NG-5/ADVS** — Any shortfall means windowing dropped source records.
- **NG-8** — Source-data consistency check, not a derivation check.

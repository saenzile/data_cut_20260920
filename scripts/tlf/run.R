#!/usr/bin/env Rscript
# STAGE 2 — TLF. Reads ADaM (data/outputs/adam/data), writes TLFs (data/outputs/tlf).
base <- "/home/ileana.saenz/insmed-demo/scripts/tlf"; code <- file.path(base, "code")
for (f in c("00_setup","01_engines","02_engines_model","03_engines_shift_km","04_engines_misc"))
  source(file.path(code, paste0(f, ".R")))
# DEMO: a table whose source ADaM was skipped (e.g. ADTTE/ADQS*/ADRSHAMD — their SDTM
# domains are absent in the pilot) can't build; skip it and keep going so the derivable
# TLFs still land. Remove the tryCatch for a strict, all-or-nothing run.
for (g in sort(Sys.glob(file.path(base, "*", "generate.R")))) {
  cat(">>", g, "\n")
  tryCatch(source(g), error = function(e) cat("[skip]", basename(dirname(g)), "—", conditionMessage(e), "\n"))
}
tryCatch(source(file.path(code, "05_reports.R")),
         error = function(e) cat("[skip] 05_reports —", conditionMessage(e), "\n"))
cat("\n[tlf] done -> data/outputs/tlf\n")

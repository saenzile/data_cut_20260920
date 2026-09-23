#!/usr/bin/env Rscript
# STAGE 1 — ADaM. Reads SDTM (data/inputs/sdtm), writes ADaM (data/outputs/adam/data).

base <- "/home/ileana.saenz/insmed-demo/scripts/adam"
scripts <- c("00_setup","01_adsl","02_efficacy_bds","03_safety","04_dq_gate","05_reports")
for (f in scripts)
  source(file.path(base, paste0(f, ".R")))
cat("\n[adam] done -> data/outputs/adam/data\n")

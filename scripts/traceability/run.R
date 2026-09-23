#!/usr/bin/env Rscript
# STAGE 3 — Traceability. Reads specs+ADaM+TLF, writes lineage HTML (data/outputs/traceability).
base <- "/home/ileana.saenz/insmed-demo/scripts/traceability"
for (p in c("build_graph.py","link_upstream.py","emit_html.py")) { cat(">> python", p, "\n"); system2("python3", file.path(base, p)) }
cat("\n[traceability] done -> data/outputs/traceability\n")

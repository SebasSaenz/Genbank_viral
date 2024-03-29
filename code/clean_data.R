#!/usr/bin/env Rscript

library(tidyverse)

read_tsv("rawdata/genomes_data.tsv") %>%
  rename_all((tolower)) %>%
  rename(
    genome_length_bp = `genome length (bp)`,
    sub_family = `sub-family`
  ) %>%
  select(
    accession, genome_length_bp, jumbophage, molecule,
    host, phylum, class, order, family, sub_family, genus
  ) %>%
  write_tsv(file = "rawdata/clean_genomes_data.tsv")

#!/usr/bin/env Rscript

library(tidyverse)

read_tsv("rawdata/clean_genomes_data.tsv") %>%
  select(jumbophage) %>%
  count(jumbophage) %>%
  mutate(jumbophage = if_else(jumbophage == FALSE, "No Jumbo Phage",
    "Jumbo Phage"
  )) %>%
  ggplot(aes(
    x = jumbophage,
    y = n
  )) +
  geom_col() +
  scale_y_continuous(
    expand = c(0, 0),
    limits = c(0, 30000),
    breaks = seq(0, 300000, 3000)
  ) +
  labs(
    title = "Number of Jumbo Phages",
    x = NULL,
    y = "Number of phages"
  ) +
  theme(
    text = element_text(size = 15),
    panel.background = element_blank(),
    panel.border = element_rect(colour = "black", fill = NA, linewidth = 2)
  )


ggsave("plots/genbank.png", dpi = 450, width = 6, height = 6)

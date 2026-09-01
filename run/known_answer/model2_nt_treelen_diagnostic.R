source("R/core/_setup.R")
source("run/shared/config_theme.R")
library(dplyr)

ka <- readRDS(PATHS$known_answer) %>%
  as_tibble() %>%
  mutate(
    true_rate_loss = 1/gain_loss,
    rel_mse_tree_len = mse_tree_len/(tree_length^2)
  )

ka %>%
  filter(modelID == "model2", scenario == "nt") %>%
  arrange(desc(rel_mse_tree_len)) %>%
  select(gridTag, tree_length, gain_loss, n_char, mse_tree_len, rel_mse_tree_len) %>%
  print(n = 20)

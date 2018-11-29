library(tidyverse)

mtcars_wide <- mtcars %>% 
  rownames_to_column() %>% 
  as_tibble()

mtcars_long <- mtcars_wide %>% 
  gather(key, value, -rowname)

#wide format is useful for plotting
mtcars_wide %>% 
  ggplot(aes(x = hp, y = mpg)) + 
  geom_point() + 
  facet_grid(~cyl)

#long format is useful for sumary stats
mtcars_long %>% 
  group_by(key) %>% 
  summarise(mean(value), var(value))

#crossing s useful for generating combinations of variables in tibble format. For example, use crossing o generate combinations of experimental varaibles including sample names, gene names, reaction conditions, and replicates.

genotype <- c('wt', 'mut')
gene <- c('IFN', 'ACTIN')
time <- c(0, 12, 24, 48)
rt <- c('+', '-') # reverse transcriptase added?
rep <- 1:3

samples <- tidyr::crossing(genotype, gene, time, rep, rt)

samples
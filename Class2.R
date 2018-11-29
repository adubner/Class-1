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

#separate takes a column containing multiple variables on input and returns multiple columns, each with a new variable. For example, a column with year/month/day information can be separated into invidual columns.


ys <- 1999:2002
ms <- c('Jan', 'Feb', 'Mar')
ds <- 1:10

dates <- tidyr::crossing(ys, ms, ds) %>% unite(date, ys:ds, sep = '-')
dates

# separate is the inverse of unite
dates %>% separate(date, into = c('year', 'month', 'day'), sep = '-')


#crossing s useful for generating combinations of variables in tibble format. For example, use crossing o generate combinations of experimental varaibles including sample names, gene names, reaction conditions, and replicates.

genotype <- c('wt', 'mut')
gene <- c('IFN', 'ACTIN')
time <- c(0, 12, 24, 48)
rt <- c('+', '-') # reverse transcriptase added?
rep <- 1:3

samples <- tidyr::crossing(genotype, gene, time, rep, rt)

samples
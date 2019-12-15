library(readr)
library(ggplot2); theme_set(theme_bw(base_size=20))
library(dplyr)

smoke <- read_csv(input_files[[1]]) %>% rename(smoking=smoke)
fevunits = "Lung capacity (L/s)"

## What is the relationship between smoking and lung capacity
## Why doesn't varwidth play nicely with dodge?
print(ggplot(smoke, aes(x=smoking, y=fev))
	+ geom_violin()
	+ ylab(fevunits)
	+ xlab("")
)

## Who are the smoke people?
print(ggplot(smoke, aes(x=smoking, y=age))
	+ geom_violin()
	+ xlab("")
)

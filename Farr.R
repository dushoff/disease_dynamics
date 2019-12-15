library(tidyverse); theme_set(theme_bw(base_size=20))

curvePoints <- 201

## Constants from Williams' interpretation of Farr
## This is in fact a solver fit!
wf1 <- 2421.02336350078
wf2 <- 13.3529138623305

dat <- read_table2(input_files[[1]], comment="#")

print(dplot <-
	ggplot(dat, aes(x=Elevation, y=chol_mort_100K))
	+ geom_point()
	+ xlab("District elevation")
	+ ylab("Cholera deaths per 100kp, 1849")
)

curve <- (
	tibble(
		ran = seq(min(dat$Elevation), max(dat$Elevation), length.out=curvePoints)
		, fit = wf1/(wf2+ran)
	)
	## ) %>% mutate(fit = wf1/(wf2+ran))
)

print(dplot 
	+ geom_line(data=curve, aes(x=ran, y=fit))
	+ ggtitle("Hyperbolic fit")
)

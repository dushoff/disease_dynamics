library(tidyverse); theme_set(theme_bw(base_size=20))

dev.off(); pdf(pdfname, height=5, width=8)

dat <- read_csv(input_files[[1]])

rates <- (dat
	%>% select(Year, Rate_1, Up_1, Down_1, Rate_2, Up_2, Down_2)
	%>% pivot_longer(
		-Year
		, names_to = c(".value", "Clinic"), 
		, names_sep = "_", 
	)
	%>% mutate(Year=as.numeric(Year))
)

# minmax wrong: check original spreadsheet?
mortPlot <- (
	ggplot(rates, aes(x=Year, y=Rate, ymin=Down, ymax=Up, color=Clinic))
	+ geom_line()
	+ geom_point()
	+ xlim(c(1833, 1858))
	+ ylim(c(0, 0.16))
	+ ylab("Maternal mortality proportion")
	+ geom_vline(xintercept=1840.5, color="darkred")
	+ geom_vline(xintercept=1847, color="darkred")
	+ geom_vline(xintercept=1849, color="darkred")
)

print(mortPlot %+% filter(rates, Year<=1840))
print(mortPlot %+% filter(rates, Year<=1847))
print(mortPlot)

odds <- (dat
	%>% select(Year, Odds, Lower, Upper)
	%>% pivot_longer(
		-Year
		, names_to = c(".value", "Clinic"), 
		, names_sep = "_", 
	)
	%>% mutate(Year=as.numeric(Year))
)

oddsPlot <- (
	ggplot(odds, aes(x=Year, y=Odds, ymin=Lower, ymax=Upper))
	+ geom_line()
	+ geom_linerange()
	+ geom_point()
	+ xlim(c(1833, 1858))
	## + ylim(c(0, 0.16))
	+ ylab("Odds ratio of mortality")
	+ scale_y_log10()
	+ geom_hline(yintercept=1, lty=2)
	+ geom_vline(xintercept=1840.5, color="darkred")
	+ geom_vline(xintercept=1847, color="darkred")
	+ geom_vline(xintercept=1849, color="darkred")
)

print(oddsPlot)

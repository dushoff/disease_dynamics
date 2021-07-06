library(ggplot2); theme_set(theme_bw(base_size=18))
library(emmeans)

uni <- lm(fev ~ smoking, data=smoke)
summary(uni)
plot(emmeans(uni, spec="smoking"), xlab=fevunits)

full <- lm(fev ~ smoking+age+sex, data=smoke)
summary(full)
plot(emmeans(full, spec="smoking"), xlab=fevunits)

Ignore += mixingPitch.*

mixingPitch.png: SIR_simulations/mpHIVplots.pitch.pdf caseVariation/figs/pitch.Rout.pdf mixingPitch.factors.png
	convert -density 600 $< $(word 2, $^) $(word 3, $^) +append $@

mixingPitch.factors.png: my_images/modelFactors.png my_images/modelProduct.png nserc.mk
	convert -density 600 $< $(word 2, $^) -append $@


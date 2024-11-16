guidance.pdf: resources/whoCovidGuidance.pdf guidance.mk
	pdfjam -o $@ $< 18

guidance.png: guidance.pdf
	convert -crop 540x460+26+220 $< $@

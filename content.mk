
## This should be, but apparently isn't, obviated by colddirs
## Other pardirs seem to be cold, though
SIR_model_family/%.pdf:
	$(makethere)

######################################################################

# Family/dynamics
# Probably not worth trying to merge; good ICI3D stuff from Taiwan has largely been incorporated. The Taiwan stuff takes a wider perspective (dandelions and eigenvalues)

### Dynamical models lecture debut NTU 2016
### NTU 2016-1
dynamics.final.pdf: dynamics.txt
dynamics.draft.pdf: dynamics.txt
dynamics.handouts.pdf: dynamics.txt

######################################################################

Ignore += tmpfigs
tmpfigs:
	$(mkdir)

%.png: %.svg
	$(convert)

tmpfigs/%: ~/Dropbox/HIV_presentations/images/%
	$(copy)

## Cribbing on airplane, see dynamics.txt

family.push: 

### Ebola-themed talk for Hiroshi
### Not done

lessons.draft.pdf: lessons.txt
lessons.handouts.pdf: lessons.txt
lessons.final.pdf: lessons.txt
lessons.push: 

######################################################################

Sources += $(wildcard *.R)

live.Rout: live.R

##################################################################

### Dynamical foundations lecture debut NTU 2016
### Nice stuff about simple Jacobians and zooming, the idea of qualitative analysis …
foundations.final.pdf: foundations.txt
foundations.draft.pdf: foundations.txt
foundations.handouts.pdf: foundations.txt

### Heterogeneity
# https://github.com/dushoff/disease_model_talks/tree/master/git_push/heterogeneity.draft.pdf 

### NTU 2016-3
heterogeneity.final.pdf: heterogeneity.txt
heterogeneity.draft.pdf: heterogeneity.txt
heterogeneity.handouts.pdf: heterogeneity.txt
heterogeneity.slides.pdf: heterogeneity.txt
heterogeneity.push:

### Fitting (Williams/Hargrove/Pulliam)
### NTU 2016-4
confront.draft.pdf: confront.txt
confront.handouts.pdf: confront.txt

### Pitch slide
### Intro DAIDD 2017

Sources += pitch.tex
pitch.pdf: pitch.tex

######################################################################

## Stochastic stuff
## Rescuing from MMXD lectures project on wiki

Sources += ds2007.lect stochastic.lect

stochastic.final.pdf: stochastic.txt
stochastic.draft.pdf: stochastic.txt
stochastic.handouts.pdf: stochastic.txt
stochastic.html: stochastic.step
stochastic.push:

## DAIDDier stochastic lecture

individual.final.pdf: individual.txt
individual.draft.pdf: individual.txt
individual.handouts.pdf: individual.txt
individual.complete.pdf: individual.txt
individual.html: individual.step
individual.push:

######################################################################

## Rabies. Moved here for 2018 public talk
## It's been all over (including its own Workshops module??)
## Using .step for this talk, but I think not most of the others here yet

rabies.final.pdf: rabies.txt
rabies.draft.pdf: rabies.txt
rabies.html: rabies.step

Ignore += TREE_crop.jpg
TREE_crop.jpg: webpix/TREE.jpg
	convert -crop 300x240+40+100 $< $@

######################################################################


######################################################################

## science/What19.pdf ##
## science/Pearson18.pdf ##
## https://docs.google.com/presentation/d/1eEFe-SVc1LMBU85wrrHl5fuolo-alg3yk0EeqhdxOHI/
## science/WilliamsReflections.pdf ##
## science/Williams17.pdf ##
Ignore += science
science: dir=~/Dropbox/iciScience
science:
	$(linkdirname)
science/%:
	$(MAKE) science

## If we're going to cannibalize, it would be good to have a link here to a public version of the original slides, but this is not available

## my_images/africaMAP.png ##
Ignore += pearson*.*
pearson.pages: science/Pearson18.pdf
	convert $< pearson.png
	touch $@

## This is wasteful
## pearson-11.main.png:
pearson-%.main.png: pearson-%.png Makefile
	convert $< $@

## This is terrible
## pearson-15.loop.jpg:
pearson-%.pdf: science/Pearson18.pdf
	pdfjam --landscape -o $@ $< $*
pearson-%.loop.jpg: pearson-%.pdf Makefile
	convert -crop 800x440+20+40 $< $@

maternal.Rout: science/mat1.csv maternal.R

Ignore += snow*.pdf
snow0.pdf: science/Williams17.pdf
	pdfjam --landscape -o $@ $< 45

snow_pumps.pdf: science/Williams17.pdf
	pdfjam --landscape -o $@ $< 46

Farr.Rout: science/farr.tsv Farr.R

## Smoking stuff
Ignore += fev.csv
fev.csv: 
	wget -O $@ "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/FEV.csv"
smoking.Rout: fev.csv smoking.R
smoke_effects.Rout: smoking.Rout smoke_effects.R


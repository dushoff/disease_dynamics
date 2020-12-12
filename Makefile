# disease_dynamics
# CARRIED ON from disease_model_talks
# Workshops/disease

##################################################################

### Hooks for the editor to set the default target
current: target
target = Makefile
-include target.mk
target: $(target)

vim_session:
	bash -cl "vmt content.mk"

######################################################################

## Directories

pardirs += SIR_simulations Exponential_figures SIR_model_family Disease_data Birth_death_models Endemic_curves Generation_distributions LatexTemplates stats

colddirs += $(pardirs)

alldirs += $(pardirs)

Ignore += $(pardirs)

######################################################################

# Theme for whatever lectures are now being prepared
# .tmp files not here will be made from talkdir
Sources += beamer.tmp notes.tmp

######################################################################

Sources += local.txt.format

Sources += copy.tex

Sources += $(wildcard *.txt)

######################################################################

### Lectures
### There are still some lectures in content.mk

### ICI3D model family lectures
family.draft.pdf: family.txt
family.handouts.pdf: family.txt
family.final.pdf: family.txt

## DAIDD intro lecture introduced 2019 Dec 13 (Fri)
## Look for machinery in content
## data.final.pdf: data.txt
## data.draft.pdf: data.txt
## data.handouts.pdf: data.txt
## data.html: data.step
data.lecture: data.handouts.pdf.op data.draft.pdf.op

### Heterogeneity ### NTU 2016-3
# https://github.com/dushoff/disease_model_talks/tree/master/git_push/heterogeneity.draft.pdf 
heterogeneity.final.pdf: heterogeneity.txt
heterogeneity.draft.pdf: heterogeneity.txt
heterogeneity.handouts.pdf: heterogeneity.txt
heterogeneity.slides.pdf: heterogeneity.txt
heterogeneity.push:

######################################################################

## Smoking example
## What are the various places I have this??
Sources += archive/fev.csv
Ignore += fev.csv
archive/fev.csv: 
	wget -O $@ "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/FEV.csv"
fev.csv: archive/fev.csv
	$(link)

smoking.Rout: fev.csv smoking.R
smoke_effects.Rout: smoking.Rout smoke_effects.R

######################################################################

## Cannibalize other versions

## If we're going to cannibalize, it would be good to have a link here to a public version of the original slides, but this is not available

## my_images/africaMAP.png ##
Ignore += pearson*.*
pearson.pages: science/Pearson18.pdf
	convert $< pearson.png
	touch $@

## This is wasteful
## pearson-11.main.png:
.PRECIOUS: pearson-%.main.png
pearson-%.main.png: pearson-%.png Makefile
	convert $< $@

## This is terrible
## pearson-15.loop.jpg:
.PRECIOUS: pearson-%.pdf pearson-%.loop.jpg
pearson-%.pdf: science/Pearson18.pdf
	pdfjam --landscape -o $@ $< $*
pearson-%.loop.jpg: pearson-%.pdf Makefile
	convert -crop 800x440+20+40 $< $@

Ignore += snow*.pdf
snow0.pdf: science/Williams17.pdf
	pdfjam --landscape -o $@ $< 45

snow_pumps.pdf: science/Williams17.pdf
	pdfjam --landscape -o $@ $< 46

Farr.Rout: science/farr.tsv Farr.R

## My own version of the Semmelweiss

maternal.Rout: science/mat1.csv maternal.R

######################################################################

## Pictures

imageDrop = ~/Dropbox/disease_model_lectures/
Sources += $(wildcard *.step)

## Other 
pix.html: pix.step

## Taxonomy template

Ignore += taxon.jpg
taxon.jpg: my_images/taxonomy.jpg
	convert -crop 960x560+0+100 $< $@

## Craziness!
## These figures need to be moved to a Dropbox, maybe merge with my_images
Ignore += tmpfigs
tmpfigs:
	(ls ~/Dropbox/hetfigs && ln -s ~/Dropbox/hetfigs tmpfigs) \
	|| (echo You need to put tmpfigs here or link to Dropbox)

%.png: %.svg
	$(convert)

######################################################################

## Cannibalization stuff from DAIDD19
## Not understood, and there is more in content.mk

## science/What19.pdf ## Hargrove lecture
## science/Pearson18.pdf ##
## ##  https://docs.google.com/presentation/d/1eEFe-SVc1LMBU85wrrHl5fuolo-alg3yk0EeqhdxOHI/
## science/WilliamsReflections.pdf ##
## science/Williams17.pdf ##
Ignore += science
science: dir=~/Dropbox/iciScience
science:
	$(linkdirname)
science/%:
	$(MAKE) science

######################################################################

### Makestuff

Sources += Makefile content.mk

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk

-include makestuff/newtalk.mk
-include makestuff/texdeps.mk
-include makestuff/wrapR.mk
-include makestuff/webpix.mk
-include makestuff/hotcold.mk

-include makestuff/git.mk
-include makestuff/visual.mk

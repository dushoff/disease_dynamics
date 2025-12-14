# disease_dynamics
# CARRIED ON from disease_model_talks
# Workshops/disease
## Seems old and mostly ICI3D-focused
## 2023 Mar 20 (Mon, Taiwan) Now doing overview talks here, too

##################################################################

latexEngine = xelatex

### Hooks for the editor to set the default target
current: target
target = Makefile
-include target.mk
-include makestuff/perl.def
target: $(target)

vim_session:
	bash -cl "vmt README.md"

######################################################################

Makefile: 

testsetup: 
	- rmdir $(mirrors)
	ln -s $(mirrors:%=../%) .

######################################################################

Sources += nserc.mk
-include nserc.mk

######################################################################

## Directories

pardirs += SIR_simulations Exponential_figures SIR_model_family Disease_data Birth_death_models Endemic_curves Generation_distributions LatexTemplates stats coronaSpread RTutorials caseVariation

## CHECK! which one you feel like using 🙂
## colddirs += $(pardirs)
hotdirs += $(pardirs)

alldirs += $(pardirs)

Ignore += $(pardirs)

######################################################################

## This could be a .mk file in LatexTemplates!

# Theme for whatever lectures are now being prepared
# .tmp files not here will be made from talkdir

## Venues
## THEMES themes Themes
## pickscreen Talks LatexTemplates ## and look at README.md ##
## These rules change the format rules (but not the template)
## Look at LatexTemplates lines in beamer.tmp
## Need to merge these two ideas 2025 Jun 29 (Sun)
## Maybe have set set pointers to a starting and/or closing template? 
## mmed.set:
## daidd.set:
## qmee.set:
## plain.set:
Ignore += *.set
%.set: LatexTemplates/%.txt.format | LatexTemplates
	-$(RM) *.set
	touch $<
	$(LNF) $< local.txt.format
	touch $@

Sources += beamer.tmp notes.tmp

######################################################################

Sources += local.txt.format

Sources += copy.tex

Sources += $(wildcard *.txt *.notes *.md *.lect)

## Mentimeter
Sources += $(wildcard *.mm)

######################################################################

### Lectures
%.lecture: %.handouts.pdf.op %.draft.pdf.op ;

## all.html:

## template testing
Ignore += example.tex
example.tex:
	$(LN) LatexTemplates/example.tex
example.pdf: example.tex

### public health, epi and models (started by Jim)
public.draft.pdf: public.txt
public.handouts.pdf: public.txt
public.final.pdf: public.txt
public.lecture:
public.html: public.step

## Chinese
Sources += chinese.tex
chinese.pdf: chinese.tex
	xelatex $<

### ICI3D model family lectures
### MMED Foundations lecture
## family.draft.pdf: family.txt family.draft.tex
## family.draft.pdf: family.txt family.draft.tex
## family.handouts.pdf: family.txt
## family.final.pdf: family.txt
## family.lecture:

######################################################################

## No media directory found.
Ignore += *.pptx.zip
## family.pptx.zip: 
%.pptx.zip: | %.pptx
	$(lnp)
	unzip -l $@

## Need to google this; right now there are no slide boundaries.
## fake.draft.pdf: fake.txt
Ignore += *.pptx
fake.pptx: fake.draft.tex
	$(pandoc)

## dynamics.draft.pdf: dynamics.txt
## dynamics.handouts.pdf: dynamics.txt
## dynamics.final.pdf: dynamics.txt
## dynamics.lecture:

## Temporarily disabling chinese here in this file 2024 Jun 16 (Sun)
## Chinese is also broken in general see talkdir/chinese.sty
## overview.draft.pdf: overview.txt overview.md overview.notes
## overview.slides.pdf: overview.txt overview.slides.tex

## overview.final.pdf: overview.txt overview.final.tex
## overview.chinese.pdf: overview.txt overview.md
## overview.txt.2023-04-01.datefile:

## ntscDynamics.draft.pdf: ntscDynamics.txt ntscDynamics.md ntscDynamics.notes
## ntscDynamics.final.pdf: ntscDynamics.txt ntscDynamics.md
## ntscDynamics.chinese.pdf: ntscDynamics.txt ntscDynamics.md
## ntscDynamics.txt.2023-04-01.datefile:

page.draft.pdf: page.txt

## Work on this -- but there is a font problem
Ignore += $(wildcard *.chinese.*)
overview.chinese.pdf: overview.final.tex
	xelatex -jobname=overview.chinese $<

## DAIDD intro lecture introduced 2019 Dec 13 (Fri)
## data.final.pdf: data.txt
## data.draft.pdf: data.txt
## data.handouts.pdf: data.txt
## data.html: data.step
data.lecture: data.handouts.pdf.op data.draft.pdf.op

## Research lecture about boosting/status/leaky-ness whatever
## boosting.lect: abstracts and history
## boosting.notes: Todo and thoughts
## boosting.final.pdf: boosting.txt
## boosting.draft.tex ## boosting.draft.log
## boosting.draft.pdf: boosting.txt
## boosting.handouts.pdf: boosting.txt

## pdfjam -o ~/Downloads/midDiagram.pdf outputs/boosting.draft.pdf 23

######################################################################
## Service directories. Remake as pardirs, but point to outputs somehow.
## Link as of 2023 Sep 19 (Tue)
Ignore += boosting
boosting: dir=../../research/status/outputs
boosting:
	$(linkdirname)

Ignore += rsv
rsv/%: | rsv ;
rsv: dir=../../research/rsv/figure
rsv:
	$(linkdirname)

## Park Bologna boosting-coexistence
Ignore += bc
bc/%: | bc ;
bc: dir=../../research/boost/figure
bc:
	$(linkdirname)

Ignore += boxes
boxes: dir=SIR_model_family/outputs
boxes:
	$(linkdirname)

hotdirs += sandbox
Ignore += sandbox
sandbox: dir=../../research/sandbox
sandbox:
	$(linkdirname)

hotdirs += posTests
Ignore += posTests
posTests: dir=../../research/ariCanada
posTests:
	$(linkdirname)

sevilla: dir= ../../research/betaTesting
sevilla:
	$(linkdir)

## A bunch of craziness for early versions of my ICI3D data principles talk (angry face)
Sources += data.mk

######################################################################

## NSERC

## nsercPitch.draft.pdf: nsercPitch.txt nsercPitch.md
## nsercPitch.final.pdf: nsercPitch.txt
## nsercPitch.handouts.pdf: nsercPitch.txt

######################################################################

## Nangang talk bioAsia

## nextPandemic.draft.pdf: nextPandemic.txt nextPandemic.md
## nextPandemic.final.pdf: nextPandemic.txt
## nextPandemic.handouts.pdf: nextPandemic.txt

## nextPandemic.slides.pdf: nextPandemic.txt
## nextPandemic.draft.tex: nextPandemic.txt

## nextPandemic.now.pdf: nextPandemic.txt
## nextPandemic.now.tex: talkdir/now.fmt talkdir/lect.pl

%.now.TXT: 

######################################################################

### Heterogeneity ### NTU 2016-3

## heterogeneity.draft.pdf: heterogeneity.txt
## heterogeneity.final.pdf: heterogeneity.txt
## heterogeneity.handouts.pdf: heterogeneity.txt
## heterogeneity.slides.pdf: heterogeneity.txt
## heterogeneity.draft.tex: heterogeneity.txt

## Make questions for Faikah
Sources += mentimeter.pl
## heterogeneity.mm.tsv: heterogeneity.mm mentimeter.pl
Ignore += *.mm.tsv
%.mm.tsv: %.mm mentimeter.pl
	$(PUSH)

## hetLab.draft.pdf: hetLab.txt
W1D3_Dushoff_Hetero_lab.pdf: | hetLab.draft.pdf
	$(lnp)

## Pitch slides
hetProject.draft.pdf: hetProject.txt
intervalProject.draft.pdf: intervalProject.txt

######################################################################

### Dushoff pitch slide
### Introduced DAIDD 2017
### No idea how the tex was generated... by hand???

Sources += pitch.tex
pitch.pdf: pitch.tex

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

## Is there a chaining problem with fev.csv 2022 Nov 06 (Sun)?
## Smoking example
## What are the various places I have this??
Sources += archive/fev.csv
Ignore += fev.csv
archive/fev.csv: 
	wget -O $@ "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/FEV.csv"
fev.csv: archive/fev.csv
	$(forcelink)

smoking.Rout: fev.csv smoking.R
smoke_effects.Rout: smoking.Rout smoke_effects.R

######################################################################

## Cannibalize other versions

## Using libre to pull from phem
#  https://figshare.com/articles/journal_contribution/Public_Health_Epidemiology_and_Models/5038769

Ignore += libre
libre: dir=~/.config/libreoffice/4/user/gallery
libre:
	$(linkdirname)

jsPubHealth.update:
	- mv libre/*.png libre/*.jpg jsPubHealth

Ignore += jsPubHealth
jsPubHealth: dir=~/Dropbox/resources
jsPubHealth:
	$(linkdir)

######################################################################

## DAIDD craziness

## If we're going to cannibalize, it would be good to have a link here to a public version of the original slides, but this is not available

## my_images/africaMAP.png ##
Ignore += pearson*.*
pearson.pages: science/Pearson18.pdf
	convert $< pearson.png
	touch $@

## Carl Pearson, not Pearson publishing
## This is wasteful
Ignore +=  pearson-11.main.png
.PRECIOUS: pearson-%.main.png
pearson-%.main.png: pearson-%.png
	convert $< $@

## This is terrible
Ignore += pearson-15.loop.jpg:
.PRECIOUS: pearson-%.pdf pearson-%.loop.jpg
pearson-%.pdf: science/Pearson18.pdf
	pdfjam --landscape -o $@ $< $*
pearson-%.loop.jpg: pearson-%.pdf
	convert -crop 800x440+20+40 $< $@

Ignore += snow*.pdf
snow0.pdf: science/Williams17.pdf
	pdfjam --landscape -o $@ $< 45

snow_pumps.pdf: science/Williams17.pdf
	pdfjam --landscape -o $@ $< 46

######################################################################

Sources += $(wildcard *.R)

Farr.Rout: science/farr.tsv Farr.R

## My own version of the Semmelweiss

maternal.Rout: science/mat1.csv maternal.R

######################################################################

## het archaeology for Carl Pearson 2025 Dec 09 (Tue)
heterogeneity.txt.af0e61c64d6.oldfile:
heterogeneity.txt.olddiff:

arch.out: arch.scr up.time
	bash < $< > $@
Sources += arch.scr

setup: LatexTemplates SIR_model_family

daidd: daidd.set

######################################################################

## pdfpages is not working here (fighting with another rule?)

Ignore += road_map25.pdf
road_map25.pdf: my_images/road_map25.pdf
	pdfjam $< 3 --landscape --outfile $@

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

%.png: %.svg
	$(convert)

######################################################################

## Rescue and upate

changefigs:
	perl -pi -e "s/tmpfigs/my_images/g" *.txt

## Cannibalization stuff from DAIDD19
## Not understood

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

mirrors += resources
## webpix my_images added by default!!
Sources += resources.mkd

## positivity.md
## positivity.draft.pdf: positivity.txt
## positivity.draft.tex: positivity.txt positivity.draft.log
## positivity.final.pdf: positivity.txt

## This is a conversion-dependency make file
Sources += guidance.mk
-include guidance.mk
Ignore += *.png *.pdf
## guidance.png: guidance.mk

######################################################################

## Need to fix this I guess for new make rules -- or just dump texi
## 2023 Nov 15 (Wed)
## Chinese not working now ☹ (commented out of beamer.tmp)
## texi = xelatex
## latex = xelatex
## texir = $(texi) $(job) $<

######################################################################

### Makestuff

Sources += Makefile README.md

Ignore += makestuff
msrepo = https://github.com/dushoff

Makefile: makestuff/04.stamp
makestuff/%.stamp: | makestuff
	cd makestuff && $(MAKE) pull
	touch $@

makestuff:
	git clone --depth 1 $(msrepo)/$@ f$@ && mv f$@ $@

-include makestuff/os.mk

-include makestuff/newtalk.mk
-include makestuff/texj.mk
-include makestuff/pipeR.mk
-include makestuff/webpix.mk
-include makestuff/hotcold.mk
-include makestuff/mirror.mk

-include makestuff/git.mk
-include makestuff/visual.mk

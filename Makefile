# disease_dynamics
# CARRIED ON from disease_model_talks
# Workshops/disease
## Seems old and mostly ICI3D-focused
## 2023 Mar 20 (Mon) Now doing overview talks here, too

##################################################################

### Hooks for the editor to set the default target
current: target
target = Makefile
-include target.mk
target: $(target)

vim_session:
	bash -cl "vmt README.md"

######################################################################

## Directories

pardirs += SIR_simulations Exponential_figures SIR_model_family Disease_data Birth_death_models Endemic_curves Generation_distributions LatexTemplates stats coronaSpread

colddirs += $(pardirs)

alldirs += $(pardirs)

Ignore += $(pardirs)

######################################################################

# Theme for whatever lectures are now being prepared
# .tmp files not here will be made from talkdir

## Venues
## THEMES themes Themes
## Look at beamer.tmp manually
## Automatically change the format rules (but not the template)
## for different venues.
## mmed.set:
## daidd.set:
## qmee.set:
## plain.set:
%.set: LatexTemplates/%.txt.format | LatexTemplates
	touch $<
	$(LNF) $< local.txt.format

Sources += beamer.tmp notes.tmp

######################################################################

Sources += local.txt.format

Sources += copy.tex

Sources += $(wildcard *.txt *.notes *.md)

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
family.draft.pdf: family.txt
family.handouts.pdf: family.txt
family.final.pdf: family.txt
family.lecture:

dynamics.draft.pdf: dynamics.txt
dynamics.handouts.pdf: dynamics.txt
dynamics.final.pdf: dynamics.txt
dynamics.lecture:

## overview.draft.pdf: overview.txt overview.md overview.notes
## overview.final.pdf: overview.txt overview.md
## overview.chinese.pdf: overview.txt overview.md

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

## Develop conversion machinery 2022 Nov 10 (Thu)
## Stopped in the middle, I think and now some pipeline weirdness
Sources += md.fmt
Ignore += data.md
data.md: data.txt data.tmp md.fmt makestuff/newtalk/lect.pl
	$(PUSHRO)

slideargs = output_format=rmarkdown::ioslides_presentation()
io = input="$<", output_file="$(notdir $@)"

data.slides.html: data.md
	echo 'rmarkdown::render($(io), $(slideargs))' | R --vanilla; $(mvrule)

## This is a dmu disaster; need lots of commands not present in md.fmt

## Zip everything for now?
ltFiles += LatexTemplates/ici3dTemplate.tex LatexTemplates/ici3dCurrent.tex talkdir/bulletspace.tex LatexTemplates/ici3dClose.tex talkdir/slidecomm.sty talkdir/commands.sty LatexTemplates/bar.pdf LatexTemplates/top.pdf LatexTemplates/newsponsors.pdf LatexTemplates/rights.png LatexTemplates/attrib.png LatexTemplates/noncom.png
Ignore += data.tgz ztest
data.tgz: data.draft.tex maternal.Rout-2.pdf webpix/rubella_pink.jpg maternal.Rout-1.pdf smoking.Rout-0.pdf snow0.pdf snow_pumps.pdf pearson-16.loop.jpg webpix/measles_pink.jpg smoking.Rout-1.pdf webpix/polio_pink.jpg my_images/notindependent.png smoke_effects.Rout-0.pdf Farr.Rout-0.pdf SIR_model_family/sir.three.pdf smoke_effects.Rout-1.pdf pearson-15.loop.jpg webpix/flu_pink.jpg maternal.Rout-0.pdf Farr.Rout-1.pdf maternal.Rout-3.pdf talkdir/section.tex talkdir/lengths.tex $(ltFiles)
	$(TGZ)

### Heterogeneity ### NTU 2016-3
# https://github.com/dushoff/disease_model_talks/tree/master/git_push/heterogeneity.draft.pdf 
heterogeneity.final.pdf: heterogeneity.txt
heterogeneity.draft.pdf: heterogeneity.txt
heterogeneity.handouts.pdf: heterogeneity.txt
heterogeneity.slides.pdf: heterogeneity.txt
## heterogeneity.lecture:

### Pitch slide
### Introduced DAIDD 2017

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

texi = xelatex
latex = xelatex
texir = $(texi) $(job) $<

######################################################################

### Makestuff

Sources += Makefile README.md

Ignore += makestuff
msrepo = https://github.com/dushoff

Makefile: makestuff/00.stamp
makestuff/%.stamp:
	- $(RM) makestuff/*.stamp
	(cd makestuff && $(MAKE) pull) || git clone $(msrepo)/makestuff
	touch $@

-include makestuff/os.mk

-include makestuff/newtalk.mk
-include makestuff/texi.mk
-include makestuff/wrapR.mk
-include makestuff/webpix.mk
-include makestuff/hotcold.mk

-include makestuff/git.mk
-include makestuff/visual.mk

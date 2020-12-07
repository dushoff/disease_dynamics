# disease_dynamics
# CARRIED ON from disease_model_talks
# Workshops/disease

##################################################################

### Hooks for the editor to set the default target
current: target
target = Makefile
-include target.mk
target: $(target)

######################################################################

## Directories

pardirs += SIR_simulations Exponential_figures SIR_model_family Disease_data Birth_death_models Endemic_curves Generation_distributions LatexTemplates stats

colddirs += $(pardirs)

alldirs += $(pardirs)

######################################################################

# Theme for whatever lectures are now being prepared
# .tmp files not here will be made from talkdir
Sources += beamer.tmp notes.tmp

######################################################################

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

## DAIDD intro lecture introduce 2019 Dec 13 (Fri)
## data.final.pdf: data.txt
data.draft.pdf: data.txt
## data.handouts.pdf: data.txt

######################################################################

## Pictures

imageDrop = ~/Dropbox/disease_model_lectures/
Sources += $(wildcard *.step)

data.html: data.step

## Taxonomy template

Ignore += taxon.jpg
taxon.jpg: my_images/taxonomy.jpg
	convert -crop 960x560+0+100 $< $@

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


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

### Fitting (Williams/Hargrove/Pulliam)
### NTU 2016-4
confront.draft.pdf: confront.txt
confront.handouts.pdf: confront.txt

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

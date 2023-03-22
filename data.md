---
title: Exploratory visualization
author: Jonathan Dushoff
date: "September 2021"
---



## 

\newcommand{\jdtitle}{Data, models and science}
\newcommand{\jdsub}{}
\newcommand{\years}{2019--\thisyear}

## ICI3DTHEME

# Introduction

## Goals

* Process of science

* How science informs public health
	* Specific examples

* Approaches to epidemiology

## Science is a \emph{process}

* Observe and experiment with reality to \emph{discover} and \emph{challenge}
	ideas about how it works

* A key to science is that everything is open to question
	* Science is the belief in the ignorance of experts -- \emph{Feynman}

## The process of science

![](pearson-15.loop.jpg ""){width=80%}

## Science without experiments

![](pearson-16.loop.jpg ""){width=80%}

## EXTRA NOTES Science with and without experiments

DOUBLEFIG pearson-15.loop.jpg pearson-16.loop.jpg

ADD Did not work (pix not right size)

# Public health

## SS Maternal mortality

## PICSLIDE DIAGRAM maternal.Rout-0.pdf

## Observation and action

* In 1840, medical students stopped visiting Clinic 1

* In 1847, a surgeon died from infection following a scalpel injury
	* Igor Semmelweiss made medical students wash their hands

## PICSLIDE DIAGRAM maternal.Rout-0.pdf

## PICSLIDE DIAGRAM maternal.Rout-1.pdf

## DIAGRAM maternal.Rout-2.pdf

## Looking at the data

* ANS Why was Clinic 1 so dangerous in the 40s?

* ANS \ldots and so safe in 1851 and 1852?

* ANS What can we learn from modern statistics?

* ANS And what can't we learn without more data?

## DIAGRAM maternal.Rout-3.pdf

## TSS Cholera

* Is it caused by bad air, or bad water?

* What's bad about it?

## PSLIDE Cholera and air

![](Farr.Rout-0.pdf ""){width=80%}

## Cholera and air

![](Farr.Rout-1.pdf ""){width=80%}

## PIC FIG snow0.pdf

## PIC FIG snow_pumps.pdf

## TSS Yellow fever and malaria

* Ross determined the cause of malaria primarily by experiments on mosquitoes

* Reed determined the cause of yellow fever primarily by experiments on human
	volunteers

# Approaches to epidemiology

## Data, models and science

* We're never finished, we compare models to data over and over again

* Data is what we use to develop and understand models

* Models are what we use to interpret data
	* and they can suggest what data we need to collect

* Complicated or hard-to-test theories may require \emph{dynamical} models

\textbf{Classical epidemiology}

PRESENT \vspace{8ex}

* Avoid mechanism

* Control for non-independence of ``units''

PRESENT \vspace{30ex}

\textbf{Dynamical epidemiology}

PRESENT \vspace{8ex}

* Embrace mechanism

* Explicitly incorporate dependence between units
	* X is infected because Y infected them

PRESENT \vspace{30ex}

## SS Classical epidemiology

## Classical example

![](smoking.Rout-0.pdf ""){width=80%}

## Classical example

![](smoking.Rout-1.pdf ""){width=80%}

## Univariate means

![](smoke_effects.Rout-0.pdf ""){width=80%}

## Multivariate means

![](smoke_effects.Rout-1.pdf ""){width=80%}

## TSS Dynamical epidemiology

DIAGRAM SIR_model_family/sir.three.pdf

## PSLIDE Polio

WFIG 0.8 webpix/polio_pink.jpg

## PSLIDE Measles

WFIG 0.8 webpix/measles_pink.jpg

## PSLIDE Rubella

WFIG 0.8 webpix/rubella_pink.jpg

## PSLIDE Influenza

WFIG 0.8 webpix/flu_pink.jpg

## NSLIDE Other viruses

Pictures from CDC Pink book \url{https://www.cdc.gov/vaccines/pubs/pinkbook/index.html}

* Rubella

* Measles

* Polio

* Influenza

## Bridging

* Classical epidemiology relies on statistics, avoids mechanism

* Mathematical epidemiology (the traditional approach to dynamical
	epidemiology) explores mechanism, avoids statistics

* Much modern dynamical epidemiology seeks ways to put dynamical mechanisms
	into a statistical framework
	* This is hard

## TSS Building knowledge from data

* We must have communication up and down the analysis pipeline
	* Data are collected in the field
	* Organized and documented
	* Protected (for confidentiality, and often for the rights of collectors)
	* Summarized
	* Modeled

## Example: COVID incidence

* Positive test results but no negative test results
	* Can't correct for testing intensity

* Positive and negative test results, but no individual identifiers
	* Can't correct for multiple testing of the same people

* Test results, but not reason for testing
	* Can't correct for testing focus

## Example: COVID variants

* Mutational screens not linked to invididuals
	* We can estimate mutations, but not variants

* Reasons for screening or sequencing not provided
	* Can't correct for selection bias

* Personal information not provided
	* Can't look for geographical patterns, vaccine effectiveness, \ldots

## Example: West Africa Ebola Outbreak

* Medical vs.~public-health priorities
	* Am I responsible if my data request increases the pressure on a
		front-line responder?

* Individual-level vs.~population considerations
	* When it is OK to randomize people to receive a placebo vaccine or
		treatment?

## Example: Microbiome studies

* In some fields, the amount of apparently high-quality data is far
	outstripping the ability to understand it

* Lots of reasonably intelligent experiments (or observational designs)

* Huge lists of taxonomic (or metagenomic) communities

## PIC FIG my_images/notindependent.png

CREDIT https://www.nature.com/articles/s41598-021-92400-y

## Data vs.~models

* Models can teach us a lot, but good data with a simplistic model is usually
	better than poor (or poorly contextualized) data with a good model

* Sometimes, the most valuable thing about the model is that it helps us
	figure out what data we need
	* ANS Value-of-information models

# Summary 

## Summary

* Science is an ongoing process

* Models are the way that we bridge between theory and reality

* We can only bridge to reality if we can measure reality
	* Collect and curate good data

* Dynamical models have a key role
	* When we can't do experiments
	* When mechanisms are complex

* We should work to combine dynamics with statistical approaches
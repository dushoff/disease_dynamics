
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



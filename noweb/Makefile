.PHONY: fun clean doc

SFUN =  coxme.R \
	coxme.fit.R\
	expand.nested.R \
	formula.R \
	coxmeFull.R \
	coxmeMlist.R \
	lmekin.R\
	ranef.R\
	bdsmatrix.R \
#	matrix.reconcile.R

RDIR = ../R
all: deming.pdf fun
fun: ../R/deming.R

deming.pdf: deming.tex noweb.sty
	texi2dvi --pdf deming.tex

deming.tex: demingsource.Rnw
	echo "require(noweb); noweave('demingsource.Rnw', target='deming', out='$@')" | $(R_HOME)/bin$(R_ARCH_BIN)/R --vanilla --slave

../R/deming.R: demingsource.Rnw
	echo "# Automatically generated from demingsource.Rnw using noweb" > $@
	echo 'require(noweb); notangle("demingsource.Rnw", target="deming")' | $(R_HOME)/bin$(R_ARCH_BIN)/R --vanilla --slave
	cat deming.R >> $@

clean:
	-rm deming.log deming.aux deming.tex deming.pdf deming.R
	-rm noweb.sty

noweb.sty:
	echo 'library(noweb); data(noweb); cat(noweb.sty, sep="\n", file="noweb.sty")' |  $(R_HOME)/bin$(R_ARCH_BIN)/R --vanilla --slave

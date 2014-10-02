all: test.html #test.pdf test.tex

test.pdf: FORCE
	pandoc --filter pandoc-citeproc --toc -o test.pdf test.md

test.tex: FORCE
	pandoc -s --template default.latex --filter pandoc-citeproc --toc -o test.tex test.md

test.html: test.md test.html5 FORCE
	pandoc --filter pandoc-citeproc --toc --template test2.html5 test.md >$@

clean: FORCE
	rm -f bootstrap_navbar_example.html
	rm -f test.aux
	rm -f test.dvi
	rm -f test.html
	rm -f test.log
	rm -f test.out
	rm -f test.pdf
	rm -f test.tex
	rm -f test.toc
	rm -f tmp.html


FORCE:

all: test.html test.pdf test.tex

test.pdf: FORCE
	pandoc --filter pandoc-citeproc --toc -o test.pdf test.md

test.tex: FORCE
	pandoc -s --template default.latex --filter pandoc-citeproc --toc -o test.tex test.md

test.html: test.md test.html5 FORCE
	pandoc --filter pandoc-citeproc --toc --template test2.html5 test.md >$@

FORCE:

NAME=proj4

do:	$(NAME).tex
		latex $(NAME).tex
		bibtex $(NAME)
		latex $(NAME).tex
		latex $(NAME).tex
		dvips -t a4 $(NAME).dvi
		ps2pdf $(NAME).ps

clean:	
	rm -f $(NAME).aux $(NAME).dvi $(NAME).log $(NAME).pdf $(NAME).ps

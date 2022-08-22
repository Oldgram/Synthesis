clean:
	find . -type f \( -iname \*.log -o -iname \*.bak -o -iname \*.aux -o -iname \*.gz -o -iname \*.out -o -iname \*.toc \) -delete
	find . -type d -name *_minted* -exec rm -r "{}" \;

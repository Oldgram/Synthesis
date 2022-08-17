clean:
	find . -type f \( -iname \*.log -o -iname \*.bak -o -iname \*.aux \) -delete
	find . -type d -name *_minted* -exec rm -r "{}" \;
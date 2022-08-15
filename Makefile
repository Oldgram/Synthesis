clean:
	find . -type f \( -iname \*.log -o -iname \*.bak \) -delete
	find . -type d -name *_minted* -exec rm -r "{}" \;
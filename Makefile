###############################################################################
# Make/Upload Rithm exercises

TYPE := exercise

include ../../Curric.mak

upload: handouts-upload \
		handouts-publish \
		dirzip-upload \
		dirzip-publish \
		solzip-upload \
		clean
	echo "\033[0;32mmake upload completed\033[0m"

help::
	$(info - make upload               build and upload slides, code zip, solution zip, and then clean)
	@echo

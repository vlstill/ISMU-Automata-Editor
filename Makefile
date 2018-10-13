
all : upload

upload : is-upload.zip

is-upload/editorJs.js : Editor/js/editorJs.js
	cp $< $@

is-upload/editorCss.css : Editor/style/editorCss.css
	cp $< $@

is-upload/utilIS.js : Editor/js/utilIS.js
	cp $< $@

is-upload/%Parser.js : Resolver/fja/web/js/%Parser.js
	cp $< $@

UPLOADED_ARTIFACTS = editorJs.js editorCss.css utilIS.js \
                     GRAParser.js DFAParser.js CYKParser.js \
                     NFAParser.js REGParser.js EFAParser.js

is-upload/is_folder_info.xml : upload-xmlgen.sh
	bash ./$< $(UPLOADED_ARTIFACTS) > $@

is-upload.zip : is-upload/is_folder_info.xml $(UPLOADED_ARTIFACTS:%=is-upload/%)
	zip -r is-upload.zip is-upload

.PHONY : all upload

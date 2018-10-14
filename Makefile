
all : generator upload

generator :
	cd Generator && make

upload : is-upload.zip
	@echo https://is.muni.cz/auth/el/1433/podzim$(shell date +'%Y')/IB102/odp/support/v2/
	@echo 'upload ZIP -> ingore top level + re-write + import using service information'

is-upload/editorJs.js : Editor/js/editorJs.js
	cp $< $@

is-upload/editorCss.css : Editor/style/editorCss.css
	cp $< $@

is-upload/utilIS.js : Editor/js/utilIS.js
	cp $< $@

is-upload/%Parser.js : Resolver/fja/web/js/%Parser.js
	cp $< $@

is-upload/jquery.min.js :
	wget --no-use-server-timestamps -O $@ https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js

is-upload/jquery-ui.js :
	wget --no-use-server-timestamps -O $@ https://code.jquery.com/ui/1.9.2/jquery-ui.js

is-upload/jquery-ui.css :
	wget --no-use-server-timestamps -O $@ https://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css

is-upload/bootstrap.min.js :
	wget --no-use-server-timestamps -O $@ https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js

UPLOADED_ARTIFACTS = editorJs.js editorCss.css utilIS.js \
                     GRAParser.js DFAParser.js CYKParser.js \
                     NFAParser.js REGParser.js EFAParser.js \
                     jquery.min.js jquery-ui.js jquery-ui.css bootstrap.min.js

is-upload/is_folder_info.xml : upload-xmlgen.sh $(UPLOADED_ARTIFACTS:%=is-upload/%)
	bash ./$< $(UPLOADED_ARTIFACTS) > $@

is-upload.zip : is-upload/is_folder_info.xml $(UPLOADED_ARTIFACTS:%=is-upload/%)
	zip -r is-upload.zip is-upload

.PHONY : all upload generator

# vim: noexpandtab shiftwidth=4 tabstop=4 softtabstop=4

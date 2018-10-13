EXAMPLES=$(filter-out $(wildcard examples/*.new.qdef),$(wildcard examples/*.qdef))

all : examples

examples : $(EXAMPLES:%.qdef=%.new.qdef) $(EXAMPLES:%.qdef=%.o.new.qdef)

%.new.qdef : %.qdef converter src/Converter.java
	./converter -r $<

%.o.new.qdef : %.qdef converter src/Converter.java
	./converter -o -s=.o.new -r $<

.PHONY: examples all

# vim: noexpandtab shiftwidth=4 tabstop=4 softtabstop=4

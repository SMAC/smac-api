# Target definitions

TARGETS=html twisted python java csharp cocoa

# If the thrift generator for one of the define target does not match the target
# name, add a GEN_<target-name> variable containing the generator to use instead.

GEN_cocoa=cocoa:log_unexpected
GEN_java=java:beans
GEN_twisted=py:twisted
GEN_python=py:new_style


# Configuration variable

SRCS=$(wildcard *.thrift)
DEST=build
TC=thrift
TFLAGS=-strict -recurse


# From here on it's all dynamic, edit these lines only if you know that you're doing

.PHONY=all clean

all: $(TARGETS)

# Command to use to compile a thrift interface
compile = $(TC) --gen $(1) $(TFLAGS) -o temp $(2) ;


# Define the default target names
define GEN_template
 GEN_$(1)?=$(1)
endef

$(foreach target,$(TARGETS),$(eval $(call GEN_template,$(target))))


# Create all dynamic targets
define BUILD_template
 build/$(1): $$(SRCS)
	rm -rf $$@
	mkdir -p $$@
	
	rm -rf temp
	mkdir -p temp
	
	$$(foreach src,$$(SRCS),$$(call compile,$(GEN_$(1)),$$(src)))
	
	mv temp/*/smaclib $$@ || mv temp/*/* $$@
	rm -rf temp
 $(1): build/$(1)
endef

$(foreach target,$(TARGETS),$(eval $(call BUILD_template,$(target))))

clean:
	rm -rf build
	rm -rf temp
	rm *.tar.gz

dist: all
	mv build smac-api
	tar czf smac-api.tar.gz smac-api
	mv smac-api build
	

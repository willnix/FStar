# -*- Makefile -*-
include Makefile.config

FSLYDIR := VS/packages/FsLexYacc.6.1.0
FSYACC  := $(RUNTIME) $(FSLYDIR)/build/fsyacc.exe
FSLEX   := $(RUNTIME) $(FSLYDIR)/build/fslex.exe

# --------------------------------------------------------------------
.SUFFIXES:
MAKEFLAGS += --no-builtin-rules

.PHONY: fstar-in-fsharp clean boot ocaml nuget-restore nuget-clean

# --------------------------------------------------------------------
# An artefact of the build process is that parse.fsi is auto-generated
fstar-in-fsharp: nuget-restore
	$(MAKE) -C VS install-packages
	$(MSBUILD) VS/FStar.sln
	$(DOS2UNIX) parser/parse.fsi
	chmod a+x $(BIN)/tests.exe
	chmod a+x $(BIN)/fstar.exe

# SAD! Can't make clean if fslex and fsyacc haven't be restored... what...
clean: clean-ocaml nuget-restore
	$(MSBUILD) /t:clean VS/FStar.sln

# --------------------------------------------------------------------
nuget-restore:
	$(RUNTIME) VS/.nuget/NuGet.exe restore VS/FStar.sln

nuget-clean:
	rm -r VS/packages

$(FSYACC) $(FSLEX): nuget-restore

# --------------------------------------------------------------------
# Bootstrapping in OCaml: The main logic is in Makefile.boot. Here, we
# mainly prepare for bootstrapping by copying and sed'ing a few F#
# files.
# --------------------------------------------------------------------

# All the files that need to be pre-processed

ALL_BOOT=$(addprefix boot/FStar., Util.fsti List.fsti			\
			          Compiler.Bytes.fsti String.fsti	\
			          BigInt.fsti Pprint.fsti		\
			          Parser.Parse.fsti			\
			          Tactics.Interpreter.fst		\
			          Tactics.Interpreter.fsti		\
			          Tests.Test.fst)

boot/%.fsti: basic/boot/%.fsi | boot_dir
	cp $^ $@
	$(SED) -i 's/<.* when .* : equality>//g' $@
	$(SED) -i '/\/\/ *JUST *FSHARP */d' $@

boot/%.fsti: prettyprint/boot/%.fsi | boot_dir
	cp $^ $@
	$(SED) -i '/\/\/ *JUST *FSHARP */d' $@

#fix up a use of polymorphic recursion in F#, which has a different syntax than F*
boot/FStar.Tactics.Interpreter.fst: tactics/boot/FStar.Tactics.Interpreter.fs | boot_dir
	cp $^ $@
	$(SED) -i '/\/\/ *JUST *FSHARP */d' $@
	$(SED) -i 's,^ *// *IN *F\* *:,,g' $@

boot/FStar.Tests.Test.fst: tests/boot/FStar.Tests.Test.fs | boot_dir
	cp $^ $@
	$(SED) -i '/\/\/ *JUST *FSHARP */d' $@

boot/FStar.Parser.Parse.fsti: parser/parse.fsi | boot_dir
	echo "#light \"off\"" > $@
	$(HEAD) -n -12 $^ >> $@
	$(SED) -i 's/module FStar.Parser.Parse/module FStar.Parser.Parse\nopen FStar.All\nopen FStar.BaseTypes\ntype bytes = array<byte>\nopen FStar.Syntax.Syntax/' $@

boot/%.fst: basic/boot/%.fs | boot_dir
	cp $^ $@

boot/FStar.Parser.Parse.fst: parser/parse.fs | boot_dir
	cp $^ $@

boot/FStar.Tactics.Interpreter.fsti: tactics/boot/FStar.Tactics.Interpreter.fsi | boot_dir
	cp $^ $@

boot_dir:
	mkdir -p boot

boot: $(ALL_BOOT)

clean_boot:
	rm -rf boot

# --------------------------------------------------------------------------------
# Now we have some make targets wrap calls to other makefiles,
# Notably, Makefile.boot, to extract ocaml from the compiler sources
# And ocaml-output/Makefile, to actually build the compiler in OCaml
# --------------------------------------------------------------------------------
ocaml: boot
	+$(MAKE) -f Makefile.boot all-ml

boot-ocaml:
	+$(MAKE) -C ocaml-output all

fstar-ocaml: ocaml
	+$(MAKE) boot-ocaml

# Fastest way to refresh the snapshot (if it works)
ocaml-fstar-ocaml: boot-ocaml
	+$(MAKE) ocaml
	+$(MAKE) boot-ocaml

clean-ocaml: clean_boot
	+$(MAKE) -C ocaml-output clean

# Very aggressive cleaning: remove all extracted files
clean_extracted:
	rm -f ocaml-output/FStar_*.ml

# --------------------------------------------------------------------
# Testing
# --------------------------------------------------------------------
OTHERFLAGS+=--hint_info

utest:
	+$(MAKE) utest-prelude
	+$(MAKE) uregressions

# The first tests have to be performed sequentially (but each one may use some parallelism)
utest-prelude:
	+$(MAKE) boot-ocaml        #build the ocaml-snapshot
	+$(MAKE) clean_extracted   #ensures that there is no leftover from previous extraction
	+$(MAKE) fstar-ocaml       #extract the compiler again and build the result
	+$(MAKE) ocaml-unit-tests  #run the unit tests

ocaml-unit-tests:
	$(BIN)/tests.exe

# The regressions to be run with a working F# build of F*
fsharp-unit-tests:
ifeq ($(OS),Windows_NT)
	$(RUNTIME) $(BIN)/tests.exe
else
	@# On Linux, we need to increase the maximum stack size, or we overflow
	ulimit -s unlimited; $(RUNTIME) $(BIN)/tests.exe
endif

# Getting parallelism from this target
uregressions: fstarlib ulib tutorial uexamples interactive-test

# Getting parallelism from this target as well
uregressions-ulong: uregressions ulib-extra

ulib-extra:
	+$(MAKE) -C ../ulib extra

fstarlib:
	+$(MAKE) -C ../ulib/ml

ulib:
	+$(MAKE) -C ../ulib

tutorial: fstarlib
	+$(MAKE) -C ../doc/tutorial regressions

uexamples: fstarlib
	+$(MAKE) -C ../examples all

# Interactive mode regressions
interactive-test:
	$(MAKE) -C tests/interactive

ulong:
	+$(MAKE) fstar-in-fsharp
	+$(MAKE) fsharp-unit-tests
	+$(MAKE) utest-prelude
	+$(MAKE) uregressions-ulong

ctags:
	ctags --exclude=boot_fsts --exclude=boot_fstis --exclude=ocaml-output -R .


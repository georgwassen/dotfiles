INFILES=$(shell ls *.in)
GENFILES=$(INFILES:.in=)

default : $(GENFILES)

debug :
	@echo "INFILES='$(INFILES)'"
	@echo "GENFILES='$(GENFILES)'"

$(GENFILES) : % : %.in personal.conf
	@echo "GEN $@ FROM $< USING personal.conf"
	@while IFS='=' read -r K V || [[ -n $$K ]]; do \
		if [[ $$K ]]; then CMD="$$CMD -e 's/@$$K@/$$V/'"; fi; \
	done < personal.conf; \
	eval sed $$CMD $< > $@

personal.conf :
	@echo "ERROR: personal.conf must be created/updated manually."
	@echo "       Look at personal.conf.template."
	@/bin/false


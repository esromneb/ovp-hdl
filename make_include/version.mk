GIT_VERSION = $(shell git describe --match=NeVeRmmAkeaAaTagSlaAhBrancHL1k3thi5 --always --abbrev=7 --dirty || echo "unknown")
GIT_HEX = $(shell echo -n "${GIT_VERSION}" | od -A n -t x1 | sed 's/ *//g' | cut -c-16)

.PHONY: version

version:
	@echo "// Version ${GIT_VERSION}" > ${UID_FILENAME}
	@echo "module $(basename $(notdir ${UID_FILENAME}))" >> ${UID_FILENAME}
	@echo "    (output logic [31:0] slv32_reg," >> ${UID_FILENAME}
	@echo "     output logic [63:0] slv64_reg);" >> ${UID_FILENAME}
	@echo "    assign slv32_reg = 32'h${UID};" >> ${UID_FILENAME}
	@echo "    assign slv64_reg = 64'h${GIT_HEX};" >> ${UID_FILENAME}
	@echo "endmodule"  >> ${UID_FILENAME} 

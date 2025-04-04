BUMP_TOOL  = bump-my-version
DEFAULTARG = patch

empty = $(if $(strip $1),,T)

ARGS = $(filter-out $(word 1,$(MAKECMDGOALS)), $(MAKECMDGOALS))
FIRSTARG = $(if $(call empty, $(ARGS)),$(DEFAULTARG),$(word 1,$(ARGS)))

bump-tool-check:
	@if ! command -v bump-my-version >/dev/null 2>&1; then \
		echo "❌ Error: 'bump-my-version' no está instalado. Instálalo con 'uv tool install bump-my-version'"; \
		exit 1; \
	fi

release: bump-tool-check
	git checkout main --quiet
	$(BUMP_TOOL) bump $(FIRSTARG)
	git push origin main --tags
	

.PHONY: release bump-tool-check
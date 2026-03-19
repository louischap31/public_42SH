.PHONY: check

check:
	@echo "Test suite is running..."
	@cd tests && ./run_testsuite.sh

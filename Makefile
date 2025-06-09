BUILD_DIR        ?= build
CMAKE_BUILD_DIR  ?= cmake-build-debug

.PHONY: clean format build run-algo run-algos

clean:
	rm -rf $(BUILD_DIR)
	rm -rf $(CMAKE_BUILD_DIR)

define RUN_CLANG_FORMAT
	@find . -type f \( -name "*.cpp" -o -name "*.h" \) \
	    -not -path "./$(BUILD_DIR)/*" \
	    -not -path "./cmake-build-debug/*" \
	    -not -path "./library/cmake-build-debug/*" \
	    -not -path "./library/test_package/build/*" \
	    -exec clang-format -style=file $(1) {} +
endef

format:
	@command -v clang-format >/dev/null 2>&1 || { \
		echo "clang-format is not installed. Please install clang-format and try again."; \
		exit 1; \
	}
	@echo "Formatting all *.cpp and *.h files (excluding build directories)..."
	$(call RUN_CLANG_FORMAT, -i)
	@echo "✔ Formatting complete!"

build:
	mkdir -p (BUILD_DIR)
	cmake -S . -B (BUILD_DIR)
	cmake --build (BUILD_DIR) --parallel
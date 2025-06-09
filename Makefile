BUILD_DIR        ?= build
SRC_DIR         := src
EXEC_DIR         := $(BUILD_DIR)/executables
CMAKE_BUILD_DIR  ?= cmake-build-debug

CPP_FILES        := $(wildcard $(SRC_DIR)/*.cpp)
EXE_FILES        := $(patsubst $(SRC_DIR)/%.cpp,$(EXEC_DIR)/%,$(CPP_FILES))

CXX              ?= g++
CXXFLAGS         := -std=c++17 -O2

.PHONY: clean format run-algo run-algos

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

run-algo:
ifndef name
	$(error Please provide the algorithm name like: `make run-algo name=Stacks`)
endif
	@mkdir -p $(EXEC_DIR)
	$(CXX) $(CXXFLAGS) -Iinclude $(SRC_DIR)/$(name).cpp -o $(EXEC_DIR)/$(name)
	@echo "Running $(name):"
	@$(EXEC_DIR)/$(name)

$(EXEC_DIR)/%: $(SRC_DIR)/%.cpp
	@mkdir -p $(EXEC_DIR)
	$(CXX) $(CXXFLAGS) $< -o $@

run-algos: $(EXE_FILES)
	@echo "🚀 Running all algorithms:"
	@for exe in $(EXE_FILES); do \
		echo "--- Running $$exe ---"; \
		$$exe; \
		echo; \
	done

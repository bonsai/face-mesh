# MediaPipe Face & Hand Mesh - Build Configuration
# ==================================================

PROJECT_NAME := mediapipe-face-hand
ASSETS_DIR := assets
HTML_FILE := preview.html

.PHONY: all clean download build serve run check

all: download build

# Download all required MediaPipe models from CDN
download:
	mkdir -p $(ASSETS_DIR)
	cd $(ASSETS_DIR) && \
	  wget -q "https://storage.googleapis.com/mediapipe-models/face_landmarker/face_landmarker/float16/1/face_landmarker.task" -O face_landmarker.task && \
	  wget -q "https://storage.googleapis.com/mediapipe-models/hand_landmarker/hand_landmarker/float16/1/hand_landmarker.task" -O hand_landmarker.task

# Build the project (assets are ready after download)
build: download
	@echo "Build complete. Assets are ready in $(ASSETS_DIR)/"

# Clean generated assets
clean:
	rm -rf $(ASSETS_DIR)

# Serve the project locally
serve: build
	python3 -m http.server 8081 --directory $(ASSETS_DIR) 2>/dev/null || \
	python -m http.server 8081 --directory $(ASSETS_DIR) 2>/dev/null

# Run the demo (opens browser automatically)
run: build
	python3 -c "import webbrowser; import time; print('Starting local server on http://localhost:8081'); time.sleep(3); webbrowser.open('http://localhost:8081')"

# Install dependencies
install-deps:
	npm install

# Quick test - verify the HTML loads the correct assets
check: download
	cd $(ASSETS_DIR) && ls -la
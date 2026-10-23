# Face Mesh: MediaPipe, TensorFlow.js, ONNX Runtime Web

Browser-based face landmark demos deployed with GitHub Pages.

## Demos

- **MediaPipe Face Landmarker + Three.js:** [Open demo](https://bonsai.github.io/face-mesh/)
- **TensorFlow.js Face Mesh:** [Open demo](https://bonsai.github.io/face-mesh/tfjs.html)
- **ONNX Runtime Web (experimental):** [Open demo](https://bonsai.github.io/face-mesh/onnx.html)

## Model assets

The GitHub Actions Pages workflow downloads model assets during deployment, so large binary weights do not need to be committed to Git:

- `models/face_landmarker.task` — official MediaPipe Face Landmarker bundle.
- `models/face_landmarks.onnx` — ONNX conversion of the Face Mesh V2 landmark network from Hugging Face.

The ONNX file is only the landmark network. It expects a 256×256 RGB face crop and does not include the face detector/crop pipeline. The current ONNX page is an experimental center-crop smoke test; it is not equivalent in robustness to the full MediaPipe pipeline.

TensorFlow.js uses the published `@tensorflow-models/face-landmarks-detection` package with its TFJS runtime and downloads its model assets at runtime.

## Local run

For the MediaPipe and Three.js demo, download the official `face_landmarker.task` into `models/face_landmarker.task`, then serve the repository root:

```bash
python -m http.server 8000
```

Open <http://localhost:8000/>. Camera access requires localhost or HTTPS.

The TFJS and ONNX pages also need internet access to load their JavaScript runtimes; the ONNX page additionally needs `models/face_landmarks.onnx`.

## Privacy and limitations

Camera frames are processed in the browser by these demos; they are not intentionally uploaded to a server. This is a prototype for comparing runtimes, not a calibrated 3D face reconstruction. Check each model's license and model card before redistribution or commercial use.

# Face Mesh Lab

A single-page browser demo combining MediaPipe face landmarks, hand landmarks, and a Three.js 3D face point cloud.

## Demo

- **GitHub Pages:** https://bonsai.github.io/face-mesh/
- Face landmarks are drawn over the mirrored camera preview.
- Hand landmarks and finger connections are drawn in cyan.
- Face landmarks are shown as a 3D point cloud with a simple head-pose estimate and jaw-open score.

## Architecture

The public demo is consolidated into one page: `index.html`. GitHub Actions downloads the two MediaPipe model assets during deployment, so model binaries are not committed to the repository.

- `models/face_landmarker.task` — MediaPipe Face Landmarker.
- `models/hand_landmarker.task` — MediaPipe Hand Landmarker.

## Run locally

```bash
python -m http.server 8000
```

Open <http://localhost:8000/> and allow camera access. Camera access requires localhost or HTTPS.

## Privacy and limitations

Camera frames are processed in the browser; this demo does not intentionally upload them. The 3D view visualizes landmark coordinates and is not a calibrated 3D face reconstruction. JavaScript and model files load from CDNs / Google Cloud Storage.

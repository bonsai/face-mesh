# MediaPipe Face Mesh

Browser-based face tracking sample using **MediaPipe Tasks Vision Face Landmarker** and **Three.js**.

## Features

- Webcam face tracking in the browser
- 2D face-landmark overlay
- Three.js 3D landmark point cloud and wireframe-like connections
- Approximate head rotation driven by facial landmarks
- Jaw-open blendshape readout when available
- No backend or build step

## Run locally

Webcam access generally requires `localhost` or HTTPS. From the repository directory:

```bash
python -m http.server 8000
```

Open <http://localhost:8000/>.

Click **Start camera** and grant camera permission.

## Notes

- The page loads MediaPipe and Three.js from public CDNs, so internet access is required.
- This is a visual prototype, not a calibrated 3D face reconstruction. Landmark depth is estimated by MediaPipe and is not metric depth.
- Camera frames are processed in the browser; this sample does not upload video to a server.
- If camera startup fails, check browser permissions and use a recent Chromium-based browser.

## Main file

- `index.html` — standalone demo.

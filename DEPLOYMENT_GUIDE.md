# 🚀 Deployment Guide - Indian Sign Language Detection

## Quick Fix Summary

The error you encountered:
```
ModuleNotFoundError: No module named 'cv2'
```

### ✅ What Was Fixed:
1. ✅ Created `requirements.txt` with all dependencies including `opencv-python-headless`
2. ✅ Created `.streamlit/config.toml` for proper Streamlit configuration
3. ✅ Created `.gitignore` to exclude unnecessary files
4. ✅ Created cloud-compatible version: `appUI_cloud.py` using `streamlit_webrtc`

---

## 📋 Choose Your Deployment Method

### For Local Deployment (Recommended if webcam is needed)
Use: **`appUI.py`** (original file)

### For Streamlit Cloud Deployment
Use: **`appUI_cloud.py`** (new cloud-compatible version)

---

## 🌐 Streamlit Cloud Deployment (Video with Webcam)

### Step 1: Prepare Your Repository
```bash
cd "a:/Downloads/Indian hand sign detection model"
git add .
git commit -m "Add requirements.txt and Streamlit configurations for cloud deployment"
git push origin main
```

### Step 2: Deploy on Streamlit Cloud

1. Go to [streamlit.io/cloud](https://streamlit.io/cloud)
2. Sign up or log in with GitHub
3. Click **"New app"**
4. Select:
   - Repository: `anujparwal09/indian-sign-language-detection`
   - Branch: `main`
   - Main file: **`appUI_cloud.py`** (for webcam support)
5. Click **"Deploy"**

### Step 3: Wait for Deployment
- Streamlit will install dependencies from `requirements.txt`
- This may take 2-5 minutes
- Your app will be live at: `https://indian-sign-language[random].streamlit.app`

---

## 💻 Local Deployment

### Step 1: Create Virtual Environment
```bash
cd "a:/Downloads/Indian hand sign detection model"

# Create venv
python -m venv venv

# Activate venv
# On Windows:
venv\Scripts\activate
# On macOS/Linux:
source venv/bin/activate
```

### Step 2: Install Dependencies
```bash
pip install -r requirements.txt
```

### Step 3: Run the App
```bash
# Use original version with cv2.VideoCapture
streamlit run appUI.py

# OR use the cloud-compatible version
streamlit run appUI_cloud.py
```

### Step 4: Access Your App
Open browser to: `http://localhost:8501`

---

## 📁 File Structure for Deployment
```
indian-sign-language-detection/
├── appUI.py                          ← Local version (uses cv2.VideoCapture)
├── appUI_cloud.py                    ← Cloud version (uses streamlit_webrtc)
├── sign_language_alphaDigi_model.h5 ← Model file (KEEP IN ROOT!)
├── requirements.txt                  ← Dependencies (CRITICAL!)
├── .streamlit/
│   └── config.toml                  ← Streamlit config
├── .gitignore                        ← Git ignore rules
├── README.md                         ← Project info
└── DEPLOYMENT_GUIDE.md              ← This file
```

---

## ⚠️ Important Notes

### Model File Location
- The `sign_language_alphaDigi_model.h5` **MUST** be in the same directory as the Python files
- File size should be reasonable for cloud deployment (under 500MB)

### Dependencies in requirements.txt
- `opencv-python-headless`: For server environments (no display)
- `tensorflow`: Model inference
- `streamlit-webrtc`: Webcam access on Streamlit Cloud
- Do NOT use `opencv-python` on cloud servers

### Webcam Access
- **Local**: Works with `appUI.py` using cv2.VideoCapture(0)
- **Streamlit Cloud (Free)**: Works with `appUI_cloud.py` using streamlit_webrtc
- **Paid Streamlit Cloud**: Both versions should work

---

## 🔧 Common Issues & Fixes

### Issue 1: "No module named 'cv2'"
```
❌ Old problem - requirements.txt was missing
✅ Fixed with new requirements.txt
```

### Issue 2: Webcam Shows Black Screen
```
⚠️ Check if your camera is enabled
⚠️ Try the cloud version: appUI_cloud.py
⚠️ On Streamlit Cloud, use appUI_cloud.py only
```

### Issue 3: Model Takes Long to Load
```
✅ app.py uses @st.cache_resource to cache the model
✅ First run is slow, subsequent runs are instant
```

### Issue 4: Large File Upload on Streamlit Cloud
```
📝 Solution: 
   - The model.h5 file is committed to git
   - Streamlit Cloud will include it automatically
   - Ensure .gitignore doesn't exclude *.h5 files
```

### Issue 5: TensorFlow Import Error on Cloud
```
✅ requirements.txt specifies compatible versions:
   tensorflow==2.13.0
   protobuf==3.20.0
```

---

## 📊 Performance Optimization

### Local Optimization:
- Uses cv2.VideoCapture(0) - fastest for local
- Requires installed webcam driver
- Lower latency

### Cloud Optimization:
- Uses streamlit_webrtc - WebRTC for cloud
- Works through browser
- May have latency based on internet

---

## 🔐 Security Notes

### For Streamlit Cloud:
- Webcam access requires browser permission
- No data is stored on servers
- Camera feed stays local in browser
- Connection to WebRTC server is encrypted

### Streamlit Secrets (Optional)
If you need to add API keys later:
1. Go to app settings on Streamlit Cloud
2. Add secrets in UI
3. Access via `st.secrets`

---

## ✅ Deployment Checklist

- [ ] `requirements.txt` exists and has all dependencies
- [ ] `sign_language_alphaDigi_model.h5` is in root directory
- [ ] `.streamlit/config.toml` exists
- [ ] `.gitignore` is configured
- [ ] Code pushed to GitHub
- [ ] Streamlit Cloud app deployed
- [ ] Webcam permissions granted in browser
- [ ] App is working and recognizing signs

---

## 🆘 Still Having Issues?

1. **Check Streamlit Cloud Logs**
   - In Streamlit Cloud app, click "Manage app" → "View logs"
   - Look for actual error messages

2. **Test Locally First**
   ```bash
   streamlit run appUI.py
   ```
   - If this works, issue is with cloud environment
   - Try `appUI_cloud.py` instead

3. **Verify Dependencies**
   ```bash
   pip list
   ```
   - Ensure all packages from requirements.txt are installed

4. **Check Model File**
   ```bash
   ls -la sign_language_alphaDigi_model.h5
   ```
   - File should exist in root directory
   - Check file size is reasonable

---

## 📞 Support Resources

- **Streamlit Docs**: https://docs.streamlit.io/
- **Streamlit Community**: https://discuss.streamlit.io/
- **TensorFlow Docs**: https://www.tensorflow.org/
- **OpenCV Docs**: https://docs.opencv.org/

---

**Status**: ✅ All deployment files prepared and ready!
**Last Updated**: 2026-04-04

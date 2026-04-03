#!/bin/bash
# Setup script for Indian Sign Language Detection - Streamlit

echo "🚀 Setting up Indian Sign Language Detection App..."

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python first."
    exit 1
fi

echo "✅ Python found: $(python3 --version)"

# Create virtual environment
echo "📦 Creating virtual environment..."
python3 -m venv venv

# Activate virtual environment
echo "🔌 Activating virtual environment..."
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    # Windows
    source venv/Scripts/activate
else
    # macOS/Linux
    source venv/bin/activate
fi

# Install dependencies
echo "⬇️  Installing dependencies from requirements.txt..."
pip install --upgrade pip
pip install -r requirements.txt

echo ""
echo "✅ Setup complete!"
echo ""
echo "To run the app, activate the virtual environment and run:"
echo "  # Windows:"
echo "  venv\\Scripts\\activate"
echo "  streamlit run appUI.py"
echo ""
echo "  # macOS/Linux:"
echo "  source venv/bin/activate"
echo "  streamlit run appUI.py"
echo ""
echo "For cloud deployment (Streamlit), use appUI_cloud.py"
echo ""

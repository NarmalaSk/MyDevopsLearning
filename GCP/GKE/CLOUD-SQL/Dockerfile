# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements (optional but good practice)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY . .

# Default command
CMD ["python", "app.py"]

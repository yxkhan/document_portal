# Use official Python image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set workdir
WORKDIR /app

# Install OS dependencies required for container
RUN apt-get update && apt-get install -y build-essential poppler-utils && rm -rf /var/lib/apt/lists/*

# Copy requirements from local directory
COPY requirements.txt .
COPY .env .

# Copy project files to the working directory
COPY . .

# Install dependencies wrt to our project
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 8080

# # Run FastAPI with uvicorn
# CMD ["uvicorn", "api.main:app", "--host", "0.0.0.0", "--port", "8080", "--reload"]

# # Replace last CMD in prod
# CMD ["uvicorn", "api.main:app", "--host", "0.0.0.0", "--port", "8080", "--workers", "4"]

#ChatGPT suggested change
CMD ["uvicorn", "api.main:app", "--host", "0.0.0.0", "--port", "8080"]
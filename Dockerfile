# Use a slim Python image as the base
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies that neuroimaging tools might need
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install HD-BET, pytest for testing, and other Python dependencies
RUN pip install --no-cache-dir HD-BET pytest

# Download the HD-BET model parameters during the build.
# This ensures the model is ready to use inside the container.
RUN hd-bet -download_weights

# Copy the project source code into the container
COPY ./dti_pipeline ./dti_pipeline
COPY ./tests ./tests

# Command to run when the container starts (we can change this later)
CMD ["/bin/bash"]
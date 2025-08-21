# DTI Processing Platform

![GitHub License](https://img.shields.io/github/license/Mageshwar/dti-processing-platform)

A user-friendly, containerized platform to automate standard Diffusion Tensor Imaging (DTI) preprocessing pipelines for neuroimaging researchers.

## Overview

The goal of this project is to simplify and standardize DTI preprocessing by wrapping powerful but complex command-line tools (like FSL, MRtrix3, ANTs) into an accessible web-based interface. This platform enables researchers, particularly those with limited programming experience, to process their data reproducibly and efficiently, moving from raw DICOM images to preprocessed, BIDS-compliant data ready for analysis.

## Key Features

-   **Intuitive Web UI**: A simple interface built with Streamlit for data upload, parameter selection, and pipeline execution.
-   **BIDS Standardization**: An integrated HeuDiConv-based utility to convert complex DICOM folder structures into the Brain Imaging Data Structure (BIDS) standard.
-   **Containerized Environment**: The entire software environment and its dependencies are encapsulated in a single Docker container, ensuring perfect reproducibility across different machines.
-   **HPC Ready**: The Docker image can be converted to a Singularity image, allowing safe and efficient execution on High-Performance Computing (HPC) clusters.
-   **Modular & Scalable Backend**: The Python backend is designed with a clear separation between low-level tool wrappers and high-level pipeline logic, making it easy to maintain and extend.
-   **Flexible Compute**: Supports both CPU and GPU execution, selectable by the user at runtime.

## Tech Stack

| Category              | Technology / Tool                                     |
| --------------------- | ----------------------------------------------------- |
| **Frontend**          | Streamlit                                             |
| **Backend**           | Python 3.10+                                          |
| **Neuroimaging Tools**| FSL, MRtrix3, ANTs, HeuDiConv                         |
| **Containerization**  | Docker, Singularity                                   |
| **Testing**           | Pytest                                                |
| **Data Standard**     | BIDS (Brain Imaging Data Structure)                   |

## Project Architecture

The backend is designed with a two-layer architecture to ensure modularity and testability:

1.  **Wrapper Layer (`dti_pipeline/wrappers/`)**: Contains Python functions that directly wrap and execute command-line tools. Each function is a clean abstraction over a single tool (e.g., `fsl.bet`).
2.  **Pipeline Layer (`dti_pipeline/steps/`)**: Orchestrates calls to the wrapper layer to execute meaningful scientific workflows (e.g., a `preprocessing` step that calls denoising, eddy correction, and brain extraction in sequence).

```
dti-processing-platform/
├── Dockerfile
├── app.py              # Streamlit UI
├── dti_pipeline/
│   ├── wrappers/       # Low-level tool wrappers
│   └── steps/          # High-level pipeline logic
└── tests/              # Pytest tests
```

## Getting Started

### Prerequisites

-   Git
-   Docker Desktop (for local execution)
-   Singularity (for HPC execution)

### Installation & Usage

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/your-username/dti-processing-platform.git](https://github.com/mrityunjayan/dti-processing-platform.git)
    cd dti-processing-platform
    ```

2.  **Build the Docker image:**
    ```bash
    docker build -t dti-platform .
    ```

3.  **Run the application:**
    ```bash
    docker run -p 8501:8501 dti-platform
    ```
    You can then access the UI by navigating to `http://localhost:8501` in your web browser.

## Project Roadmap

-   [ ] Implement core preprocessing wrappers (FSL BET, Eddy, TOPUP).
-   [ ] Develop BIDS conversion step.
-   [ ] Build the Streamlit interface for user input.
-   [ ] Add tensor fitting and DTI metric calculation (FA, MD).
-   [ ] Implement basic tractography using MRtrix3.
-   [ ] Set up a CI/CD pipeline with GitHub Actions for automated testing.
-   [ ] Create a results dashboard for quality control.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

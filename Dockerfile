FROM nvidia/cuda:11.8.0-base-ubuntu22.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone https://github.com/Ahhmedsamehh/ProteinMPNN.git
RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113

WORKDIR /app/ProteinMPNN

ENTRYPOINT ["python3", "protein_mpnn_run.py"]

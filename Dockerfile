FROM tensorflow/tensorflow:1.1.0-rc2-gpu-py3
WORKDIR /DeployedProjects
RUN pip install tqdm
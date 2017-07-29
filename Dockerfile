FROM tensorflow/tensorflow:1.1.0-rc2-gpu-py3
ENV LANG="C.UTF-8" \
	TF_CPP_MIN_LOG_LEVEL="1"
WORKDIR /DeployedProjects
USER root
RUN pip install tqdm \
	&& GOSU_SHA="5b3b03713a888cee84ecbf4582b21ac9fd46c3d935ff2d7ea25dd5055d302d3c" \
	&& curl -sSL -o /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64" \
	&& chmod +x /usr/local/bin/gosu \
	&& echo "$GOSU_SHA  /usr/local/bin/gosu" | sha256sum -c -

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
FROM ppc64le/centos:7.6.1810
COPY prereq.txt /
COPY setup.sh   /
COPY yarn_api_client-0.3.7.dev0-py2.py3-none-any.zip /
RUN chmod +x /setup.sh
RUN sh /setup.sh
CMD ["/bin/bash"]

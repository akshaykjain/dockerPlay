FROM centos:6.9
RUN yum install -y gcc libffi-devel python-devel openssl-devel python-setuptools wget
COPY prereq.txt /
COPY setup.sh   /
COPY yarn_api_client-0.3.7.dev0-py2.py3-none-any.zip /
RUN chmod +x /setup.sh
RUN sh /setup.sh
CMD ["/bin/bash"]

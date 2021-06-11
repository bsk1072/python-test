FROM ubuntu:latest
MAINTAINER bhandari santhosh kumar
RUN apt update -y
RUN  apt install -y build-essential python3-pip python-dev
COPY . /workdir
WORKDIR /workdir
RUN pip install -r Procfile
ENTRYPOINT ["python"]
CMD ["script.py"]

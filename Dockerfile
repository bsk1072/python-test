FROM ubuntu:latest
MAINTAINER bhandari santhosh kumar
RUN apt update -y
RUN  apt install -y build-essential python-pip python-dev
COPY . /workdir
WORKDIR /workdir
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["script.py"]

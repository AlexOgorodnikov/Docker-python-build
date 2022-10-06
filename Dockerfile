FROM ubuntu:18.04
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && apt-get install -y \
python-all \
python-pip \
p7zip-full
WORKDIR /opt/webapp
COPY ./webapp.7z /opt/webapp
RUN 7z e webapp.7z
RUN pip install -qr /opt/webapp/requirements.txt
EXPOSE 5000
CMD ["python", "app.py"]
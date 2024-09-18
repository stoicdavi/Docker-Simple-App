FROM ubuntu
RUN apt-get update && apt-get install -y python3 \
	 python3-pip \
	python3-venv
# Create a virtual env
RUN python3 -m venv /opt/venv

# set env variable for the virtual env
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip3 install flask

COPY app.py /opt/app.py

ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]
ENV FLASK_APP=/opt/app.py

FROM python:3.12.3-alpine3.19
LABEL maintainer="apoorvabhishek.com"

ENV PYTHONUNBUFFERED 1

COPY requirements.txt /
COPY run.py /
WORKDIR /
RUN pip3 install -r requirements.txt
EXPOSE 5000
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /requirements.txt

ENV PATH="/py/bin:$PATH"

CMD flask run --host=0.0.0.0

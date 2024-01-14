FROM python:3.10-slim

EXPOSE $PORT

COPY app.py /app.py
COPY requirements.txt /tmp/requirements.txt

WORKDIR /

RUN pip install -r /tmp/requirements.txt

CMD exec uvicorn app:app --port $PORT --host 0.0.0.0 --workers 1
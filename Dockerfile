# Create a docker file for python 3.10 from an alpine image
# Use pip to install flask
# Use pip to install tiktoken
# Copy the /usr/tiktoken/tiktoken_server.py file to the container
# The entry point for the container is python -m flask --app /usr/tiktoken/tiktoken_server.py run

FROM python:3.10-alpine
RUN pip install flask gunicorn tiktoken
RUN mkdir /app
COPY src/tiktoken_server.py /app/tiktoken_server.py
WORKDIR /app

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "tiktoken_server:app"]

EXPOSE 5000







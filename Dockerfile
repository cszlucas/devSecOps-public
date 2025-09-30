FROM devilbox/python-flask:3.8-dev
ENV FLASK_APP=hello.py
WORKDIR /app
COPY ./app /app
CMD ["flask", "run", "--host=0.0.0.0", "--port=80"]
EXPOSE 80

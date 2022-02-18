FROM python:latest

WORKDIR /webpage

COPY /PiAAC/requirements.txt /webpage/

RUN pip install -r requirements.txt

COPY /PiAAC/static /webpage/cloud
COPY /PiAAC/templates /webpage/templates
COPY /PiAAC/venv /webpage/venv
COPY /PiAAC/.idea /webpage/.idea
COPY /PiAAC/run.py .
COPY /PiAAC/aboutme.html .
COPY /PiAAC/contact.html .
COPY /PiAAC/gallery.html .

EXPOSE 5000

CMD ["python", "./run.py"]
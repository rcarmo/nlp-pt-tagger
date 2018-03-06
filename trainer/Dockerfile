FROM rcarmo/ubuntu-python:3.6-onbuild-x86_64

ADD train.py /app/train.py
ADD setup.py /app/setup.py
WORKDIR /app
RUN python -u setup.py
CMD python -u train.py
FROM python:3.7

ENV TARGET_DIR /simpleapp
WORKDIR /simpleapp
ADD ./requirements.txt ${TARGET_DIR}/
COPY templates ${TARGET_DIR}/templates/
COPY app.py ${TARGET_DIR}
# RUN pip install -r requirements.txt
RUN pip install -r requirements.txt --proxy http(s)://proxy:8080 --trusted-host pypi.python.org

CMD ["python", "app.py"]

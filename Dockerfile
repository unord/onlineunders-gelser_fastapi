FROM selenium/standalone-chrome

RUN apt-get update && apt-get install -y python3 git



# set display port to avoid crash
ENV DISPLAY=:99


#
WORKDIR /code

#
COPY ./requirements.txt code/src/requirements.txt

#
RUN pip3 install --no-cache-dir --upgrade -r code/src/requirements.txt

#
COPY . /code/

#
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]

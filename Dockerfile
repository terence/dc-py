FROM python:3

RUN mkdir -p /test/code/
RUN mkdir -p /test/code/data

# IMPT: For python file referencing
WORKDIR /test/code/


# Install Libraries
RUN pip install numpy
RUN pip install pandas
RUN pip install matplotlib
#RUN pip install sqlite3

ADD files/helloworld.py /test/code/
ADD files/sqlite.py /test/code/
ADD files/data/sqlite1.db /test/code/data/

CMD [ "python3", "-u", "/test/code/helloworld.py" ]
CMD [ "python3", "/test/code/sqlite.py" ]

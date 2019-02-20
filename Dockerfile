FROM python:3

RUN mkdir -p /test/code/
RUN mkdir -p /test/code/data


# Install Libraries
RUN pip install numpy
RUN pip install pandas
RUN pip install matplotlib
#RUN pip install sqlite3

ADD files/helloworld.py /test/code/
ADD files/sqlite.py /test/code/
ADD files/data/sqlite1.db /test/code/data/

#ADD test_output.txt /test/code/
#ADD test_input.txt /test/configs/
#ADD logfile.log /test/logs/


CMD [ "python3", "/test/code/helloworld.py" ]
CMD [ "python3", "/test/code/sqlite.py" ]

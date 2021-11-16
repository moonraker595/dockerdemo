#Use the standard python base OS image
FROM python:3

# get the repo
ADD https://github.com/ral-facilities/scigateway-auth/archive/refs/heads/master.zip /app

# unzip and remove top level folder
RUN unzip /app/master.zip -d ./tmp
RUN mv ./tmp/*/* .
#Change the working directory to /app
WORKDIR /app
#Install the required python packages listed in the requirements file
RUN python -m pip install -r requirements.txt
#Expose port 5000 of the container to the outside
EXPOSE 5000
#Run the command to start the server
CMD ["python3","hello_world.py"]
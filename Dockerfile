#Use the standard python base OS image
FROM python:3.7-alpine

#Change the working directory to /app
WORKDIR /app

# get the repo
ADD https://github.com/moonraker595/dockerdemo/archive/refs/heads/main.zip /app

# unzip and remove top level folder
RUN unzip /app/main.zip -d ./tmp
RUN mv ./tmp/*/* .

#Install the required python packages listed in the requirements file
RUN python -m pip install -r requirements.txt

#Expose port 5000 of the container to the outside
EXPOSE 5000

#Run the command to start the server
CMD ["python3","hello_world.py"]
FROM python:3.10
WORKDIR /backup-checker
COPY ./app /backup-checker
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python", "main.py"]


## NOTES:
# copy over the entire app directory to backup-checker directory in the docker container.  I am not pushing over .env because
# that will be created on the fly in the .gitlab-ci.yml file
# The python:3.10 docker image has been tested to see that it contains the 2 libs below. These are required now that the 
# main.py python backup-checker is using the mariadb connector instead of mysql.connector function.
# To verify the docker python:3.10 image do the following:
# docker run -it --rm python:3.10 bash (step 1). This start a terminal session in the container itself.
# dpkg -l | grep libmariadb3
# dpkg -l | grep libmariadb-dev
# both of these show as installed in the docker python:3.10 docker container.
# With these libs, the pip install of dependencies requirements.txt which now has mariadb-1.1.10, should install without 
# issues

#!/bin/bash

pwd
touch test1234.txt

source /home/ubuntu/project/env/bin/activate  >> test.log
pip3 install -r /home/ubuntu/project/django-cicd/requirements.txt  >> test.log
python3 /home/ubuntu/project/django-cicd/manage.py runserver 0.0.0.0:8000




# #!/bin/bash
# if [ -d "env" ]; 
# then
#     echo "Python virtual environment exists." 
# else
#     pip3 install virtualenv
#     virtualenv env
#     if [ $? -eq 0 ];
#     then
#         echo "Python virtual environment created successfully"
#     else 
#         echo "Failed to create Python virtual environment"
#         exit 1
#     fi
# fi

# source env/bin/activate


# pip3 install -r requirements.txt

# if [ -d "logs" ] 
# then
#     echo "Log folder exists." 
# else
#     mkdir logs
#     touch logs/error.log logs/access.log
# fi

# sudo chmod -R 777 logs
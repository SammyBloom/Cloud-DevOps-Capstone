
setup:
	# Create python virtualenv & source it
	python3 -m venv ~/.devops
	source ~/.devops/bin/activate

install:
	# This should be run 
	pip install --upgrade pip &&\
		pip install -r requirements.txt

install-hadolint:
	wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.17.5/hadolint-Linux-x86_64
	chmod +x /bin/hadolint		

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	
	hadolint Dockerfile

	# pylint --disable=C0114,C0116,C0103,W1514,R1732,C0103,W1514,R1732,C0304,C0411,W0702  app/app.py

all: install lint test


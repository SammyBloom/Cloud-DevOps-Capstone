
setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	python3 -m venv ./.devops

install:
	# This should be run 
	pip install --upgrade pip &&\
		pip install -r requirements.txt

install-hadolint:
	wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.17.5/hadolint-Linux-x86_64
	chmod +x /bin/hadolint		

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile

all: install lint test


FROM amostsai/nginx

MAINTAINER Amos Tsai <amos.tsai@gmail.com>

RUN \
	apt-get update && \
	apt-get -y upgrade && \
	apt-get --no-install-recommends install -y python-pip python-dev python-setuptools libmysqlclient-dev && \
	pip install --upgrade pip


ADD app/ /app/

RUN	pip install -r /app/requirements.txt && \

	# Clean up
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	apt-get autoremove -y && \
	apt-get clean

EXPOSE 80

WORKDIR /app/

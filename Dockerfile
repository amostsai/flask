FROM amostsai/nginx

MAINTAINER Amos Tsai <amos.tsai@gmail.com>

RUN \
	apt-get update && \
	apt-get -y upgrade && \
	apt-get --no-install-recommends install -y python-pip python-dev

ADD app/ /var/www/app/

RUN	pip install -r /var/www/app/requirements.txt && \

	# Clean up
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt-get autoremove -y && \
    apt-get clean

EXPOSE 80

CMD cd /var/www/app/ && python app.py
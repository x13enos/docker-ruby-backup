FROM postgres:12.1

RUN apt-get update && \
  apt-get install -y git ruby-full make gcc libffi-dev build-essential
RUN apt-get install -y zlib1g-dev libxml2-dev libcurl4-gnutls-dev

RUN ruby -v

RUN gem install specific_install
RUN gem specific_install -l https://github.com/backup/backup.git

ADD model.rb /root/Backup/models/
ADD model.rb /root/Backup/models/
ADD config.rb /root/Backup/config.rb

WORKDIR /app
ADD . /app

VOLUME ["/home/backups", "/etc/backups", "/var/lib/backups", "/var/log/backups"]

CMD backup perform --trigger my_backup

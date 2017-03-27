FROM cloudbees/cje-mm:2.32.2.6

COPY install-plugins.sh /usr/local/bin/install-plugins.sh
RUN /usr/local/bin/install-plugins.sh \
  hipchat

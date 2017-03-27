FROM cloudbees/cje-mm:2.32.2.6

USER root

COPY install-plugins.sh /usr/local/bin/install-plugins.sh
RUN /usr/local/bin/install-plugins.sh \
  hipchat

USER ${user}

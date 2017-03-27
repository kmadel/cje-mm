FROM cloudbees/cje-mm:2.32.2.6

USER root
COPY install-plugins.sh /usr/local/bin/install-plugins.sh
RUN chown -R ${user} /usr/local/bin/install-plugins.sh

USER ${user}
RUN /usr/local/bin/install-plugins.sh \
  hipchat

FROM cloudbees/cje-mm:2.32.2.6

USER root
RUN /usr/local/bin/install-plugins.sh \
  hipchat
USER jenkins

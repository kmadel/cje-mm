FROM cloudbees/cje-mm:2.32.2.6

ARG user=jenkins
USER ${user}
ENV JENKINS_UC https://updates.jenkins.io
COPY install-plugins.sh /usr/local/bin/install-plugins.sh
RUN /usr/local/bin/install-plugins.sh \
  hipchat

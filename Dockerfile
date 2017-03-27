FROM cloudbees/cje-mm:2.32.3.1

#skip setup wizard; per https://github.com/jenkinsci/docker/tree/master#preinstalling-plugins
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

ENV JENKINS_UC http://jenkins-updates.cloudbees.com
COPY plugins.sh /usr/local/bin/plugins.sh
COPY plugins.txt plugins.txt
RUN plugins.sh plugins.txt
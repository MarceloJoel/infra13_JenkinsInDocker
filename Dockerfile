FROM jenkins/jenkins:jdk21

RUN jenkins-plugin-cli --plugins configuration-as-code:2006.v001a_2ca_6b_574

ENV JAVA_OPTS -Djenkins.runSetupWizard=false

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY install-plugins.sh /usr/local/bin/install-plugins.sh
# RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

USER root

RUN chmod +x /usr/local/bin/install-plugins.sh
RUN /usr/local/bin/install-plugins.sh usr/share/jenkins/ref/plugins.txt


EXPOSE 8080 50000
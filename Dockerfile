FROM jenkins/jenkins:lts

# skip the setup wizard
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false -Dpermissive-script-security.enabled=true"

# install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
# ensure that our plugin versions win, not those on disk
RUN for f in /usr/share/jenkins/ref/plugins/*.jpi; do mv $f $f.override ; done

# FROM jenkins/jenkins:lts

# COPY my_marvin.yml ./
# EXPOSE 8080


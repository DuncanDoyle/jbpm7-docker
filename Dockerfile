FROM registry.access.redhat.com/jboss-eap-7/eap70-openshift

MAINTAINER ddoyle <ddoyle@redhat.com>

ADD https://repository.jboss.org/nexus/service/local/artifact/maven/redirect?r=snapshots&g=org.kie&a=kie-wb&v=7.0.0-SNAPSHOT&e=war&c=wildfly10 /opt/eap/standalone/deployments/jbpm-console.war
ADD https://repository.jboss.org/nexus/service/local/artifact/maven/redirect?r=snapshots&g=org.jbpm&a=jbpm-wb-case-mgmt-showcase&v=7.0.0-SNAPSHOT&e=war&c=wildfly10 /opt/eap/standalone/deployments/jbpm-casemgmt.war
ADD https://repository.jboss.org/nexus/service/local/artifact/maven/redirect?r=snapshots&g=org.kie.server&a=kie-server&v=7.0.0-SNAPSHOT&e=war&c=ee7 /opt/eap/standalone/deployments/kie-server.war

COPY contrib/standalone-full-eap-7.0.0.xml /opt/eap/standalone/configuration/standalone-openshift.xml
COPY contrib/users.properties /opt/eap/standalone/configuration/users.properties
COPY contrib/roles.properties /opt/eap/standalone/configuration/roles.properties

USER root
RUN chown jboss:jboss /opt/eap/standalone/deployments/jbpm-console.war /opt/eap/standalone/deployments/jbpm-casemgmt.war /opt/eap/standalone/deployments/kie-server.war /opt/eap/standalone/configuration/standalone-openshift.xml /opt/eap/standalone/configuration/users.properties /opt/eap/standalone/configuration/roles.properties
USER jboss


#COPY contrib/standalone.conf /opt/jboss/wildfly/bin/standalone.conf
#COPY contrib/jbpm-console.war /opt/jboss/wildfly/standalone/deployments/jbpm-console.war
#COPY contrib/kie-server.war /opt/jboss/wildfly/standalone/deployments/kie-server.war
#COPY contrib/jbpm-casemgmt.war /opt/jboss/wildfly/standalone/deployments/jbpm-casemgmt.war



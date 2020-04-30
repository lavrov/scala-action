FROM openjdk:14 as builder

COPY mill mill
COPY build.sc build.sc
COPY action action
RUN ./mill action.assembly

FROM openjdk:14

COPY --from=builder out/action/assembly/dest/out.jar /opt/action.jar

ENTRYPOINT ["java", "-jar", "/opt/action.jar"]

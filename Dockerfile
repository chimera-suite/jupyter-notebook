ARG PYSPARK_NOTEBOOK_VERSION
FROM jupyter/pyspark-notebook:${PYSPARK_NOTEBOOK_VERSION}

ARG PYSPARQL_VERSION
ARG GRAPHFRAMES_VERSION

RUN pip install PySPARQL==${PYSPARQL_VERSION}

COPY --chown=$NB_UID:$NB_GID examples examples

USER root

RUN wget --directory-prefix /usr/local/spark/jars \
    http://dl.bintray.com/spark-packages/maven/graphframes/graphframes/${GRAPHFRAMES_VERSION}/graphframes-${GRAPHFRAMES_VERSION}.jar

USER $NB_UID

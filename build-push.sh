#! /bin/bash

PYSPARQL_VERSION=0.0.6

# SPARK_VERSION="spark2.4.0-hadoop2.7"    PYSPARK_NOTEBOOK_VERSION="65761486d5d3"     GRAPHFRAMES_VERSION="0.8.1-spark2.4-s_2.11"
# SPARK_VERSION="spark2.4.1-hadoop2.7"    PYSPARK_NOTEBOOK_VERSION="f646d2b2a3af"     GRAPHFRAMES_VERSION="0.8.1-spark2.4-s_2.11"
# SPARK_VERSION="spark2.4.3-hadoop2.7"    PYSPARK_NOTEBOOK_VERSION="82d1d0bf0867"     GRAPHFRAMES_VERSION="0.8.1-spark2.4-s_2.11"
# SPARK_VERSION="spark2.4.4-hadoop2.7"    PYSPARK_NOTEBOOK_VERSION="3deefc7d16c7"     GRAPHFRAMES_VERSION="0.8.1-spark2.4-s_2.11"
# SPARK_VERSION="spark2.4.5-hadoop2.7"    PYSPARK_NOTEBOOK_VERSION="76402a27fd13"     GRAPHFRAMES_VERSION="0.8.1-spark2.4-s_2.11"
# SPARK_VERSION="spark3.0.0-hadoop3.2"    PYSPARK_NOTEBOOK_VERSION="6d42503c684f"     GRAPHFRAMES_VERSION="0.8.1-spark3.0-s_2.12"
# SPARK_VERSION="spark3.0.1-hadoop3.2"    PYSPARK_NOTEBOOK_VERSION="5cfa60996e84"     GRAPHFRAMES_VERSION="0.8.1-spark3.0-s_2.12"

echo "Enter you dockerhub credentials"
read -p "Username:" username
read -s -p "Password:" password
echo ""

echo "${password}" | docker login --username "${username}" --password-stdin

docker build \
    --build-arg "PYSPARK_NOTEBOOK_VERSION=${PYSPARK_NOTEBOOK_VERSION}" \
    --build-arg "GRAPHFRAMES_VERSION=${GRAPHFRAMES_VERSION}" \
    --build-arg "PYSPARQL_VERSION=${PYSPARQL_VERSION}" \
    --tag "chimerasuite/jupyter-notebook:pysparql${PYSPARQL_VERSION}-${SPARK_VERSION}" \
	.

docker push "chimerasuite/jupyter-notebook:pysparql${PYSPARQL_VERSION}-${SPARK_VERSION}"
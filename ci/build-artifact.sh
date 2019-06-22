#!/usr/bin/env bash
set -eux

export ROOT_FOLDER=$(pwd)

M2_HOME="${HOME}/.m2"
M2_CACHE="${ROOT_FOLDER}/maven"
GRADLE_HOME="${HOME}/.gradle"
GRADLE_CACHE="${ROOT_FOLDER}/gradle"

echo "Generating symbolic links for caches"
[[ -d "${M2_CACHE}" && ! -d "${M2_HOME}" ]] && ln -s "${M2_CACHE}" "${M2_HOME}"
[[ -d "${GRADLE_CACHE}" && ! -d "${GRADLE_HOME}" ]] && ln -s "${GRADLE_CACHE}" "${GRADLE_HOME}"

cd git-repo
./gradlew build
cp build/libs/*.jar ../artifact-dir/${base_name}.jar
ls ../artifact-dir
cp -r ../git-repo/* ../sonarqube-analysis-input/
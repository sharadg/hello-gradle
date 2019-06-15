#!/usr/bin/env bash
set -e

cd git-repo
./gradlew build
cp build/libs/*.jar ../artifact-dir/${base_name}.jar
ls ../artifact-dir
cp -r ../git-repo/* ../sonarqube-analysis-input/

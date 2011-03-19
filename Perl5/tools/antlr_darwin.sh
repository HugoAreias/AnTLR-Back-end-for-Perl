#!/bin/sh

ANTLR_HOME=`dirname "$0"`/../../..

java -Dfile.encoding=windows-1252 \
    -classpath "$ANTLR_HOME/tool/target/classes:$ANTLR_HOME/src/main/java:$ANTLR_HOME/tool/target/antlr-3.2.jar:$ANTLR_HOME/target/antlr-master-3.2-completejar.jar" \
    org.antlr.Tool \
    $@

ANIMEXEC_TOP=~/workspace/AnimJavaExec
JAVAUTIL_TOP=~/workspace/JavaUtils
JAR_NAME=animexe.jar
JAVAUTIL_NAME=javautils.jar
CURDIR=`pwd`

echo "We take stuff from $ANIMEXEC_TOP"
echo "Clean stuff in $ANIMEXEC_TOP/bin (default package...). No class would stay at top level bin dir."
## NO RECURSE !
\rm  -f $ANIMEXEC_TOP/bin/* 
echo "***VERIFIER LES PROPERTIES ***"
echo "Copying localized bundles files"

cp "$ANIMEXEC_TOP/src/fr/loria/madynes/animjavaexec/MessagesBundle_en.properties"  "$ANIMEXEC_TOP/bin/fr/loria/madynes/animjavaexec/MessagesBundle_en.properties"
echo "US messages bundle is the default (an unique for now !)"
cp "$ANIMEXEC_TOP/src/fr/loria/madynes/animjavaexec/MessagesBundle_en.properties"  "$ANIMEXEC_TOP/bin/fr/loria/madynes/animjavaexec/MessagesBundle.properties"
# No french messages for now
##cp "$ANIMEXEC_TOP/src/simulip/gui/MessagesBundle_fr.properties"  "$ANIMEXEC_TOP/bin/simulip/gui/MessagesBundle_fr.properties"

rm -f "$JAR_NAME"
cd "$ANIMEXEC_TOP/bin"
## jar is a pain. A file could be produced using find...
jar cfe   "$CURDIR/$JAR_NAME"  fr.loria.madynes.animjavaexec.Main *

echo "Adding javautils stuff"
cd "$JAVAUTIL_TOP/bin"
## JavaUtils lib
jar uf   "$CURDIR/$JAR_NAME" *


echo "Building javautil jar"
cd "$JAVAUTIL_TOP/bin"
###jar uf  "$CURDIR/$JAR_NAME" *
jar cf "$CURDIR/$JAVAUTIL_NAME" *

# One-jar lib for animexec. Does not work. runanimjavaexec.sh
#cd "$CURDIR"
#jar tf    "$JAR_NAME"
#cd root; jar -cvfm ../animexe-onejar.jar boot-manifest.mf .


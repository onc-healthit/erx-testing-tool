#!/bin/sh
mkdir dist
cd dist
cp ../hit-base-tool-1.2.37.arc .
cp ../ncpdp-erx-resource-bundle-1.0.3.jar .
jar xvf hit-base-tool-1.2.37.arc  WEB-INF/lib
cp ncpdp-erx-resource-bundle-1.0.3.jar WEB-INF/lib
jar uvf hit-base-tool-1.2.37.arc  WEB-INF/lib
mv hit-base-tool-1.2.37.arc hit-base-tool-1.2.37.war
rm -rf WEB-INF
rm ncpdp-erx-resource-bundle-1.0.3.jar

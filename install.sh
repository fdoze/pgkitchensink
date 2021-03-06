#!/usr/bin/env sh
echo "This script downloads required JavaScript libraries"

# Constants
LIBS=_libs

# If the "_libs" directory exists, delete it
if [ -d "$LIBS" ]; then
  rm -r $LIBS
fi

# Create the directory
mkdir $LIBS




echo
echo "###############################"
echo "#"
echo "# Downloading jQuery Mobile"
echo "#"
echo "###############################"
curl http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.zip --output $LIBS/jqm.zip

# Extract zip file contents
unzip $LIBS/jqm.zip -d $LIBS

# Rename the folder
mv $LIBS/jquery.mobile-1.1.0 $LIBS/jqm/

# Remove the zip file
rm $LIBS/jqm.zip

# Download jQuery itself
curl http://code.jquery.com/jquery-1.7.2.min.js --output $LIBS/jqm/jquery-1.7.2.min.js




echo
echo "###############################"
echo "#"
echo "# Downloading PhoneGap"
echo "#"
echo "###############################"
curl https://github.com/phonegap/phonegap/zipball/1.7.0 --location --output $LIBS/phonegap.zip

# Extract the contents of the zip file
unzip $LIBS/phonegap.zip -d $LIBS

# Rename the folder
mv $LIBS/phonegap-phonegap-475bfd2/ $LIBS/phonegap

# Remove the zip file
rm $LIBS/phonegap.zip




echo
echo "###############################"
echo "#"
echo "# Copying files to the Xcode project"
echo "#"
echo "###############################"
cp -R www/* native/iOS/KitchenSink/www
cp -R _libs native/iOS/KitchenSink/www
rm -r native/iOS/KitchenSink/www/_libs/phonegap





echo
echo "###############################"
echo "#"
echo "# Copying files to the Android project"
echo "#"
echo "###############################"
cp -R www/* native/Android/KitchenSink/assets/www
cp -R _libs native/Android/KitchenSink/assets/www
rm -r native/Android/KitchenSink/assets/www/_libs/phonegap
mv native/Android/KitchenSink/assets/www/_libs native/Android/KitchenSink/assets/www/libs_






echo
echo "###############################"
echo "#"
echo "# Copying files to the Windows Phone project"
echo "#"
echo "###############################"
cp -R www/* native/Windows\ Phone/KitchenSink/KitchenSink/www
cp -R _libs native/Android/KitchenSink/assets/www
rm -r native/Android/KitchenSink/assets/www/_libs/phonegap


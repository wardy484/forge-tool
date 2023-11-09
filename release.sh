#!/bin/bash

# Check if a version argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

VERSION=$1
APP_NAME="forge"

# Backup original files
cp pubspec.yaml pubspec.yaml.backup
cp dist/appcast.xml dist/appcast.xml.backup

# Step 1: Update pubspec.yaml with the new version
sed -i '' "s/version:.*/version: $VERSION/g" pubspec.yaml

# Step 2: Run flutter_distributor
if ! flutter_distributor release --name dev --jobs release-macos; then
    echo "Error: flutter_distributor command failed."
    exit 1
fi

# Step 3: Run auto updater and extract signature and length
output=$(dart run auto_updater:sign_update dist/$VERSION/$APP_NAME-$VERSION-macos.zip)
if [ $? -ne 0 ]; then
    echo "Error: auto_updater command failed."
    exit 1
fi
# Extracting the signature
signature=$(echo "$output" | grep 'sparkle:edSignature' | sed 's/.*sparkle:edSignature="//' | sed 's/".*//')

# Extracting the length
length=$(echo "$output" | grep 'length=' | sed 's/.*length="//' | sed 's/".*//')

# Step 4: Update appcast.xml
current_time=$(date +"%a, %d %b %Y %H:%M:%S %z")
# Define new item
new_item="<item>\
    <title>Version $VERSION</title>\
    <sparkle:releaseNotesLink>\
        https://forgebuddy.com/release_notes.html\
    </sparkle:releaseNotesLink>\
    <pubDate>$current_time</pubDate>\
    <enclosure url=\"$VERSION/$APP_NAME-$VERSION-macos.zip\"\
        sparkle:edSignature=\"$signature\"\
        sparkle:version=\"$VERSION\"\
        sparkle:os=\"macos\"\
        length=\"$length\"\
        type=\"application/octet-stream\" />\
</item>"

# Insert new item into appcast.xml just before the closing </channel> tag
sed -i '' "/<\/channel>/i\\
$new_item\
" dist/appcast.xml

echo "Release process completed for version $VERSION"

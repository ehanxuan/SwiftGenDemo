#!/bin/sh
#===============================================================================
# SwiftGen Batch Script
#===============================================================================

SCRIPT_DIR=$(cd $(dirname $0);pwd)
RESOURCES_DIR=$SCRIPT_DIR/SwiftGenDemo/Resources

# Strings
GEN_STRINGS_SRC=$RESOURCES_DIR/Localizable.strings
GEN_STRINGS_DST=$RESOURCES_DIR/Localizable.swift

# Assets
GEN_ASSETS_SRC=$RESOURCES_DIR/Assets.xcassets
GEN_ASSETS_DST=$RESOURCES_DIR/Assets.swift

# Colors
GEN_COLORS_SRC=$RESOURCES_DIR/Colors.txt
GEN_COLORS_DST=$RESOURCES_DIR/Colors.swift

echo "##### Check swiftgen installation #####"
if which swiftgen >/dev/null; then
  echo "swiftgen is installed."
else 
  echo "swiftgen is not installed."
  exit 1
fi

echo "##### Generate #####"
swiftgen strings -t swift3 --output $GEN_STRINGS_DST $GEN_STRINGS_SRC
swiftgen images -t swift3 --output $GEN_ASSETS_DST $GEN_ASSETS_SRC
swiftgen colors -t swift3 --output $GEN_COLORS_DST $GEN_COLORS_SRC

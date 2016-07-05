#! /bin/bash
#-workspace swipeToRedeem.xcworkspace

TEST_CMD="xcodebuild -scheme swipeToRedeemUITests -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6S,OS=9.3' build test"

which -s xcpretty
XCPRETTY_INSTALLED=$?

if [[ $TRAVIS || $XCPRETTY_INSTALLED == 0 ]]; then
  eval "${TEST_CMD} | xcpretty"
else
eval "$T
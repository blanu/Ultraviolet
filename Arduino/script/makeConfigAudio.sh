pushd ~/Clockwork
INPUT=~/Documents/Arduino/libraries/Audio_-_Adafruit_Fork
OUTPUT=~/Ultraviolet/Arduino/Ultraviolet
CLASS=`grep class $INPUT/$1 | head -n 1 | awk '{print $2}'`
echo "$1 $CLASS"
swift run ClockworkCommandLine new $CLASS.config --cpp-messages $OUTPUT --cpp-server $OUTPUT --cpp-module $OUTPUT --cpp-universe $OUTPUT $INPUT/$1
mv $CLASS.config ~/Ultraviolet/Arduino/config/
popd


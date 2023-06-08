pushd ~/Clockwork
INPUT=~/Documents/Arduino/libraries/$1
OUTPUT=~/Ultraviolet/Arduino/UltravioletArduino
CLASS=`grep class $INPUT/$2 | head -n 1 | awk '{print $2}'`
echo "$2 $CLASS"
swift run ClockworkCommandLine new $CLASS.config --cpp-messages $OUTPUT --cpp-server $OUTPUT --cpp-module $OUTPUT --cpp-universe $OUTPUT $INPUT/$2
mv $CLASS.config ~/Ultraviolet/Arduino/config/
popd


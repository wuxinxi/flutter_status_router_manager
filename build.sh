flutter build apk --dart-define=env=$1
cd build/app/outputs/apk/release/
cp -R *.apk /Users/sensiwu/AndroidProject/Tangren/router/fluro/apk/$1/
cd /Users/sensiwu/AndroidProject/Tangren/router/fluro/apk/$1/
open .
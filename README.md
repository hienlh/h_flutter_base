# Before starting

```flutter pub run build_runner build```

# Setup ENV

For VScode

`code .vscode/launch.json`

For Intellj

`Updating...`

# Firebase configure

Staging

`flutterfire configure -a com.hienlh.flutter.stg -i com.hienlh.flutter.stg -m com.hienlh.flutter.stg`

Production 

`flutterfire configure -a com.hienlh.flutter -i com.hienlh.flutter -m com.hienlh.flutter`


# Generate app icons

`flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-production.yaml`
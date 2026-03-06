# MentallyAiProjectProductionVersion

This is frond-end part and the back-end part in one repo

make a new file name `.env`
and adding the ip of the app server 
```
IpServer=<ip>
```

```
flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations"
// and
flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations" -o "locale_keys.dart" -f keys
``` 
<br>

if the there problem with `gradle` in your device, we use `Java JDK-21`

```
./gradlew clean build
```

To set or change the splash screen, write this code

```
flutter pub run flutter_native_splash:create
```

to run without error 
```
flutter run --release
```

# Setup the backend env

go to `.env.example` 

and set this information from pgAdmin for example

```
Gemini_API_KEY=YourGeminiApiKey
PORT=YourPostgresPort
pgUser=YourPostgresUser
pgPassword=YourPassword
pgHost=YourPostgresHost
pgPort=YourPostgresPort
pgDataBase=YourPostgresNameOfDatabase
```

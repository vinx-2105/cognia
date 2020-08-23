# cognia
A project for the development engineering course

For running, make sure your phone and server device are on the same network

The backend folder has the code for the django server.

cd backend
pip3 install -r requirements.txt
cd congia
python3 manage.py runserver 0.0.0.0:8000

This will run your server on 

For the frontend, change the IP Address in cognia/frontend/cognia_app/lib/CREDS.json to the IP Address (and port number) of the device on which the server is running

Thereafter generate the APK using 'flutter build apk' command

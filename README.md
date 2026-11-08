# Lernquizze (statische Seite hinter Passwortschutz)

## Aufbau
- `site/index.html`: Übersicht aller Quizze
- `site/gwb-1/index.html`: Quiz GWB 1. Klasse
- `site/robots.txt`: sperrt Suchmaschinen
- `nginx.conf`: Passwortschutz, Sicherheits-Header, keine Access-Logs
- `40-htpasswd.sh`: erzeugt beim Start aus `QUIZ_PASSWORD` die Passwortdatei
- `Dockerfile`: läuft als normaler Benutzer (nicht root) auf Port 8080

## Neues Quiz hinzufügen
1. Ordner `site/<name>/index.html` anlegen.
2. In `site/index.html` einen Link ergänzen.
3. Ins Repository pushen, Coolify veröffentlicht automatisch.

## Coolify-Einstellungen
- Build Pack: Dockerfile
- Ports Exposes: 8080
- Domain: https://gwb-quiz.luisaheinrich.com
- Environment Variable: `QUIZ_PASSWORD` (langer Klassencode), optional `QUIZ_USER` (Standard: klasse)
- Keine Persistent Storage, kein Docker-Socket, nicht mit anderen Netzwerken verbinden
- Health Check (optional): Pfad `/healthz`, Port 8080

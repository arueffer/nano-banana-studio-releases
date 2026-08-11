# 🍌 Nano Banana Studio — Releases

Mac-App für Googles Bildmodelle (Nano Banana / Gemini): Chat-Oberfläche statt
Formular, Referenzbilder per Drag & Drop, Seitenverhältnis und Auflösung mit einem
Klick, mehrere Entwürfe pro Prompt — und alle Bilder landen sortiert in dem Ordner,
den du wählst.

Hier liegen ausschließlich die fertigen Builds. Der Quellcode liegt nicht in diesem
Repository; es ist öffentlich, damit die App ohne Zugangstoken nach Updates suchen kann.

## Kurzfassung

1. [Neueste Version laden](../../releases/latest) und die App in den Programme-Ordner ziehen
2. Beim ersten Start: **Rechtsklick → Öffnen** (nicht Doppelklick)
3. In der App: Einstellungen → eigenen Google-AI-API-Key eintragen

## Voraussetzungen

- **Mac mit Apple Silicon** (M1 oder neuer). Nachsehen unter  → *Über diesen Mac*.
- **Ein eigener Google-AI-API-Key.** Jede Person braucht einen eigenen, die Nutzung
  wird darüber abgerechnet. Kostenlos anlegen unter https://aistudio.google.com/apikey

## Die Warnung von macOS

Die App ist **nicht von Apple beglaubigt** — das setzt einen kostenpflichtigen
Apple-Developer-Account voraus. macOS blockiert sie deshalb beim ersten Start. Das ist
eine Formalie, aber du musst einmalig bestätigen:

**„… Entwickler kann nicht verifiziert werden"** → Rechtsklick auf die App →
*Öffnen* → im Dialog nochmals *Öffnen*. Doppelklick genügt hier nicht.
Fehlt der Knopf: Systemeinstellungen → *Datenschutz & Sicherheit* → ganz unten
*Trotzdem öffnen*.

**„… ist beschädigt"** → das ist nur die Quarantäne-Markierung geladener Dateien.
Einmalig im Terminal:

```bash
xattr -dr com.apple.quarantine "/Applications/Nano Banana Studio.app"
```

## Einrichten

Beim ersten Start führt die Übersicht Schritt für Schritt hindurch.

- **API-Key** (nötig) — Einstellungen → *Google AI API-Key*. Wird sofort geprüft.
- **Bildordner** (optional) — am besten ein Cloud-Ordner. Die App sortiert automatisch
  nach `Kunde/Projekt/Chat`.
- **Jira** (optional) — Adresse eurer Jira-Instanz plus Login. Danach lassen sich Chats
  Tickets zuordnen. Die Zugangsdaten bleiben lokal auf dem Rechner.

## Updates

Die App meldet neue Versionen selbst. Weil sie nicht signiert ist, kann sie sich nicht
selbst aktualisieren — sie verlinkt die neue Fassung, die wie oben installiert wird.
Chats, Bilder und Einstellungen bleiben erhalten.

## Wo liegen meine Daten?

- Chats und Einstellungen: `~/Library/Application Support/nano-banana-studio/`
- Bilder: im gewählten Ordner, standardmäßig `~/Pictures/Nano Banana Studio`

API-Key und Jira-Passwort stehen in `config.json` mit Dateirechten `600`, sind also nur
für das eigene Benutzerkonto lesbar, und gehen ausschließlich an Google bzw. an die
eingetragene Jira-Adresse.

# Nano Banana Studio — Releases

Hier liegen ausschließlich die fertigen Mac-Builds von **Nano Banana Studio**,
einer Oberfläche für Googles Nano-Banana-/Gemini-Bildmodelle.

Der Quellcode liegt nicht hier. Dieses Repository ist öffentlich, damit die App
ohne Zugangstoken nach Updates suchen kann.

## Installieren

Unter [Releases](../../releases) das neueste `.dmg` laden, öffnen und die App in
den Programme-Ordner ziehen.

Die App ist **nicht von Apple beglaubigt**. Beim ersten Start deshalb:

- Rechtsklick auf die App → *Öffnen* → im Dialog nochmals *Öffnen*
- Falls macOS „ist beschädigt" meldet, einmalig im Terminal:

```bash
xattr -dr com.apple.quarantine "/Applications/Nano Banana Studio.app"
```

## Einrichten

Beim ersten Start führt die Übersicht durch die Einrichtung. Nötig ist ein
eigener Google-AI-API-Key von https://aistudio.google.com/apikey — die Nutzung
wird darüber abgerechnet, jede Person braucht also einen eigenen.

Optional lassen sich ein Speicherort für die Bilder (z. B. ein Cloud-Ordner) und
ein Jira-Zugang hinterlegen, um Chats Tickets zuzuordnen.

## Systemvoraussetzung

macOS auf Apple Silicon (M1 oder neuer).

---
name: nano-banana
description: Bilder erzeugen und überarbeiten mit Nano Banana Studio (Googles Gemini-Bildmodelle) über die MCP-Anbindung — Entwürfe, Charakterdesigns, Mockups, Key Visuals, Bannermotive. Auslösen, sobald Alexander ein Bild will („mach mir ein Bild von…", „entwirf…", „visualisiere…", „Charakter…", „Mockup…") oder ein vorhandenes Bild ändern möchte. Nicht auslösen für reine Diagramme, Screenshots oder Code-Grafiken.
---

# Bilder mit Nano Banana Studio

Die Werkzeuge heißen `mcp__nano-banana__*`. Sie steuern die App auf Alexanders Mac.
Was du erzeugst, erscheint sofort in seinem Fenster — er kann jederzeit selbst
weiterarbeiten.

## Vor dem ersten Bild

`list_chats` aufrufen. Passt ein bestehender Chat zum Thema, dort weitermachen statt
einen neuen anzulegen. Bei Problemen (Bild kommt nicht, Fehler) `studio_status`.

**Kunde und Projekt immer setzen**, sobald sie bekannt sind. Danach richtet sich der
Ablageort: Die Bilder landen unter `Kunde/Projekt/Chat`, bei bekannten Projekten
automatisch im richtigen Nextcloud-Ordner. Ohne die Angaben liegen sie im Standardordner
und müssen später umsortiert werden.

## Kosten — nicht nebensächlich

Jedes Bild kostet echtes Geld, abgerechnet über Alexanders API-Key.

| | 1K | 4K |
|---|---|---|
| Nano Banana 2 (Standard) | 0,067 $ | 0,151 $ |
| Nano Banana Pro | 0,134 $ | 0,24 $ |

Multipliziert mit der Zahl der Entwürfe.

- **Entwürfe und Zwischenschritte:** Standard lassen (`gemini-3.1-flash-image`, 1K, 1 Entwurf).
- **Erst wenn das Motiv sitzt:** auf `gemini-3-pro-image` und 4K hochschalten.
- **Pro nutzen**, wenn viele Details gleichzeitig stimmen müssen (Text im Bild, exakte
  Merkmale) — das schnelle Modell überliest Vorgaben eher.
- **Vor Serien** (mehr als fünf Bilder oder 4K mit mehreren Entwürfen) kurz die
  ungefähren Kosten nennen und zustimmen lassen.

## Prompts

Englisch und konkret formulieren, das trifft besser. Motiv, Bildausschnitt, Stil, Licht
und Hintergrund benennen. Bei Figuren „full figure visible head to toe" ergänzen, sonst
schneidet das Modell gern ab.

Seitenverhältnis passend wählen: `16:9` Präsentation, `9:16` App-Screen und Reel,
`1:1` Social, `3:4` Charakterbogen, `8:1`/`4:1` Banner.

## Zusammenhängende Bildserien

Damit Figuren, Stil oder Produkte über mehrere Bilder gleich aussehen:

- `referenceImages` mit den `/media/`-URLs aus `get_chat` füllen — mehrere möglich. So
  bringst du etwa drei einzeln erzeugte Charaktere in ein gemeinsames Bild.
- Im Prompt ausdrücklich sagen, dass die Vorlagen übernommen werden sollen
  („keep each character exactly as shown in the reference images").
- Für Varianten desselben Bildes `continueFromLast: true`.

Erwarte trotzdem leichte Abweichungen bei Details — darauf hinweisen, statt sie zu
übergehen.

## Videos — teuer, deshalb mit Ansage

Seit 1.11.0 gibt es `generate_video` (Google Veo 3.1): 4 bis 8 Sekunden, mit Ton,
in 16:9 oder 9:16. Ein Video kostet ein Vielfaches eines Bildes:

| | 720p | 1080p | 4K |
|---|---|---|---|
| Veo 3.1 Lite (Standard) | 0,05 $/s | 0,08 $/s | kann es nicht |
| Veo 3.1 Fast | 0,10 $/s | 0,12 $/s | 0,30 $/s |
| Veo 3.1 | 0,40 $/s | 0,40 $/s | 0,60 $/s |

Vier Sekunden Lite in 720p sind 0,20 $, acht Sekunden im großen Modell in 4K sind
4,80 $ — das Vierundzwanzigfache eines Bildes.

- **Immer vorher den Betrag nennen und zustimmen lassen.** Nicht einfach erzeugen,
  auch nicht „zum Ausprobieren".
- Liegt der Betrag über der in der App gesetzten Grenze, lehnt der Server ab. Dann
  den Betrag nennen und erst nach ausdrücklichem Ja `confirmed: true` setzen.
- **Aus einem fertigen Bild ein Video machen** (`startImage` mit der `/media/`-URL)
  ist meist besser, als das Motiv neu beschreiben zu lassen: Das Bild ist schon
  abgestimmt, und Bildentwürfe kosten Cent statt Euro.
- Der Prompt beschreibt **Bewegung**, nicht das Motiv: Kamerafahrt, Tempo, was sich
  im Bild verändert.
- **Ich sehe das Video nicht.** Anders als bei Bildern kommt nur der Pfad zurück.
  Also sagen, wo es liegt, und um Sichtung bitten — nicht so tun, als hätte ich es
  beurteilt.

## Ergebnisse

Du bekommst die Bilder zurück und siehst sie. **Sieh sie dir an und sag ehrlich, was
abweicht** — fehlende Merkmale aus dem Prompt, abgeschnittene Figuren, falsche Farben.
Nicht blind weitergenerieren: Erst benennen, dann fragen oder gezielt nachbessern.

Am Ende die Chat-ID nennen, damit Alexander in der App weiterarbeiten kann.

## Randfälle

- **„Ordner nicht synchronisiert"** — der Nextcloud-Ordner des Chats ist gerade nicht da.
  Nicht umgehen, sondern Alexander sagen; er aktiviert die Synchronisierung wieder.
- **„API-Key ungültig"** — er muss ihn in den Einstellungen erneuern, du kannst nichts tun.
- **Aufräumen** — `archive_chat` statt Löschen vorschlagen: behält die Bilder.

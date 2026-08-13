#!/bin/sh
# Startet den MCP-Server aus der installierten App.
#
# Zwei Dinge nimmt uns das ab: Erstens muss niemand Node.js installieren – die
# App bringt über Electron ihre eigene Laufzeit mit (ELECTRON_RUN_AS_NODE).
# Zweitens muss niemand einen Pfad eintragen; wo die App liegt, suchen wir.
set -eu

APP=""
for candidate in \
  "/Applications/Nano Banana Studio.app" \
  "$HOME/Applications/Nano Banana Studio.app"
do
  if [ -d "$candidate" ]; then APP="$candidate"; break; fi
done

# Verschoben oder umbenannt: Spotlight kennt die Bundle-ID.
if [ -z "$APP" ] && command -v mdfind >/dev/null 2>&1; then
  APP=$(mdfind "kMDItemCFBundleIdentifier == 'de.2wmedia.nanobananastudio'" 2>/dev/null | head -1)
fi

if [ -z "$APP" ] || [ ! -d "$APP" ]; then
  echo "Nano Banana Studio wurde nicht gefunden." >&2
  echo "Die App installieren: https://github.com/arueffer/nano-banana-studio-releases/releases/latest" >&2
  exit 1
fi

SERVER="$APP/Contents/Resources/app/mcp/server.mjs"
if [ ! -f "$SERVER" ]; then
  echo "Die installierte Fassung von Nano Banana Studio bringt keinen MCP-Server mit." >&2
  echo "Nötig ist 1.9.2 oder neuer: https://github.com/arueffer/nano-banana-studio-releases/releases/latest" >&2
  exit 1
fi

# Fassungen vor 1.9.2 haben eine unvollständige Signatur. Die App startet zwar,
# aber als Node-Laufzeit bricht macOS sie wortlos mit SIGKILL ab – hier lieber
# vorher nachsehen (kostet Millisekunden) als eine rätselhafte Fehlermeldung.
if ! codesign --verify "$APP" >/dev/null 2>&1; then
  if command -v node >/dev/null 2>&1; then
    exec node "$SERVER" "$@"
  fi
  echo "Diese Fassung von Nano Banana Studio lässt sich nicht als Laufzeit verwenden." >&2
  echo "Bitte auf 1.9.2 oder neuer aktualisieren:" >&2
  echo "https://github.com/arueffer/nano-banana-studio-releases/releases/latest" >&2
  exit 1
fi

ELECTRON_RUN_AS_NODE=1 exec "$APP/Contents/MacOS/Nano Banana Studio" "$SERVER" "$@"

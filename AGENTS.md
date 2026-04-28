# AI Coding Agent Guide - Job-Applier Bot
Antworte auf deutsch.

This guide helps AI agents understand the architecture and conventions of the `Job-Applier Bot` project to be immediately productive.

## 🚀 Mission & MVP Vision
SaaS-Tool zur automatisierten Bewerbungsgenerierung. Python-Monorepo.

## 🔧 Tech Stack
- **Sprache**: Python 3.12
- **Wichtige Libraries**: `python-jobspy`, `anthropic` SDK, `pandas`, `APScheduler`
- **Datenbank**: SQLite
- **Testing & Linting**: `pytest` für Tests, `ruff` für Linting

## 🏗️ Architektur
- `/scraper/` — JobSpy-Wrapper
- `/ai/` — Prompt-Builder + Anthropic-Client
- `/prompts/` — Alle System/User-Prompts als `.md`-Dateien
- `/output/` — Excel/SQLite-Output

## 🛠️ Commands
- `make run` — Pipeline starten
- `make test` — pytest run
- `make lint` — ruff check .

## 📏 Project Conventions
- **Clean Code**: Funktionen < 30 Zeilen, keine Klassen wo Functions reichen.
- **Error Handling**: Fehler immer explicit loggen, kein `bare except`.
- **Prompts**: Prompts befinden sich ausschließlich in `/prompts/*.md`, nie hardcoded im Code.
- **Testing**: NEVER committen ohne passing tests.

## 🚦 Operational Rules
- **Plan-First**: Vor großen Änderungen [PLAN] erstellen. Bei Unklarheiten erst Interview-Fragen stellen (Edge Cases, Tradeoffs), um Annahmen zu externalisieren. Execution erst nach Review/Bestätigung.
- **Search-First**: MCP-Check (Tavily/Context7) vor internem Wissen für State-of-the-Art (z.B. aktuelle Docs zu Anthropic SDK API oder JobSpy).
- **Clean Code**: SOLID, DRY, Typsicherheit. "DONE" = `make test` & `make lint` sind fehlerfrei.
- **Self-Correction**: Max. 3 Iterationen bei Fehlern, dann Rücksprache.

## 🤝 Human-in-the-Loop
`[WAIT_FOR_CONFIRMATION]` erforderlich bei:
- Destruktiven Änderungen an der SQLite Datenbank oder Datenstrukturen.
- Refactorings zentraler Architekturkomponenten.
- Aktualisierung oder Einführung neuer Core-Libraries.
- Änderungen an Prompts im `/prompts/` Verzeichnis.

## 🔌 MCP Integrations & Research Tools
Um den "Search-First"-Ansatz und die "State of the Art"-Anforderung zu erfüllen, stehen folgende MCP (Model Context Protocol) Server zur Verfügung:

- **Tavily**: Primäres Tool für Echtzeit-Websuche nach aktuellen Python-Trends.
- **Context7**: Spezialisiert auf die Abfrage aktueller Dokumentationen und Code-Beispiele für Frameworks/Libraries (besonders nützlich für `anthropic` und `jobspy`).
- **GitHub**: Zugriff auf Repositories für Issue-Tracking, Code-Search und Pull Requests.

### 🧠 Research-Strategie & MCP-Orchestrierung
1.  **Search-First & State of the Art**: Nutze MCP-Tools *bevor* du dich auf internes Trainingswissen verlässt.
2.  **Double-Check & Validation**: Vergleiche interne Agenten-Daten mit MCP-Ergebnissen. Bei Diskrepanzen haben die aktuellsten stabilen Docs (Context7/Tavily) Vorrang.
3.  **Effizienz**: Wähle das Tool primär nach der Informationsquelle (Web vs. Strukturierte Doku vs. Repository-Daten).

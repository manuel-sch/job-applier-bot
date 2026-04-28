# 🚀 Job-Applier Bot

[![Python 3.12+](https://img.shields.io/badge/python-3.12+-blue.svg)](https://www.python.org/downloads/)
[![Code style: ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Ein asynchrones, API-gestütztes SaaS-Backend zur automatisierten Analyse von Jobangeboten und Generierung hyper-personalisierter Bewerbungsunterlagen. 

Das System nutzt einen **Search-First & Match-Driven** Ansatz. Statt generischen Spam zu erzeugen, ermittelt LangChain die exakte Schnittmenge zwischen einem Jobprofil und dem Entwickler-CV und füllt ein deterministisches Bewerbungs-Template mit dynamischen, kontextuellen Einleitungen.

---

## ✨ Features

- 🕵️‍♂️ **Resilient Scraping**: Extraktion von Jobdaten via `python-jobspy` (LinkedIn, Indeed, Glassdoor) zur Umgehung von Standard-Bot-Protection.
- 🧠 **AI-Powered Matching**: Abgleich von Job-Description und User-CV zur Extraktion der Top-3 überlappenden Skills via Pydantic & Google Gemini 1.5 Flash.
- 🏗️ **Hybrid-Templating**: Kombination aus festem, sicherem Markdown-Lebenslauf und dynamisch generierten Anschreiben-Segmenten (Intro/Outro) zur Minimierung von LLM-Halluzinationen.
- 🛑 **Human-in-the-Loop (HITL)**: Automatisierter E-Mail-Dispatch mit Match-Score, extrahierten relevanten Keywords, den generierten Unterlagen und dem Direktlink zum Job (Review vor Absenden).
- 💾 **Local Tracking**: Persistente Speicherung aller verarbeiteten Jobs und Statuswerte in SQLite.

## 📐 Architektur-Workflow

1. **Ingestion**: Scraper sucht nach Parametern auf Jobboards.
2. **Analysis**: LangChain-Pipeline bewertet Job vs. CV. Rückgabe als strukturiertes JSON.
3. **Generation**: Injection der KI-generierten Segmente in das Basis-Template.
4. **Notification**: SMTP-Dispatch an den Endnutzer zur finalen Abnahme (HITL).

## 🛠️ Tech Stack

- **Core**: Python 3.12
- **AI & RAG**: `langchain`, `langchain-google-genai` (Gemini 1.5 Flash), `pydantic`
- **Data Ingestion**: `python-jobspy`, `pandas`
- **Task Orchestration**: `APScheduler`
- **Quality Assurance**: `pytest`, `ruff`

---

## 🚀 Getting Started

### Prerequisites
- Python 3.12+
- Google Gemini API Key
- App-Passwort (z.B. Gmail) für den SMTP Server

### Installation

1. **Repository klonen**
```bash
git clone https://github.com/manuel-sch/job-applier-bot.git
cd job-applier-bot
```

2. **Virtual Environment aufsetzen**
```bash
python -m venv .venv
# Windows:
.\.venv\Scripts\activate
# Mac/Linux:
source .venv/bin/activate
```

3. **Dependencies installieren**
```bash
make install
```

4. **Konfiguration**
```bash
cp .env.example .env
```
Fülle die `.env` Datei mit deinem Gemini API Key und deinen E-Mail-Daten.

---

## 💻 Usage

Das Projekt wird komfortabel über das Makefile gesteuert:

- **Applikation starten**:
  ```bash
  make run
  ```
- **Tests ausführen**:
  ```bash
  make test
  ```
- **Linter (Ruff) durchlaufen lassen**:
  ```bash
  make lint
  ```
- **Cache-Bereinigung**:
  ```bash
  make clean
  ```

---

## 🤝 Project Guidelines
Gehe für detaillierte System-Prompts, Coding-Conventions und Workflow-Regeln der AI-Agenten bitte in die `AGENTS.md`.

*Code Quality Standard: SOLID, DRY, Functions < 30 LOC.*


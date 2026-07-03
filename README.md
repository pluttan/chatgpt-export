<div align="center">

# chatgpt_export

**Export ChatGPT conversations to Excel**


</div>

Exports ChatGPT chat conversations to structured Excel files. Drives a real Chromium instance with `nodriver` (CDP automation) over a persistent browser profile, loads the bundled ExportGPT extension to extract conversation data from chatgpt.com, then writes each chat to an `.xlsx` file via openpyxl.

## ■ Features

- ❖ **Chat export** — extracts full conversation threads from ChatGPT
- ❖ **Excel output** — saves each chat as a structured `.xlsx` file in `output/`
- ❖ **Browser extension** — bundled ExportGPT extension (MV3 `.crx` + unpacked) for in-page extraction
- ❖ **Session persistence** — pickled cookie jars (`cookies/`) and Chromium profiles (`.browser_data/`) keep authenticated access
- ❖ **One-click run** — `run.bat` handles venv creation, dependency install, and execution

## ■ Stack

<div align="center">

| Component | Technology |
|-----------|------------|
| Automation | nodriver (Chromium via CDP) |
| Extension | ExportGPT (Chrome MV3) |
| Export | openpyxl |
| Platform | Windows (bat launcher) |

</div>

## ■ How It Works

```
1. run.bat creates a Python venv, installs dependencies, and launches export_chats.py.
2. nodriver starts a real Chromium instance using a persistent profile from .browser_data/.
3. Saved session cookies from cookies/ are loaded to maintain authenticated access to chatgpt.com.
4. The bundled ExportGPT (MV3) extension is injected into the browser for in-page conversation extraction.
5. Extracted conversation data is written to structured .xlsx workbooks in output/ via openpyxl.
```

## ■ Usage

```bash
# Windows
run.bat

# Manual
python -m venv .venv
pip install playwright openpyxl nodriver
playwright install chromium
python export_chats.py
```

> `run.bat` creates `.venv`, installs the dependencies above, and runs `export_chats.py`. Exported workbooks land in `output/`.

## ■ Repository Structure

<div align="center">

| Path | Purpose |
|------|---------|
| `run.bat` | Windows launcher (venv + deps + run) |
| `requirements.txt` | Core deps (`requests`, `openpyxl`) |
| `extension/` | ExportGPT MV3 extension (`.crx` + unpacked) |
| `cookies/` | Saved session/cookie jars |
| `.browser_data/` | Persistent Chromium profiles |
| `output/` | Generated `.xlsx` exports |

</div>

## ■ License

MIT © [pluttan](https://github.com/pluttan)

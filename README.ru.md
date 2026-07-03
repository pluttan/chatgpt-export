<div align="center">

# chatgpt_export

**Экспорт переписок ChatGPT в Excel**


</div>

Экспортирует переписки ChatGPT в структурированные Excel-файлы. Управляет реальным экземпляром Chromium через `nodriver` (автоматизация по CDP) с постоянным профилем браузера, загружает встроенное расширение ExportGPT для извлечения данных переписки с chatgpt.com, затем записывает каждый чат в файл `.xlsx` через openpyxl.

## ■ Возможности

- ❖ **Экспорт чатов** — извлекает полные потоки переписок из ChatGPT
- ❖ **Вывод в Excel** — сохраняет каждый чат как структурированный файл `.xlsx` в `output/`
- ❖ **Расширение браузера** — встроенное расширение ExportGPT (MV3 `.crx` + распакованное) для извлечения данных со страницы
- ❖ **Сохранение сессии** — сериализованные cookie-файлы (`cookies/`) и профили Chromium (`.browser_data/`) поддерживают аутентифицированный доступ
- ❖ **Запуск в один клик** — `run.bat` создаёт venv, устанавливает зависимости и запускает выполнение

## ■ Стек

<div align="center">

| Компонент | Технология |
|-----------|------------|
| Автоматизация | nodriver (Chromium via CDP) |
| Расширение | ExportGPT (Chrome MV3) |
| Экспорт | openpyxl |
| Платформа | Windows (bat launcher) |

</div>

## ■ Как это работает

```
1. run.bat создаёт виртуальное окружение Python, устанавливает зависимости и запускает export_chats.py.
2. nodriver запускает реальный экземпляр Chromium, используя постоянный профиль из .browser_data/.
3. Сохранённые cookie-файлы сессии из cookies/ загружаются для поддержания аутентифицированного доступа к chatgpt.com.
4. Встроенное расширение ExportGPT (MV3) внедряется в браузер для извлечения переписок прямо со страницы.
5. Извлечённые данные переписок записываются в структурированные книги .xlsx в output/ через openpyxl.
```

## ■ Использование

```bash
# Windows
run.bat

# Вручную
python -m venv .venv
pip install playwright openpyxl nodriver
playwright install chromium
python export_chats.py
```

> `run.bat` создаёт `.venv`, устанавливает указанные выше зависимости и запускает `export_chats.py`. Готовые книги попадают в `output/`.

## ■ Структура репозитория

<div align="center">

| Путь | Назначение |
|------|-----------|
| `run.bat` | Windows launcher (venv + deps + run) |
| `requirements.txt` | Core deps (`requests`, `openpyxl`) |
| `extension/` | ExportGPT MV3 extension (`.crx` + unpacked) |
| `cookies/` | Saved session/cookie jars |
| `.browser_data/` | Persistent Chromium profiles |
| `output/` | Generated `.xlsx` exports |

</div>

## ■ Лицензия

MIT © [pluttan](https://github.com/pluttan)

# VSCode Python 3 Template

Python 3 and venv basic setup template

```json
{
  "python.pythonPath": ".venv/bin/python3",
  "python.linting.pylintEnabled": true,
  "python.linting.enabled": true,
  "python.formatting.provider": "black"
}
```

### Setup

`python3 -m venv .venv`

### Activate venv

- macOS/Linux: `source .venv/bin/activate`
- Windows: `.venv\Scripts\activate.bat`

### Install deps

`pip3 install -r requirements.txt`

### Run script

`python3 main.py`

### Deactivate venv

`deactivate`

# Git Hooks - Einfaches Beispiel

## Was sind Git Hooks?

Git Hooks sind Skripte, die automatisch bei bestimmten Git-Aktionen ausgeführt werden. Sie ermöglichen es, Workflows zu automatisieren und Qualitätsstandards durchzusetzen.

## Unser Beispiel: Pre-Commit Hook

Der `pre-commit` Hook wird **vor jedem Commit** ausgeführt und kann den Commit verhindern, wenn bestimmte Bedingungen nicht erfüllt sind.

### Funktionen des Beispiel-Hooks

1. **TODO-Warnung**: Warnt, wenn Dateien mit TODO-Kommentaren committed werden sollen
2. **Dateigrößen-Prüfung**: Verhindert das Committen von Dateien größer als 1MB

## Installation

### Schritt 1: Hook installieren

Führe in PowerShell oder Terminal aus:

```powershell
./setup-git-hook.ps1
```

### Schritt 2: Testen

Erstelle eine Test-Datei:

```bash
echo "# TODO: Beispiel" > test-file.txt
git add test-file.txt
git commit -m "Test Commit"
```

Du solltest eine Warnung sehen!

## Manuelle Installation

Falls du den Hook manuell installieren möchtest:

1. Kopiere `.githooks/pre-commit` nach `.git/hooks/pre-commit`
2. Unter Linux/Mac: `chmod +x .git/hooks/pre-commit`

```bash
cp .githooks/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

## Warum `.githooks/` Verzeichnis?

Git Hooks im `.git/hooks/` Verzeichnis werden **nicht** versioniert. Deshalb speichern wir sie in `.githooks/` im Repository-Root, sodass:
- Sie mit dem Repository versioniert werden
- Alle Team-Mitglieder Zugriff darauf haben
- Das Setup-Skript sie nach `.git/hooks/` kopieren kann

## Hook deaktivieren

### Temporär für einen Commit

```bash
git commit --no-verify -m "Commit ohne Hook"
```

### Permanent

Lösche oder benenne die Hook-Datei um:

```bash
rm .git/hooks/pre-commit
# oder
mv .git/hooks/pre-commit .git/hooks/pre-commit.disabled
```

## Weitere Hook-Typen

- `pre-push`: Vor einem Push
- `commit-msg`: Zum Validieren der Commit-Nachricht
- `post-commit`: Nach einem erfolgreichen Commit
- `pre-rebase`: Vor einem Rebase
- `prepare-commit-msg`: Zum Bearbeiten der Standard-Commit-Nachricht

## Hook anpassen

Du kannst den `pre-commit` Hook nach deinen Bedürfnissen anpassen:

- Weitere Prüfungen hinzufügen
- Automatische Formatierung durchführen
- Tests ausführen
- Linting durchführen

### Beispiel: Commit-Nachricht Länge prüfen

Erstelle `.git/hooks/commit-msg`:

```bash
#!/bin/sh
commit_msg=$(cat "$1")
msg_length=${#commit_msg}

if [ $msg_length -lt 10 ]; then
    echo "❌ Commit-Nachricht zu kurz! (Mindestens 10 Zeichen)"
    exit 1
fi
```

## Wichtige Hinweise

- Hooks werden **nicht** ins Repository committed (`.git/hooks/` ist nicht versioniert)
- Jeder Entwickler muss die Hooks selbst installieren
- Hooks können mit `--no-verify` umgangen werden
- Für Team-weite Hooks: Verwende Tools wie `husky` (Node.js) oder `pre-commit` (Python)

## Troubleshooting

### Hook wird nicht ausgeführt

- Prüfe, ob die Datei in `.git/hooks/` liegt
- Unter Linux/Mac: Prüfe Ausführrechte mit `ls -la .git/hooks/`
- Prüfe, ob der Dateiname exakt `pre-commit` ist (ohne Endung!)
- Führe das Setup-Skript aus: `./setup-git-hook.ps1`

### "bash: command not found"

- Windows: Stelle sicher, dass Git Bash installiert ist
- Der Hook verwendet Shell-Syntax, die in Git Bash funktioniert

### Hook funktioniert unter Windows nicht

- Hooks sind Shell-Skripte und benötigen Git Bash
- Git for Windows installiert Git Bash automatisch
- PowerShell kann Hooks installieren, aber Git führt sie in Bash aus

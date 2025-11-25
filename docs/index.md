# Dokumentation - CI/CD Demo Projekt

Willkommen zur Dokumentation des GitHub CI/CD Demo-Projekts für Entwickler.

## 📚 Verfügbare Dokumentationen

### [Git Flow Quick Guide](GITFLOW.md)
Schnellreferenz für den Git Flow Workflow mit Branches, typischen Abläufen und Best Practices für:
- Branch-Struktur (main, develop, feature, release, hotfix)
- Typischer Entwicklungs-Workflow
- Release-Management

### [Git Hooks Guide](GIT-HOOKS-GUIDE.md)
Umfassende Anleitung zur Verwendung von Git Hooks in diesem Projekt:
- Was sind Git Hooks?
- Pre-Commit Hook Beispiel (TODO-Warnung, Dateigrößen-Prüfung)
- Installation und Konfiguration
- Troubleshooting und Best Practices

## 🚀 Quick Start

1. **Repository klonen:**
   ```bash
   git clone <repository-url>
   cd 2025-11-25_github-fuer-entwickler-ci-demo-solutions
   ```

2. **Git Hooks installieren:**
   ```bash
   ./setup-git-hook.ps1
   ```

3. **Mit Git Flow arbeiten:**
   ```bash
   git checkout develop
   git checkout -b feature/mein-feature
   # ... entwickeln ...
   git push origin feature/mein-feature
   ```

## 🔧 Projekt-Struktur

```
.
├── .github/
│   └── workflows/          # GitHub Actions CI/CD Workflows
├── .githooks/              # Versionierte Git Hooks
├── docs/                   # Dokumentation (dieser Ordner)
│   ├── index.md           # Diese Datei
│   ├── GITFLOW.md         # Git Flow Guide
│   └── GIT-HOOKS-GUIDE.md # Git Hooks Anleitung
├── src/                    # Quellcode
└── setup-git-hook.ps1      # Setup-Skript für Hooks
```

## 📦 CI/CD Pipeline

Dieses Projekt verwendet GitHub Actions für automatisierte Builds:

- **Build Workflow:** Erstellt bei jedem Push auf `main` oder `develop` ein versioniertes Build-Artefakt
- **Semantic Versioning:** Verwendet Git Tags für Versionierung (z.B. `v1.0.0`)
- **Artefakte:** Build-Dateien werden als ZIP mit Versionsnummer gespeichert

## 🏷️ Versionierung

Das Projekt verwendet **Semantic Versioning** (SemVer):
- `MAJOR.MINOR.PATCH` (z.B. `1.2.3`)
- Tags erstellen: `git tag -a v1.0.0 -m "Release 1.0.0"`
- Tags pushen: `git push origin v1.0.0`

## 💡 Weitere Ressourcen

- [Git Flow Cheatsheet](https://danielkummer.github.io/git-flow-cheatsheet/)
- [Semantic Versioning](https://semver.org/)
- [GitHub Actions Dokumentation](https://docs.github.com/en/actions)
- [Git Hooks Dokumentation](https://git-scm.com/docs/githooks)

## 📝 Hinweise

- Git Hooks müssen von jedem Entwickler lokal installiert werden
- Hooks können mit `git commit --no-verify` umgangen werden
- Verwende beschreibende Branch-Namen: `feature/beschreibung`, `bugfix/issue-123`
- Halte Commits klein und fokussiert

---

*Letzte Aktualisierung: November 2025*

# Git Flow Quick Guide

## Branches:
- main: production
- develop: integration
- feature/*: from develop
- release/*: for release stabilization
- hotfix/*: urgent fixes from main

## Typical flow:
1. git checkout develop
2. git checkout -b feature/foo
3. work, commit, push
4. PR -> merge into develop (CI runs)
5. When ready: create release/x.y.z from develop, test, then merge into main and tag
6. Push tag -> create release
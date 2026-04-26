---
name: minecraft-datapack-dev
description: Minecraft datapack development for Java Edition. Use when Codex needs to create, edit, debug, explain, migrate, package, or validate Minecraft data packs, including pack.mcmeta, function files, advancements, predicates, loot tables, recipes, tags, dimensions, worldgen, item modifiers, command syntax, scoreboards, storage, macros, and version-specific datapack behavior. Use for requests that mention MC datapacks, data packs, mcfunction, Minecraft commands in datapacks, or automatic lookup of Minecraft Wiki, official version docs, changelogs, snapshots, and reliable tutorials.
---

# Minecraft Datapack Dev

## Core Workflow

Start by identifying the target game edition and version. Assume Minecraft Java Edition when the user says "datapack" unless they explicitly say Bedrock. Do not guess version-sensitive syntax when the target version matters; ask for the version or browse current sources.

For any feature affected by version, use current sources before implementing. Prefer:

- Minecraft Wiki pages for data pack format, pack format numbers, command syntax, data-driven registries, predicates, loot tables, recipes, advancements, tags, and version history.
- Official Mojang/Minecraft.net release notes, snapshot notes, and changelogs for newly changed behavior.
- Well-regarded tutorials or examples only after checking primary/spec-like references, and treat them as examples rather than authority.

Read `references/datapack-checklist.md` when creating or reviewing a pack structure, packaging a zip, or debugging load errors.

## Build Or Edit Datapacks

Use the existing project layout if the user provides one. If creating a new pack, generate the smallest complete structure that satisfies the request:

```text
<pack>/
  pack.mcmeta
  data/
    <namespace>/
      function/
        ...
```

Use a lowercase namespace with only `a-z`, `0-9`, `_`, `.`, and `-`. Keep namespaces descriptive and avoid `minecraft` unless intentionally adding vanilla tags.

Prefer modern singular folder names for current versions, such as `function`, `advancement`, `loot_table`, `predicate`, `recipe`, and `item_modifier`. For older target versions, verify whether plural names are required and adapt the layout.

Write `.mcfunction` files as command-only files:

- Use one command per line.
- Omit the leading slash.
- Keep comments short and meaningful.
- Use `execute` deliberately; avoid unnecessarily broad selectors.
- Use scoreboard, storage, and tags for state instead of fragile chat/output parsing.

## Version Handling

Always align `pack.mcmeta` with the target Minecraft Java version. If the pack format number is uncertain or likely changed recently, browse and cite the source used.

When migrating a datapack:

1. Identify the source version and target version.
2. Check pack format changes and command/registry folder changes.
3. Update folder names, JSON schemas, command syntax, and tags.
4. Call out behavior changes that require in-game testing.

## Validation

Validate structurally before claiming the pack is ready:

- Confirm `pack.mcmeta` is valid JSON and has the correct pack metadata for the target version.
- Confirm every generated JSON file parses successfully.
- Confirm function references match actual file paths and namespace ids.
- Confirm tick/load hooks use `data/minecraft/tags/function/tick.json` and `load.json` for modern versions, or version-appropriate paths if older.
- Package zip files with `pack.mcmeta` at the zip root, not inside an extra parent folder.

If possible, recommend or run an in-game validation step:

```text
/reload
/datapack list
/function <namespace>:<path>
```

When the local environment cannot run Minecraft, state that validation was limited to static checks.

## Research Discipline

Browse automatically when:

- The user asks for current, latest, recent, new, snapshot, prerelease, or version-specific behavior.
- The requested feature depends on command syntax, pack format, data component format, registries, item formats, loot table format, or worldgen behavior.
- The answer should cite Minecraft Wiki, official release notes, or an external tutorial.

When citing web material, prefer direct links to the exact page used. Summarize briefly and avoid copying long passages.

## Deliverables

For implementation tasks, provide the changed files, a short usage note, and the validation performed. For generated packs, include:

- Target Minecraft Java version.
- Namespace.
- Entry points such as load/tick functions or manual functions.
- Installation note: place the folder or zip in the world's `datapacks` directory and run `/reload`.

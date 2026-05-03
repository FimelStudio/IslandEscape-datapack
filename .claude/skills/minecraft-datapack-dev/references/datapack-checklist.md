# Datapack Checklist

Use this reference when creating, reviewing, packaging, or debugging Minecraft Java Edition datapacks.

## Required Structure

- `pack.mcmeta` must be at the pack root.
- `data/<namespace>/...` holds namespaced resources.
- `data/minecraft/tags/function/load.json` runs functions after `/reload` for modern versions.
- `data/minecraft/tags/function/tick.json` runs functions every tick for modern versions.
- Generated zip files must contain `pack.mcmeta` and `data/` at the zip root.

## Static Checks

- Parse all `.json` and `.mcmeta` files.
- Verify namespace ids use valid lowercase characters.
- Verify function file paths match namespaced ids:
  - `data/demo/function/foo/bar.mcfunction` -> `demo:foo/bar`
- Verify `.mcfunction` commands do not start with `/`.
- Verify tick/load tag `values` entries point to existing functions unless intentionally optional.
- Verify target-version folder names. Some older versions used plural directories such as `functions`; modern packs use singular registry-style directories.

## Common Failure Points

- Wrong pack format for the target Minecraft version.
- Extra parent folder inside the zip.
- Plural versus singular resource folder mismatch after version migration.
- Invalid JSON trailing commas or comments.
- A function referenced by a tag, advancement, schedule, or command was renamed without updating the id.
- Commands copied from chat include a leading `/`.
- Selectors affect all entities because `distance`, `tag`, `type`, `limit`, or execution position was not constrained.

## Research Targets

Check Minecraft Wiki or official release notes for:

- Current pack format number.
- Folder names and registry names for the target version.
- Command syntax for `execute`, `data`, `item`, `loot`, `schedule`, `return`, and `function`.
- Data component and item stack syntax in current versions.
- Snapshot or prerelease changes.

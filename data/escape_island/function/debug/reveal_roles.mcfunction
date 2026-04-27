# escape_island:debug/reveal_roles  —  show all player roles
execute as @a run tellraw @a [{"selector":"@s"},{"text":" → role#"},{"score":{"name":"@s","objective":"role"}},{"text":" "},{"nbt":"Tags","entity":"@s"}]

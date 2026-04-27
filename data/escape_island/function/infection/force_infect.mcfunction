# escape_island:infection/force_infect  —  bypass threshold, enter period immediately
# Used by Phase 5 (孢子升腾) to force-infect all remaining survivors.

scoreboard players set @s spore_load 200
function escape_island:infection/_enter_period

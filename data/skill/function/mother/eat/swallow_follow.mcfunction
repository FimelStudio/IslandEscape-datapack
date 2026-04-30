# 保留兼容入口：旧逻辑会调用这个函数时，直接转入吞噬后的旁观状态。
execute as @a[tag=skill.mother.eat.target,limit=1] run function skill:mother/eat/swallow_target

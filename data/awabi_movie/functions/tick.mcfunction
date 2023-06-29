## Tick
# ツール使用検知
execute as @a[advancements={awabi_movie:on_tool_use=true}] at @s run function awabi_movie:tool/on_use

# マーカー地点表示
execute as @a if predicate awabi_movie:has_tool at @s at @e[tag=AwabiMovie.Marker-SettingUp,distance=..32] run particle dust 1 1 0 0.5 ~ ~ ~ 0 0 0 0 1 force @s
execute as @a if predicate awabi_movie:has_tool at @s at @e[tag=AwabiMovie.Marker-Start,distance=..32] run particle dust 1 0 0 1 ~ ~ ~ 0 0 0 0 1 force @s
execute as @a if predicate awabi_movie:has_tool at @s at @e[tag=AwabiMovie.Marker-End,distance=..32] run particle dust 0 0 1 1 ~ ~ ~ 0 0 0 0 1 force @s

execute as @a if predicate awabi_movie:has_tool at @s at @e[tag=AwabiMovie.Marker-Start,distance=..32] as @e[tag=AwabiMovie.Marker-End,distance=..32] if score @s AwabiMovie.Id = @e[tag=AwabiMovie.Marker-Start,sort=nearest,limit=1] AwabiMovie.Id facing entity @s eyes as @e[tag=AwabiMovie.Marker-Start,sort=nearest,limit=1] run function awabi_movie:marker_display

# 設定キャンセル
execute as @a unless predicate awabi_movie:has_tool if score @s AwabiMovie.Link matches -2147483648..2147483647 at @s as @e[tag=AwabiMovie.Marker-SettingUp,tag=AwabiMovie.Marker-Start] if score @s AwabiMovie.Link = @p AwabiMovie.Link as @p run function awabi_movie:tool/create_new/cancel
execute as @a if predicate awabi_movie:has_tool unless entity @s[tag=AwabiMovie.ToolUsing] unless data entity @s {SelectedItem:{AwabiMovie:{Tool:{Level:0}}}} run function awabi_movie:tool/reset_level

# モード切り替え
execute as @a if predicate awabi_movie:mode_swap at @s run function awabi_movie:tool/swap_mode

# 特殊動作: Q
execute as @a if score @s AwabiMovie.PressedQ matches 1.. at @s anchored eyes positioned ^ ^ ^ if entity @e[type=item,distance=..0.5] at @s run function awabi_movie:tool/press_q

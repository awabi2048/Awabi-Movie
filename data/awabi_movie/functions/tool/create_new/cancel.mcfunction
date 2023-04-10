## CreateNew - Cancel
# kill
execute as @e[tag=AwabiMovie.Marker-SettingUp] if score @s AwabiMovie.Link = @p AwabiMovie.Link run kill @s

# フラグリセット
scoreboard players reset @s AwabiMovie.Link
tag @s remove AwabiMovie.ToolUsing

# tellraw・演出
tellraw @s [{"text": "[","color": "white"},{"text": "AwabiMovie","color": "green"},{"text": "]","color": "white"},{"text": " ムービーの新規作成をキャンセルしました。"}]
playsound ui.button.click master @s ~ ~ ~ 0.5 0.75


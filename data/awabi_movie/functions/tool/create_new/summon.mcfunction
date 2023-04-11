## CreateNew - Level 1 ~ 2
#> 設定用紐づけID
execute store result score @s AwabiMovie.Link run data get entity @s UUID[0]

#> Marker召喚, 座標計算
summon marker ~ ~ ~ {Tags:["AwabiMovie.Marker","AwabiMovie.Marker-SettingUp"]}
scoreboard players operation @e[tag=AwabiMovie.Marker-SettingUp,sort=nearest,limit=1] AwabiMovie.Link = @s AwabiMovie.Link

#> tellraw・演出
execute if data storage awabi_movie:temp {Tool:{Level:1}} run tellraw @p [{"text": "[","color": "white"},{"text": "AwabiMovie","color": "green"},{"text": "]","color": "white"},{"text": " ムービーの開始地点を\n"},{"nbt":"CreateNew.AlignedPos","storage": "awabi_movie:temp","color": "gold"},{"text": "に設定しました。\nもう一度クリックして終了地点を設定します。"}]
execute if data storage awabi_movie:temp {Tool:{Level:2}} run tellraw @p [{"text": "[","color": "white"},{"text": "AwabiMovie","color": "green"},{"text": "]","color": "white"},{"text": " ムービーの終了地点を\n"},{"nbt":"CreateNew.AlignedPos","storage": "awabi_movie:temp","color": "gold"},{"text": "に設定しました。\nもう一度クリックして確定します。"}]

execute if data storage awabi_movie:temp {Tool:{Level:1}} run tag @e[tag=AwabiMovie.Marker-SettingUp,sort=nearest,limit=1] add AwabiMovie.Marker-Start
execute if data storage awabi_movie:temp {Tool:{Level:2}} run tag @e[tag=AwabiMovie.Marker-SettingUp,sort=nearest,limit=1] add AwabiMovie.Marker-End

playsound block.note_block.pling master @s ~ ~ ~ 0.5 1

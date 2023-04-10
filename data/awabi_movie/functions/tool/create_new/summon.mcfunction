## CreateNew - Level 1 ~ 2
#> 設定用紐づけID
execute store result score @s AwabiMovie.Link run data get entity @s UUID[0]

#> Marker召喚, 座標計算
summon marker ~ ~ ~ {Tags:["AwabiMovie.Marker","AwabiMovie.Marker-SettingUp"]}
scoreboard players operation @e[tag=AwabiMovie.Marker-SettingUp,sort=nearest,limit=1] AwabiMovie.Link = @s AwabiMovie.Link

# 0.25単位で位置調整
data modify storage awabi_movie:temp CreateNew.PlayerPos set from entity @s Pos
data modify storage awabi_movie:temp CreateNew.AlignedPos set value [0.0d,0.0d,0.0d]

# X
execute store result score $PlayerPos.X-Dec AwabiMovie run data get storage awabi_movie:temp CreateNew.PlayerPos[0] 1000
scoreboard players operation $PlayerPos.X-Dec AwabiMovie %= #1000 Constant

execute if score $PlayerPos.X-Dec AwabiMovie matches 0..249 run scoreboard players set $PlayerPos.X-Dec AwabiMovie 125
execute if score $PlayerPos.X-Dec AwabiMovie matches 250..499 run scoreboard players set $PlayerPos.X-Dec AwabiMovie 375
execute if score $PlayerPos.X-Dec AwabiMovie matches 500..749 run scoreboard players set $PlayerPos.X-Dec AwabiMovie 625
execute if score $PlayerPos.X-Dec AwabiMovie matches 750..999 run scoreboard players set $PlayerPos.X-Dec AwabiMovie 875

execute store result score $PlayerPos.X-Int AwabiMovie run data get storage awabi_movie:temp CreateNew.PlayerPos[0] 1000
scoreboard players operation $PlayerPos.X-Int AwabiMovie /= #1000 Constant
execute store result score $PlayerPos.X AwabiMovie run scoreboard players operation $PlayerPos.X-Int AwabiMovie *= #1000 Constant

execute if score $PlayerPos.X AwabiMovie matches 0.. run scoreboard players operation $PlayerPos.X AwabiMovie += $PlayerPos.X-Dec AwabiMovie
execute if score $PlayerPos.X AwabiMovie matches ..-1 run scoreboard players operation $PlayerPos.X AwabiMovie -= $PlayerPos.X-Dec AwabiMovie

execute if score $PlayerPos.X AwabiMovie matches ..-1 run scoreboard players add $PlayerPos.X AwabiMovie 1000

execute store result storage awabi_movie:temp CreateNew.AlignedPos[0] double 0.001 run scoreboard players get $PlayerPos.X AwabiMovie

# Y
execute store result score $PlayerPos.Y-Dec AwabiMovie run data get storage awabi_movie:temp CreateNew.PlayerPos[1] 1000
scoreboard players operation $PlayerPos.Y-Dec AwabiMovie %= #1000 Constant

execute if score $PlayerPos.Y-Dec AwabiMovie matches 0..249 run scoreboard players set $PlayerPos.Y-Dec AwabiMovie 125
execute if score $PlayerPos.Y-Dec AwabiMovie matches 250..499 run scoreboard players set $PlayerPos.Y-Dec AwabiMovie 375
execute if score $PlayerPos.Y-Dec AwabiMovie matches 500..749 run scoreboard players set $PlayerPos.Y-Dec AwabiMovie 625
execute if score $PlayerPos.Y-Dec AwabiMovie matches 750..999 run scoreboard players set $PlayerPos.Y-Dec AwabiMovie 875

execute store result score $PlayerPos.Y-Int AwabiMovie run data get storage awabi_movie:temp CreateNew.PlayerPos[1] 1000
scoreboard players operation $PlayerPos.Y-Int AwabiMovie /= #1000 Constant
execute store result score $PlayerPos.Y AwabiMovie run scoreboard players operation $PlayerPos.Y-Int AwabiMovie *= #1000 Constant

execute if score $PlayerPos.Y AwabiMovie matches 0.. run scoreboard players operation $PlayerPos.Y AwabiMovie += $PlayerPos.Y-Dec AwabiMovie
execute if score $PlayerPos.Y AwabiMovie matches ..-1 run scoreboard players operation $PlayerPos.Y AwabiMovie -= $PlayerPos.Y-Dec AwabiMovie

execute store result storage awabi_movie:temp CreateNew.AlignedPos[1] double 0.001 run scoreboard players get $PlayerPos.Y AwabiMovie

# Z
execute store result score $PlayerPos.Z-Dec AwabiMovie run data get storage awabi_movie:temp CreateNew.PlayerPos[2] 1000
scoreboard players operation $PlayerPos.Z-Dec AwabiMovie %= #1000 Constant

execute if score $PlayerPos.Z-Dec AwabiMovie matches 0..249 run scoreboard players set $PlayerPos.Z-Dec AwabiMovie 125
execute if score $PlayerPos.Z-Dec AwabiMovie matches 250..499 run scoreboard players set $PlayerPos.Z-Dec AwabiMovie 375
execute if score $PlayerPos.Z-Dec AwabiMovie matches 500..749 run scoreboard players set $PlayerPos.Z-Dec AwabiMovie 625
execute if score $PlayerPos.Z-Dec AwabiMovie matches 750..999 run scoreboard players set $PlayerPos.Z-Dec AwabiMovie 875

execute store result score $PlayerPos.Z-Int AwabiMovie run data get storage awabi_movie:temp CreateNew.PlayerPos[2] 1000
scoreboard players operation $PlayerPos.Z-Int AwabiMovie /= #1000 Constant
execute store result score $PlayerPos.Z AwabiMovie run scoreboard players operation $PlayerPos.Z-Int AwabiMovie *= #1000 Constant

execute if score $PlayerPos.Z AwabiMovie matches 0.. run scoreboard players operation $PlayerPos.Z AwabiMovie += $PlayerPos.Z-Dec AwabiMovie
execute if score $PlayerPos.Z AwabiMovie matches ..-1 run scoreboard players operation $PlayerPos.Z AwabiMovie -= $PlayerPos.Z-Dec AwabiMovie

execute if score $PlayerPos.Z AwabiMovie matches ..-1 run scoreboard players add $PlayerPos.Z AwabiMovie 1000

execute store result storage awabi_movie:temp CreateNew.AlignedPos[2] double 0.001 run scoreboard players get $PlayerPos.Z AwabiMovie

# 位置適応
data modify entity @e[tag=AwabiMovie.Marker-SettingUp,sort=nearest,limit=1] Pos set from storage awabi_movie:temp CreateNew.AlignedPos

#> tellraw・演出
execute if data storage awabi_movie:temp {Tool:{Level:1}} run tellraw @p [{"text": "[","color": "white"},{"text": "AwabiMovie","color": "green"},{"text": "]","color": "white"},{"text": " ムービーの開始地点を\n"},{"nbt":"CreateNew.AlignedPos","storage": "awabi_movie:temp","color": "gold"},{"text": "に設定しました。\nもう一度クリックして終了地点を設定します。"}]
execute if data storage awabi_movie:temp {Tool:{Level:2}} run tellraw @p [{"text": "[","color": "white"},{"text": "AwabiMovie","color": "green"},{"text": "]","color": "white"},{"text": " ムービーの終了地点を\n"},{"nbt":"CreateNew.AlignedPos","storage": "awabi_movie:temp","color": "gold"},{"text": "に設定しました。\nもう一度クリックして確定します。"}]

execute if data storage awabi_movie:temp {Tool:{Level:1}} run tag @e[tag=AwabiMovie.Marker-SettingUp,sort=nearest,limit=1] add AwabiMovie.Marker-Start
execute if data storage awabi_movie:temp {Tool:{Level:2}} run tag @e[tag=AwabiMovie.Marker-SettingUp,sort=nearest,limit=1] add AwabiMovie.Marker-End

playsound block.note_block.pling master @s ~ ~ ~ 0.5 1

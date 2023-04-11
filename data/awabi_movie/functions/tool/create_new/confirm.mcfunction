## CreateNew - Level 3
# 確定、Id作成
execute as @e[tag=AwabiMovie.Marker-SettingUp,tag=AwabiMovie.Marker-Start] if score @s AwabiMovie.Link = @p AwabiMovie.Link run data modify storage awabi_movie:temp CreateNew.Id set from entity @s UUID[0]

# tellraw
tellraw @s [{"text": "[","color": "white"},{"text": "AwabiMovie","color": "green"},{"text": "]","color": "white"},{"text": " 新しくムービーを作成しました。"},{"text": "\n(Id: ","color": "gray"},{"nbt":"CreateNew.Id","storage": "awabi_movie:temp","color": "gray"},{"text": ")","color": "gray"}]

# 効果音
playsound block.note_block.pling master @s ~ ~ ~ 1 1.5

# Id設定
execute as @e[tag=AwabiMovie.Marker-SettingUp] if score @s AwabiMovie.Link = @p AwabiMovie.Link store result score @s AwabiMovie.Id run data get storage awabi_movie:temp CreateNew.Id

# ストレージに登録
# Name生成
summon item_display ~ ~ ~ {Tags:["AwabiMovie.Temp"]}
loot replace entity @e[tag=AwabiMovie.Temp] container.0 loot awabi_movie:generate_head

data modify storage awabi_movie:data Main append value {}

data modify storage awabi_movie:data Main[-1].Id set from storage awabi_movie:temp CreateNew.Id
data modify storage awabi_movie:data Main[-1].OwnerUUID set from entity @s UUID
data modify storage awabi_movie:data Main[-1].OwnerName set from entity @e[tag=AwabiMovie.Temp,limit=1] item.tag.SkullOwner.Name
data modify storage awabi_movie:data Main[-1].Name set value '{"text":"NONE"}'

data modify storage awabi_movie:data Main[-1].AnimationData set value {Duration:20,Rotation:{Start:[0.0f,0.0f],End:[0.0f,0.0f]}}

kill @e[tag=AwabiMovie.Temp]

# フラグリセット
execute as @e[tag=AwabiMovie.Marker-SettingUp] if score @s AwabiMovie.Link = @p AwabiMovie.Link run tag @s remove AwabiMovie.Marker-SettingUp

scoreboard players reset @s AwabiMovie.Link
tag @s remove AwabiMovie.ToolUsing


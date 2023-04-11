## Setting
data modify storage awabi_movie:temp DisplayData set from storage awabi_movie:temp DataSearching.Output

data modify storage awabi_movie:temp Renamed set value ""

#> tellraw
# 編集不可部分
tellraw @s [{"text": " | ","bold": true},{"text": "識別データ","color": "red","bold": true},{"text": " |","color": "white","bold": true}]
tellraw @s [{"text": "- ","color": "gray"},{"text": "Id: ","color": "gray"},{"nbt":"DisplayData.Id","storage": "awabi_movie:temp","color": "white"}]
tellraw @s [{"text": "- ","color": "gray"},{"text": "OwnerName: ","color": "gray"},{"nbt":"DisplayData.OwnerName","storage": "awabi_movie:temp","color": "white"}]
tellraw @s [{"text": "- ","color": "gray"},{"text": "Name: ","color": "gray"},{"nbt":"DisplayData.Name","storage": "awabi_movie:temp","color": "white","interpret": true},{"text": "［編集］\n","color": "aqua","bold": true,"clickEvent": {"action": "run_command","value": "/function awabi_movie:tool/setting/button/edit/name"}}]
tellraw @s [{"text": " ※Nameを除き編集できません。","color":"red"}]

tellraw @s " "

# 編集可能部分
tellraw @s [{"text": " | ","bold": true},{"text": "アニメーションデータ","color": "yellow","bold": true},{"text": " |","color": "white","bold": true}]
tellraw @s [{"text": "- ","color": "gray"},{"text": "Rotation: ","color": "gray"},{"nbt":"DisplayData.AnimationData.Rotation.Start","storage": "awabi_movie:temp","color": "white"},{"text": " ➡ ","color": "gray"},{"nbt":"DisplayData.AnimationData.Rotation.End","storage": "awabi_movie:temp","color": "white"},{"text": "［編集］\n","color": "aqua","bold": true,"clickEvent": {"action": "run_command","value": "/function awabi_movie:tool/setting/button/edit/rotation"}}]
tellraw @s [{"text": "- ","color": "gray"},{"text": "Duration: ","color": "gray"},{"nbt":"DisplayData.AnimationData.Duration","storage": "awabi_movie:temp","color": "white"},{"text": " (tick)","color": "gray"},{"text": "［編集］\n","color": "aqua","bold": true,"clickEvent": {"action": "run_command","value": "/function awabi_movie:tool/setting/button/edit/duration"}}]


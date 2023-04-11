## Name Edit
# Id検索
execute store result storage awabi_movie:temp DataSearching.TargetData int 1 run scoreboard players get @s AwabiMovie.SettingId
data modify storage awabi_movie:temp DataSearching.Input set from storage awabi_movie:data Main

function awabi_movie:data_searching/id/_

data modify storage awabi_movie:temp DisplayData set from storage awabi_movie:temp DataSearching.Output



tellraw @s {"text": "▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬","color": "gray"}
tellraw @s [{"text": "||| ","bold": false,"color": "gold"},{"text": "データ変更 ","bold": false,"color": "white"},{"text": "➡ ","color": "gray","bold": true},{"text": "Name","color": "yellow","bold": true}]

tellraw @s " "
tellraw @s [{"text": " - ","color": "gray"},{"text": "旧データ: ","color": "white"},{"nbt":"DisplayData.Name","storage": "awabi_movie:temp","color": "white","bold": true,"interpret": true}]
tellraw @s " "
tellraw @s {"text": " ⬇","color": "aqua"}
tellraw @s " "
tellraw @s [{"text": " - ","color": "gray"},{"text": "新データ: ","color": "white"},{"nbt":"Renamed","storage": "awabi_movie:temp","color": "yellow","bold": true,"interpret": true}]
tellraw @s " "
tellraw @s " "
tellraw @s [{"text": "Note: ","color": "gray"},{"text": "手持ちのアイテムの名前からNameを登録します。","color": "white"}]
tellraw @s " "
tellraw @s {"text": "［クリックして変更］","color": "aqua","bold": false,"clickEvent": {"action": "run_command","value": "/function awabi_movie:tool/setting/rename/_"}}
tellraw @s {"text": "［変更を保存］","color": "aqua","bold": true,"clickEvent": {"action": "run_command","value": "/function awabi_movie:tool/setting/rename/confirm"}}
tellraw @s " "
tellraw @s " "
tellraw @s " "
tellraw @s {"text": "▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬","color": "gray"}


## Setting - 1
# tellraw
tellraw @s [{"text": "[","color": "white"},{"text": "AwabiMovie","color": "green"},{"text": "]","color": "white"},{"text": " 該当Idのデータを検索します。","color": "yellow"}]

# Id検索
execute store result storage awabi_movie:temp DataSearching.TargetData int 1 run scoreboard players get @s AwabiMovie.SettingId
data modify storage awabi_movie:temp DataSearching.Input set from storage awabi_movie:data Main

function awabi_movie:data_searching/id/_

execute if data storage awabi_movie:temp DataSearching.Output.Id run tellraw @s [{"text": "[","color": "white"},{"text": "AwabiMovie","color": "green"},{"text": "]","color": "white"},{"text": " データを発見しました。"}]
execute unless data storage awabi_movie:temp DataSearching.Output.Id run tellraw @s [{"text": "[","color": "white"},{"text": "AwabiMovie","color": "green"},{"text": "]","color": "white"},{"text": " データを発見できませんでした。Idをお確かめください。","color": "red"}]

execute if data storage awabi_movie:temp DataSearching.Output.Id run function awabi_movie:tool/setting/display

# 効果音
playsound block.note_block.bit master @s ~ ~ ~ 1 2

## Display
execute unless data storage awabi_movie:temp DisplayData[0] run tellraw @s [{"text": "- 表示可能なデータはありません。","color": "gray"}]

execute if data storage awabi_movie:temp DisplayData[0] run tellraw @s [{"text": "- ","color": "gray"},{"text": "Name: ","color": "white"},{"nbt":"DisplayData[0].Name","storage": "awabi_movie:temp","color": "white","interpret": true},{"text": " (Id: ","color": "gray"},{"nbt":"DisplayData[0].Id","storage": "awabi_movie:temp"},{"text": ")","color": "gray"}]
execute if data storage awabi_movie:temp DisplayData[0] run data remove storage awabi_movie:temp DisplayData[0]

execute if data storage awabi_movie:temp DisplayData[0] run function awabi_movie:tool/list/display




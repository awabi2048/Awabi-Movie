## Reset
# tellraw
tellraw @s [{"text": "[","color": "white"},{"text": "AwabiMovie","color": "green"},{"text": "]","color": "white"},{"text": " WARNING ","color": "red","bold": true},{"text": "これを実行するとバックアップを含めた全てのムービーのデータがリセットされます。本当に実行しますか？","color": "yellow","bold": false}]

# ストレージ
data modify storage awabi_movie:data Main set value []
data modify storage awabi_movie:data Backup set value []

# エンティティ
kill @e[tag=AwabiMovie.Marker]

## Data検索
# 
execute unless data storage awabi_movie:temp DataSearching.Input run data modify storage awabi_movie:temp DataSearching.Input set from storage awabi_movie:data Main
data modify storage awabi_movie:temp DataSearching.Output set value []
data modify storage awabi_movie:temp DataSearching.FoundData set value {}

data modify storage awabi_movie:temp DataSearching.Memory.Original set from storage awabi_movie:temp DataSearching.Input

execute if data storage awabi_movie:temp DataSearching.TargetData run function awabi_movie:data_searching/id/loop
execute unless data storage awabi_movie:temp DataSearching.TargetData run tellraw @s [{"text": "[","color": "white"},{"text": "AwabiMovie","color": "green"},{"text": "] ","color": "white"},{"text": "TargetIdが設定されていません。","color": "red"}]

data remove storage awabi_movie:temp DataSearching.Memory

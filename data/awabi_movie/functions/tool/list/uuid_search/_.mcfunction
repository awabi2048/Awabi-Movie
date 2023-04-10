## UUID検索
# 
execute unless data storage awabi_movie:temp UUIDSearching.Input run data modify storage awabi_movie:temp UUIDSearching.Input set from storage awabi_movie:data Main
data modify storage awabi_movie:temp UUIDSearching.Output set value []

data modify storage awabi_movie:temp UUIDSearching.Memory.Original set from storage awabi_movie:temp UUIDSearching.Input

execute if data storage awabi_movie:temp UUIDSearching.TargetUUID run function awabi_movie:tool/list/uuid_search/loop
execute unless data storage awabi_movie:temp UUIDSearching.TargetUUID run tellraw @s [{"text": "[","color": "white"},{"text": "AwabiMovie","color": "green"},{"text": "]","color": "white"},{"text": "TargetUUIDが設定されていません。","color": "red"}]


## UUID Search Loop
data modify storage awabi_movie:temp UUIDSearching.Memory.CompareTarget set from storage awabi_movie:temp UUIDSearching.Memory.Original[0]

execute store success storage awabi_movie:temp UUIDSearching.Memory.CompareFailed byte 1 run data modify storage awabi_movie:temp UUIDSearching.Memory.CompareTarget.OwnerUUID set from storage awabi_movie:temp UUIDSearching.TargetUUID
execute if data storage awabi_movie:temp {UUIDSearching:{Memory:{CompareFailed:false}}} run data modify storage awabi_movie:temp UUIDSearching.Output append from storage awabi_movie:temp UUIDSearching.Memory.CompareTarget

data remove storage awabi_movie:temp UUIDSearching.Memory.Original[0]
execute if data storage awabi_movie:temp UUIDSearching.Memory.Original[0] run function awabi_movie:tool/list/uuid_search/loop

## Data Search Loop
data modify storage awabi_movie:temp DataSearching.Memory.CompareTarget set from storage awabi_movie:temp DataSearching.Memory.Original[0]

execute store success storage awabi_movie:temp DataSearching.Memory.CompareFailed byte 1 run data modify storage awabi_movie:temp DataSearching.Memory.CompareTarget.Id set from storage awabi_movie:temp DataSearching.TargetData
execute if data storage awabi_movie:temp {DataSearching:{Memory:{CompareFailed:false}}} run data modify storage awabi_movie:temp DataSearching.FoundData set from storage awabi_movie:temp DataSearching.Memory.CompareTarget

data modify storage awabi_movie:temp DataSearching.Output append from storage awabi_movie:temp DataSearching.Memory.Original[0]
data remove storage awabi_movie:temp DataSearching.Memory.Original[0]

execute if data storage awabi_movie:temp {DataSearching:{Memory:{CompareFailed:false}}} if data storage awabi_movie:temp {DataSearching:{RemoveFoundData:true}} run data remove storage awabi_movie:temp DataSearching.Output[0]

execute if data storage awabi_movie:temp DataSearching.Memory.Original[0] run function awabi_movie:data_searching/uuid/loop

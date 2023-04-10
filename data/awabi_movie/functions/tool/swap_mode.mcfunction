## Mode Swap
# アイテムを戻す
summon item_display ~ ~ ~ {Tags:["AwabiMovie.Temp"]}
item replace entity @e[tag=AwabiMovie.Temp,limit=1] container.0 from entity @s weapon.offhand

item replace entity @s weapon.offhand from entity @s weapon.mainhand
item replace entity @s weapon.mainhand from entity @e[tag=AwabiMovie.Temp,limit=1] container.0

kill @e[tag=AwabiMovie.Temp]

# 循環
data modify storage awabi_movie:temp Tool.SwapMode.From set from entity @s SelectedItem.tag.AwabiMovie.Tool.Mode

execute if data storage awabi_movie:temp {Tool:{SwapMode:{From:"CreateNew"}}} run data modify storage awabi_movie:temp Tool.SwapMode.To set value "Setting"
execute if data storage awabi_movie:temp {Tool:{SwapMode:{From:"Setting"}}} run data modify storage awabi_movie:temp Tool.SwapMode.To set value "List"

execute if data storage awabi_movie:temp {Tool:{SwapMode:{From:"List"}}} run data modify storage awabi_movie:temp Tool.SwapMode.To set value "CreateNew"

# 演出, tellraw
tellraw @s [{"text": "[","color": "white"},{"text": "AwabiMovie","color": "green"},{"text": "]","color": "white"},{"text": " ツールのモードを変更しました: "},{"nbt":"Tool.SwapMode.From","storage": "awabi_movie:temp","color": "white","bold": true},{"text": " ➡ ","color": "gray","bold": true},{"nbt":"Tool.SwapMode.To","storage": "awabi_movie:temp","color": "yellow","bold": true}]
playsound entity.cat.ambient master @s ~ ~ ~ 1 1.5

# item modify
item modify entity @s weapon.mainhand awabi_movie:set_mode

# Levelリセット
data modify storage awabi_movie:temp Tool.Level set value 0
item modify entity @s weapon.mainhand awabi_movie:set_level

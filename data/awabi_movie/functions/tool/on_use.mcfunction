## ツール使用時
#Memo: rewardsから実行するとクロスボウの処理に割り込みが発生し、Chargedの値の変更がうまくいかない
# タスクの進行度合いを取得
data modify storage awabi_movie:temp Tool.Level set from entity @s SelectedItem.tag.AwabiMovie.Tool.Level

# トリガー
advancement revoke @s only awabi_movie:on_tool_use
item modify entity @s weapon.mainhand awabi_movie:set_charged

tag @s add AwabiMovie.ToolUsing

# 使用モード検知
data modify storage awabi_movie:temp Tool.Mode set from entity @s SelectedItem.tag.AwabiMovie.Tool.Mode

# Mode別処理
# CreateNew
execute if data storage awabi_movie:temp {Tool:{Mode:"CreateNew"}} if data storage awabi_movie:temp {Tool:{Level:0}} run function awabi_movie:tool/create_new/note
execute if data storage awabi_movie:temp {Tool:{Mode:"CreateNew"}} if data storage awabi_movie:temp {Tool:{Level:1}} run function awabi_movie:tool/create_new/summon
execute if data storage awabi_movie:temp {Tool:{Mode:"CreateNew"}} if data storage awabi_movie:temp {Tool:{Level:2}} run function awabi_movie:tool/create_new/summon
execute if data storage awabi_movie:temp {Tool:{Mode:"CreateNew"}} if data storage awabi_movie:temp {Tool:{Level:3}} run function awabi_movie:tool/create_new/confirm

# Level更新
execute store result score $ToolLevel AwabiMovie run data get storage awabi_movie:temp Tool.Level
execute store result storage awabi_movie:temp Tool.Level int 1 run scoreboard players add $ToolLevel AwabiMovie 1


execute if data storage awabi_movie:temp {Tool:{Mode:"List"}} if data storage awabi_movie:temp {Tool:{Level:1}} run function awabi_movie:tool/list/_


item modify entity @s weapon.mainhand awabi_movie:set_level

## Qキー判定    
# トリガー解除
scoreboard players reset @s AwabiMovie.PressedQ

# アイテムを手元に
execute anchored eyes positioned ^ ^ ^ as @e[type=item,sort=nearest,limit=1] run data merge entity @s {Motion:[0.0d,0.0d,0.0d],PickupDelay:0}
execute anchored eyes positioned ^ ^ ^ as @e[type=item,sort=nearest,limit=1] run tp @p

## 特殊動作の待機中の設定か
data modify storage awabi_movie:temp Tool.Mode set from entity @s SelectedItem.tag.AwabiMovie.Tool.Mode

#> Mode別処理
# CreateNew
execute if data storage awabi_movie:temp {Tool:{Mode:"CreateNew"}} if data storage awabi_movie:temp {Tool:{Level:2}} run function awabi_movie:tool/create_new/summon
execute if data storage awabi_movie:temp {Tool:{Mode:"CreateNew"}} if data storage awabi_movie:temp {Tool:{Level:3}} run function awabi_movie:tool/create_new/confirm

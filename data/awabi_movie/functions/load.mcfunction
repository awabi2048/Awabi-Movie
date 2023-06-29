## Load
# スコアボード定義
scoreboard objectives add AwabiMovie dummy
scoreboard objectives add AwabiMovie.Id dummy
scoreboard objectives add AwabiMovie.Link dummy
scoreboard objectives add AwabiMovie.SettingId trigger

scoreboard objectives add AwabiMovie.PressedQ minecraft.dropped:minecraft.crossbow 

scoreboard objectives add Constant dummy
scoreboard players set #10 Constant 10
scoreboard players set #100 Constant 100
scoreboard players set #1000 Constant 1000

# データなければ設定
execute unless data storage awabi_movie:data Main run data modify storage awabi_movie:data Main set value []
execute unless data storage awabi_movie:data Backup run data modify storage awabi_movie:data Backup set value []

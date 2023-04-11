## List - 0
# tellraw
tellraw @s [{"text": "[","color": "white"},{"text": "AwabiMovie","color": "green"},{"text": "]","color": "white"},{"text": " あなたが作成したムービーの一覧を表示します。"}]

# 自分の作成したデータのみを表示・編集可能。UUIDで検索
data modify storage awabi_movie:temp DataSearching.TargetData set from entity @s UUID
data modify storage awabi_movie:temp DataSearching.Input set from storage awabi_movie:data Main

function awabi_movie:data_searching/uuid/_

data modify storage awabi_movie:temp DisplayData set from storage awabi_movie:temp DataSearching.Output
function awabi_movie:tool/list/display

function awabi_movie:tool/reset_level

# 効果音
playsound block.note_block.bit master @s ~ ~ ~ 1 1.5

## Setting - Level 0
scoreboard players enable @s AwabiMovie.SettingId

# tellraw
tellraw @s [{"text": "[","color": "white"},{"text": "AwabiMovie","color": "green"},{"text": "]","color": "white"},{"text": " 作成されたムービーの編集を行います。"},{"text": "【ここをクリック】\n","color": "gold","underlined": true,"clickEvent": {"action": "suggest_command","value": "/trigger AwabiMovie.SettingId set <Idを入力>"}},{"text": "クリックしてムービーのIdを入力後、再度右クリックしてください。"}]

# 効果音
playsound ui.button.click master @s ~ ~ ~ 1 1.5


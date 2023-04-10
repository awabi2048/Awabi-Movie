## マーカー線表示
execute as @a if predicate awabi_movie:has_tool run particle composter ~ ~ ~ 0 0 0 0 1

execute positioned ^ ^ ^0.5 unless entity @e[tag=AwabiMovie.Marker-End,distance=..0.5] run function awabi_movie:marker_display

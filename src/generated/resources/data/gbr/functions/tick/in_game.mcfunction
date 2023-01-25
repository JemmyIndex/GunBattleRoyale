# 每tick都要进行的玩家判定
execute as @a[gamemode=adventure] run function gbr:tick/player
execute as @a[gamemode=spectator] unless score @s death matches -1 run function gbr:death
# 空投判定
scoreboard players add game_tick global 1
execute if score game_tick global matches 2000 run function gbr:airdrop/airdrop
execute if score game_tick global matches 4000 run function gbr:airdrop/airdrop
execute as @e[tag=dropping] run function gbr:airdrop/dropping
# 技能
execute as @e[type=item] if data entity @s Thrower at @s run function gbr:skill/item
execute as @e[tag=fly] at @s run function gbr:skill/fly_entity
# 获胜判定
scoreboard players set game_sum global 0
execute as @a[gamemode=adventure, scores={death=0}] run scoreboard players add game_sum global 1
execute if score game_sum global matches 0..1 run function gbr:game/win
#=============================================================================
#  バニラアイテムの「日本語表示名の文字数」テーブル
#  ここに無いアイテムは config の #default 扱いになる。
#  ネタを増やしたいときは、この表に1行足すだけ。
#  ※文字数は 26.3 の日本語表示名に合わせること。ズレていたら数字を直すだけでよい。
#=============================================================================

data modify storage namelen:table items set value {}

# --- 剣・斧（「ダイヤモンドの剣」が「ネザライトの剣」より強くなるのが肝）-----
data merge storage namelen:table {items:{"minecraft:stick":1,"minecraft:wooden_sword":3,"minecraft:stone_sword":3,"minecraft:iron_sword":3,"minecraft:golden_sword":3,"minecraft:diamond_sword":8,"minecraft:netherite_sword":7,"minecraft:wooden_axe":3,"minecraft:stone_axe":3,"minecraft:iron_axe":3,"minecraft:golden_axe":3,"minecraft:diamond_axe":8,"minecraft:netherite_axe":7,"minecraft:mace":3,"minecraft:trident":6,"minecraft:bow":1,"minecraft:crossbow":5,"minecraft:shield":1}}

# --- 道具 --------------------------------------------------------------------
data merge storage namelen:table {items:{"minecraft:wooden_pickaxe":6,"minecraft:stone_pickaxe":6,"minecraft:iron_pickaxe":6,"minecraft:golden_pickaxe":6,"minecraft:diamond_pickaxe":11,"minecraft:netherite_pickaxe":10,"minecraft:wooden_shovel":6,"minecraft:diamond_shovel":11,"minecraft:wooden_hoe":5,"minecraft:diamond_hoe":10,"minecraft:shears":3,"minecraft:fishing_rod":2,"minecraft:flint_and_steel":8,"minecraft:elytra":4}}

# --- 食べ物（「金のニンジン」で殴れるのが絵になる）---------------------------
data merge storage namelen:table {items:{"minecraft:bread":2,"minecraft:apple":3,"minecraft:golden_apple":5,"minecraft:enchanted_golden_apple":14,"minecraft:carrot":4,"minecraft:golden_carrot":6,"minecraft:cooked_chicken":3,"minecraft:cooked_beef":4,"minecraft:rotten_flesh":4,"minecraft:pufferfish":2,"minecraft:cake":3,"minecraft:cookie":4,"minecraft:suspicious_stew":8}}

# --- ブロック（「土」が最弱の基準）-------------------------------------------
data merge storage namelen:table {items:{"minecraft:dirt":1,"minecraft:stone":1,"minecraft:sand":1,"minecraft:cobblestone":2,"minecraft:mossy_cobblestone":6,"minecraft:oak_log":6,"minecraft:obsidian":3,"minecraft:tnt":3,"minecraft:glass":3,"minecraft:torch":2,"minecraft:crafting_table":3,"minecraft:furnace":3,"minecraft:anvil":2,"minecraft:beacon":4,"minecraft:note_block":6,"minecraft:diamond_block":10,"minecraft:netherite_block":9,"minecraft:enchanting_table":10,"minecraft:respawn_anchor":9,"minecraft:lodestone":7,"minecraft:sculk_shrieker":10}}

# --- 素材・特殊（バニラで一番長い名前の枠が銅の階段）-------------------------
data merge storage namelen:table {items:{"minecraft:bone":1,"minecraft:feather":2,"minecraft:book":1,"minecraft:enchanted_book":8,"minecraft:gold_nugget":2,"minecraft:iron_ingot":6,"minecraft:diamond":6,"minecraft:netherite_ingot":10,"minecraft:nether_star":6,"minecraft:totem_of_undying":7,"minecraft:end_crystal":8,"minecraft:dragon_egg":6,"minecraft:ender_eye":6,"minecraft:water_bucket":6,"minecraft:lava_bucket":7,"minecraft:waxed_oxidized_cut_copper_stairs":22}}

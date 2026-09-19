# メインハンドのアイテムを storage namelen:tmp item に取り出す。
# 装備の NBT の持ち方がバージョンで違うので、両方の置き場所を見る。

data remove storage namelen:tmp item
execute if data entity @s equipment.mainhand run data modify storage namelen:tmp item set from entity @s equipment.mainhand
execute unless data storage namelen:tmp item if data entity @s SelectedItem run data modify storage namelen:tmp item set from entity @s SelectedItem

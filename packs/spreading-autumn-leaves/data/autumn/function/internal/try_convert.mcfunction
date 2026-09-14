# 普通の葉（＝ポプラ以外の葉）のときだけ確率判定へ
execute if block ~ ~ ~ #autumn:spreadable_leaves unless block ~ ~ ~ #autumn:poplar_leaves run function autumn:internal/roll

# 探索範囲内のランダムな1ブロックを選ぶ（マクロ引数は storage autumn:config）
$execute store result storage autumn:tmp probe.x int 1 run random value -$(radius_xz)..$(radius_xz)
$execute store result storage autumn:tmp probe.y int 1 run random value -$(radius_y)..$(radius_y)
$execute store result storage autumn:tmp probe.z int 1 run random value -$(radius_xz)..$(radius_xz)
function autumn:internal/probe with storage autumn:tmp probe

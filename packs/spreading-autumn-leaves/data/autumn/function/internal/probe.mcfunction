# そこがポプラの葉なら伝播を試みる。違えばここで終わり（= 大半はこの1行で済む）
$execute positioned ~$(x) ~$(y) ~$(z) align xyz if block ~ ~ ~ #autumn:poplar_leaves run function autumn:internal/spread with storage autumn:config colors

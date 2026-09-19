execute store result score #roll autumn.tmp run random value 1..100
execute if score #roll autumn.tmp <= #chance autumn.config run function autumn:internal/convert

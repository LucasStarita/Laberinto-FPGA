onerror {quit -f}
vlib work
vlog -work work ADC_tutorial.vo
vlog -work work ADC_tutorial.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.conexioooon_vlg_vec_tst
vcd file -direction ADC_tutorial.msim.vcd
vcd add -internal conexioooon_vlg_vec_tst/*
vcd add -internal conexioooon_vlg_vec_tst/i1/*
add wave /*
run -all

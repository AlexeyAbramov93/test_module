onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_module_tb/clk_in
add wave -noupdate /test_module_tb/reset_in
add wave -noupdate -radix unsigned -radixshowbase 0 /test_module_tb/data_in
add wave -noupdate -radix unsigned -radixshowbase 0 /test_module_tb/out_0
add wave -noupdate /test_module_tb/out_valid_0
add wave -noupdate -radix unsigned -radixshowbase 0 /test_module_tb/out_1
add wave -noupdate /test_module_tb/out_valid_1
add wave -noupdate -radix unsigned -radixshowbase 0 /test_module_tb/out_2
add wave -noupdate /test_module_tb/out_valid_2
add wave -noupdate -radix unsigned -radixshowbase 0 /test_module_tb/out_3
add wave -noupdate /test_module_tb/out_valid_3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {120400 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 173
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {142050 ps}

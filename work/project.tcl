set projDir "/home/ryan/p/alu/work/planAhead"
set projName "1D_ALU"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/ryan/p/alu/work/verilog/mojo_top_0.v" "/home/ryan/p/alu/work/verilog/alu_1.v" "/home/ryan/p/alu/work/verilog/reset_conditioner_2.v" "/home/ryan/p/alu/work/verilog/button_conditioner_3.v" "/home/ryan/p/alu/work/verilog/edge_detector_4.v" "/home/ryan/p/alu/work/verilog/multi_seven_seg_5.v" "/home/ryan/p/alu/work/verilog/bin_to_dec_6.v" "/home/ryan/p/alu/work/verilog/adder_7.v" "/home/ryan/p/alu/work/verilog/cmp_8.v" "/home/ryan/p/alu/work/verilog/boole_9.v" "/home/ryan/p/alu/work/verilog/shift_10.v" "/home/ryan/p/alu/work/verilog/pipeline_11.v" "/home/ryan/p/alu/work/verilog/counter_12.v" "/home/ryan/p/alu/work/verilog/digit_lut_13.v" "/home/ryan/p/alu/work/verilog/decoder_14.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "/home/ryan/p/alu/constraint/mojo.ucf" "/home/ryan/Desktop/mojo-ide-B1.3.6/library/components/io_shield.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1

set projDir "C:/Users/ZhiYao/Documents/GitHub/1D_ALU_CI03_7_/work/planAhead"
set projName "1D_ALU"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/ZhiYao/Documents/GitHub/1D_ALU_CI03_7_/work/verilog/mojo_top_0.v" "C:/Users/ZhiYao/Documents/GitHub/1D_ALU_CI03_7_/work/verilog/alu_1.v" "C:/Users/ZhiYao/Documents/GitHub/1D_ALU_CI03_7_/work/verilog/reset_conditioner_2.v" "C:/Users/ZhiYao/Documents/GitHub/1D_ALU_CI03_7_/work/verilog/button_conditioner_3.v" "C:/Users/ZhiYao/Documents/GitHub/1D_ALU_CI03_7_/work/verilog/edge_detector_4.v" "C:/Users/ZhiYao/Documents/GitHub/1D_ALU_CI03_7_/work/verilog/multi_seven_seg_5.v" "C:/Users/ZhiYao/Documents/GitHub/1D_ALU_CI03_7_/work/verilog/bin_to_dec_6.v" "C:/Users/ZhiYao/Documents/GitHub/1D_ALU_CI03_7_/work/verilog/adder_7.v" "C:/Users/ZhiYao/Documents/GitHub/1D_ALU_CI03_7_/work/verilog/cmp_8.v" "C:/Users/ZhiYao/Documents/GitHub/1D_ALU_CI03_7_/work/verilog/boole_9.v" "C:/Users/ZhiYao/Documents/GitHub/1D_ALU_CI03_7_/work/verilog/shift_10.v" "C:/Users/ZhiYao/Documents/GitHub/1D_ALU_CI03_7_/work/verilog/pipeline_11.v" "C:/Users/ZhiYao/Documents/GitHub/1D_ALU_CI03_7_/work/verilog/counter_12.v" "C:/Users/ZhiYao/Documents/GitHub/1D_ALU_CI03_7_/work/verilog/digit_lut_13.v" "C:/Users/ZhiYao/Documents/GitHub/1D_ALU_CI03_7_/work/verilog/decoder_14.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/ZhiYao/Documents/GitHub/1D_ALU_CI03_7_/constraint/mojo.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf"]
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

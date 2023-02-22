	alias clc ".main clear"
	
	clc
	exec vlib work
	vmap work work
	
	set TB					"permutationFuncTB"
	set hdl_path			"../src/hdl"
	set inc_path			"../src/inc"
	
	set run_time			100000
#	set run_time			"-all"

#============================ Add verilog files  ===============================
# Pleas add other module here	
	#vlog 	+acc -incr -source  +define+SIM 	$hdl_path/verilog_file_name.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/datapath.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/encoder25.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/decoder6to64.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/counter6bit.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/register25bit.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/permutationFunc.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/controlUnit.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/controllerFSM.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/mux64to1_1600.v
	
	#vlog 	+acc -incr -source  +define+SIM 	$inc_path/implementation_option.vh
		
	vlog 	+acc -incr -source  +incdir+$inc_path +define+SIM 	./tb/$TB.v
	onerror {break}

#================================ simulation ====================================

	vsim	-voptargs=+acc -debugDB $TB


#======================= adding signals to wave window ==========================


	add wave -hex -group 	 	{TB}				sim:/$TB/*
	add wave -hex -group 	 	{top}				sim:/$TB/uut/*	
	add wave -hex -group -r		{all}				sim:/$TB/*

#=========================== Configure wave signals =============================
	
	configure wave -signalnamewidth 2
    

#====================================== run =====================================

	run $run_time 
	
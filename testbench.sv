module testbench();

  	logic        clk;
	logic        reset;
	logic [31:0] writedata, adr; 
	logic        memwrite;

	// instantiate device to be tested
	top dut(.*);
	
	// initialize test
	initial
    	begin
      		reset <= 1; #9; 
			reset <= 0;
    	end

  	// generate clock to sequence tests
  	always
    	begin
     		clk <= 0; # 5; 
			clk <= 1; # 5;
    	end

endmodule

module controllertest();
    //input logic
    logic clk;
    logic reset;
    logic [5:0] op;
    logic [5:0] funct;
    logic zero;
    //output logic
    logic bne, pcen, memwrite, irwrite, regwrite, alusrca, iord, memtoreg, regdst, pc_enable;
	logic [1:0] alusrcb, pcsrc;
    logic [2:0] alucontrol;
    logic [3:0] state;     
    logic [15:0] controls;

    controller dut(.*);

    always begin
        clk = 0; #5; 
        clk = 1; #5;
    end

    initial begin
        reset = 1;                              zero = 0;   #11;  
        reset = 0;  op = 6'h0;  funct = 6'h20;              #40;  // add    1, 6, 7, 0
                    op = 6'h0;  funct = 6'h22;              #40;  // sub    1, 6, 7, 0 
                    op = 6'h0;  funct = 6'h24;              #40;  // and    1, 6, 7, 0
                    op = 6'h0;  funct = 6'h25;              #40;  // or     1, 6, 7, 0
                    op = 6'h0;  funct = 6'h2a;              #40;  // slt    1, 6, 7, 0
                    op = 6'h08; funct = 6'hx;               #40;  // addi   1, 9, A, 0
                    op = 6'h2b; funct = 6'hx;               #40;  // sw     1, 2, 5, 0
                    op = 6'h23; funct = 6'hx;               #50;  // lw     1, 2, 3, 4, 0
                    op = 6'h04; funct = 6'hx;   zero = 0;   #30;  // beq    1, 8, 0
                    op = 6'h04; funct = 6'hx;   zero = 1;   #30;  // beq    1, 8, 0
                    op = 6'h02; funct = 6'hx;               #30;  // j      1, B, 0
    end
endmodule






















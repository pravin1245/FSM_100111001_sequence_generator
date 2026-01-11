`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2026 06:55:01 PM
// Design Name: 
// Module Name: FSM_100111001_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FSM_100111001_tb( );
    reg clk;
    reg rst;
    wire [8:0] seq_out;
    wire seq_done;
    wire serial_out;
    wire[3:0]state_out;
    
    FSM_100111001_seq_generator dut (
        .clk(clk),
        .rst(rst),
        .seq_out(seq_out),
        .seq_done(seq_done),
        .serial_out(serial_out),
        .state_out(state_out)
    );

    
    always #5 clk = ~clk;

    initial begin
       
        clk = 0;
        rst = 0;

      
        #10;
        rst = 1;      

        
        #200;

        $stop;
    end

endmodule


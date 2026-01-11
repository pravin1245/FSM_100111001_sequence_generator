`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2026 06:15:30 PM
// Design Name: 
// Module Name: FSM_100111001_seq_generator
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


module FSM_100111001_seq_generator(
            input wire clk,
            input wire rst,
            output reg[8:0]seq_out,
            output wire[3:0]state_out,
            output reg seq_done,
            output wire serial_out
           );
           
    parameter A = 4'd0;
    parameter B = 4'd1;
    parameter C = 4'd2;
    parameter D = 4'd3;
    parameter E = 4'd4;
    parameter F = 4'd5;
    parameter G = 4'd6;
    parameter H = 4'd7;
    parameter I = 4'd8;
    
    
                reg[3:0]state,next_state;
                reg bit_out;
                
  always@(posedge clk or negedge rst )begin   
            if(!rst)begin    
                state <= A;
           end
                   else begin  
                         state <= next_state;
                    end      
             end
      
  always@(*)begin   
            case(state)   
                A:    next_state = B;
                B:    next_state = C;
                C:    next_state = D;
                D:    next_state = E;
                E:    next_state = F;
                F:    next_state = G;
                G:    next_state = H;
                H:    next_state = I;
                I:    next_state = A;
                default: next_state = A;
             endcase     
       end      
 
   always@(*)begin      
           case(state)
          A:   bit_out = 1'b1; 
          B:   bit_out = 1'b0;
          C:   bit_out = 1'b0;
          D:   bit_out = 1'b1;  
          E:   bit_out = 1'b1;
          F:   bit_out = 1'b1;
          G:   bit_out = 1'b0;
          H:   bit_out = 1'b0;
          I:   bit_out = 1'b1;
          default: bit_out = 1'b0;
     endcase
  end        
          
    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            seq_out  <= 9'b0;
            seq_done <= 1'b0;
        end else begin
            seq_out <= {seq_out[7:0], bit_out}; 
            seq_done <= (state == I) ? 1'b1 : 1'b0;
        end
    end

    
    assign serial_out = bit_out;
    assign state_out  = state; 

endmodule
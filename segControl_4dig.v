`timescale 1ns / 1ps




//----------------------------------------------MUX---------------------------------------
module mux(
                sel,
                muxOUT,
                BCD1,
                BCD2,
                BCD3,
                BCD4
                );

  //inputs
 input [3:0] BCD1; 
 input [3:0] BCD2; 
 input [3:0] BCD3;
 input [3:0] BCD4;
 input [1:0] sel;
 
 //outputs
 output reg [3:0] muxOUT;

   
    always @ (sel)begin
        
        case (sel)
        2'b00: muxOUT = BCD1 ;
        2'b01: muxOUT = BCD2 ;
        2'b10: muxOUT = BCD3 ;
        2'b11: muxOUT = BCD4 ;

        endcase
        
       end 
        
endmodule

//---------------------------Counter----------------------------

module counter_2bit(
    input clk,
    input rst,
    output reg [1:0] cnt
    );
    
    
    
    

    always @ (posedge(clk), posedge(rst))	// When will Always Block Be Triggered
        begin
            if (rst == 1'b1)
                // How Output reacts when Reset Is Asserted
                cnt <= 2'b0;
            else
             // How Output reacts when Rising Edge of Clock Arrives?
            cnt <= cnt + 1'b1;
end

endmodule


//------------------------------Decoder-----------------------------
module decoder (  
              Cin,
                Y,
                rst
               );

    input [1:0] Cin;
    input rst;
    
    output reg [3:0] Y;

always @ (Cin, rst)
begin
      if (rst == 1)
        Y = 4'b1111;
      else
  
        case (Cin)
          2'b00: Y = 4'b1110;
          2'b01: Y = 4'b1101;
          2'b10: Y = 4'b1011;
          2'b11: Y = 4'b0111;
          default  : Y = 4'b1111;

        endcase
end

endmodule
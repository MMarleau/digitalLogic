`timescale 1ns / 1ps


//-----------------BCD 1--------------------
module BCD_Counter1 ( clk,
                    rst,
                    Y,
                    enNext,
                    en
                     );
     output  enNext;
     output reg [3:0] Y ;
     
     input en;
     input clk ;
     input rst ;
     
     
     

    
    assign enNext = Y[0] & ~Y[1] & ~Y[2] & Y[3];
    
     always @ (posedge (clk),posedge(rst)) 
        begin
        if (rst == 1)begin
            Y <= 4'b0000;
        end
        else begin
            if (en == 0)
                begin
                Y <= Y;
                end
            else begin
                if (Y<9)begin
                Y<= Y + 1;
                end
                else begin
                Y <= 4'd0;
                end
                end 
            end
        end

    

endmodule

//-----------------BCD 2--------------------
module BCD_Counter2 ( clk,
                    rst,
                    Y,
                    enNext,
                    en
                     );
     output reg enNext;
     output reg [3:0] Y ;
     
     input en;
     input clk ;
     input rst ;
     
     
     
//     initial
//     begin
//     Y = 4'b0000; 
//     end

     always @ (posedge (clk)) 
        begin
        if (rst == 1)
            Y <= 4'b0000;
     
        else if (en == 0)
            begin
            Y <= Y;
            end 
     
         else if (Y < 9) 
            begin
            Y <= Y + 1;
            end
         else
            begin
            Y <= 4'b0;
            end
         end
            
     always @ (posedge (Y))
        begin
        if (Y == 9)
            enNext <= 1'b1;
           else 
                enNext <= 1'b0; 
        end
    

endmodule

//-----------------BCD 3--------------------
module BCD_Counter3 ( clk,
                    rst,
                    Y,
                    enNext,
                    en
                     );
     output reg enNext;
     output reg [3:0] Y ;
     
     input en;
     input clk ;
     input rst ;
     
     
     
//     initial
//     begin
//     Y = 4'b0000; 
//     end

     always @ (posedge (clk)) 
        begin
        if (rst == 1)
            Y <= 4'b0000;
     
        else if (en == 0)
            begin
            Y <= Y;
            end 
     
         else if (Y < 9) 
            begin
            Y <= Y + 1;
            end
         else
            begin
            Y <= 4'b0;
            end
         end
            
     always @ (posedge (Y))
        begin
        if (Y == 9)
            enNext <= 1'b1;
           else 
                enNext <= 1'b0; 
        end
    

endmodule


//-----------------BCD 4--------------------
module BCD_Counter4 ( clk,
                    rst,
                    Y,
                    enNext,
                    en
                     );
     output reg enNext;
     output reg [3:0] Y ;
     
     input en;
     input clk ;
     input rst ;
     
     
     
//     initial
//     begin
//     Y = 4'b0000; 
//     end

     always @ (posedge (clk)) 
        begin
        if (rst == 1)
            Y <= 4'b0000;
     
        else if (en == 0)
            begin
            Y <= Y;
            end 
     
         else if (Y < 9) 
            begin
            Y <= Y + 1'b1;
            end
         else
            begin
            Y <= 4'b0;
            end
         end
            
     always @ (posedge (Y))
        begin
        if (Y == 9)
            enNext <= 1;
           else 
                enNext <= 1'b0; 
        end
    

endmodule










//module BCD_Counter ( 
//                    input clk,
//                    input rst,
//                    input en,
//                    output nextEn,
//                    output [3:0] digOut
//                    );
     
//     //Declare States
//     localparam zero = 2'b00;
//     localparam digUp = 2'b01;
//     localparam freeze = 2'b10;
     
//     reg [1:0] pState, nState;
     
//     always @ (rst,pState,en)
//        begin
//            case (pState)
                
//                zero: begin
//                    if (rst == 1'b1)
//                        nState <= zero;
//                    if (en == 1'b1 && rst == 1'b0)
//                        nState <= digUp;
//                    else 
//                        nState <= zero;
//                        end
             
//               digUp: begin
//                    if (rst == 1'b1)
//                        nState <= zero;
//                    if (en == 1'b1 && rst == 1'b0)
//                        nState <= digUp;
//                    else
//                        nState <= freeze;
//                      end
                     
//               freeze: begin
//                    if (rst == 1'b1)
//                        nState <= zero;
//                    if (en == 1'b1 && rst == 1'b0)
//                        nState <= digUp;  
//                    else 
//                        nState <= freeze;
//                        end       
//             endcase    
//        end
        
//     //State Register   
//    always @ (posedge(clk) , posedge(rst))
//        begin 
//            if (rst == 1'b1)
//                pState <= zero;
//            else 
//                pState <= nState;
//        end   
        
//    //output Logic
//    assign digOut = (pState == digUp)? digOut + 1'b1 : digOut;
//    assign nextEn = (digOut == 4'd9) ? 1'b1 : 1'b0; 
          
     
                    
//endmodule























//                    clk,
//                    rst,
//                    Y,
//                    bcPrev
//                     );
                    
//     //outputs: enNext turns on next BCD in chain
//     //         Y gives direction to whcih cathode to turn on to display proper digit                

//     output reg [3:0] Y;
     
//     //inputs: en comes directly from enNext of previous BCD. en for BCD is always driven to 1
//     //        clk and rst
//     input [3:0] bcPrev;
//     input rst;
//     input clk;
     
     
//    always @ (posedge(clk) , posedge(rst))
//        begin
        
//            if (rst == 1'b1)
//                begin
//                Y <= 4'b0;
//                end
        
//            else if (bcPrev != 4'b0)
//                begin
       
//                  if ( Y == 4'd9)
//                     Y <= 4'b0;  
                     
//                  else 
//                     Y <= Y + 1;
//                end
//            else 
//                Y <= Y;
                
//         end
        

//endmodule



//---------------------------------BIN-2-SEG----------------------------------------
module bin2seg(
             binIn,
             segA,
             segB,
             segC,
             segD,
             segE,
             segF,
             segG
             

    );
    
    // inputs
    input [3:0] binIn;
  
    
    //outputs
    output segA,segB, segC, segD, segE, segF, segG;
    
    
    
    reg [6:0] encoding;
    
    
    always @ (binIn, encoding) 
        begin 
         //treat switches like bits, turn on leds when switches are on 
            case (binIn)
    
            //0
            4'b0000 : encoding <= 7'b00000001; 
                
            //1
            4'b0001 : encoding <= 7'b1001111;
                
            //2
            4'b0010 : encoding <= 7'b0010010;
                
            //3        
            4'b0011 : encoding <= 7'b0000110;
            
            //4
            4'b0100 : encoding <= 7'b1001100;
                     
            //5      
            4'b0101 : encoding <= 7'b0100100;
                     
            //6      
            4'b0110 : encoding <= 7'b0100000;
                     
            //7      
            4'b0111 : encoding <= 7'b0001111;
            
            //8
            4'b1000 : encoding <= 7'b0000000;
                     
            //9         
            4'b1001 : encoding <= 7'b0001100;
                     

        
    
        endcase
    end
    
    
     assign segA = encoding[6];
     assign segB = encoding[5];
     assign segC = encoding[4];
     assign segD = encoding[3];
     assign segE = encoding[2];
     assign segF = encoding[1];
     assign segG = encoding[0];
    
    
endmodule
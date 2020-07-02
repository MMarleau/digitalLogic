`timescale 1ns / 1ps


module wrapper (
                clk,
                rst,
//                en,
                anode, 
                segA,
                segB,
                segC,
                segD,
                segE,
                segF,
                segG,
                start,
                stop,
                inc
                );
          
       //inputs 
       input rst;  
       input clk;
       input start;
       input stop;
       input inc;
             
      //outputs
      output segA, segB, segC, segD, segE, segF, segG;
      output [3:0] anode;

       wire [4:0] enData;
       wire [3:0] muxData;
//       wire [1:0] muxCnt;
       wire [1:0] cntData;
       wire [3:0] bcdData1;
       wire [3:0] bcdData2;
       wire [3:0] bcdData3;
       wire [3:0] bcdData4;
       wire [1:0] clkData;
//       wire start;
//       wire stop;
//       wire inc;
       
       
        //------instantiations--------
        
        StateMachine stateOut( 
                             .start (start),
                             .stop (stop),
                             .rst (rst),
                             .inc (inc),
                             .countEn (enData[0]),
                             .clk (clkData[0])
        
                               );
       
       clk_divider inputDivider (
                               .clk (clk),
                               .Y (clkData),
                               .rst(rst)
       
                               );

       
       bin2seg output_seg(
                          .binIn (muxData),
                          .segA (segA),
                          .segB (segB),
                          .segC (segC),
                          .segD (segD),
                          .segE (segE),
                          .segF (segF),
                          .segG (segG) 
                          
                           );
                           
       
       BCD_Counter1 outputBCD1 (
                              .clk (clkData[0]),
                              .en (enData[0]),
                              .enNext (enData[1]),
                              .rst (rst),
                              .Y (bcdData1)
       
                              );
                              
       BCD_Counter1 outputBCD2 (
                              .clk (clkData[0]),
                              .en (enData[1]),
                              .enNext (enData[2]), 
                              .rst (rst),      
                              .Y (bcdData2)
                              );
                              
        BCD_Counter1 outputBCD3 (
                                .clk (clkData[0]),
                                .en (enData[2]),
                                .enNext (enData[3]),  
                                .rst (rst),      
                                .Y (bcdData3)   
                                 );
                                
       BCD_Counter1 outputBCD4 (
                                .clk (clkData[0]),
                                .en (enData[3]),
                                .enNext (enData[4]),  
                                .rst (rst),      
                                .Y (bcdData4)  
                                
                                );
                                
       mux muxOutput (
                       .muxOUT (muxData),
                       .sel (cntData),
                       .BCD1 (bcdData1),
                       .BCD2 (bcdData2),
                       .BCD3 (bcdData3),
                       .BCD4 (bcdData4)
                       
                       
                       
       
                       );
                       
                
                       
       counter_2bit counterOutput (
                                   .cnt (cntData),
                                   .clk (clkData[1]),
                                   .rst (rst)
       
                                   );
                                   
       decoder decoderOutput (
                              .rst (rst),
                              .Cin (cntData),
                              .Y (anode)
       
                              );
                     
    

    endmodule
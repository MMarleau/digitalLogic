`timescale 1ns / 1ps



module StateMachine(
                    input start,
                    input stop,
                    input rst,
                    input inc,
                    output countEn,
                    input clk

    );
    //Defined States
    localparam zerozero = 2'b00;
    localparam cen = 2'b01;
    localparam count = 2'b10;
    localparam incCheck = 2'b11;
    
    reg [1:0] pState, nState;
    
    
  //Next Stage Logic
  always @ (*)
      begin
          case (pState)
            zerozero:begin             
                if (rst == 1'b1)begin  
                    nState <= zerozero;
                    end                
                     else begin 
                        if(start==1'b0 & inc == 1'b0)begin
                        nState <= zerozero;
                        end
                        else if (start == 1'b0 & inc == 1'b1)begin
                        nState <= cen;
                        end
                        else if (start == 1'b1)begin
                        nState <= count;
                        end
                     end        
                end   
                
             cen: begin
                if (rst == 1'b1)begin
                    nState <= zerozero;
                    end
                    else begin
//                    #335544000
                    nState <= incCheck;
                    end 
             end 
             
             count: begin
                if (rst == 1'b1) begin
                    nState <= zerozero;
                    end
                    else begin
                        if (stop == 1'b1)begin
                        nState <= zerozero;
                        end
                        else if( stop == 1'b0)begin
                        nState <= count;
                        end
                    end
                end
                
              incCheck: begin
                if (rst == 1'b1)begin
                    nState <= zerozero;
                    end
                    else begin
                        if(inc == 1'b0)begin
                        nState <= zerozero;
                        end
                        else if(inc == 1'b1)begin
                        nState <= incCheck;
                        end
                    end
              end
           
            endcase
            
            end
            
            
            
//Next Stage Logic
//always @ (posedge(pState), posedge(start), posedge(stop), posedge(rst), posedge(inc))
//    begin
    
//      if (rst == 1'b1)begin  
//        nState <= zerozero;
//        end                
//         else begin 
 
//        case (pState)
//          zerozero:begin             
 
//                      if(start==1'b0 & inc == 1'b0)begin
//                      nState <= zerozero;
//                      end
//                      else if (start == 1'b0 & inc == 1'b1)begin
//                      nState <= cen;
//                      end
                          
//              end   
              
//           cen: begin
//                  nState <= incCheck;
//                  end 
          
           
//           count: begin
//                      if (stop == 1'b1)begin
//                      nState <= zerozero;
//                      end
//                      else if( stop == 1'b0)begin
//                      nState <= count;
//                      end
//              end
              
//            incCheck: begin
//                      if(inc == 1'b1)begin
//                      nState <= zerozero;
//                      end
//                      else if(inc == 1'b0)begin
//                      nState <= incCheck;
//                      end
//            end
         
//          endcase
//          end
          
//          end

  
  
  
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
 //State Register   
 always @ (posedge(clk) , posedge(rst))
     begin 
         if (rst == 1'b1)
             pState <= zerozero;
         else 
             pState <= nState;
     end 
     
 //output Logic
 assign countEn = (pState == count || pState == cen)? 1'b1 : 1'b0;
    
    
    
    
//    //Next Stage Logic
//    always @ (posedge(pState), posedge(start), posedge(stop), posedge(rst), posedge(inc))
//        begin
//            case (pState)
            
//                zerozero:begin
//                    if (rst == 1'b1)begin
//                        nState <= zerozero;
//                        end
//                        else begin
//                            if (start == 1'b1) begin
//                                nState <= count;
//                                end
//                            if (stop == 1'b1)begin
//                                nState <= freeze;
//                                end
//                            if (inc <= 1'b1)begin
//                                nState <= plus1;
//                                end
//                            else begin
//                                nState <= zerozero;
//                                end
//                                end
//                                end
                        
//                 count:begin
//                    if (rst == 1'b1)begin
//                        nState <= zerozero;
//                            end
//                            else begin
//                             if (stop == 1'b1 || inc == 1'b1)begin
//                                 nState <= freeze;
//                                 end
//                             else begin
//                                 nState <= count;
//                                 end
//                                 end
//                                 end
                        
//                  freeze: begin
//                    if (rst == 1'b1)begin
//                        nState <= zerozero;
//                        end
//                        else begin
//                            if (start == 1'b1)begin
//                                nState <= count;
//                                end
//                            if (inc == 1'b1) begin
//                                nState <= plus1;
//                                end
//                            else begin
//                                nState <= freeze;
//                                end
//                                end
//                                end
                    
//                  plus1: begin
//                    if (rst == 1'b1)begin
//                        nState <= zerozero;
//                        end
//                    else begin
//                        nState <= freeze;
//                        end
//                        end
//                endcase
//        end
        
//     //State Register   
//    always @ (posedge(clk) , posedge(rst))
//        begin 
//            if (rst == 1'b1)
//                pState <= zerozero;
//            else 
//                pState <= nState;
//        end 
        
        
//     //Next State Logic
//     assign countEn = (pState == count)? 1'b1 : 1'b0;
//     assign incOne = (pState == inc)? 1'b1 : 1'b0;
        
        
        
endmodule
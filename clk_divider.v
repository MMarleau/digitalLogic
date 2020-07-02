`timescale 1ns / 1ps



module dff(
    input D,
    input clk,
    input rst,
    output reg Q
    );

always @ (posedge(clk), posedge(rst))
begin
    if (rst == 1)
        Q <= 1'b0;
    else
        Q <= D;
end

endmodule


// clk divider brings 100 Mhz down to to 1 hz
module clk_divider(
    input clk,
    input rst,
    output [1:0] Y
    );
    reg [27:0] cnt;
 always @ (posedge(clk), posedge(rst))	// When will Always Block Be Triggered
           begin
               if (rst == 1'b1)
                   // How Output reacts when Reset Is Asserted
                   cnt <= 1'd0;
               else
                // How Output reacts when Rising Edge of Clock Arrives?
               cnt <= cnt + 1;
   end
   assign Y[0] = cnt[20];
   assign Y[1] = cnt[15];

//wire [24:0] din;
//wire [24:0] clkdiv;

//dff dff_inst0 (
//    .clk(clk),
//    .rst(rst),
//    .D(din[0]),
//    .Q(clkdiv[0])

//               );
//    genvar i;
//    generate
//    for (i = 1; i < 25; i=i+1)
//    begin : dff_gen_label
//        dff dff_inst (
//            .clk(clkdiv[i-1]),
//            .rst(rst),
//            .D(din[i]),
//            .Q(clkdiv[i])
//        );
//        end
//    endgenerate
    
//    assign din = ~clkdiv;
    
//    assign Y = clkdiv[21];
    
    endmodule
    
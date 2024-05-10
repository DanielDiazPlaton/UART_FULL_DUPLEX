/**********************************************************************************************
 * Project Name       : UART FULL DUPLEX MODULE TOP
 * Engineer           : Daniel Diaz Platon
 * Module description : 
 * Target             : 5CSXFC6D6F31C6
 * Date               : 2024/05/08
 **********************************************************************************************/

module Duplex (
    input   wire         reset_n,       //  Active low reset.
    input   wire         send,          //  An enable to start sending data.
    input   wire         clk,         //  The main system's clock.
    input   wire         data_in_rx,      //  Serial data recieved from the transmitter.
    input   wire  [1:0]  parity_type,   //  Parity type agreed upon by the Tx and Rx units.
    // input   wire  [1:0]  baud_rate,     //  Baud Rate agreed upon by the Tx and Rx units.
    input   wire  [7:0]  data_in,       //  The data input.

    output  wire         tx_active_flag, //  outputs logic 1 when data is in progress.
    output  wire         tx_done_flag,   //  Outputs logic 1 when data is transmitted
    // output  wire         rx_active_flag, //  outputs logic 1 when data is in progress.
    // output  wire         rx_done_flag,   //  Outputs logic 1 when data is recieved
    // output  wire  [7:0]  data_out_rx,       //  The 8-bits data separated from the frame.
    output  wire         data_out_tx,        //  The 8-bits data separated from the frame.
    output               parity,
    output               heard_bit_out,
	output [6:0]         HEX0,
	output [6:0]         HEX2,
	output [6:0]         HEX3
    // output  wire  [2:0]  error_flag,
    // Display
    // output seg_a,
    // output seg_b,
    // output seg_c,
    // output seg_d,
    // output seg_e,
    // output seg_f,
    // output seg_g
    //  Consits of three bits, each bit is a flag for an error
    //  error_flag[0] ParityError flag, error_flag[1] StartError flag,
    //  error_flag[2] StopError flag.
);

//  wires for interconnection
// wire        data_tx_w;        //  Serial transmitter's data out.
// wire [7:0]  data_out_rx_w;
// wire [3:0]  bin_w;
wire  button_out_w;

//  Transmitter unit instance
TxUnit Transmitter(
    //  Inputs
    .reset_n(reset_n),
    .send(button_out_w),
    .clock(clk),
    .parity_type(parity_type),
    .baud_rate(2'b10),
    .data_in(data_in),

    //  Outputs
    .data_tx(data_out_tx),
    .active_flag(tx_active_flag),
    .done_flag(tx_done_flag)
);

//  Reciever unit instance
UART_Rx Reciever(
	.clk(clk),
	.n_rst(reset_n),
	.rx(data_in_rx),
	.parity(parity),
	// .Rx_SR(),
	.heard_bit_out(heard_bit_out),
	.HEX0(HEX0),
	.HEX2(HEX2),
	.HEX3(HEX3)
);

debounce #(.COUNTS(50000)) dbn 
(
	.clk(clk),
	.rst(~reset_n),
	.button_in(~send),
	.button_out(button_out_w)
);

endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gustov Vladimir
// 
// Create Date: 25.10.2018 14:31:30
// Design Name: estrada_v
// Module Name: icap_wrapper
// Project Name: 
// Target Devices: xc7k160tffg676-2
// Tool Versions: Vivado 2016.3
// Description: This module is wrapper under ICAP2
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module icap_wrapper(
    input         CLK,       // clock signal
    input         RST,       // reset signal    
    input [31:0]  ADDRESS_I, // Address of upload bitstream in QSPI Flash
    input         VALID_I,   // Address valid
    output        DONE       // Work in process
    );

// {{{ local parameters (constants) --------  
    localparam DUMMY_WORD  = 32'hFFFFFFFF;
    localparam SYNC_WORD   = 32'hAA995566;
    localparam NOOP_WORD   = 32'h20000000;
    localparam WBSTAR_WORD = 32'h30020001;
    localparam CMD_WORD    = 32'h30008001;
    localparam IPROG_WORD  = 32'h0000000F;    
    // FSM
    localparam [3:0] IDLE_S      = 4'h00;    
    localparam [3:0] DUMMY_S     = 4'h01;
    localparam [3:0] SYNC_S      = 4'h02;
    localparam [3:0] NOOP_S      = 4'h03;
    localparam [3:0] WBSTAR_S    = 4'h04;
    localparam [3:0] ADDRESS_S   = 4'h05;
    localparam [3:0] CMD_S       = 4'h06;    
    localparam [3:0] IPROG_S     = 4'h07;
    localparam [3:0] FIN_NOOP_S  = 4'h08;
    localparam [3:0] END_S       = 4'h09;
// }}} End local parameters -------------


// {{{ Wire declarations ----------------
    wire [31:0] sO;                        // Output data from ICAP
    wire [31:0] sI;                        // Input data to ICAP
    wire        sWrite_en;                 // Active - Low;
    wire        sChip_enable;              // Active - Low;
    wire        reset_process;

    reg         reset_inprogress = 1'b0;  
    reg         d_reset_inprogress;
    

    reg         finish;
    reg         ce = 1'b0;

    reg         strt_counter;    
    reg  [1:0]  counter = 2'h00;
    reg  [31:0] data    = DUMMY_WORD;
    
    reg         end_trans;
/*
    reg         ;
    reg  [3:0]  ;*/

    reg  [3:0]  state, next_state;    
// }}} End of wire declarations ------------
    
    
// {{{ Wire initializations -------------------
    assign sI            = {data[24], data[25], data[26], data[27], data[28], data[29], data[30], data[31],
                            data[16], data[17], data[18], data[19], data[20], data[21], data[22], data[23],
                            data[8],  data[9],  data[10], data[11], data[12], data[13], data[14], data[15],
                            data[0],  data[1],  data[2],  data[3],  data[4],  data[5],  data[6],  data[7]};
    assign reset_process = (reset_inprogress && d_reset_inprogress);
    assign sWrite_en     = !reset_process;
    assign sChip_enable  = !ce;
    
    assign BUSY = end_trans;
// }}} End of wire initializations ------------


    always @(posedge CLK) begin
        if (RST)
            counter <= 2'h00;
        else if (!strt_counter)
            counter <= 2'h00;
        else 
            counter <= counter + 1'b1;
    end


    always @(posedge CLK) begin
        if (RST)
            reset_inprogress <= 1'b0;
        else if (VALID_I)
            reset_inprogress <= 1'b1;
        else if (end_trans)
            reset_inprogress <= 1'b0;
    end

    always @(posedge CLK) begin
        if (RST)
            d_reset_inprogress <= 1'b0;                        
        else 
            d_reset_inprogress <= reset_inprogress;                    
    end
/*
    always @(posedge CLK) begin
        if (RST)
            d_start_transfer_cnt <= 1'b0;
        else
            d_start_transfer_cnt <= strt_transfer_cnt;
    end*/


// {{{ FSM logic -------------------
    // see XAPP1100 page 6
    always @(posedge CLK) begin
        if (RST)
            state <= IDLE_S;
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = IDLE_S;
        case (state)
            IDLE_S: begin                           // 0
                if (reset_process)
                    next_state = DUMMY_S;
                else
                    next_state = IDLE_S;
            end

            DUMMY_S: begin                          // 1
                next_state = SYNC_S;
            end

            SYNC_S: begin                           // 2
                next_state = NOOP_S;
            end

            NOOP_S: begin                           // 3
                next_state = WBSTAR_S;    
            end

            WBSTAR_S: begin                         // 4
                next_state = ADDRESS_S;
            end

            ADDRESS_S: begin                        // 5
                next_state = CMD_S;
            end

            CMD_S: begin                            // 6
                next_state = IPROG_S;
            end

            IPROG_S: begin                          // 7
                next_state = FIN_NOOP_S;
            end

            FIN_NOOP_S: begin                       // 8
                if (counter == 2'h01)
                    next_state = END_S;
                else
                    next_state = FIN_NOOP_S;
            end

            END_S: begin
                next_state = IDLE_S;
            end

            default: begin
                next_state = IDLE_S;
            end
        endcase
    end

    always @(*) begin
        case (state)
            IDLE_S: begin
                data         = DUMMY_WORD;                
                ce           = 1'b0;
                strt_counter = 1'b0;
                end_trans    = 1'b0;
            end

            DUMMY_S: begin
                data         = DUMMY_WORD;                
                ce           = 1'b1;
                strt_counter = 1'b0;
                end_trans    = 1'b0;
            end

            SYNC_S: begin
                data         = SYNC_WORD;                
                ce           = 1'b1;
                strt_counter = 1'b0;
                end_trans    = 1'b0;
            end

            NOOP_S: begin
                data         = NOOP_WORD;                
                ce           = 1'b1;
                strt_counter = 1'b0;
                end_trans    = 1'b0;                
            end

            WBSTAR_S: begin
                data         = WBSTAR_WORD;                
                ce           = 1'b1;
                strt_counter = 1'b0;
                end_trans    = 1'b0;
            end

            ADDRESS_S: begin
                data         = 32'h00;//ADDRESS_I;                
                ce           = 1'b1;
                strt_counter = 1'b0;
                end_trans    = 1'b0;
            end

            CMD_S: begin
                data         = CMD_WORD;                
                ce           = 1'b1;
                strt_counter = 1'b0;
                end_trans    = 1'b0;
            end

            IPROG_S: begin
                data         = IPROG_WORD;
                ce           = 1'b1;
                strt_counter = 1'b0;
                end_trans    = 1'b0;
            end

            FIN_NOOP_S: begin
                data         = NOOP_WORD;                
                ce           = 1'b1;
                strt_counter = 1'b1;
                end_trans    = 1'b0;
                if (counter == 2'h01) begin
                    ce        = 1'b0;
                    end_trans = 1'b1;
                end
            end

            END_S: begin
                data         = DUMMY_WORD;                
                ce           = 1'b0;
                strt_counter = 1'b0;
                end_trans    = 1'b1;
            end

            default: begin
            end
        endcase
    end
// }}} End of FSM logic ------------


// {{{ Include other modules ------------
    // ICAPE2: Internal Configuration Access Port Kintex-7    
    // Write: RDWRB = Low;  next tact CSIB = Low.
    // Read:  RDWRB = High; next tact CSIB = Low;
    ICAPE2 #(
      .DEVICE_ID(0'h3651093),    // Specifies the pre-programmed Device ID value to be used for
                                 // simulation purposes.
      .ICAP_WIDTH("X32"),        // Specifies the input and output data width.
      .SIM_CFG_FILE_NAME("None") // Specifies the Raw Bitstream (RBT) file to be parsed by 
                                 // the simulation model.
    )
    ICAPE2_inst ( 
      .O        ( sO            ),  // 32-bit output: Configuration data output bus
      .CLK      ( CLK           ),  // 1-bit input: Clock Input
      .CSIB     ( sChip_enable  ),  // 1-bit input: Active-Low ICAP Enable
      .I        ( sI            ),  // 32-bit input: Configuration data input bus
      .RDWRB    ( sWrite_en     )   // 1-bit input: Read/Write Select input      
    );

    /*dbg_spi_icap dbg_icap (
        .clk              ( CLK ),
      
        .probe0           ( sI           ),
        .probe1           ( sChip_enable ),
        .probe2           ( sWrite_en    ),
        .probe3           ( VALID_I      ),
        .probe4           ( state        ),
        .probe5           ( next_state   ),
        .probe6           ( reset_inprogress )
    );*/
// }}} End of Include other modules ------------
endmodule

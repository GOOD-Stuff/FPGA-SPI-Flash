
`timescale 1ps/1ps

module srio_gen2_0_srio_clk
 (// Clock in ports
  input         sys_clkp,
  input         sys_clkn,
  // Status and control signals
  input         sys_rst,
  input         mode_1x,
  // Clock out ports
  output        log_clk,
  output        phy_clk,
  output        gt_pcs_clk,
  output        gt_clk,
  output        refclk,
  output        drpclk,
 
  // Status and control signals
  output        clk_lock
 );

  //------------------------------------
  // wire declarations
  //------------------------------------
  wire        refclk_bufg;
  wire        clkout0;
  wire        clkout1;
  wire        clkout2;
  wire        clkout3;
  wire [15:0] do_unused;
  wire        drdy_unused;
  wire        psdone_unused;
  wire        clkfbout;
  wire        to_feedback_in;
  wire        clkfboutb_unused;
  wire        clkout0b_unused;
  wire        clkout1b_unused;
  wire        clkout2b_unused;
  wire        clkout3_unused;
  wire        clkout3b_unused;
  wire        clkout4_unused;
  wire        clkout5_unused;
  wire        clkout6_unused;
  wire        clkfbstopped_unused;
  wire        clkinstopped_unused;
  // End wire declarations
  //------------------------------------


//  // input buffering

  //------------------------------------
  IBUFDS_GTE2 u_refclk_ibufds(
    .O      (refclk),
    .I      (sys_clkp),
    .IB     (sys_clkn),
    .CEB    (1'b0),
    .ODIV2  ()
  );

  BUFG refclk_bufg_inst
   (.O (refclk_bufg),
    .I (refclk));
  // End input buffering

  // MMCME2_ADV instantiation
  //------------------------------------
  MMCME2_ADV
  #(.BANDWIDTH            ("OPTIMIZED"),
    .CLKOUT4_CASCADE      ("FALSE"),
    .COMPENSATION         ("ZHOLD"),
    .STARTUP_WAIT         ("FALSE"),
    .DIVCLK_DIVIDE        (1),
    .CLKFBOUT_MULT_F      (6.500),
    .CLKFBOUT_PHASE       (0.000),
    .CLKFBOUT_USE_FINE_PS ("FALSE"),
    .CLKOUT0_DIVIDE_F     (6.500),
    .CLKOUT0_PHASE        (0.000),
    .CLKOUT0_DUTY_CYCLE   (0.500),
    .CLKOUT0_USE_FINE_PS  ("FALSE"),
    .CLKOUT1_DIVIDE       (26),
    .CLKOUT1_PHASE        (0.000),
    .CLKOUT1_DUTY_CYCLE   (0.500),
    .CLKOUT1_USE_FINE_PS  ("FALSE"),
    .CLKOUT2_DIVIDE       (13),
    .CLKOUT2_PHASE        (0.000),
    .CLKOUT2_DUTY_CYCLE   (0.500),
    .CLKOUT2_USE_FINE_PS  ("FALSE"),
    .CLKIN1_PERIOD        (6.400),
    .REF_JITTER1          (0.010))
  srio_mmcm_inst
    // Output clocks
   (.CLKFBOUT            (clkfbout),
    .CLKFBOUTB           (clkfboutb_unused),
    .CLKOUT0             (clkout0),
    .CLKOUT0B            (clkout0b_unused),
    .CLKOUT1             (clkout1),
    .CLKOUT1B            (clkout1b_unused),
    .CLKOUT2             (clkout2),
    .CLKOUT2B            (clkout2b_unused),
    .CLKOUT3             (clkout3_unused),
    .CLKOUT3B            (clkout3b_unused),
    .CLKOUT4             (clkout4_unused),
    .CLKOUT5             (clkout5_unused),
    .CLKOUT6             (clkout6_unused),
     // Input clock control
    .CLKFBIN             (clkfbout),
    .CLKIN1              (refclk_bufg),
    .CLKIN2              (1'b0),
     // Tied to always select the primary input clock
    .CLKINSEL            (1'b1),
    // Ports for dynamic reconfiguration
    .DADDR               (7'h0),
    .DCLK                (1'b0),
    .DEN                 (1'b0),
    .DI                  (16'h0),
    .DO                  (do_unused),
    .DRDY                (drdy_unused),
    .DWE                 (1'b0),
    // Ports for dynamic phase shift
    .PSCLK               (1'b0),
    .PSEN                (1'b0),
    .PSINCDEC            (1'b0),
    .PSDONE              (psdone_unused),
    // Other control and status signals
    .LOCKED              (clk_lock),
    .CLKINSTOPPED        (clkinstopped_unused),
    .CLKFBSTOPPED        (clkfbstopped_unused),
    .PWRDWN              (1'b0),
    .RST                 (1'b0)
  );
  // End 7 series MMCM instantiation

//______________________________________________________________________________

  // output buffering
  //-----------------------------------

  BUFG drpclk_bufr_inst
   (.O   (drpclk),
    .I   (clkout1));

  BUFG gt_clk_bufg_inst
   (.O (gt_clk),
    .I (clkout0));

  BUFG gt_pcs_clk_bufg_inst
   (.O (gt_pcs_clk),
    .I (clkout2));

  BUFGMUX phy_clk_bufg_inst
   (.O (phy_clk),
    .I0(clkout2),
    .I1(clkout1),
    .S (mode_1x));

  // Note that this bufg is a duplicate of the gt_pcs_clk bufg, and is not necessary if BUFG resources are limited.
  BUFG log_clk_bufg_inst
   (.O (log_clk),
    .I (clkout2));
 
  // End output buffering
//______________________________________________________________________________

endmodule


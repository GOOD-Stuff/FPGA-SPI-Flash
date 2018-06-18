// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sat Jun  9 17:11:32 2018
// Host        : vldmr-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim -rename_top fifo_cmd -prefix
//               fifo_cmd_ fifo_cmd_sim_netlist.v
// Design      : fifo_cmd
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku9p-ffve900-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_cmd,fifo_generator_v13_2_2,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_2,Vivado 2018.1" *) 
(* NotValidForBitStream *)
module fifo_cmd
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    prog_full,
    prog_empty,
    wr_rst_busy,
    rd_rst_busy);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, PHASE 0.000" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, PHASE 0.000" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [59:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [59:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output prog_full;
  output prog_empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [59:0]din;
  wire [59:0]dout;
  wire empty;
  wire full;
  wire prog_empty;
  wire prog_full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire rst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [11:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [11:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [11:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "12" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "60" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "60" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "kintexuplus" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "58" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "59" *) 
  (* C_PROG_EMPTY_TYPE = "1" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "4095" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "4094" *) 
  (* C_PROG_FULL_TYPE = "1" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "12" *) 
  (* C_RD_DEPTH = "4096" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "12" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "1" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "12" *) 
  (* C_WR_DEPTH = "4096" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "12" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  fifo_cmd_fifo_generator_v13_2_2 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[11:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(prog_empty),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(prog_full),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[11:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[11:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* REG_OUTPUT = "1" *) 
(* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) (* VERSION = "0" *) 
(* WIDTH = "12" *) (* XPM_MODULE = "TRUE" *) (* xpm_cdc = "GRAY" *) 
module fifo_cmd_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [11:0]src_in_bin;
  input dest_clk;
  output [11:0]dest_out_bin;

  wire [11:0]async_path;
  wire [10:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [11:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [11:0]\dest_graysync_ff[1] ;
  wire [11:0]dest_out_bin;
  wire [10:0]gray_enc;
  wire src_clk;
  wire [11:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[10]),
        .Q(\dest_graysync_ff[0] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[11]),
        .Q(\dest_graysync_ff[0] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [10]),
        .Q(\dest_graysync_ff[1] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [11]),
        .Q(\dest_graysync_ff[1] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(binval[1]),
        .O(binval[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[10]_i_1 
       (.I0(\dest_graysync_ff[1] [10]),
        .I1(\dest_graysync_ff[1] [11]),
        .O(binval[10]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(binval[6]),
        .I4(\dest_graysync_ff[1] [4]),
        .I5(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(binval[6]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(binval[6]),
        .I3(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(binval[6]),
        .I2(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(binval[6]),
        .O(binval[5]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [10]),
        .I3(\dest_graysync_ff[1] [11]),
        .I4(\dest_graysync_ff[1] [9]),
        .I5(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [10]),
        .I4(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[8]_i_1 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [10]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [9]),
        .O(binval[8]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[9]_i_1 
       (.I0(\dest_graysync_ff[1] [9]),
        .I1(\dest_graysync_ff[1] [11]),
        .I2(\dest_graysync_ff[1] [10]),
        .O(binval[9]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[10]),
        .Q(dest_out_bin[10]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [11]),
        .Q(dest_out_bin[11]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[9]),
        .Q(dest_out_bin[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[10]_i_1 
       (.I0(src_in_bin[11]),
        .I1(src_in_bin[10]),
        .O(gray_enc[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[9]_i_1 
       (.I0(src_in_bin[10]),
        .I1(src_in_bin[9]),
        .O(gray_enc[9]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[10] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[10]),
        .Q(async_path[10]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[11] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[11]),
        .Q(async_path[11]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "12" *) (* XPM_MODULE = "TRUE" *) 
(* xpm_cdc = "GRAY" *) 
module fifo_cmd_xpm_cdc_gray__1
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [11:0]src_in_bin;
  input dest_clk;
  output [11:0]dest_out_bin;

  wire [11:0]async_path;
  wire [10:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [11:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [11:0]\dest_graysync_ff[1] ;
  wire [11:0]dest_out_bin;
  wire [10:0]gray_enc;
  wire src_clk;
  wire [11:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[10]),
        .Q(\dest_graysync_ff[0] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[11]),
        .Q(\dest_graysync_ff[0] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [10]),
        .Q(\dest_graysync_ff[1] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [11]),
        .Q(\dest_graysync_ff[1] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(binval[1]),
        .O(binval[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[10]_i_1 
       (.I0(\dest_graysync_ff[1] [10]),
        .I1(\dest_graysync_ff[1] [11]),
        .O(binval[10]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(binval[6]),
        .I4(\dest_graysync_ff[1] [4]),
        .I5(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(binval[6]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(binval[6]),
        .I3(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(binval[6]),
        .I2(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(binval[6]),
        .O(binval[5]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [10]),
        .I3(\dest_graysync_ff[1] [11]),
        .I4(\dest_graysync_ff[1] [9]),
        .I5(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [10]),
        .I4(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[8]_i_1 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [10]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [9]),
        .O(binval[8]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[9]_i_1 
       (.I0(\dest_graysync_ff[1] [9]),
        .I1(\dest_graysync_ff[1] [11]),
        .I2(\dest_graysync_ff[1] [10]),
        .O(binval[9]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[10]),
        .Q(dest_out_bin[10]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [11]),
        .Q(dest_out_bin[11]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[9]),
        .Q(dest_out_bin[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[10]_i_1 
       (.I0(src_in_bin[11]),
        .I1(src_in_bin[10]),
        .O(gray_enc[10]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[9]_i_1 
       (.I0(src_in_bin[10]),
        .I1(src_in_bin[9]),
        .O(gray_enc[9]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[10] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[10]),
        .Q(async_path[10]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[11] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[11]),
        .Q(async_path[11]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* SIM_ASSERT_CHK = "0" *) 
(* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) 
(* xpm_cdc = "SINGLE" *) 
module fifo_cmd_xpm_cdc_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SINGLE" *) 
module fifo_cmd_xpm_cdc_single__1
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* SIM_ASSERT_CHK = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SYNC_RST" *) 
module fifo_cmd_xpm_cdc_sync_rst
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SYNC_RST" *) 
module fifo_cmd_xpm_cdc_sync_rst__1
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

module fifo_cmd_blk_mem_gen_generic_cstr
   (dout,
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    ENB_dly_reg_D,
    rd_clk,
    wr_clk,
    ENB_I,
    tmp_ram_regout_en,
    ram_rstreg_b,
    \gic0.gc0.count_d2_reg[11] ,
    Q,
    din,
    E,
    SR,
    out,
    wr_en);
  output [59:0]dout;
  output \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  output ENB_dly_reg_D;
  input rd_clk;
  input wr_clk;
  input ENB_I;
  input tmp_ram_regout_en;
  input ram_rstreg_b;
  input [11:0]\gic0.gc0.count_d2_reg[11] ;
  input [11:0]Q;
  input [59:0]din;
  input [0:0]E;
  input [0:0]SR;
  input out;
  input wr_en;

  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire ENB_dly_reg_D;
  wire POR_A;
  wire [11:0]Q;
  wire [0:0]SR;
  wire [59:0]din;
  wire [59:0]dout;
  wire [11:0]\gic0.gc0.count_d2_reg[11] ;
  wire out;
  wire ram_rstreg_b;
  wire rd_clk;
  wire tmp_ram_regout_en;
  wire wr_clk;
  wire wr_en;

  fifo_cmd_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.E(E),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .POR_A(POR_A),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .din(din[8:0]),
        .dout(dout[8:0]),
        .\gic0.gc0.count_d2_reg[11] (\gic0.gc0.count_d2_reg[11] ),
        .ram_rstreg_b(ram_rstreg_b),
        .rd_clk(rd_clk),
        .tmp_ram_regout_en(tmp_ram_regout_en),
        .wr_clk(wr_clk));
  fifo_cmd_blk_mem_gen_prim_width__parameterized0 \ramloop[1].ram.r 
       (.E(E),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .POR_A(POR_A),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .din(din[17:9]),
        .dout(dout[17:9]),
        .\gic0.gc0.count_d2_reg[11] (\gic0.gc0.count_d2_reg[11] ),
        .ram_rstreg_b(ram_rstreg_b),
        .rd_clk(rd_clk),
        .tmp_ram_regout_en(tmp_ram_regout_en),
        .wr_clk(wr_clk));
  fifo_cmd_blk_mem_gen_prim_width__parameterized1 \ramloop[2].ram.r 
       (.E(E),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .POR_A(POR_A),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .din(din[26:18]),
        .dout(dout[26:18]),
        .\gic0.gc0.count_d2_reg[11] (\gic0.gc0.count_d2_reg[11] ),
        .ram_rstreg_b(ram_rstreg_b),
        .rd_clk(rd_clk),
        .tmp_ram_regout_en(tmp_ram_regout_en),
        .wr_clk(wr_clk));
  fifo_cmd_blk_mem_gen_prim_width__parameterized2 \ramloop[3].ram.r 
       (.E(E),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .POR_A(POR_A),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .din(din[35:27]),
        .dout(dout[35:27]),
        .\gic0.gc0.count_d2_reg[11] (\gic0.gc0.count_d2_reg[11] ),
        .ram_rstreg_b(ram_rstreg_b),
        .rd_clk(rd_clk),
        .tmp_ram_regout_en(tmp_ram_regout_en),
        .wr_clk(wr_clk));
  fifo_cmd_blk_mem_gen_prim_width__parameterized3 \ramloop[4].ram.r 
       (.E(E),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .POR_A(POR_A),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .din(din[44:36]),
        .dout(dout[44:36]),
        .\gic0.gc0.count_d2_reg[11] (\gic0.gc0.count_d2_reg[11] ),
        .ram_rstreg_b(ram_rstreg_b),
        .rd_clk(rd_clk),
        .tmp_ram_regout_en(tmp_ram_regout_en),
        .wr_clk(wr_clk));
  fifo_cmd_blk_mem_gen_prim_width__parameterized4 \ramloop[5].ram.r 
       (.E(E),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .POR_A(POR_A),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .din(din[53:45]),
        .dout(dout[53:45]),
        .\gic0.gc0.count_d2_reg[11] (\gic0.gc0.count_d2_reg[11] ),
        .ram_rstreg_b(ram_rstreg_b),
        .rd_clk(rd_clk),
        .tmp_ram_regout_en(tmp_ram_regout_en),
        .wr_clk(wr_clk));
  fifo_cmd_blk_mem_gen_prim_width__parameterized5 \ramloop[6].ram.r 
       (.\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .E(E),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .ENB_dly_reg_D(ENB_dly_reg_D),
        .POR_A(POR_A),
        .Q(Q),
        .SR(SR),
        .din(din[59:54]),
        .dout(dout[59:54]),
        .\gic0.gc0.count_d2_reg[11] (\gic0.gc0.count_d2_reg[11] ),
        .out(out),
        .ram_rstreg_b(ram_rstreg_b),
        .rd_clk(rd_clk),
        .tmp_ram_regout_en(tmp_ram_regout_en),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
endmodule

module fifo_cmd_blk_mem_gen_prim_width
   (dout,
    wr_clk,
    rd_clk,
    ENA_I,
    ENB_I,
    tmp_ram_regout_en,
    POR_A,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstreg_b,
    \gic0.gc0.count_d2_reg[11] ,
    Q,
    din,
    E);
  output [8:0]dout;
  input wr_clk;
  input rd_clk;
  input ENA_I;
  input ENB_I;
  input tmp_ram_regout_en;
  input POR_A;
  input \SAFETY_CKT_GEN.POR_B_reg ;
  input ram_rstreg_b;
  input [11:0]\gic0.gc0.count_d2_reg[11] ;
  input [11:0]Q;
  input [8:0]din;
  input [0:0]E;

  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire POR_A;
  wire [11:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire [8:0]din;
  wire [8:0]dout;
  wire [11:0]\gic0.gc0.count_d2_reg[11] ;
  wire ram_rstreg_b;
  wire rd_clk;
  wire tmp_ram_regout_en;
  wire wr_clk;

  fifo_cmd_blk_mem_gen_prim_wrapper \prim_noinit.ram 
       (.E(E),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .POR_A(POR_A),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .din(din),
        .dout(dout),
        .\gic0.gc0.count_d2_reg[11] (\gic0.gc0.count_d2_reg[11] ),
        .ram_rstreg_b(ram_rstreg_b),
        .rd_clk(rd_clk),
        .tmp_ram_regout_en(tmp_ram_regout_en),
        .wr_clk(wr_clk));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_cmd_blk_mem_gen_prim_width__parameterized0
   (dout,
    wr_clk,
    rd_clk,
    ENA_I,
    ENB_I,
    tmp_ram_regout_en,
    POR_A,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstreg_b,
    \gic0.gc0.count_d2_reg[11] ,
    Q,
    din,
    E);
  output [8:0]dout;
  input wr_clk;
  input rd_clk;
  input ENA_I;
  input ENB_I;
  input tmp_ram_regout_en;
  input POR_A;
  input \SAFETY_CKT_GEN.POR_B_reg ;
  input ram_rstreg_b;
  input [11:0]\gic0.gc0.count_d2_reg[11] ;
  input [11:0]Q;
  input [8:0]din;
  input [0:0]E;

  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire POR_A;
  wire [11:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire [8:0]din;
  wire [8:0]dout;
  wire [11:0]\gic0.gc0.count_d2_reg[11] ;
  wire ram_rstreg_b;
  wire rd_clk;
  wire tmp_ram_regout_en;
  wire wr_clk;

  fifo_cmd_blk_mem_gen_prim_wrapper__parameterized0 \prim_noinit.ram 
       (.E(E),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .POR_A(POR_A),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .din(din),
        .dout(dout),
        .\gic0.gc0.count_d2_reg[11] (\gic0.gc0.count_d2_reg[11] ),
        .ram_rstreg_b(ram_rstreg_b),
        .rd_clk(rd_clk),
        .tmp_ram_regout_en(tmp_ram_regout_en),
        .wr_clk(wr_clk));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_cmd_blk_mem_gen_prim_width__parameterized1
   (dout,
    wr_clk,
    rd_clk,
    ENA_I,
    ENB_I,
    tmp_ram_regout_en,
    POR_A,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstreg_b,
    \gic0.gc0.count_d2_reg[11] ,
    Q,
    din,
    E);
  output [8:0]dout;
  input wr_clk;
  input rd_clk;
  input ENA_I;
  input ENB_I;
  input tmp_ram_regout_en;
  input POR_A;
  input \SAFETY_CKT_GEN.POR_B_reg ;
  input ram_rstreg_b;
  input [11:0]\gic0.gc0.count_d2_reg[11] ;
  input [11:0]Q;
  input [8:0]din;
  input [0:0]E;

  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire POR_A;
  wire [11:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire [8:0]din;
  wire [8:0]dout;
  wire [11:0]\gic0.gc0.count_d2_reg[11] ;
  wire ram_rstreg_b;
  wire rd_clk;
  wire tmp_ram_regout_en;
  wire wr_clk;

  fifo_cmd_blk_mem_gen_prim_wrapper__parameterized1 \prim_noinit.ram 
       (.E(E),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .POR_A(POR_A),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .din(din),
        .dout(dout),
        .\gic0.gc0.count_d2_reg[11] (\gic0.gc0.count_d2_reg[11] ),
        .ram_rstreg_b(ram_rstreg_b),
        .rd_clk(rd_clk),
        .tmp_ram_regout_en(tmp_ram_regout_en),
        .wr_clk(wr_clk));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_cmd_blk_mem_gen_prim_width__parameterized2
   (dout,
    wr_clk,
    rd_clk,
    ENA_I,
    ENB_I,
    tmp_ram_regout_en,
    POR_A,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstreg_b,
    \gic0.gc0.count_d2_reg[11] ,
    Q,
    din,
    E);
  output [8:0]dout;
  input wr_clk;
  input rd_clk;
  input ENA_I;
  input ENB_I;
  input tmp_ram_regout_en;
  input POR_A;
  input \SAFETY_CKT_GEN.POR_B_reg ;
  input ram_rstreg_b;
  input [11:0]\gic0.gc0.count_d2_reg[11] ;
  input [11:0]Q;
  input [8:0]din;
  input [0:0]E;

  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire POR_A;
  wire [11:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire [8:0]din;
  wire [8:0]dout;
  wire [11:0]\gic0.gc0.count_d2_reg[11] ;
  wire ram_rstreg_b;
  wire rd_clk;
  wire tmp_ram_regout_en;
  wire wr_clk;

  fifo_cmd_blk_mem_gen_prim_wrapper__parameterized2 \prim_noinit.ram 
       (.E(E),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .POR_A(POR_A),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .din(din),
        .dout(dout),
        .\gic0.gc0.count_d2_reg[11] (\gic0.gc0.count_d2_reg[11] ),
        .ram_rstreg_b(ram_rstreg_b),
        .rd_clk(rd_clk),
        .tmp_ram_regout_en(tmp_ram_regout_en),
        .wr_clk(wr_clk));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_cmd_blk_mem_gen_prim_width__parameterized3
   (dout,
    wr_clk,
    rd_clk,
    ENA_I,
    ENB_I,
    tmp_ram_regout_en,
    POR_A,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstreg_b,
    \gic0.gc0.count_d2_reg[11] ,
    Q,
    din,
    E);
  output [8:0]dout;
  input wr_clk;
  input rd_clk;
  input ENA_I;
  input ENB_I;
  input tmp_ram_regout_en;
  input POR_A;
  input \SAFETY_CKT_GEN.POR_B_reg ;
  input ram_rstreg_b;
  input [11:0]\gic0.gc0.count_d2_reg[11] ;
  input [11:0]Q;
  input [8:0]din;
  input [0:0]E;

  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire POR_A;
  wire [11:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire [8:0]din;
  wire [8:0]dout;
  wire [11:0]\gic0.gc0.count_d2_reg[11] ;
  wire ram_rstreg_b;
  wire rd_clk;
  wire tmp_ram_regout_en;
  wire wr_clk;

  fifo_cmd_blk_mem_gen_prim_wrapper__parameterized3 \prim_noinit.ram 
       (.E(E),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .POR_A(POR_A),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .din(din),
        .dout(dout),
        .\gic0.gc0.count_d2_reg[11] (\gic0.gc0.count_d2_reg[11] ),
        .ram_rstreg_b(ram_rstreg_b),
        .rd_clk(rd_clk),
        .tmp_ram_regout_en(tmp_ram_regout_en),
        .wr_clk(wr_clk));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_cmd_blk_mem_gen_prim_width__parameterized4
   (dout,
    wr_clk,
    rd_clk,
    ENA_I,
    ENB_I,
    tmp_ram_regout_en,
    POR_A,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstreg_b,
    \gic0.gc0.count_d2_reg[11] ,
    Q,
    din,
    E);
  output [8:0]dout;
  input wr_clk;
  input rd_clk;
  input ENA_I;
  input ENB_I;
  input tmp_ram_regout_en;
  input POR_A;
  input \SAFETY_CKT_GEN.POR_B_reg ;
  input ram_rstreg_b;
  input [11:0]\gic0.gc0.count_d2_reg[11] ;
  input [11:0]Q;
  input [8:0]din;
  input [0:0]E;

  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire POR_A;
  wire [11:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire [8:0]din;
  wire [8:0]dout;
  wire [11:0]\gic0.gc0.count_d2_reg[11] ;
  wire ram_rstreg_b;
  wire rd_clk;
  wire tmp_ram_regout_en;
  wire wr_clk;

  fifo_cmd_blk_mem_gen_prim_wrapper__parameterized4 \prim_noinit.ram 
       (.E(E),
        .ENA_I(ENA_I),
        .ENB_I(ENB_I),
        .POR_A(POR_A),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\SAFETY_CKT_GEN.POR_B_reg ),
        .din(din),
        .dout(dout),
        .\gic0.gc0.count_d2_reg[11] (\gic0.gc0.count_d2_reg[11] ),
        .ram_rstreg_b(ram_rstreg_b),
        .rd_clk(rd_clk),
        .tmp_ram_regout_en(tmp_ram_regout_en),
        .wr_clk(wr_clk));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_cmd_blk_mem_gen_prim_width__parameterized5
   (dout,
    ENA_I,
    POR_A,
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    ENB_dly_reg_D,
    rd_clk,
    wr_clk,
    ENB_I,
    tmp_ram_regout_en,
    ram_rstreg_b,
    \gic0.gc0.count_d2_reg[11] ,
    Q,
    din,
    E,
    SR,
    out,
    wr_en);
  output [5:0]dout;
  output ENA_I;
  output POR_A;
  output \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  output ENB_dly_reg_D;
  input rd_clk;
  input wr_clk;
  input ENB_I;
  input tmp_ram_regout_en;
  input ram_rstreg_b;
  input [11:0]\gic0.gc0.count_d2_reg[11] ;
  input [11:0]Q;
  input [5:0]din;
  input [0:0]E;
  input [0:0]SR;
  input out;
  input wr_en;

  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire [0:0]E;
  wire ENA_I;
  wire ENA_dly;
  wire ENA_dly_D;
  wire ENB_I;
  wire ENB_dly_reg;
  wire ENB_dly_reg_D;
  wire POR_A;
  wire [11:0]Q;
  wire \SAFETY_CKT_GEN.POR_A_i_1_n_0 ;
  wire \SAFETY_CKT_GEN.POR_B_i_1_n_0 ;
  wire \SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[3]_srl3_n_0 ;
  wire \SAFETY_CKT_GEN.RSTA_SHFT_REG_reg_n_0_[0] ;
  wire \SAFETY_CKT_GEN.RSTA_SHFT_REG_reg_n_0_[4] ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3_n_0 ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg_n_0_[0] ;
  wire \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg_n_0_[4] ;
  wire [0:0]SR;
  wire [5:0]din;
  wire [5:0]dout;
  wire [11:0]\gic0.gc0.count_d2_reg[11] ;
  wire out;
  wire ram_rstreg_b;
  wire rd_clk;
  wire tmp_ram_regout_en;
  wire wr_clk;
  wire wr_en;

  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENA_NO_REG.ENA_dly_D_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(ENA_dly),
        .Q(ENA_dly_D),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENA_NO_REG.ENA_dly_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(POR_A),
        .Q(ENA_dly),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENB_WITH_REG.ENB_dly_reg_D_reg 
       (.C(rd_clk),
        .CE(1'b1),
        .D(ENB_dly_reg),
        .Q(ENB_dly_reg_D),
        .R(1'b0));
  FDSE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.ENB_WITH_REG.ENB_dly_reg_reg 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .Q(ENB_dly_reg),
        .S(SR));
  LUT2 #(
    .INIT(4'h6)) 
    \SAFETY_CKT_GEN.POR_A_i_1 
       (.I0(\SAFETY_CKT_GEN.RSTA_SHFT_REG_reg_n_0_[0] ),
        .I1(\SAFETY_CKT_GEN.RSTA_SHFT_REG_reg_n_0_[4] ),
        .O(\SAFETY_CKT_GEN.POR_A_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.POR_A_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\SAFETY_CKT_GEN.POR_A_i_1_n_0 ),
        .Q(POR_A),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \SAFETY_CKT_GEN.POR_B_i_1 
       (.I0(\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg_n_0_[0] ),
        .I1(\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg_n_0_[4] ),
        .O(\SAFETY_CKT_GEN.POR_B_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.POR_B_reg 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\SAFETY_CKT_GEN.POR_B_i_1_n_0 ),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(1'b1),
        .Q(\SAFETY_CKT_GEN.RSTA_SHFT_REG_reg_n_0_[0] ),
        .R(1'b0));
  (* srl_bus_name = "U0/\inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmgb.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/SAFETY_CKT_GEN.RSTA_SHFT_REG_reg " *) 
  (* srl_name = "U0/\inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmgb.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[3]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[3]_srl3 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(wr_clk),
        .D(\SAFETY_CKT_GEN.RSTA_SHFT_REG_reg_n_0_[0] ),
        .Q(\SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[3]_srl3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[4] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\SAFETY_CKT_GEN.RSTA_SHFT_REG_reg[3]_srl3_n_0 ),
        .Q(\SAFETY_CKT_GEN.RSTA_SHFT_REG_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(1'b1),
        .Q(\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg_n_0_[0] ),
        .R(1'b0));
  (* srl_bus_name = "U0/\inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmgb.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/SAFETY_CKT_GEN.RSTB_SHFT_REG_reg " *) 
  (* srl_name = "U0/\inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmgb.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(rd_clk),
        .D(\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg_n_0_[0] ),
        .Q(\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[4] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg[3]_srl3_n_0 ),
        .Q(\SAFETY_CKT_GEN.RSTB_SHFT_REG_reg_n_0_[4] ),
        .R(1'b0));
  fifo_cmd_blk_mem_gen_prim_wrapper__parameterized5 \prim_noinit.ram 
       (.E(E),
        .ENA_I(ENA_I),
        .ENA_dly_D(ENA_dly_D),
        .ENB_I(ENB_I),
        .POR_A(POR_A),
        .Q(Q),
        .\SAFETY_CKT_GEN.POR_B_reg (\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .din(din),
        .dout(dout),
        .\gic0.gc0.count_d2_reg[11] (\gic0.gc0.count_d2_reg[11] ),
        .out(out),
        .ram_rstreg_b(ram_rstreg_b),
        .rd_clk(rd_clk),
        .tmp_ram_regout_en(tmp_ram_regout_en),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
endmodule

module fifo_cmd_blk_mem_gen_prim_wrapper
   (dout,
    wr_clk,
    rd_clk,
    ENA_I,
    ENB_I,
    tmp_ram_regout_en,
    POR_A,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstreg_b,
    \gic0.gc0.count_d2_reg[11] ,
    Q,
    din,
    E);
  output [8:0]dout;
  input wr_clk;
  input rd_clk;
  input ENA_I;
  input ENB_I;
  input tmp_ram_regout_en;
  input POR_A;
  input \SAFETY_CKT_GEN.POR_B_reg ;
  input ram_rstreg_b;
  input [11:0]\gic0.gc0.count_d2_reg[11] ;
  input [11:0]Q;
  input [8:0]din;
  input [0:0]E;

  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire POR_A;
  wire [11:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire [8:0]din;
  wire [8:0]dout;
  wire [11:0]\gic0.gc0.count_d2_reg[11] ;
  wire ram_rstreg_b;
  wire rd_clk;
  wire tmp_ram_regout_en;
  wire wr_clk;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTDBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTSBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTA_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPA_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTADOUT_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPADOUTP_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({\gic0.gc0.count_d2_reg[11] ,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({Q,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b0),
        .CASDOMUXEN_B(1'b0),
        .CASDOUTA(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTB_UNCONNECTED [31:0]),
        .CASDOUTPA(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPB_UNCONNECTED [3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b0),
        .CASOREGIMUXEN_B(1'b0),
        .CASOUTDBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTDBITERR_UNCONNECTED ),
        .CASOUTSBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTSBITERR_UNCONNECTED ),
        .CLKARDCLK(wr_clk),
        .CLKBWRCLK(rd_clk),
        .DBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din[7:0]}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINPADINP({1'b0,1'b0,1'b0,din[8]}),
        .DINPBDINP({1'b0,1'b0,1'b0,1'b0}),
        .DOUTADOUT(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT({\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTBDOUT_UNCONNECTED [31:8],dout[7:0]}),
        .DOUTPADOUTP(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP({\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPBDOUTP_UNCONNECTED [3:1],dout[8]}),
        .ECCPARITY(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b0),
        .ENARDEN(ENA_I),
        .ENBWREN(ENB_I),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(tmp_ram_regout_en),
        .RSTRAMARSTRAM(POR_A),
        .RSTRAMB(\SAFETY_CKT_GEN.POR_B_reg ),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(ram_rstreg_b),
        .SBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,E}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_cmd_blk_mem_gen_prim_wrapper__parameterized0
   (dout,
    wr_clk,
    rd_clk,
    ENA_I,
    ENB_I,
    tmp_ram_regout_en,
    POR_A,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstreg_b,
    \gic0.gc0.count_d2_reg[11] ,
    Q,
    din,
    E);
  output [8:0]dout;
  input wr_clk;
  input rd_clk;
  input ENA_I;
  input ENB_I;
  input tmp_ram_regout_en;
  input POR_A;
  input \SAFETY_CKT_GEN.POR_B_reg ;
  input ram_rstreg_b;
  input [11:0]\gic0.gc0.count_d2_reg[11] ;
  input [11:0]Q;
  input [8:0]din;
  input [0:0]E;

  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire POR_A;
  wire [11:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire [8:0]din;
  wire [8:0]dout;
  wire [11:0]\gic0.gc0.count_d2_reg[11] ;
  wire ram_rstreg_b;
  wire rd_clk;
  wire tmp_ram_regout_en;
  wire wr_clk;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTDBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTSBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTA_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPA_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTADOUT_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPADOUTP_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({\gic0.gc0.count_d2_reg[11] ,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({Q,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b0),
        .CASDOMUXEN_B(1'b0),
        .CASDOUTA(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTB_UNCONNECTED [31:0]),
        .CASDOUTPA(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPB_UNCONNECTED [3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b0),
        .CASOREGIMUXEN_B(1'b0),
        .CASOUTDBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTDBITERR_UNCONNECTED ),
        .CASOUTSBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTSBITERR_UNCONNECTED ),
        .CLKARDCLK(wr_clk),
        .CLKBWRCLK(rd_clk),
        .DBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din[7:0]}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINPADINP({1'b0,1'b0,1'b0,din[8]}),
        .DINPBDINP({1'b0,1'b0,1'b0,1'b0}),
        .DOUTADOUT(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT({\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTBDOUT_UNCONNECTED [31:8],dout[7:0]}),
        .DOUTPADOUTP(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP({\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPBDOUTP_UNCONNECTED [3:1],dout[8]}),
        .ECCPARITY(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b0),
        .ENARDEN(ENA_I),
        .ENBWREN(ENB_I),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(tmp_ram_regout_en),
        .RSTRAMARSTRAM(POR_A),
        .RSTRAMB(\SAFETY_CKT_GEN.POR_B_reg ),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(ram_rstreg_b),
        .SBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,E}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_cmd_blk_mem_gen_prim_wrapper__parameterized1
   (dout,
    wr_clk,
    rd_clk,
    ENA_I,
    ENB_I,
    tmp_ram_regout_en,
    POR_A,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstreg_b,
    \gic0.gc0.count_d2_reg[11] ,
    Q,
    din,
    E);
  output [8:0]dout;
  input wr_clk;
  input rd_clk;
  input ENA_I;
  input ENB_I;
  input tmp_ram_regout_en;
  input POR_A;
  input \SAFETY_CKT_GEN.POR_B_reg ;
  input ram_rstreg_b;
  input [11:0]\gic0.gc0.count_d2_reg[11] ;
  input [11:0]Q;
  input [8:0]din;
  input [0:0]E;

  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire POR_A;
  wire [11:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire [8:0]din;
  wire [8:0]dout;
  wire [11:0]\gic0.gc0.count_d2_reg[11] ;
  wire ram_rstreg_b;
  wire rd_clk;
  wire tmp_ram_regout_en;
  wire wr_clk;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTDBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTSBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTA_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPA_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTADOUT_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPADOUTP_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({\gic0.gc0.count_d2_reg[11] ,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({Q,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b0),
        .CASDOMUXEN_B(1'b0),
        .CASDOUTA(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTB_UNCONNECTED [31:0]),
        .CASDOUTPA(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPB_UNCONNECTED [3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b0),
        .CASOREGIMUXEN_B(1'b0),
        .CASOUTDBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTDBITERR_UNCONNECTED ),
        .CASOUTSBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTSBITERR_UNCONNECTED ),
        .CLKARDCLK(wr_clk),
        .CLKBWRCLK(rd_clk),
        .DBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din[7:0]}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINPADINP({1'b0,1'b0,1'b0,din[8]}),
        .DINPBDINP({1'b0,1'b0,1'b0,1'b0}),
        .DOUTADOUT(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT({\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTBDOUT_UNCONNECTED [31:8],dout[7:0]}),
        .DOUTPADOUTP(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP({\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPBDOUTP_UNCONNECTED [3:1],dout[8]}),
        .ECCPARITY(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b0),
        .ENARDEN(ENA_I),
        .ENBWREN(ENB_I),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(tmp_ram_regout_en),
        .RSTRAMARSTRAM(POR_A),
        .RSTRAMB(\SAFETY_CKT_GEN.POR_B_reg ),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(ram_rstreg_b),
        .SBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,E}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_cmd_blk_mem_gen_prim_wrapper__parameterized2
   (dout,
    wr_clk,
    rd_clk,
    ENA_I,
    ENB_I,
    tmp_ram_regout_en,
    POR_A,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstreg_b,
    \gic0.gc0.count_d2_reg[11] ,
    Q,
    din,
    E);
  output [8:0]dout;
  input wr_clk;
  input rd_clk;
  input ENA_I;
  input ENB_I;
  input tmp_ram_regout_en;
  input POR_A;
  input \SAFETY_CKT_GEN.POR_B_reg ;
  input ram_rstreg_b;
  input [11:0]\gic0.gc0.count_d2_reg[11] ;
  input [11:0]Q;
  input [8:0]din;
  input [0:0]E;

  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire POR_A;
  wire [11:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire [8:0]din;
  wire [8:0]dout;
  wire [11:0]\gic0.gc0.count_d2_reg[11] ;
  wire ram_rstreg_b;
  wire rd_clk;
  wire tmp_ram_regout_en;
  wire wr_clk;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTDBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTSBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTA_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPA_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTADOUT_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPADOUTP_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({\gic0.gc0.count_d2_reg[11] ,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({Q,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b0),
        .CASDOMUXEN_B(1'b0),
        .CASDOUTA(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTB_UNCONNECTED [31:0]),
        .CASDOUTPA(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPB_UNCONNECTED [3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b0),
        .CASOREGIMUXEN_B(1'b0),
        .CASOUTDBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTDBITERR_UNCONNECTED ),
        .CASOUTSBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTSBITERR_UNCONNECTED ),
        .CLKARDCLK(wr_clk),
        .CLKBWRCLK(rd_clk),
        .DBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din[7:0]}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINPADINP({1'b0,1'b0,1'b0,din[8]}),
        .DINPBDINP({1'b0,1'b0,1'b0,1'b0}),
        .DOUTADOUT(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT({\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTBDOUT_UNCONNECTED [31:8],dout[7:0]}),
        .DOUTPADOUTP(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP({\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPBDOUTP_UNCONNECTED [3:1],dout[8]}),
        .ECCPARITY(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b0),
        .ENARDEN(ENA_I),
        .ENBWREN(ENB_I),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(tmp_ram_regout_en),
        .RSTRAMARSTRAM(POR_A),
        .RSTRAMB(\SAFETY_CKT_GEN.POR_B_reg ),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(ram_rstreg_b),
        .SBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,E}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_cmd_blk_mem_gen_prim_wrapper__parameterized3
   (dout,
    wr_clk,
    rd_clk,
    ENA_I,
    ENB_I,
    tmp_ram_regout_en,
    POR_A,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstreg_b,
    \gic0.gc0.count_d2_reg[11] ,
    Q,
    din,
    E);
  output [8:0]dout;
  input wr_clk;
  input rd_clk;
  input ENA_I;
  input ENB_I;
  input tmp_ram_regout_en;
  input POR_A;
  input \SAFETY_CKT_GEN.POR_B_reg ;
  input ram_rstreg_b;
  input [11:0]\gic0.gc0.count_d2_reg[11] ;
  input [11:0]Q;
  input [8:0]din;
  input [0:0]E;

  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire POR_A;
  wire [11:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire [8:0]din;
  wire [8:0]dout;
  wire [11:0]\gic0.gc0.count_d2_reg[11] ;
  wire ram_rstreg_b;
  wire rd_clk;
  wire tmp_ram_regout_en;
  wire wr_clk;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTDBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTSBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTA_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPA_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTADOUT_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPADOUTP_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({\gic0.gc0.count_d2_reg[11] ,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({Q,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b0),
        .CASDOMUXEN_B(1'b0),
        .CASDOUTA(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTB_UNCONNECTED [31:0]),
        .CASDOUTPA(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPB_UNCONNECTED [3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b0),
        .CASOREGIMUXEN_B(1'b0),
        .CASOUTDBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTDBITERR_UNCONNECTED ),
        .CASOUTSBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTSBITERR_UNCONNECTED ),
        .CLKARDCLK(wr_clk),
        .CLKBWRCLK(rd_clk),
        .DBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din[7:0]}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINPADINP({1'b0,1'b0,1'b0,din[8]}),
        .DINPBDINP({1'b0,1'b0,1'b0,1'b0}),
        .DOUTADOUT(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT({\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTBDOUT_UNCONNECTED [31:8],dout[7:0]}),
        .DOUTPADOUTP(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP({\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPBDOUTP_UNCONNECTED [3:1],dout[8]}),
        .ECCPARITY(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b0),
        .ENARDEN(ENA_I),
        .ENBWREN(ENB_I),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(tmp_ram_regout_en),
        .RSTRAMARSTRAM(POR_A),
        .RSTRAMB(\SAFETY_CKT_GEN.POR_B_reg ),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(ram_rstreg_b),
        .SBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,E}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_cmd_blk_mem_gen_prim_wrapper__parameterized4
   (dout,
    wr_clk,
    rd_clk,
    ENA_I,
    ENB_I,
    tmp_ram_regout_en,
    POR_A,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstreg_b,
    \gic0.gc0.count_d2_reg[11] ,
    Q,
    din,
    E);
  output [8:0]dout;
  input wr_clk;
  input rd_clk;
  input ENA_I;
  input ENB_I;
  input tmp_ram_regout_en;
  input POR_A;
  input \SAFETY_CKT_GEN.POR_B_reg ;
  input ram_rstreg_b;
  input [11:0]\gic0.gc0.count_d2_reg[11] ;
  input [11:0]Q;
  input [8:0]din;
  input [0:0]E;

  wire [0:0]E;
  wire ENA_I;
  wire ENB_I;
  wire POR_A;
  wire [11:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire [8:0]din;
  wire [8:0]dout;
  wire [11:0]\gic0.gc0.count_d2_reg[11] ;
  wire ram_rstreg_b;
  wire rd_clk;
  wire tmp_ram_regout_en;
  wire wr_clk;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTDBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTSBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTA_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPA_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTADOUT_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPADOUTP_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({\gic0.gc0.count_d2_reg[11] ,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({Q,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b0),
        .CASDOMUXEN_B(1'b0),
        .CASDOUTA(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTB_UNCONNECTED [31:0]),
        .CASDOUTPA(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPB_UNCONNECTED [3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b0),
        .CASOREGIMUXEN_B(1'b0),
        .CASOUTDBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTDBITERR_UNCONNECTED ),
        .CASOUTSBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTSBITERR_UNCONNECTED ),
        .CLKARDCLK(wr_clk),
        .CLKBWRCLK(rd_clk),
        .DBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din[7:0]}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINPADINP({1'b0,1'b0,1'b0,din[8]}),
        .DINPBDINP({1'b0,1'b0,1'b0,1'b0}),
        .DOUTADOUT(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT({\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTBDOUT_UNCONNECTED [31:8],dout[7:0]}),
        .DOUTPADOUTP(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP({\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPBDOUTP_UNCONNECTED [3:1],dout[8]}),
        .ECCPARITY(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b0),
        .ENARDEN(ENA_I),
        .ENBWREN(ENB_I),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(tmp_ram_regout_en),
        .RSTRAMARSTRAM(POR_A),
        .RSTRAMB(\SAFETY_CKT_GEN.POR_B_reg ),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(ram_rstreg_b),
        .SBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,E}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_cmd_blk_mem_gen_prim_wrapper__parameterized5
   (dout,
    ENA_I,
    wr_clk,
    rd_clk,
    ENB_I,
    tmp_ram_regout_en,
    POR_A,
    \SAFETY_CKT_GEN.POR_B_reg ,
    ram_rstreg_b,
    \gic0.gc0.count_d2_reg[11] ,
    Q,
    din,
    E,
    ENA_dly_D,
    out,
    wr_en);
  output [5:0]dout;
  output ENA_I;
  input wr_clk;
  input rd_clk;
  input ENB_I;
  input tmp_ram_regout_en;
  input POR_A;
  input \SAFETY_CKT_GEN.POR_B_reg ;
  input ram_rstreg_b;
  input [11:0]\gic0.gc0.count_d2_reg[11] ;
  input [11:0]Q;
  input [5:0]din;
  input [0:0]E;
  input ENA_dly_D;
  input out;
  input wr_en;

  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_n_124 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_n_125 ;
  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_n_147 ;
  wire [0:0]E;
  wire ENA_I;
  wire ENA_dly_D;
  wire ENB_I;
  wire POR_A;
  wire [11:0]Q;
  wire \SAFETY_CKT_GEN.POR_B_reg ;
  wire [5:0]din;
  wire [5:0]dout;
  wire [11:0]\gic0.gc0.count_d2_reg[11] ;
  wire out;
  wire ram_rstreg_b;
  wire rd_clk;
  wire tmp_ram_regout_en;
  wire wr_clk;
  wire wr_en;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTDBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTSBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTA_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPA_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTADOUT_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPADOUTP_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({\gic0.gc0.count_d2_reg[11] ,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({Q,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b0),
        .CASDOMUXEN_B(1'b0),
        .CASDOUTA(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTB_UNCONNECTED [31:0]),
        .CASDOUTPA(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASDOUTPB_UNCONNECTED [3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b0),
        .CASOREGIMUXEN_B(1'b0),
        .CASOUTDBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTDBITERR_UNCONNECTED ),
        .CASOUTSBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASOUTSBITERR_UNCONNECTED ),
        .CLKARDCLK(wr_clk),
        .CLKBWRCLK(rd_clk),
        .DBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINPADINP({1'b0,1'b0,1'b0,1'b0}),
        .DINPBDINP({1'b0,1'b0,1'b0,1'b0}),
        .DOUTADOUT(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT({\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTBDOUT_UNCONNECTED [31:8],\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_n_124 ,\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_n_125 ,dout}),
        .DOUTPADOUTP(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP({\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOUTPBDOUTP_UNCONNECTED [3:1],\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_n_147 }),
        .ECCPARITY(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b0),
        .ENARDEN(ENA_I),
        .ENBWREN(ENB_I),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(tmp_ram_regout_en),
        .RSTRAMARSTRAM(POR_A),
        .RSTRAMB(\SAFETY_CKT_GEN.POR_B_reg ),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(ram_rstreg_b),
        .SBITERR(\NLW_DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,E}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT3 #(
    .INIT(8'hBA)) 
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1 
       (.I0(ENA_dly_D),
        .I1(out),
        .I2(wr_en),
        .O(ENA_I));
endmodule

module fifo_cmd_blk_mem_gen_top
   (dout,
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    ENB_dly_reg_D,
    rd_clk,
    wr_clk,
    ENB_I,
    tmp_ram_regout_en,
    ram_rstreg_b,
    \gic0.gc0.count_d2_reg[11] ,
    Q,
    din,
    E,
    SR,
    out,
    wr_en);
  output [59:0]dout;
  output \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  output ENB_dly_reg_D;
  input rd_clk;
  input wr_clk;
  input ENB_I;
  input tmp_ram_regout_en;
  input ram_rstreg_b;
  input [11:0]\gic0.gc0.count_d2_reg[11] ;
  input [11:0]Q;
  input [59:0]din;
  input [0:0]E;
  input [0:0]SR;
  input out;
  input wr_en;

  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_reg_D;
  wire [11:0]Q;
  wire [0:0]SR;
  wire [59:0]din;
  wire [59:0]dout;
  wire [11:0]\gic0.gc0.count_d2_reg[11] ;
  wire out;
  wire ram_rstreg_b;
  wire rd_clk;
  wire tmp_ram_regout_en;
  wire wr_clk;
  wire wr_en;

  fifo_cmd_blk_mem_gen_generic_cstr \valid.cstr 
       (.\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .E(E),
        .ENB_I(ENB_I),
        .ENB_dly_reg_D(ENB_dly_reg_D),
        .Q(Q),
        .SR(SR),
        .din(din),
        .dout(dout),
        .\gic0.gc0.count_d2_reg[11] (\gic0.gc0.count_d2_reg[11] ),
        .out(out),
        .ram_rstreg_b(ram_rstreg_b),
        .rd_clk(rd_clk),
        .tmp_ram_regout_en(tmp_ram_regout_en),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
endmodule

module fifo_cmd_blk_mem_gen_v8_4_1
   (dout,
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    ENB_dly_reg_D,
    rd_clk,
    wr_clk,
    ENB_I,
    tmp_ram_regout_en,
    ram_rstreg_b,
    \gic0.gc0.count_d2_reg[11] ,
    Q,
    din,
    E,
    SR,
    out,
    wr_en);
  output [59:0]dout;
  output \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  output ENB_dly_reg_D;
  input rd_clk;
  input wr_clk;
  input ENB_I;
  input tmp_ram_regout_en;
  input ram_rstreg_b;
  input [11:0]\gic0.gc0.count_d2_reg[11] ;
  input [11:0]Q;
  input [59:0]din;
  input [0:0]E;
  input [0:0]SR;
  input out;
  input wr_en;

  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_reg_D;
  wire [11:0]Q;
  wire [0:0]SR;
  wire [59:0]din;
  wire [59:0]dout;
  wire [11:0]\gic0.gc0.count_d2_reg[11] ;
  wire out;
  wire ram_rstreg_b;
  wire rd_clk;
  wire tmp_ram_regout_en;
  wire wr_clk;
  wire wr_en;

  fifo_cmd_blk_mem_gen_v8_4_1_synth inst_blk_mem_gen
       (.\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .E(E),
        .ENB_I(ENB_I),
        .ENB_dly_reg_D(ENB_dly_reg_D),
        .Q(Q),
        .SR(SR),
        .din(din),
        .dout(dout),
        .\gic0.gc0.count_d2_reg[11] (\gic0.gc0.count_d2_reg[11] ),
        .out(out),
        .ram_rstreg_b(ram_rstreg_b),
        .rd_clk(rd_clk),
        .tmp_ram_regout_en(tmp_ram_regout_en),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
endmodule

module fifo_cmd_blk_mem_gen_v8_4_1_synth
   (dout,
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    ENB_dly_reg_D,
    rd_clk,
    wr_clk,
    ENB_I,
    tmp_ram_regout_en,
    ram_rstreg_b,
    \gic0.gc0.count_d2_reg[11] ,
    Q,
    din,
    E,
    SR,
    out,
    wr_en);
  output [59:0]dout;
  output \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  output ENB_dly_reg_D;
  input rd_clk;
  input wr_clk;
  input ENB_I;
  input tmp_ram_regout_en;
  input ram_rstreg_b;
  input [11:0]\gic0.gc0.count_d2_reg[11] ;
  input [11:0]Q;
  input [59:0]din;
  input [0:0]E;
  input [0:0]SR;
  input out;
  input wr_en;

  wire \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_reg_D;
  wire [11:0]Q;
  wire [0:0]SR;
  wire [59:0]din;
  wire [59:0]dout;
  wire [11:0]\gic0.gc0.count_d2_reg[11] ;
  wire out;
  wire ram_rstreg_b;
  wire rd_clk;
  wire tmp_ram_regout_en;
  wire wr_clk;
  wire wr_en;

  fifo_cmd_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .E(E),
        .ENB_I(ENB_I),
        .ENB_dly_reg_D(ENB_dly_reg_D),
        .Q(Q),
        .SR(SR),
        .din(din),
        .dout(dout),
        .\gic0.gc0.count_d2_reg[11] (\gic0.gc0.count_d2_reg[11] ),
        .out(out),
        .ram_rstreg_b(ram_rstreg_b),
        .rd_clk(rd_clk),
        .tmp_ram_regout_en(tmp_ram_regout_en),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
endmodule

module fifo_cmd_clk_x_pntrs
   (S,
    RD_PNTR_WR,
    \gdiff.diff_pntr_pad_reg[12] ,
    \gdiff.diff_pntr_pad_reg[8] ,
    WR_PNTR_RD,
    \gdiff.diff_pntr_pad_reg[12]_0 ,
    v1_reg,
    Q,
    \gc0.count_d1_reg[11] ,
    wr_clk,
    \gic0.gc0.count_d2_reg[11] ,
    rd_clk);
  output [7:0]S;
  output [11:0]RD_PNTR_WR;
  output [3:0]\gdiff.diff_pntr_pad_reg[12] ;
  output [7:0]\gdiff.diff_pntr_pad_reg[8] ;
  output [11:0]WR_PNTR_RD;
  output [3:0]\gdiff.diff_pntr_pad_reg[12]_0 ;
  output [5:0]v1_reg;
  input [11:0]Q;
  input [11:0]\gc0.count_d1_reg[11] ;
  input wr_clk;
  input [11:0]\gic0.gc0.count_d2_reg[11] ;
  input rd_clk;

  wire [11:0]Q;
  wire [11:0]RD_PNTR_WR;
  wire [7:0]S;
  wire [11:0]WR_PNTR_RD;
  wire [11:0]\gc0.count_d1_reg[11] ;
  wire [3:0]\gdiff.diff_pntr_pad_reg[12] ;
  wire [3:0]\gdiff.diff_pntr_pad_reg[12]_0 ;
  wire [7:0]\gdiff.diff_pntr_pad_reg[8] ;
  wire [11:0]\gic0.gc0.count_d2_reg[11] ;
  wire rd_clk;
  wire [5:0]v1_reg;
  wire wr_clk;

  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1 
       (.I0(WR_PNTR_RD[0]),
        .I1(\gc0.count_d1_reg[11] [0]),
        .I2(WR_PNTR_RD[1]),
        .I3(\gc0.count_d1_reg[11] [1]),
        .O(v1_reg[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1 
       (.I0(WR_PNTR_RD[2]),
        .I1(\gc0.count_d1_reg[11] [2]),
        .I2(WR_PNTR_RD[3]),
        .I3(\gc0.count_d1_reg[11] [3]),
        .O(v1_reg[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1 
       (.I0(WR_PNTR_RD[4]),
        .I1(\gc0.count_d1_reg[11] [4]),
        .I2(WR_PNTR_RD[5]),
        .I3(\gc0.count_d1_reg[11] [5]),
        .O(v1_reg[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1 
       (.I0(WR_PNTR_RD[6]),
        .I1(\gc0.count_d1_reg[11] [6]),
        .I2(WR_PNTR_RD[7]),
        .I3(\gc0.count_d1_reg[11] [7]),
        .O(v1_reg[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[4].gms.ms_i_1 
       (.I0(WR_PNTR_RD[8]),
        .I1(\gc0.count_d1_reg[11] [8]),
        .I2(WR_PNTR_RD[9]),
        .I3(\gc0.count_d1_reg[11] [9]),
        .O(v1_reg[4]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[5].gms.ms_i_1 
       (.I0(WR_PNTR_RD[10]),
        .I1(\gc0.count_d1_reg[11] [10]),
        .I2(WR_PNTR_RD[11]),
        .I3(\gc0.count_d1_reg[11] [11]),
        .O(v1_reg[5]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry__0_i_1
       (.I0(RD_PNTR_WR[11]),
        .I1(Q[11]),
        .O(\gdiff.diff_pntr_pad_reg[12] [3]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry__0_i_1__0
       (.I0(WR_PNTR_RD[11]),
        .I1(\gc0.count_d1_reg[11] [11]),
        .O(\gdiff.diff_pntr_pad_reg[12]_0 [3]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry__0_i_2
       (.I0(RD_PNTR_WR[10]),
        .I1(Q[10]),
        .O(\gdiff.diff_pntr_pad_reg[12] [2]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry__0_i_2__0
       (.I0(WR_PNTR_RD[10]),
        .I1(\gc0.count_d1_reg[11] [10]),
        .O(\gdiff.diff_pntr_pad_reg[12]_0 [2]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry__0_i_3
       (.I0(RD_PNTR_WR[9]),
        .I1(Q[9]),
        .O(\gdiff.diff_pntr_pad_reg[12] [1]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry__0_i_3__0
       (.I0(WR_PNTR_RD[9]),
        .I1(\gc0.count_d1_reg[11] [9]),
        .O(\gdiff.diff_pntr_pad_reg[12]_0 [1]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry__0_i_4
       (.I0(RD_PNTR_WR[8]),
        .I1(Q[8]),
        .O(\gdiff.diff_pntr_pad_reg[12] [0]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry__0_i_4__0
       (.I0(WR_PNTR_RD[8]),
        .I1(\gc0.count_d1_reg[11] [8]),
        .O(\gdiff.diff_pntr_pad_reg[12]_0 [0]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry_i_1__0
       (.I0(RD_PNTR_WR[7]),
        .I1(Q[7]),
        .O(S[7]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry_i_2
       (.I0(RD_PNTR_WR[6]),
        .I1(Q[6]),
        .O(S[6]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry_i_2__0
       (.I0(WR_PNTR_RD[7]),
        .I1(\gc0.count_d1_reg[11] [7]),
        .O(\gdiff.diff_pntr_pad_reg[8] [7]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry_i_3
       (.I0(RD_PNTR_WR[5]),
        .I1(Q[5]),
        .O(S[5]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry_i_3__0
       (.I0(WR_PNTR_RD[6]),
        .I1(\gc0.count_d1_reg[11] [6]),
        .O(\gdiff.diff_pntr_pad_reg[8] [6]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry_i_4
       (.I0(RD_PNTR_WR[4]),
        .I1(Q[4]),
        .O(S[4]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry_i_4__0
       (.I0(WR_PNTR_RD[5]),
        .I1(\gc0.count_d1_reg[11] [5]),
        .O(\gdiff.diff_pntr_pad_reg[8] [5]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry_i_5
       (.I0(RD_PNTR_WR[3]),
        .I1(Q[3]),
        .O(S[3]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry_i_5__0
       (.I0(WR_PNTR_RD[4]),
        .I1(\gc0.count_d1_reg[11] [4]),
        .O(\gdiff.diff_pntr_pad_reg[8] [4]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry_i_6
       (.I0(RD_PNTR_WR[2]),
        .I1(Q[2]),
        .O(S[2]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry_i_6__0
       (.I0(WR_PNTR_RD[3]),
        .I1(\gc0.count_d1_reg[11] [3]),
        .O(\gdiff.diff_pntr_pad_reg[8] [3]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry_i_7
       (.I0(RD_PNTR_WR[1]),
        .I1(Q[1]),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry_i_7__0
       (.I0(WR_PNTR_RD[2]),
        .I1(\gc0.count_d1_reg[11] [2]),
        .O(\gdiff.diff_pntr_pad_reg[8] [2]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry_i_8
       (.I0(RD_PNTR_WR[0]),
        .I1(Q[0]),
        .O(S[0]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry_i_8__0
       (.I0(WR_PNTR_RD[1]),
        .I1(\gc0.count_d1_reg[11] [1]),
        .O(\gdiff.diff_pntr_pad_reg[8] [1]));
  LUT2 #(
    .INIT(4'h9)) 
    plusOp_carry_i_9
       (.I0(WR_PNTR_RD[0]),
        .I1(\gc0.count_d1_reg[11] [0]),
        .O(\gdiff.diff_pntr_pad_reg[8] [0]));
  (* DEST_SYNC_FF = "2" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* REG_OUTPUT = "1" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* WIDTH = "12" *) 
  (* XPM_CDC = "GRAY" *) 
  (* XPM_MODULE = "TRUE" *) 
  fifo_cmd_xpm_cdc_gray rd_pntr_cdc_inst
       (.dest_clk(wr_clk),
        .dest_out_bin(RD_PNTR_WR),
        .src_clk(rd_clk),
        .src_in_bin(\gc0.count_d1_reg[11] ));
  (* DEST_SYNC_FF = "2" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* REG_OUTPUT = "1" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* WIDTH = "12" *) 
  (* XPM_CDC = "GRAY" *) 
  (* XPM_MODULE = "TRUE" *) 
  fifo_cmd_xpm_cdc_gray__1 wr_pntr_cdc_inst
       (.dest_clk(rd_clk),
        .dest_out_bin(WR_PNTR_RD),
        .src_clk(wr_clk),
        .src_in_bin(\gic0.gc0.count_d2_reg[11] ));
endmodule

module fifo_cmd_compare
   (comp1,
    RD_PNTR_WR,
    Q);
  output comp1;
  input [11:0]RD_PNTR_WR;
  input [11:0]Q;

  wire [11:0]Q;
  wire [11:0]RD_PNTR_WR;
  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_4;
  wire comp1;
  wire [5:0]v1_reg;
  wire [7:3]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED ;
  wire [7:6]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED ;
  wire [7:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED ;
  wire [7:6]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED ;

  (* XILINX_LEGACY_PRIM = "(CARRY4)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY8 \gmux.gm[0].gm1.m1_CARRY4_CARRY8 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [7:6],comp1,carrynet_4,\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [3],carrynet_2,carrynet_1,carrynet_0}),
        .DI({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED [7:6],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED [7:0]),
        .S({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED [7:6],v1_reg}));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1 
       (.I0(RD_PNTR_WR[0]),
        .I1(Q[0]),
        .I2(RD_PNTR_WR[1]),
        .I3(Q[1]),
        .O(v1_reg[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1 
       (.I0(RD_PNTR_WR[2]),
        .I1(Q[2]),
        .I2(RD_PNTR_WR[3]),
        .I3(Q[3]),
        .O(v1_reg[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1 
       (.I0(RD_PNTR_WR[4]),
        .I1(Q[4]),
        .I2(RD_PNTR_WR[5]),
        .I3(Q[5]),
        .O(v1_reg[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1 
       (.I0(RD_PNTR_WR[6]),
        .I1(Q[6]),
        .I2(RD_PNTR_WR[7]),
        .I3(Q[7]),
        .O(v1_reg[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[4].gms.ms_i_1 
       (.I0(RD_PNTR_WR[8]),
        .I1(Q[8]),
        .I2(RD_PNTR_WR[9]),
        .I3(Q[9]),
        .O(v1_reg[4]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[5].gms.ms_i_1 
       (.I0(RD_PNTR_WR[10]),
        .I1(Q[10]),
        .I2(RD_PNTR_WR[11]),
        .I3(Q[11]),
        .O(v1_reg[5]));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_cmd_compare_0
   (comp2,
    RD_PNTR_WR,
    \gic0.gc0.count_reg[11] );
  output comp2;
  input [11:0]RD_PNTR_WR;
  input [11:0]\gic0.gc0.count_reg[11] ;

  wire [11:0]RD_PNTR_WR;
  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_4;
  wire comp2;
  wire [11:0]\gic0.gc0.count_reg[11] ;
  wire [5:0]v1_reg;
  wire [7:3]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED ;
  wire [7:6]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED ;
  wire [7:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED ;
  wire [7:6]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED ;

  (* XILINX_LEGACY_PRIM = "(CARRY4)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY8 \gmux.gm[0].gm1.m1_CARRY4_CARRY8 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [7:6],comp2,carrynet_4,\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [3],carrynet_2,carrynet_1,carrynet_0}),
        .DI({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED [7:6],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED [7:0]),
        .S({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED [7:6],v1_reg}));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1 
       (.I0(RD_PNTR_WR[0]),
        .I1(\gic0.gc0.count_reg[11] [0]),
        .I2(RD_PNTR_WR[1]),
        .I3(\gic0.gc0.count_reg[11] [1]),
        .O(v1_reg[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1 
       (.I0(RD_PNTR_WR[2]),
        .I1(\gic0.gc0.count_reg[11] [2]),
        .I2(RD_PNTR_WR[3]),
        .I3(\gic0.gc0.count_reg[11] [3]),
        .O(v1_reg[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1 
       (.I0(RD_PNTR_WR[4]),
        .I1(\gic0.gc0.count_reg[11] [4]),
        .I2(RD_PNTR_WR[5]),
        .I3(\gic0.gc0.count_reg[11] [5]),
        .O(v1_reg[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1 
       (.I0(RD_PNTR_WR[6]),
        .I1(\gic0.gc0.count_reg[11] [6]),
        .I2(RD_PNTR_WR[7]),
        .I3(\gic0.gc0.count_reg[11] [7]),
        .O(v1_reg[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[4].gms.ms_i_1 
       (.I0(RD_PNTR_WR[8]),
        .I1(\gic0.gc0.count_reg[11] [8]),
        .I2(RD_PNTR_WR[9]),
        .I3(\gic0.gc0.count_reg[11] [9]),
        .O(v1_reg[4]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[5].gms.ms_i_1 
       (.I0(RD_PNTR_WR[10]),
        .I1(\gic0.gc0.count_reg[11] [10]),
        .I2(RD_PNTR_WR[11]),
        .I3(\gic0.gc0.count_reg[11] [11]),
        .O(v1_reg[5]));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_cmd_compare_1
   (ram_empty_fb_i_reg,
    v1_reg,
    out,
    rd_en,
    \gpregsm1.curr_fwft_state_reg[1] ,
    comp1);
  output ram_empty_fb_i_reg;
  input [5:0]v1_reg;
  input out;
  input rd_en;
  input [1:0]\gpregsm1.curr_fwft_state_reg[1] ;
  input comp1;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_4;
  wire comp0;
  wire comp1;
  wire [1:0]\gpregsm1.curr_fwft_state_reg[1] ;
  wire out;
  wire ram_empty_fb_i_reg;
  wire rd_en;
  wire [5:0]v1_reg;
  wire [7:3]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED ;
  wire [7:6]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED ;
  wire [7:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED ;
  wire [7:6]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED ;

  (* XILINX_LEGACY_PRIM = "(CARRY4)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY8 \gmux.gm[0].gm1.m1_CARRY4_CARRY8 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [7:6],comp0,carrynet_4,\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [3],carrynet_2,carrynet_1,carrynet_0}),
        .DI({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED [7:6],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED [7:0]),
        .S({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED [7:6],v1_reg}));
  LUT6 #(
    .INIT(64'hBABBBBBBAAAAAAAA)) 
    ram_empty_i_i_1
       (.I0(comp0),
        .I1(out),
        .I2(rd_en),
        .I3(\gpregsm1.curr_fwft_state_reg[1] [1]),
        .I4(\gpregsm1.curr_fwft_state_reg[1] [0]),
        .I5(comp1),
        .O(ram_empty_fb_i_reg));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_cmd_compare_2
   (comp1,
    v1_reg_0);
  output comp1;
  input [5:0]v1_reg_0;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_4;
  wire comp1;
  wire [5:0]v1_reg_0;
  wire [7:3]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED ;
  wire [7:6]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED ;
  wire [7:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED ;
  wire [7:6]\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED ;

  (* XILINX_LEGACY_PRIM = "(CARRY4)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY8 \gmux.gm[0].gm1.m1_CARRY4_CARRY8 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [7:6],comp1,carrynet_4,\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_CO_UNCONNECTED [3],carrynet_2,carrynet_1,carrynet_0}),
        .DI({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_DI_UNCONNECTED [7:6],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_O_UNCONNECTED [7:0]),
        .S({\NLW_gmux.gm[0].gm1.m1_CARRY4_CARRY8_S_UNCONNECTED [7:6],v1_reg_0}));
endmodule

module fifo_cmd_fifo_generator_ramfifo
   (rd_rst_busy,
    wr_rst_busy,
    dout,
    empty,
    full,
    prog_full,
    prog_empty,
    rd_clk,
    wr_clk,
    rst,
    din,
    wr_en,
    rd_en);
  output rd_rst_busy;
  output wr_rst_busy;
  output [59:0]dout;
  output empty;
  output full;
  output prog_full;
  output prog_empty;
  input rd_clk;
  input wr_clk;
  input rst;
  input [59:0]din;
  input wr_en;
  input rd_en;

  wire [59:0]din;
  wire [59:0]dout;
  wire empty;
  wire full;
  wire \gbm.gbmg.gbmgb.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/ENB_I ;
  wire \gbm.gbmg.gbmgb.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/ENB_dly_reg_D ;
  wire \gbm.gbmg.gbmgb.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/POR_B ;
  wire \gbm.gbmg.gbmgb.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/ram_rstreg_b ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_0 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_1 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_2 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_20 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_21 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_22 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_23 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_24 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_25 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_26 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_27 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_28 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_29 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_3 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_30 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_31 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_4 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_44 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_45 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_46 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_47 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_5 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_6 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_7 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_1 ;
  wire [5:0]\gras.rsts/c0/v1_reg ;
  wire [11:0]p_0_out_0;
  wire [11:0]p_13_out;
  wire [11:0]p_14_out;
  wire p_20_out;
  wire [11:0]p_24_out;
  wire [11:0]p_25_out;
  wire prog_empty;
  wire prog_full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire rst;
  wire rst_full_gen_i;
  wire rstblk_n_0;
  wire tmp_ram_regout_en;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;

  fifo_cmd_clk_x_pntrs \gntv_or_sync_fifo.gcx.clkx 
       (.Q(p_14_out),
        .RD_PNTR_WR(p_25_out),
        .S({\gntv_or_sync_fifo.gcx.clkx_n_0 ,\gntv_or_sync_fifo.gcx.clkx_n_1 ,\gntv_or_sync_fifo.gcx.clkx_n_2 ,\gntv_or_sync_fifo.gcx.clkx_n_3 ,\gntv_or_sync_fifo.gcx.clkx_n_4 ,\gntv_or_sync_fifo.gcx.clkx_n_5 ,\gntv_or_sync_fifo.gcx.clkx_n_6 ,\gntv_or_sync_fifo.gcx.clkx_n_7 }),
        .WR_PNTR_RD(p_24_out),
        .\gc0.count_d1_reg[11] (p_0_out_0),
        .\gdiff.diff_pntr_pad_reg[12] ({\gntv_or_sync_fifo.gcx.clkx_n_20 ,\gntv_or_sync_fifo.gcx.clkx_n_21 ,\gntv_or_sync_fifo.gcx.clkx_n_22 ,\gntv_or_sync_fifo.gcx.clkx_n_23 }),
        .\gdiff.diff_pntr_pad_reg[12]_0 ({\gntv_or_sync_fifo.gcx.clkx_n_44 ,\gntv_or_sync_fifo.gcx.clkx_n_45 ,\gntv_or_sync_fifo.gcx.clkx_n_46 ,\gntv_or_sync_fifo.gcx.clkx_n_47 }),
        .\gdiff.diff_pntr_pad_reg[8] ({\gntv_or_sync_fifo.gcx.clkx_n_24 ,\gntv_or_sync_fifo.gcx.clkx_n_25 ,\gntv_or_sync_fifo.gcx.clkx_n_26 ,\gntv_or_sync_fifo.gcx.clkx_n_27 ,\gntv_or_sync_fifo.gcx.clkx_n_28 ,\gntv_or_sync_fifo.gcx.clkx_n_29 ,\gntv_or_sync_fifo.gcx.clkx_n_30 ,\gntv_or_sync_fifo.gcx.clkx_n_31 }),
        .\gic0.gc0.count_d2_reg[11] (p_13_out),
        .rd_clk(rd_clk),
        .v1_reg(\gras.rsts/c0/v1_reg ),
        .wr_clk(wr_clk));
  fifo_cmd_rd_logic \gntv_or_sync_fifo.gl0.rd 
       (.ENB_I(\gbm.gbmg.gbmgb.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/ENB_I ),
        .ENB_dly_reg_D(\gbm.gbmg.gbmgb.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/ENB_dly_reg_D ),
        .Q(p_0_out_0),
        .SR(rd_rst_busy),
        .WR_PNTR_RD(p_24_out),
        .\dest_out_bin_ff_reg[11] ({\gntv_or_sync_fifo.gcx.clkx_n_44 ,\gntv_or_sync_fifo.gcx.clkx_n_45 ,\gntv_or_sync_fifo.gcx.clkx_n_46 ,\gntv_or_sync_fifo.gcx.clkx_n_47 }),
        .\dest_out_bin_ff_reg[7] ({\gntv_or_sync_fifo.gcx.clkx_n_24 ,\gntv_or_sync_fifo.gcx.clkx_n_25 ,\gntv_or_sync_fifo.gcx.clkx_n_26 ,\gntv_or_sync_fifo.gcx.clkx_n_27 ,\gntv_or_sync_fifo.gcx.clkx_n_28 ,\gntv_or_sync_fifo.gcx.clkx_n_29 ,\gntv_or_sync_fifo.gcx.clkx_n_30 ,\gntv_or_sync_fifo.gcx.clkx_n_31 }),
        .empty(empty),
        .prog_empty(prog_empty),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .tmp_ram_regout_en(tmp_ram_regout_en),
        .v1_reg(\gras.rsts/c0/v1_reg ));
  fifo_cmd_wr_logic \gntv_or_sync_fifo.gl0.wr 
       (.\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (p_13_out),
        .E(p_20_out),
        .Q(p_14_out),
        .RD_PNTR_WR(p_25_out),
        .S({\gntv_or_sync_fifo.gcx.clkx_n_0 ,\gntv_or_sync_fifo.gcx.clkx_n_1 ,\gntv_or_sync_fifo.gcx.clkx_n_2 ,\gntv_or_sync_fifo.gcx.clkx_n_3 ,\gntv_or_sync_fifo.gcx.clkx_n_4 ,\gntv_or_sync_fifo.gcx.clkx_n_5 ,\gntv_or_sync_fifo.gcx.clkx_n_6 ,\gntv_or_sync_fifo.gcx.clkx_n_7 }),
        .\dest_out_bin_ff_reg[11] ({\gntv_or_sync_fifo.gcx.clkx_n_20 ,\gntv_or_sync_fifo.gcx.clkx_n_21 ,\gntv_or_sync_fifo.gcx.clkx_n_22 ,\gntv_or_sync_fifo.gcx.clkx_n_23 }),
        .full(full),
        .\grstd1.grst_full.grst_f.rst_d3_reg (rst_full_gen_i),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg (rstblk_n_0),
        .out(\gntv_or_sync_fifo.gl0.wr_n_1 ),
        .prog_full(prog_full),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
  fifo_cmd_memory \gntv_or_sync_fifo.mem 
       (.E(p_20_out),
        .ENB_I(\gbm.gbmg.gbmgb.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/ENB_I ),
        .ENB_dly_reg_D(\gbm.gbmg.gbmgb.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/ENB_dly_reg_D ),
        .POR_B(\gbm.gbmg.gbmgb.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/POR_B ),
        .Q(p_0_out_0),
        .SR(rd_rst_busy),
        .din(din),
        .dout(dout),
        .\gic0.gc0.count_d2_reg[11] (p_13_out),
        .out(\gntv_or_sync_fifo.gl0.wr_n_1 ),
        .ram_rstreg_b(\gbm.gbmg.gbmgb.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/ram_rstreg_b ),
        .rd_clk(rd_clk),
        .tmp_ram_regout_en(tmp_ram_regout_en),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
  fifo_cmd_reset_blk_ramfifo rstblk
       (.POR_B(\gbm.gbmg.gbmgb.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/POR_B ),
        .SR(rd_rst_busy),
        .out(rst_full_gen_i),
        .ram_rstreg_b(\gbm.gbmg.gbmgb.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/ram_rstreg_b ),
        .rd_clk(rd_clk),
        .rst(rst),
        .\syncstages_ff_reg[0] (rstblk_n_0),
        .wr_clk(wr_clk),
        .wr_rst_busy(wr_rst_busy));
endmodule

module fifo_cmd_fifo_generator_top
   (SR,
    wr_rst_busy,
    dout,
    empty,
    full,
    prog_full,
    prog_empty,
    rd_clk,
    wr_clk,
    rst,
    din,
    wr_en,
    rd_en);
  output [0:0]SR;
  output wr_rst_busy;
  output [59:0]dout;
  output empty;
  output full;
  output prog_full;
  output prog_empty;
  input rd_clk;
  input wr_clk;
  input rst;
  input [59:0]din;
  input wr_en;
  input rd_en;

  wire [0:0]SR;
  wire [59:0]din;
  wire [59:0]dout;
  wire empty;
  wire full;
  wire prog_empty;
  wire prog_full;
  wire rd_clk;
  wire rd_en;
  wire rst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;

  fifo_cmd_fifo_generator_ramfifo \grf.rf 
       (.din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .prog_empty(prog_empty),
        .prog_full(prog_full),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rd_rst_busy(SR),
        .rst(rst),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* C_ADD_NGC_CONSTRAINT = "0" *) (* C_APPLICATION_TYPE_AXIS = "0" *) (* C_APPLICATION_TYPE_RACH = "0" *) 
(* C_APPLICATION_TYPE_RDCH = "0" *) (* C_APPLICATION_TYPE_WACH = "0" *) (* C_APPLICATION_TYPE_WDCH = "0" *) 
(* C_APPLICATION_TYPE_WRCH = "0" *) (* C_AXIS_TDATA_WIDTH = "8" *) (* C_AXIS_TDEST_WIDTH = "1" *) 
(* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TKEEP_WIDTH = "1" *) (* C_AXIS_TSTRB_WIDTH = "1" *) 
(* C_AXIS_TUSER_WIDTH = "4" *) (* C_AXIS_TYPE = "0" *) (* C_AXI_ADDR_WIDTH = "32" *) 
(* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) (* C_AXI_BUSER_WIDTH = "1" *) 
(* C_AXI_DATA_WIDTH = "64" *) (* C_AXI_ID_WIDTH = "1" *) (* C_AXI_LEN_WIDTH = "8" *) 
(* C_AXI_LOCK_WIDTH = "1" *) (* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_TYPE = "1" *) 
(* C_AXI_WUSER_WIDTH = "1" *) (* C_COMMON_CLOCK = "0" *) (* C_COUNT_TYPE = "0" *) 
(* C_DATA_COUNT_WIDTH = "12" *) (* C_DEFAULT_VALUE = "BlankString" *) (* C_DIN_WIDTH = "60" *) 
(* C_DIN_WIDTH_AXIS = "1" *) (* C_DIN_WIDTH_RACH = "32" *) (* C_DIN_WIDTH_RDCH = "64" *) 
(* C_DIN_WIDTH_WACH = "1" *) (* C_DIN_WIDTH_WDCH = "64" *) (* C_DIN_WIDTH_WRCH = "2" *) 
(* C_DOUT_RST_VAL = "0" *) (* C_DOUT_WIDTH = "60" *) (* C_ENABLE_RLOCS = "0" *) 
(* C_ENABLE_RST_SYNC = "1" *) (* C_EN_SAFETY_CKT = "1" *) (* C_ERROR_INJECTION_TYPE = "0" *) 
(* C_ERROR_INJECTION_TYPE_AXIS = "0" *) (* C_ERROR_INJECTION_TYPE_RACH = "0" *) (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
(* C_ERROR_INJECTION_TYPE_WACH = "0" *) (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
(* C_FAMILY = "kintexuplus" *) (* C_FULL_FLAGS_RST_VAL = "1" *) (* C_HAS_ALMOST_EMPTY = "0" *) 
(* C_HAS_ALMOST_FULL = "0" *) (* C_HAS_AXIS_TDATA = "1" *) (* C_HAS_AXIS_TDEST = "0" *) 
(* C_HAS_AXIS_TID = "0" *) (* C_HAS_AXIS_TKEEP = "0" *) (* C_HAS_AXIS_TLAST = "0" *) 
(* C_HAS_AXIS_TREADY = "1" *) (* C_HAS_AXIS_TSTRB = "0" *) (* C_HAS_AXIS_TUSER = "1" *) 
(* C_HAS_AXI_ARUSER = "0" *) (* C_HAS_AXI_AWUSER = "0" *) (* C_HAS_AXI_BUSER = "0" *) 
(* C_HAS_AXI_ID = "0" *) (* C_HAS_AXI_RD_CHANNEL = "1" *) (* C_HAS_AXI_RUSER = "0" *) 
(* C_HAS_AXI_WR_CHANNEL = "1" *) (* C_HAS_AXI_WUSER = "0" *) (* C_HAS_BACKUP = "0" *) 
(* C_HAS_DATA_COUNT = "0" *) (* C_HAS_DATA_COUNTS_AXIS = "0" *) (* C_HAS_DATA_COUNTS_RACH = "0" *) 
(* C_HAS_DATA_COUNTS_RDCH = "0" *) (* C_HAS_DATA_COUNTS_WACH = "0" *) (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
(* C_HAS_DATA_COUNTS_WRCH = "0" *) (* C_HAS_INT_CLK = "0" *) (* C_HAS_MASTER_CE = "0" *) 
(* C_HAS_MEMINIT_FILE = "0" *) (* C_HAS_OVERFLOW = "0" *) (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
(* C_HAS_PROG_FLAGS_RACH = "0" *) (* C_HAS_PROG_FLAGS_RDCH = "0" *) (* C_HAS_PROG_FLAGS_WACH = "0" *) 
(* C_HAS_PROG_FLAGS_WDCH = "0" *) (* C_HAS_PROG_FLAGS_WRCH = "0" *) (* C_HAS_RD_DATA_COUNT = "0" *) 
(* C_HAS_RD_RST = "0" *) (* C_HAS_RST = "1" *) (* C_HAS_SLAVE_CE = "0" *) 
(* C_HAS_SRST = "0" *) (* C_HAS_UNDERFLOW = "0" *) (* C_HAS_VALID = "0" *) 
(* C_HAS_WR_ACK = "0" *) (* C_HAS_WR_DATA_COUNT = "0" *) (* C_HAS_WR_RST = "0" *) 
(* C_IMPLEMENTATION_TYPE = "2" *) (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
(* C_IMPLEMENTATION_TYPE_RDCH = "1" *) (* C_IMPLEMENTATION_TYPE_WACH = "1" *) (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
(* C_IMPLEMENTATION_TYPE_WRCH = "1" *) (* C_INIT_WR_PNTR_VAL = "0" *) (* C_INTERFACE_TYPE = "0" *) 
(* C_MEMORY_TYPE = "1" *) (* C_MIF_FILE_NAME = "BlankString" *) (* C_MSGON_VAL = "1" *) 
(* C_OPTIMIZATION_MODE = "0" *) (* C_OVERFLOW_LOW = "0" *) (* C_POWER_SAVING_MODE = "0" *) 
(* C_PRELOAD_LATENCY = "0" *) (* C_PRELOAD_REGS = "1" *) (* C_PRIM_FIFO_TYPE = "512x72" *) 
(* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
(* C_PRIM_FIFO_TYPE_WACH = "512x36" *) (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL = "58" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "59" *) (* C_PROG_EMPTY_TYPE = "1" *) 
(* C_PROG_EMPTY_TYPE_AXIS = "0" *) (* C_PROG_EMPTY_TYPE_RACH = "0" *) (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
(* C_PROG_EMPTY_TYPE_WACH = "0" *) (* C_PROG_EMPTY_TYPE_WDCH = "0" *) (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL = "4095" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) (* C_PROG_FULL_THRESH_NEGATE_VAL = "4094" *) (* C_PROG_FULL_TYPE = "1" *) 
(* C_PROG_FULL_TYPE_AXIS = "0" *) (* C_PROG_FULL_TYPE_RACH = "0" *) (* C_PROG_FULL_TYPE_RDCH = "0" *) 
(* C_PROG_FULL_TYPE_WACH = "0" *) (* C_PROG_FULL_TYPE_WDCH = "0" *) (* C_PROG_FULL_TYPE_WRCH = "0" *) 
(* C_RACH_TYPE = "0" *) (* C_RDCH_TYPE = "0" *) (* C_RD_DATA_COUNT_WIDTH = "12" *) 
(* C_RD_DEPTH = "4096" *) (* C_RD_FREQ = "1" *) (* C_RD_PNTR_WIDTH = "12" *) 
(* C_REG_SLICE_MODE_AXIS = "0" *) (* C_REG_SLICE_MODE_RACH = "0" *) (* C_REG_SLICE_MODE_RDCH = "0" *) 
(* C_REG_SLICE_MODE_WACH = "0" *) (* C_REG_SLICE_MODE_WDCH = "0" *) (* C_REG_SLICE_MODE_WRCH = "0" *) 
(* C_SELECT_XPM = "0" *) (* C_SYNCHRONIZER_STAGE = "2" *) (* C_UNDERFLOW_LOW = "0" *) 
(* C_USE_COMMON_OVERFLOW = "0" *) (* C_USE_COMMON_UNDERFLOW = "0" *) (* C_USE_DEFAULT_SETTINGS = "0" *) 
(* C_USE_DOUT_RST = "1" *) (* C_USE_ECC = "0" *) (* C_USE_ECC_AXIS = "0" *) 
(* C_USE_ECC_RACH = "0" *) (* C_USE_ECC_RDCH = "0" *) (* C_USE_ECC_WACH = "0" *) 
(* C_USE_ECC_WDCH = "0" *) (* C_USE_ECC_WRCH = "0" *) (* C_USE_EMBEDDED_REG = "1" *) 
(* C_USE_FIFO16_FLAGS = "0" *) (* C_USE_FWFT_DATA_COUNT = "0" *) (* C_USE_PIPELINE_REG = "0" *) 
(* C_VALID_LOW = "0" *) (* C_WACH_TYPE = "0" *) (* C_WDCH_TYPE = "0" *) 
(* C_WRCH_TYPE = "0" *) (* C_WR_ACK_LOW = "0" *) (* C_WR_DATA_COUNT_WIDTH = "12" *) 
(* C_WR_DEPTH = "4096" *) (* C_WR_DEPTH_AXIS = "1024" *) (* C_WR_DEPTH_RACH = "16" *) 
(* C_WR_DEPTH_RDCH = "1024" *) (* C_WR_DEPTH_WACH = "16" *) (* C_WR_DEPTH_WDCH = "1024" *) 
(* C_WR_DEPTH_WRCH = "16" *) (* C_WR_FREQ = "1" *) (* C_WR_PNTR_WIDTH = "12" *) 
(* C_WR_PNTR_WIDTH_AXIS = "10" *) (* C_WR_PNTR_WIDTH_RACH = "4" *) (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
(* C_WR_PNTR_WIDTH_WACH = "4" *) (* C_WR_PNTR_WIDTH_WDCH = "10" *) (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
(* C_WR_RESPONSE_LATENCY = "1" *) 
module fifo_cmd_fifo_generator_v13_2_2
   (backup,
    backup_marker,
    clk,
    rst,
    srst,
    wr_clk,
    wr_rst,
    rd_clk,
    rd_rst,
    din,
    wr_en,
    rd_en,
    prog_empty_thresh,
    prog_empty_thresh_assert,
    prog_empty_thresh_negate,
    prog_full_thresh,
    prog_full_thresh_assert,
    prog_full_thresh_negate,
    int_clk,
    injectdbiterr,
    injectsbiterr,
    sleep,
    dout,
    full,
    almost_full,
    wr_ack,
    overflow,
    empty,
    almost_empty,
    valid,
    underflow,
    data_count,
    rd_data_count,
    wr_data_count,
    prog_full,
    prog_empty,
    sbiterr,
    dbiterr,
    wr_rst_busy,
    rd_rst_busy,
    m_aclk,
    s_aclk,
    s_aresetn,
    m_aclk_en,
    s_aclk_en,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awregion,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wuser,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_bready,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awregion,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wuser,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arregion,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arregion,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_ruser,
    m_axi_rvalid,
    m_axi_rready,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,
    axi_aw_injectsbiterr,
    axi_aw_injectdbiterr,
    axi_aw_prog_full_thresh,
    axi_aw_prog_empty_thresh,
    axi_aw_data_count,
    axi_aw_wr_data_count,
    axi_aw_rd_data_count,
    axi_aw_sbiterr,
    axi_aw_dbiterr,
    axi_aw_overflow,
    axi_aw_underflow,
    axi_aw_prog_full,
    axi_aw_prog_empty,
    axi_w_injectsbiterr,
    axi_w_injectdbiterr,
    axi_w_prog_full_thresh,
    axi_w_prog_empty_thresh,
    axi_w_data_count,
    axi_w_wr_data_count,
    axi_w_rd_data_count,
    axi_w_sbiterr,
    axi_w_dbiterr,
    axi_w_overflow,
    axi_w_underflow,
    axi_w_prog_full,
    axi_w_prog_empty,
    axi_b_injectsbiterr,
    axi_b_injectdbiterr,
    axi_b_prog_full_thresh,
    axi_b_prog_empty_thresh,
    axi_b_data_count,
    axi_b_wr_data_count,
    axi_b_rd_data_count,
    axi_b_sbiterr,
    axi_b_dbiterr,
    axi_b_overflow,
    axi_b_underflow,
    axi_b_prog_full,
    axi_b_prog_empty,
    axi_ar_injectsbiterr,
    axi_ar_injectdbiterr,
    axi_ar_prog_full_thresh,
    axi_ar_prog_empty_thresh,
    axi_ar_data_count,
    axi_ar_wr_data_count,
    axi_ar_rd_data_count,
    axi_ar_sbiterr,
    axi_ar_dbiterr,
    axi_ar_overflow,
    axi_ar_underflow,
    axi_ar_prog_full,
    axi_ar_prog_empty,
    axi_r_injectsbiterr,
    axi_r_injectdbiterr,
    axi_r_prog_full_thresh,
    axi_r_prog_empty_thresh,
    axi_r_data_count,
    axi_r_wr_data_count,
    axi_r_rd_data_count,
    axi_r_sbiterr,
    axi_r_dbiterr,
    axi_r_overflow,
    axi_r_underflow,
    axi_r_prog_full,
    axi_r_prog_empty,
    axis_injectsbiterr,
    axis_injectdbiterr,
    axis_prog_full_thresh,
    axis_prog_empty_thresh,
    axis_data_count,
    axis_wr_data_count,
    axis_rd_data_count,
    axis_sbiterr,
    axis_dbiterr,
    axis_overflow,
    axis_underflow,
    axis_prog_full,
    axis_prog_empty);
  input backup;
  input backup_marker;
  input clk;
  input rst;
  input srst;
  input wr_clk;
  input wr_rst;
  input rd_clk;
  input rd_rst;
  input [59:0]din;
  input wr_en;
  input rd_en;
  input [11:0]prog_empty_thresh;
  input [11:0]prog_empty_thresh_assert;
  input [11:0]prog_empty_thresh_negate;
  input [11:0]prog_full_thresh;
  input [11:0]prog_full_thresh_assert;
  input [11:0]prog_full_thresh_negate;
  input int_clk;
  input injectdbiterr;
  input injectsbiterr;
  input sleep;
  output [59:0]dout;
  output full;
  output almost_full;
  output wr_ack;
  output overflow;
  output empty;
  output almost_empty;
  output valid;
  output underflow;
  output [11:0]data_count;
  output [11:0]rd_data_count;
  output [11:0]wr_data_count;
  output prog_full;
  output prog_empty;
  output sbiterr;
  output dbiterr;
  output wr_rst_busy;
  output rd_rst_busy;
  input m_aclk;
  input s_aclk;
  input s_aresetn;
  input m_aclk_en;
  input s_aclk_en;
  input [0:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [0:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input [3:0]s_axi_awregion;
  input [0:0]s_axi_awuser;
  input s_axi_awvalid;
  output s_axi_awready;
  input [0:0]s_axi_wid;
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_wstrb;
  input s_axi_wlast;
  input [0:0]s_axi_wuser;
  input s_axi_wvalid;
  output s_axi_wready;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [0:0]s_axi_buser;
  output s_axi_bvalid;
  input s_axi_bready;
  output [0:0]m_axi_awid;
  output [31:0]m_axi_awaddr;
  output [7:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [0:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output [3:0]m_axi_awregion;
  output [0:0]m_axi_awuser;
  output m_axi_awvalid;
  input m_axi_awready;
  output [0:0]m_axi_wid;
  output [63:0]m_axi_wdata;
  output [7:0]m_axi_wstrb;
  output m_axi_wlast;
  output [0:0]m_axi_wuser;
  output m_axi_wvalid;
  input m_axi_wready;
  input [0:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_buser;
  input m_axi_bvalid;
  output m_axi_bready;
  input [0:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input [3:0]s_axi_arregion;
  input [0:0]s_axi_aruser;
  input s_axi_arvalid;
  output s_axi_arready;
  output [0:0]s_axi_rid;
  output [63:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output [0:0]s_axi_ruser;
  output s_axi_rvalid;
  input s_axi_rready;
  output [0:0]m_axi_arid;
  output [31:0]m_axi_araddr;
  output [7:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [0:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output [3:0]m_axi_arregion;
  output [0:0]m_axi_aruser;
  output m_axi_arvalid;
  input m_axi_arready;
  input [0:0]m_axi_rid;
  input [63:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input [0:0]m_axi_ruser;
  input m_axi_rvalid;
  output m_axi_rready;
  input s_axis_tvalid;
  output s_axis_tready;
  input [7:0]s_axis_tdata;
  input [0:0]s_axis_tstrb;
  input [0:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [0:0]s_axis_tdest;
  input [3:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [7:0]m_axis_tdata;
  output [0:0]m_axis_tstrb;
  output [0:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [3:0]m_axis_tuser;
  input axi_aw_injectsbiterr;
  input axi_aw_injectdbiterr;
  input [3:0]axi_aw_prog_full_thresh;
  input [3:0]axi_aw_prog_empty_thresh;
  output [4:0]axi_aw_data_count;
  output [4:0]axi_aw_wr_data_count;
  output [4:0]axi_aw_rd_data_count;
  output axi_aw_sbiterr;
  output axi_aw_dbiterr;
  output axi_aw_overflow;
  output axi_aw_underflow;
  output axi_aw_prog_full;
  output axi_aw_prog_empty;
  input axi_w_injectsbiterr;
  input axi_w_injectdbiterr;
  input [9:0]axi_w_prog_full_thresh;
  input [9:0]axi_w_prog_empty_thresh;
  output [10:0]axi_w_data_count;
  output [10:0]axi_w_wr_data_count;
  output [10:0]axi_w_rd_data_count;
  output axi_w_sbiterr;
  output axi_w_dbiterr;
  output axi_w_overflow;
  output axi_w_underflow;
  output axi_w_prog_full;
  output axi_w_prog_empty;
  input axi_b_injectsbiterr;
  input axi_b_injectdbiterr;
  input [3:0]axi_b_prog_full_thresh;
  input [3:0]axi_b_prog_empty_thresh;
  output [4:0]axi_b_data_count;
  output [4:0]axi_b_wr_data_count;
  output [4:0]axi_b_rd_data_count;
  output axi_b_sbiterr;
  output axi_b_dbiterr;
  output axi_b_overflow;
  output axi_b_underflow;
  output axi_b_prog_full;
  output axi_b_prog_empty;
  input axi_ar_injectsbiterr;
  input axi_ar_injectdbiterr;
  input [3:0]axi_ar_prog_full_thresh;
  input [3:0]axi_ar_prog_empty_thresh;
  output [4:0]axi_ar_data_count;
  output [4:0]axi_ar_wr_data_count;
  output [4:0]axi_ar_rd_data_count;
  output axi_ar_sbiterr;
  output axi_ar_dbiterr;
  output axi_ar_overflow;
  output axi_ar_underflow;
  output axi_ar_prog_full;
  output axi_ar_prog_empty;
  input axi_r_injectsbiterr;
  input axi_r_injectdbiterr;
  input [9:0]axi_r_prog_full_thresh;
  input [9:0]axi_r_prog_empty_thresh;
  output [10:0]axi_r_data_count;
  output [10:0]axi_r_wr_data_count;
  output [10:0]axi_r_rd_data_count;
  output axi_r_sbiterr;
  output axi_r_dbiterr;
  output axi_r_overflow;
  output axi_r_underflow;
  output axi_r_prog_full;
  output axi_r_prog_empty;
  input axis_injectsbiterr;
  input axis_injectdbiterr;
  input [9:0]axis_prog_full_thresh;
  input [9:0]axis_prog_empty_thresh;
  output [10:0]axis_data_count;
  output [10:0]axis_wr_data_count;
  output [10:0]axis_rd_data_count;
  output axis_sbiterr;
  output axis_dbiterr;
  output axis_overflow;
  output axis_underflow;
  output axis_prog_full;
  output axis_prog_empty;

  wire \<const0> ;
  wire \<const1> ;
  wire [59:0]din;
  wire [59:0]dout;
  wire empty;
  wire full;
  wire prog_empty;
  wire prog_full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire rst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;

  assign almost_empty = \<const0> ;
  assign almost_full = \<const0> ;
  assign axi_ar_data_count[4] = \<const0> ;
  assign axi_ar_data_count[3] = \<const0> ;
  assign axi_ar_data_count[2] = \<const0> ;
  assign axi_ar_data_count[1] = \<const0> ;
  assign axi_ar_data_count[0] = \<const0> ;
  assign axi_ar_dbiterr = \<const0> ;
  assign axi_ar_overflow = \<const0> ;
  assign axi_ar_prog_empty = \<const1> ;
  assign axi_ar_prog_full = \<const0> ;
  assign axi_ar_rd_data_count[4] = \<const0> ;
  assign axi_ar_rd_data_count[3] = \<const0> ;
  assign axi_ar_rd_data_count[2] = \<const0> ;
  assign axi_ar_rd_data_count[1] = \<const0> ;
  assign axi_ar_rd_data_count[0] = \<const0> ;
  assign axi_ar_sbiterr = \<const0> ;
  assign axi_ar_underflow = \<const0> ;
  assign axi_ar_wr_data_count[4] = \<const0> ;
  assign axi_ar_wr_data_count[3] = \<const0> ;
  assign axi_ar_wr_data_count[2] = \<const0> ;
  assign axi_ar_wr_data_count[1] = \<const0> ;
  assign axi_ar_wr_data_count[0] = \<const0> ;
  assign axi_aw_data_count[4] = \<const0> ;
  assign axi_aw_data_count[3] = \<const0> ;
  assign axi_aw_data_count[2] = \<const0> ;
  assign axi_aw_data_count[1] = \<const0> ;
  assign axi_aw_data_count[0] = \<const0> ;
  assign axi_aw_dbiterr = \<const0> ;
  assign axi_aw_overflow = \<const0> ;
  assign axi_aw_prog_empty = \<const1> ;
  assign axi_aw_prog_full = \<const0> ;
  assign axi_aw_rd_data_count[4] = \<const0> ;
  assign axi_aw_rd_data_count[3] = \<const0> ;
  assign axi_aw_rd_data_count[2] = \<const0> ;
  assign axi_aw_rd_data_count[1] = \<const0> ;
  assign axi_aw_rd_data_count[0] = \<const0> ;
  assign axi_aw_sbiterr = \<const0> ;
  assign axi_aw_underflow = \<const0> ;
  assign axi_aw_wr_data_count[4] = \<const0> ;
  assign axi_aw_wr_data_count[3] = \<const0> ;
  assign axi_aw_wr_data_count[2] = \<const0> ;
  assign axi_aw_wr_data_count[1] = \<const0> ;
  assign axi_aw_wr_data_count[0] = \<const0> ;
  assign axi_b_data_count[4] = \<const0> ;
  assign axi_b_data_count[3] = \<const0> ;
  assign axi_b_data_count[2] = \<const0> ;
  assign axi_b_data_count[1] = \<const0> ;
  assign axi_b_data_count[0] = \<const0> ;
  assign axi_b_dbiterr = \<const0> ;
  assign axi_b_overflow = \<const0> ;
  assign axi_b_prog_empty = \<const1> ;
  assign axi_b_prog_full = \<const0> ;
  assign axi_b_rd_data_count[4] = \<const0> ;
  assign axi_b_rd_data_count[3] = \<const0> ;
  assign axi_b_rd_data_count[2] = \<const0> ;
  assign axi_b_rd_data_count[1] = \<const0> ;
  assign axi_b_rd_data_count[0] = \<const0> ;
  assign axi_b_sbiterr = \<const0> ;
  assign axi_b_underflow = \<const0> ;
  assign axi_b_wr_data_count[4] = \<const0> ;
  assign axi_b_wr_data_count[3] = \<const0> ;
  assign axi_b_wr_data_count[2] = \<const0> ;
  assign axi_b_wr_data_count[1] = \<const0> ;
  assign axi_b_wr_data_count[0] = \<const0> ;
  assign axi_r_data_count[10] = \<const0> ;
  assign axi_r_data_count[9] = \<const0> ;
  assign axi_r_data_count[8] = \<const0> ;
  assign axi_r_data_count[7] = \<const0> ;
  assign axi_r_data_count[6] = \<const0> ;
  assign axi_r_data_count[5] = \<const0> ;
  assign axi_r_data_count[4] = \<const0> ;
  assign axi_r_data_count[3] = \<const0> ;
  assign axi_r_data_count[2] = \<const0> ;
  assign axi_r_data_count[1] = \<const0> ;
  assign axi_r_data_count[0] = \<const0> ;
  assign axi_r_dbiterr = \<const0> ;
  assign axi_r_overflow = \<const0> ;
  assign axi_r_prog_empty = \<const1> ;
  assign axi_r_prog_full = \<const0> ;
  assign axi_r_rd_data_count[10] = \<const0> ;
  assign axi_r_rd_data_count[9] = \<const0> ;
  assign axi_r_rd_data_count[8] = \<const0> ;
  assign axi_r_rd_data_count[7] = \<const0> ;
  assign axi_r_rd_data_count[6] = \<const0> ;
  assign axi_r_rd_data_count[5] = \<const0> ;
  assign axi_r_rd_data_count[4] = \<const0> ;
  assign axi_r_rd_data_count[3] = \<const0> ;
  assign axi_r_rd_data_count[2] = \<const0> ;
  assign axi_r_rd_data_count[1] = \<const0> ;
  assign axi_r_rd_data_count[0] = \<const0> ;
  assign axi_r_sbiterr = \<const0> ;
  assign axi_r_underflow = \<const0> ;
  assign axi_r_wr_data_count[10] = \<const0> ;
  assign axi_r_wr_data_count[9] = \<const0> ;
  assign axi_r_wr_data_count[8] = \<const0> ;
  assign axi_r_wr_data_count[7] = \<const0> ;
  assign axi_r_wr_data_count[6] = \<const0> ;
  assign axi_r_wr_data_count[5] = \<const0> ;
  assign axi_r_wr_data_count[4] = \<const0> ;
  assign axi_r_wr_data_count[3] = \<const0> ;
  assign axi_r_wr_data_count[2] = \<const0> ;
  assign axi_r_wr_data_count[1] = \<const0> ;
  assign axi_r_wr_data_count[0] = \<const0> ;
  assign axi_w_data_count[10] = \<const0> ;
  assign axi_w_data_count[9] = \<const0> ;
  assign axi_w_data_count[8] = \<const0> ;
  assign axi_w_data_count[7] = \<const0> ;
  assign axi_w_data_count[6] = \<const0> ;
  assign axi_w_data_count[5] = \<const0> ;
  assign axi_w_data_count[4] = \<const0> ;
  assign axi_w_data_count[3] = \<const0> ;
  assign axi_w_data_count[2] = \<const0> ;
  assign axi_w_data_count[1] = \<const0> ;
  assign axi_w_data_count[0] = \<const0> ;
  assign axi_w_dbiterr = \<const0> ;
  assign axi_w_overflow = \<const0> ;
  assign axi_w_prog_empty = \<const1> ;
  assign axi_w_prog_full = \<const0> ;
  assign axi_w_rd_data_count[10] = \<const0> ;
  assign axi_w_rd_data_count[9] = \<const0> ;
  assign axi_w_rd_data_count[8] = \<const0> ;
  assign axi_w_rd_data_count[7] = \<const0> ;
  assign axi_w_rd_data_count[6] = \<const0> ;
  assign axi_w_rd_data_count[5] = \<const0> ;
  assign axi_w_rd_data_count[4] = \<const0> ;
  assign axi_w_rd_data_count[3] = \<const0> ;
  assign axi_w_rd_data_count[2] = \<const0> ;
  assign axi_w_rd_data_count[1] = \<const0> ;
  assign axi_w_rd_data_count[0] = \<const0> ;
  assign axi_w_sbiterr = \<const0> ;
  assign axi_w_underflow = \<const0> ;
  assign axi_w_wr_data_count[10] = \<const0> ;
  assign axi_w_wr_data_count[9] = \<const0> ;
  assign axi_w_wr_data_count[8] = \<const0> ;
  assign axi_w_wr_data_count[7] = \<const0> ;
  assign axi_w_wr_data_count[6] = \<const0> ;
  assign axi_w_wr_data_count[5] = \<const0> ;
  assign axi_w_wr_data_count[4] = \<const0> ;
  assign axi_w_wr_data_count[3] = \<const0> ;
  assign axi_w_wr_data_count[2] = \<const0> ;
  assign axi_w_wr_data_count[1] = \<const0> ;
  assign axi_w_wr_data_count[0] = \<const0> ;
  assign axis_data_count[10] = \<const0> ;
  assign axis_data_count[9] = \<const0> ;
  assign axis_data_count[8] = \<const0> ;
  assign axis_data_count[7] = \<const0> ;
  assign axis_data_count[6] = \<const0> ;
  assign axis_data_count[5] = \<const0> ;
  assign axis_data_count[4] = \<const0> ;
  assign axis_data_count[3] = \<const0> ;
  assign axis_data_count[2] = \<const0> ;
  assign axis_data_count[1] = \<const0> ;
  assign axis_data_count[0] = \<const0> ;
  assign axis_dbiterr = \<const0> ;
  assign axis_overflow = \<const0> ;
  assign axis_prog_empty = \<const1> ;
  assign axis_prog_full = \<const0> ;
  assign axis_rd_data_count[10] = \<const0> ;
  assign axis_rd_data_count[9] = \<const0> ;
  assign axis_rd_data_count[8] = \<const0> ;
  assign axis_rd_data_count[7] = \<const0> ;
  assign axis_rd_data_count[6] = \<const0> ;
  assign axis_rd_data_count[5] = \<const0> ;
  assign axis_rd_data_count[4] = \<const0> ;
  assign axis_rd_data_count[3] = \<const0> ;
  assign axis_rd_data_count[2] = \<const0> ;
  assign axis_rd_data_count[1] = \<const0> ;
  assign axis_rd_data_count[0] = \<const0> ;
  assign axis_sbiterr = \<const0> ;
  assign axis_underflow = \<const0> ;
  assign axis_wr_data_count[10] = \<const0> ;
  assign axis_wr_data_count[9] = \<const0> ;
  assign axis_wr_data_count[8] = \<const0> ;
  assign axis_wr_data_count[7] = \<const0> ;
  assign axis_wr_data_count[6] = \<const0> ;
  assign axis_wr_data_count[5] = \<const0> ;
  assign axis_wr_data_count[4] = \<const0> ;
  assign axis_wr_data_count[3] = \<const0> ;
  assign axis_wr_data_count[2] = \<const0> ;
  assign axis_wr_data_count[1] = \<const0> ;
  assign axis_wr_data_count[0] = \<const0> ;
  assign data_count[11] = \<const0> ;
  assign data_count[10] = \<const0> ;
  assign data_count[9] = \<const0> ;
  assign data_count[8] = \<const0> ;
  assign data_count[7] = \<const0> ;
  assign data_count[6] = \<const0> ;
  assign data_count[5] = \<const0> ;
  assign data_count[4] = \<const0> ;
  assign data_count[3] = \<const0> ;
  assign data_count[2] = \<const0> ;
  assign data_count[1] = \<const0> ;
  assign data_count[0] = \<const0> ;
  assign dbiterr = \<const0> ;
  assign m_axi_araddr[31] = \<const0> ;
  assign m_axi_araddr[30] = \<const0> ;
  assign m_axi_araddr[29] = \<const0> ;
  assign m_axi_araddr[28] = \<const0> ;
  assign m_axi_araddr[27] = \<const0> ;
  assign m_axi_araddr[26] = \<const0> ;
  assign m_axi_araddr[25] = \<const0> ;
  assign m_axi_araddr[24] = \<const0> ;
  assign m_axi_araddr[23] = \<const0> ;
  assign m_axi_araddr[22] = \<const0> ;
  assign m_axi_araddr[21] = \<const0> ;
  assign m_axi_araddr[20] = \<const0> ;
  assign m_axi_araddr[19] = \<const0> ;
  assign m_axi_araddr[18] = \<const0> ;
  assign m_axi_araddr[17] = \<const0> ;
  assign m_axi_araddr[16] = \<const0> ;
  assign m_axi_araddr[15] = \<const0> ;
  assign m_axi_araddr[14] = \<const0> ;
  assign m_axi_araddr[13] = \<const0> ;
  assign m_axi_araddr[12] = \<const0> ;
  assign m_axi_araddr[11] = \<const0> ;
  assign m_axi_araddr[10] = \<const0> ;
  assign m_axi_araddr[9] = \<const0> ;
  assign m_axi_araddr[8] = \<const0> ;
  assign m_axi_araddr[7] = \<const0> ;
  assign m_axi_araddr[6] = \<const0> ;
  assign m_axi_araddr[5] = \<const0> ;
  assign m_axi_araddr[4] = \<const0> ;
  assign m_axi_araddr[3] = \<const0> ;
  assign m_axi_araddr[2] = \<const0> ;
  assign m_axi_araddr[1] = \<const0> ;
  assign m_axi_araddr[0] = \<const0> ;
  assign m_axi_arburst[1] = \<const0> ;
  assign m_axi_arburst[0] = \<const0> ;
  assign m_axi_arcache[3] = \<const0> ;
  assign m_axi_arcache[2] = \<const0> ;
  assign m_axi_arcache[1] = \<const0> ;
  assign m_axi_arcache[0] = \<const0> ;
  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlen[7] = \<const0> ;
  assign m_axi_arlen[6] = \<const0> ;
  assign m_axi_arlen[5] = \<const0> ;
  assign m_axi_arlen[4] = \<const0> ;
  assign m_axi_arlen[3] = \<const0> ;
  assign m_axi_arlen[2] = \<const0> ;
  assign m_axi_arlen[1] = \<const0> ;
  assign m_axi_arlen[0] = \<const0> ;
  assign m_axi_arlock[0] = \<const0> ;
  assign m_axi_arprot[2] = \<const0> ;
  assign m_axi_arprot[1] = \<const0> ;
  assign m_axi_arprot[0] = \<const0> ;
  assign m_axi_arqos[3] = \<const0> ;
  assign m_axi_arqos[2] = \<const0> ;
  assign m_axi_arqos[1] = \<const0> ;
  assign m_axi_arqos[0] = \<const0> ;
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_arsize[2] = \<const0> ;
  assign m_axi_arsize[1] = \<const0> ;
  assign m_axi_arsize[0] = \<const0> ;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_arvalid = \<const0> ;
  assign m_axi_awaddr[31] = \<const0> ;
  assign m_axi_awaddr[30] = \<const0> ;
  assign m_axi_awaddr[29] = \<const0> ;
  assign m_axi_awaddr[28] = \<const0> ;
  assign m_axi_awaddr[27] = \<const0> ;
  assign m_axi_awaddr[26] = \<const0> ;
  assign m_axi_awaddr[25] = \<const0> ;
  assign m_axi_awaddr[24] = \<const0> ;
  assign m_axi_awaddr[23] = \<const0> ;
  assign m_axi_awaddr[22] = \<const0> ;
  assign m_axi_awaddr[21] = \<const0> ;
  assign m_axi_awaddr[20] = \<const0> ;
  assign m_axi_awaddr[19] = \<const0> ;
  assign m_axi_awaddr[18] = \<const0> ;
  assign m_axi_awaddr[17] = \<const0> ;
  assign m_axi_awaddr[16] = \<const0> ;
  assign m_axi_awaddr[15] = \<const0> ;
  assign m_axi_awaddr[14] = \<const0> ;
  assign m_axi_awaddr[13] = \<const0> ;
  assign m_axi_awaddr[12] = \<const0> ;
  assign m_axi_awaddr[11] = \<const0> ;
  assign m_axi_awaddr[10] = \<const0> ;
  assign m_axi_awaddr[9] = \<const0> ;
  assign m_axi_awaddr[8] = \<const0> ;
  assign m_axi_awaddr[7] = \<const0> ;
  assign m_axi_awaddr[6] = \<const0> ;
  assign m_axi_awaddr[5] = \<const0> ;
  assign m_axi_awaddr[4] = \<const0> ;
  assign m_axi_awaddr[3] = \<const0> ;
  assign m_axi_awaddr[2] = \<const0> ;
  assign m_axi_awaddr[1] = \<const0> ;
  assign m_axi_awaddr[0] = \<const0> ;
  assign m_axi_awburst[1] = \<const0> ;
  assign m_axi_awburst[0] = \<const0> ;
  assign m_axi_awcache[3] = \<const0> ;
  assign m_axi_awcache[2] = \<const0> ;
  assign m_axi_awcache[1] = \<const0> ;
  assign m_axi_awcache[0] = \<const0> ;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlen[7] = \<const0> ;
  assign m_axi_awlen[6] = \<const0> ;
  assign m_axi_awlen[5] = \<const0> ;
  assign m_axi_awlen[4] = \<const0> ;
  assign m_axi_awlen[3] = \<const0> ;
  assign m_axi_awlen[2] = \<const0> ;
  assign m_axi_awlen[1] = \<const0> ;
  assign m_axi_awlen[0] = \<const0> ;
  assign m_axi_awlock[0] = \<const0> ;
  assign m_axi_awprot[2] = \<const0> ;
  assign m_axi_awprot[1] = \<const0> ;
  assign m_axi_awprot[0] = \<const0> ;
  assign m_axi_awqos[3] = \<const0> ;
  assign m_axi_awqos[2] = \<const0> ;
  assign m_axi_awqos[1] = \<const0> ;
  assign m_axi_awqos[0] = \<const0> ;
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awsize[2] = \<const0> ;
  assign m_axi_awsize[1] = \<const0> ;
  assign m_axi_awsize[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_awvalid = \<const0> ;
  assign m_axi_bready = \<const0> ;
  assign m_axi_rready = \<const0> ;
  assign m_axi_wdata[63] = \<const0> ;
  assign m_axi_wdata[62] = \<const0> ;
  assign m_axi_wdata[61] = \<const0> ;
  assign m_axi_wdata[60] = \<const0> ;
  assign m_axi_wdata[59] = \<const0> ;
  assign m_axi_wdata[58] = \<const0> ;
  assign m_axi_wdata[57] = \<const0> ;
  assign m_axi_wdata[56] = \<const0> ;
  assign m_axi_wdata[55] = \<const0> ;
  assign m_axi_wdata[54] = \<const0> ;
  assign m_axi_wdata[53] = \<const0> ;
  assign m_axi_wdata[52] = \<const0> ;
  assign m_axi_wdata[51] = \<const0> ;
  assign m_axi_wdata[50] = \<const0> ;
  assign m_axi_wdata[49] = \<const0> ;
  assign m_axi_wdata[48] = \<const0> ;
  assign m_axi_wdata[47] = \<const0> ;
  assign m_axi_wdata[46] = \<const0> ;
  assign m_axi_wdata[45] = \<const0> ;
  assign m_axi_wdata[44] = \<const0> ;
  assign m_axi_wdata[43] = \<const0> ;
  assign m_axi_wdata[42] = \<const0> ;
  assign m_axi_wdata[41] = \<const0> ;
  assign m_axi_wdata[40] = \<const0> ;
  assign m_axi_wdata[39] = \<const0> ;
  assign m_axi_wdata[38] = \<const0> ;
  assign m_axi_wdata[37] = \<const0> ;
  assign m_axi_wdata[36] = \<const0> ;
  assign m_axi_wdata[35] = \<const0> ;
  assign m_axi_wdata[34] = \<const0> ;
  assign m_axi_wdata[33] = \<const0> ;
  assign m_axi_wdata[32] = \<const0> ;
  assign m_axi_wdata[31] = \<const0> ;
  assign m_axi_wdata[30] = \<const0> ;
  assign m_axi_wdata[29] = \<const0> ;
  assign m_axi_wdata[28] = \<const0> ;
  assign m_axi_wdata[27] = \<const0> ;
  assign m_axi_wdata[26] = \<const0> ;
  assign m_axi_wdata[25] = \<const0> ;
  assign m_axi_wdata[24] = \<const0> ;
  assign m_axi_wdata[23] = \<const0> ;
  assign m_axi_wdata[22] = \<const0> ;
  assign m_axi_wdata[21] = \<const0> ;
  assign m_axi_wdata[20] = \<const0> ;
  assign m_axi_wdata[19] = \<const0> ;
  assign m_axi_wdata[18] = \<const0> ;
  assign m_axi_wdata[17] = \<const0> ;
  assign m_axi_wdata[16] = \<const0> ;
  assign m_axi_wdata[15] = \<const0> ;
  assign m_axi_wdata[14] = \<const0> ;
  assign m_axi_wdata[13] = \<const0> ;
  assign m_axi_wdata[12] = \<const0> ;
  assign m_axi_wdata[11] = \<const0> ;
  assign m_axi_wdata[10] = \<const0> ;
  assign m_axi_wdata[9] = \<const0> ;
  assign m_axi_wdata[8] = \<const0> ;
  assign m_axi_wdata[7] = \<const0> ;
  assign m_axi_wdata[6] = \<const0> ;
  assign m_axi_wdata[5] = \<const0> ;
  assign m_axi_wdata[4] = \<const0> ;
  assign m_axi_wdata[3] = \<const0> ;
  assign m_axi_wdata[2] = \<const0> ;
  assign m_axi_wdata[1] = \<const0> ;
  assign m_axi_wdata[0] = \<const0> ;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wlast = \<const0> ;
  assign m_axi_wstrb[7] = \<const0> ;
  assign m_axi_wstrb[6] = \<const0> ;
  assign m_axi_wstrb[5] = \<const0> ;
  assign m_axi_wstrb[4] = \<const0> ;
  assign m_axi_wstrb[3] = \<const0> ;
  assign m_axi_wstrb[2] = \<const0> ;
  assign m_axi_wstrb[1] = \<const0> ;
  assign m_axi_wstrb[0] = \<const0> ;
  assign m_axi_wuser[0] = \<const0> ;
  assign m_axi_wvalid = \<const0> ;
  assign m_axis_tdata[7] = \<const0> ;
  assign m_axis_tdata[6] = \<const0> ;
  assign m_axis_tdata[5] = \<const0> ;
  assign m_axis_tdata[4] = \<const0> ;
  assign m_axis_tdata[3] = \<const0> ;
  assign m_axis_tdata[2] = \<const0> ;
  assign m_axis_tdata[1] = \<const0> ;
  assign m_axis_tdata[0] = \<const0> ;
  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tkeep[0] = \<const0> ;
  assign m_axis_tlast = \<const0> ;
  assign m_axis_tstrb[0] = \<const0> ;
  assign m_axis_tuser[3] = \<const0> ;
  assign m_axis_tuser[2] = \<const0> ;
  assign m_axis_tuser[1] = \<const0> ;
  assign m_axis_tuser[0] = \<const0> ;
  assign m_axis_tvalid = \<const0> ;
  assign overflow = \<const0> ;
  assign rd_data_count[11] = \<const0> ;
  assign rd_data_count[10] = \<const0> ;
  assign rd_data_count[9] = \<const0> ;
  assign rd_data_count[8] = \<const0> ;
  assign rd_data_count[7] = \<const0> ;
  assign rd_data_count[6] = \<const0> ;
  assign rd_data_count[5] = \<const0> ;
  assign rd_data_count[4] = \<const0> ;
  assign rd_data_count[3] = \<const0> ;
  assign rd_data_count[2] = \<const0> ;
  assign rd_data_count[1] = \<const0> ;
  assign rd_data_count[0] = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_rdata[63] = \<const0> ;
  assign s_axi_rdata[62] = \<const0> ;
  assign s_axi_rdata[61] = \<const0> ;
  assign s_axi_rdata[60] = \<const0> ;
  assign s_axi_rdata[59] = \<const0> ;
  assign s_axi_rdata[58] = \<const0> ;
  assign s_axi_rdata[57] = \<const0> ;
  assign s_axi_rdata[56] = \<const0> ;
  assign s_axi_rdata[55] = \<const0> ;
  assign s_axi_rdata[54] = \<const0> ;
  assign s_axi_rdata[53] = \<const0> ;
  assign s_axi_rdata[52] = \<const0> ;
  assign s_axi_rdata[51] = \<const0> ;
  assign s_axi_rdata[50] = \<const0> ;
  assign s_axi_rdata[49] = \<const0> ;
  assign s_axi_rdata[48] = \<const0> ;
  assign s_axi_rdata[47] = \<const0> ;
  assign s_axi_rdata[46] = \<const0> ;
  assign s_axi_rdata[45] = \<const0> ;
  assign s_axi_rdata[44] = \<const0> ;
  assign s_axi_rdata[43] = \<const0> ;
  assign s_axi_rdata[42] = \<const0> ;
  assign s_axi_rdata[41] = \<const0> ;
  assign s_axi_rdata[40] = \<const0> ;
  assign s_axi_rdata[39] = \<const0> ;
  assign s_axi_rdata[38] = \<const0> ;
  assign s_axi_rdata[37] = \<const0> ;
  assign s_axi_rdata[36] = \<const0> ;
  assign s_axi_rdata[35] = \<const0> ;
  assign s_axi_rdata[34] = \<const0> ;
  assign s_axi_rdata[33] = \<const0> ;
  assign s_axi_rdata[32] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_ruser[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign s_axis_tready = \<const0> ;
  assign sbiterr = \<const0> ;
  assign underflow = \<const0> ;
  assign valid = \<const0> ;
  assign wr_ack = \<const0> ;
  assign wr_data_count[11] = \<const0> ;
  assign wr_data_count[10] = \<const0> ;
  assign wr_data_count[9] = \<const0> ;
  assign wr_data_count[8] = \<const0> ;
  assign wr_data_count[7] = \<const0> ;
  assign wr_data_count[6] = \<const0> ;
  assign wr_data_count[5] = \<const0> ;
  assign wr_data_count[4] = \<const0> ;
  assign wr_data_count[3] = \<const0> ;
  assign wr_data_count[2] = \<const0> ;
  assign wr_data_count[1] = \<const0> ;
  assign wr_data_count[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  fifo_cmd_fifo_generator_v13_2_2_synth inst_fifo_gen
       (.din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .prog_empty(prog_empty),
        .prog_full(prog_full),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rd_rst_busy(rd_rst_busy),
        .rst(rst),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .wr_rst_busy(wr_rst_busy));
endmodule

module fifo_cmd_fifo_generator_v13_2_2_synth
   (rd_rst_busy,
    wr_rst_busy,
    dout,
    empty,
    full,
    prog_full,
    prog_empty,
    rd_clk,
    wr_clk,
    rst,
    din,
    wr_en,
    rd_en);
  output rd_rst_busy;
  output wr_rst_busy;
  output [59:0]dout;
  output empty;
  output full;
  output prog_full;
  output prog_empty;
  input rd_clk;
  input wr_clk;
  input rst;
  input [59:0]din;
  input wr_en;
  input rd_en;

  wire [59:0]din;
  wire [59:0]dout;
  wire empty;
  wire full;
  wire prog_empty;
  wire prog_full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire rst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;

  fifo_cmd_fifo_generator_top \gconvfifo.rf 
       (.SR(rd_rst_busy),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .prog_empty(prog_empty),
        .prog_full(prog_full),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rst(rst),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .wr_rst_busy(wr_rst_busy));
endmodule

module fifo_cmd_memory
   (dout,
    POR_B,
    ENB_dly_reg_D,
    rd_clk,
    wr_clk,
    ENB_I,
    tmp_ram_regout_en,
    ram_rstreg_b,
    \gic0.gc0.count_d2_reg[11] ,
    Q,
    din,
    E,
    SR,
    out,
    wr_en);
  output [59:0]dout;
  output POR_B;
  output ENB_dly_reg_D;
  input rd_clk;
  input wr_clk;
  input ENB_I;
  input tmp_ram_regout_en;
  input ram_rstreg_b;
  input [11:0]\gic0.gc0.count_d2_reg[11] ;
  input [11:0]Q;
  input [59:0]din;
  input [0:0]E;
  input [0:0]SR;
  input out;
  input wr_en;

  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_reg_D;
  wire POR_B;
  wire [11:0]Q;
  wire [0:0]SR;
  wire [59:0]din;
  wire [59:0]dout;
  wire [11:0]\gic0.gc0.count_d2_reg[11] ;
  wire out;
  wire ram_rstreg_b;
  wire rd_clk;
  wire tmp_ram_regout_en;
  wire wr_clk;
  wire wr_en;

  fifo_cmd_blk_mem_gen_v8_4_1 \gbm.gbmg.gbmgb.ngecc.bmg 
       (.\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (POR_B),
        .E(E),
        .ENB_I(ENB_I),
        .ENB_dly_reg_D(ENB_dly_reg_D),
        .Q(Q),
        .SR(SR),
        .din(din),
        .dout(dout),
        .\gic0.gc0.count_d2_reg[11] (\gic0.gc0.count_d2_reg[11] ),
        .out(out),
        .ram_rstreg_b(ram_rstreg_b),
        .rd_clk(rd_clk),
        .tmp_ram_regout_en(tmp_ram_regout_en),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
endmodule

module fifo_cmd_rd_bin_cntr
   (v1_reg,
    Q,
    WR_PNTR_RD,
    SR,
    E,
    rd_clk);
  output [5:0]v1_reg;
  output [11:0]Q;
  input [11:0]WR_PNTR_RD;
  input [0:0]SR;
  input [0:0]E;
  input rd_clk;

  wire [0:0]E;
  wire [11:0]Q;
  wire [0:0]SR;
  wire [11:0]WR_PNTR_RD;
  wire [11:0]plusOp__1;
  wire plusOp_carry__0_n_6;
  wire plusOp_carry__0_n_7;
  wire plusOp_carry_n_0;
  wire plusOp_carry_n_1;
  wire plusOp_carry_n_2;
  wire plusOp_carry_n_3;
  wire plusOp_carry_n_5;
  wire plusOp_carry_n_6;
  wire plusOp_carry_n_7;
  wire rd_clk;
  wire [11:0]rd_pntr_plus1;
  wire [5:0]v1_reg;
  wire [3:3]NLW_plusOp_carry_CO_UNCONNECTED;
  wire [7:2]NLW_plusOp_carry__0_CO_UNCONNECTED;
  wire [7:3]NLW_plusOp_carry__0_O_UNCONNECTED;

  LUT1 #(
    .INIT(2'h1)) 
    \gc0.count[0]_i_1 
       (.I0(rd_pntr_plus1[0]),
        .O(plusOp__1[0]));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[0] 
       (.C(rd_clk),
        .CE(E),
        .D(rd_pntr_plus1[0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[10] 
       (.C(rd_clk),
        .CE(E),
        .D(rd_pntr_plus1[10]),
        .Q(Q[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[11] 
       (.C(rd_clk),
        .CE(E),
        .D(rd_pntr_plus1[11]),
        .Q(Q[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[1] 
       (.C(rd_clk),
        .CE(E),
        .D(rd_pntr_plus1[1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[2] 
       (.C(rd_clk),
        .CE(E),
        .D(rd_pntr_plus1[2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[3] 
       (.C(rd_clk),
        .CE(E),
        .D(rd_pntr_plus1[3]),
        .Q(Q[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[4] 
       (.C(rd_clk),
        .CE(E),
        .D(rd_pntr_plus1[4]),
        .Q(Q[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[5] 
       (.C(rd_clk),
        .CE(E),
        .D(rd_pntr_plus1[5]),
        .Q(Q[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[6] 
       (.C(rd_clk),
        .CE(E),
        .D(rd_pntr_plus1[6]),
        .Q(Q[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[7] 
       (.C(rd_clk),
        .CE(E),
        .D(rd_pntr_plus1[7]),
        .Q(Q[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[8] 
       (.C(rd_clk),
        .CE(E),
        .D(rd_pntr_plus1[8]),
        .Q(Q[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[9] 
       (.C(rd_clk),
        .CE(E),
        .D(rd_pntr_plus1[9]),
        .Q(Q[9]),
        .R(SR));
  FDSE #(
    .INIT(1'b1)) 
    \gc0.count_reg[0] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp__1[0]),
        .Q(rd_pntr_plus1[0]),
        .S(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[10] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp__1[10]),
        .Q(rd_pntr_plus1[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[11] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp__1[11]),
        .Q(rd_pntr_plus1[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[1] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp__1[1]),
        .Q(rd_pntr_plus1[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[2] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp__1[2]),
        .Q(rd_pntr_plus1[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[3] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp__1[3]),
        .Q(rd_pntr_plus1[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[4] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp__1[4]),
        .Q(rd_pntr_plus1[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[5] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp__1[5]),
        .Q(rd_pntr_plus1[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[6] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp__1[6]),
        .Q(rd_pntr_plus1[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[7] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp__1[7]),
        .Q(rd_pntr_plus1[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[8] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp__1[8]),
        .Q(rd_pntr_plus1[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[9] 
       (.C(rd_clk),
        .CE(E),
        .D(plusOp__1[9]),
        .Q(rd_pntr_plus1[9]),
        .R(SR));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__0 
       (.I0(rd_pntr_plus1[0]),
        .I1(WR_PNTR_RD[0]),
        .I2(rd_pntr_plus1[1]),
        .I3(WR_PNTR_RD[1]),
        .O(v1_reg[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__0 
       (.I0(rd_pntr_plus1[2]),
        .I1(WR_PNTR_RD[2]),
        .I2(rd_pntr_plus1[3]),
        .I3(WR_PNTR_RD[3]),
        .O(v1_reg[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__0 
       (.I0(rd_pntr_plus1[4]),
        .I1(WR_PNTR_RD[4]),
        .I2(rd_pntr_plus1[5]),
        .I3(WR_PNTR_RD[5]),
        .O(v1_reg[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__0 
       (.I0(rd_pntr_plus1[6]),
        .I1(WR_PNTR_RD[6]),
        .I2(rd_pntr_plus1[7]),
        .I3(WR_PNTR_RD[7]),
        .O(v1_reg[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[4].gms.ms_i_1__0 
       (.I0(rd_pntr_plus1[8]),
        .I1(WR_PNTR_RD[8]),
        .I2(rd_pntr_plus1[9]),
        .I3(WR_PNTR_RD[9]),
        .O(v1_reg[4]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[5].gms.ms_i_1__0 
       (.I0(rd_pntr_plus1[10]),
        .I1(WR_PNTR_RD[10]),
        .I2(rd_pntr_plus1[11]),
        .I3(WR_PNTR_RD[11]),
        .O(v1_reg[5]));
  CARRY8 plusOp_carry
       (.CI(rd_pntr_plus1[0]),
        .CI_TOP(1'b0),
        .CO({plusOp_carry_n_0,plusOp_carry_n_1,plusOp_carry_n_2,plusOp_carry_n_3,NLW_plusOp_carry_CO_UNCONNECTED[3],plusOp_carry_n_5,plusOp_carry_n_6,plusOp_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp__1[8:1]),
        .S(rd_pntr_plus1[8:1]));
  CARRY8 plusOp_carry__0
       (.CI(plusOp_carry_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_plusOp_carry__0_CO_UNCONNECTED[7:2],plusOp_carry__0_n_6,plusOp_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_plusOp_carry__0_O_UNCONNECTED[7:3],plusOp__1[11:9]}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,rd_pntr_plus1[11:9]}));
endmodule

module fifo_cmd_rd_fwft
   (out,
    empty,
    ENB_I,
    tmp_ram_regout_en,
    p_0_out,
    E,
    SR,
    rd_clk,
    ENB_dly_reg_D,
    rd_en,
    ram_empty_fb_i_reg);
  output [1:0]out;
  output empty;
  output ENB_I;
  output tmp_ram_regout_en;
  output p_0_out;
  output [0:0]E;
  input [0:0]SR;
  input rd_clk;
  input ENB_dly_reg_D;
  input rd_en;
  input ram_empty_fb_i_reg;

  wire [0:0]E;
  wire ENB_I;
  wire ENB_dly_reg_D;
  wire [0:0]SR;
  (* DONT_TOUCH *) wire aempty_fwft_fb_i;
  (* DONT_TOUCH *) wire aempty_fwft_i;
  wire aempty_fwft_i0__1;
  (* DONT_TOUCH *) wire [1:0]curr_fwft_state;
  (* DONT_TOUCH *) wire empty_fwft_fb_i;
  (* DONT_TOUCH *) wire empty_fwft_fb_o_i;
  wire empty_fwft_fb_o_i_reg0;
  (* DONT_TOUCH *) wire empty_fwft_i;
  wire empty_fwft_i0__1;
  wire [1:0]next_fwft_state;
  wire p_0_out;
  wire ram_empty_fb_i_reg;
  wire rd_clk;
  wire rd_en;
  wire tmp_ram_regout_en;
  (* DONT_TOUCH *) wire user_valid;

  assign empty = empty_fwft_i;
  assign out[1:0] = curr_fwft_state;
  LUT6 #(
    .INIT(64'hEEEEEEEEFFFFEFFF)) 
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2 
       (.I0(ENB_dly_reg_D),
        .I1(SR),
        .I2(curr_fwft_state[0]),
        .I3(curr_fwft_state[1]),
        .I4(rd_en),
        .I5(ram_empty_fb_i_reg),
        .O(ENB_I));
  LUT4 #(
    .INIT(16'hFFB0)) 
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_3 
       (.I0(rd_en),
        .I1(curr_fwft_state[0]),
        .I2(curr_fwft_state[1]),
        .I3(SR),
        .O(tmp_ram_regout_en));
  LUT5 #(
    .INIT(32'hFFCB8000)) 
    aempty_fwft_fb_i_i_1
       (.I0(rd_en),
        .I1(curr_fwft_state[0]),
        .I2(curr_fwft_state[1]),
        .I3(ram_empty_fb_i_reg),
        .I4(aempty_fwft_fb_i),
        .O(aempty_fwft_i0__1));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    aempty_fwft_fb_i_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(aempty_fwft_i0__1),
        .Q(aempty_fwft_fb_i),
        .S(SR));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    aempty_fwft_i_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(aempty_fwft_i0__1),
        .Q(aempty_fwft_i),
        .S(SR));
  LUT4 #(
    .INIT(16'hF320)) 
    empty_fwft_fb_i_i_1
       (.I0(rd_en),
        .I1(curr_fwft_state[1]),
        .I2(curr_fwft_state[0]),
        .I3(empty_fwft_fb_i),
        .O(empty_fwft_i0__1));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    empty_fwft_fb_i_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(empty_fwft_i0__1),
        .Q(empty_fwft_fb_i),
        .S(SR));
  LUT4 #(
    .INIT(16'hF320)) 
    empty_fwft_fb_o_i_i_1
       (.I0(rd_en),
        .I1(curr_fwft_state[1]),
        .I2(curr_fwft_state[0]),
        .I3(empty_fwft_fb_o_i),
        .O(empty_fwft_fb_o_i_reg0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    empty_fwft_fb_o_i_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(empty_fwft_fb_o_i_reg0),
        .Q(empty_fwft_fb_o_i),
        .S(SR));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    empty_fwft_i_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(empty_fwft_i0__1),
        .Q(empty_fwft_i),
        .S(SR));
  LUT4 #(
    .INIT(16'h4555)) 
    \gc0.count_d1[11]_i_1 
       (.I0(ram_empty_fb_i_reg),
        .I1(rd_en),
        .I2(curr_fwft_state[1]),
        .I3(curr_fwft_state[0]),
        .O(E));
  LUT3 #(
    .INIT(8'hBA)) 
    \gpregsm1.curr_fwft_state[0]_i_1 
       (.I0(curr_fwft_state[1]),
        .I1(rd_en),
        .I2(curr_fwft_state[0]),
        .O(next_fwft_state[0]));
  LUT4 #(
    .INIT(16'h20FF)) 
    \gpregsm1.curr_fwft_state[1]_i_1 
       (.I0(curr_fwft_state[1]),
        .I1(rd_en),
        .I2(curr_fwft_state[0]),
        .I3(ram_empty_fb_i_reg),
        .O(next_fwft_state[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gpregsm1.curr_fwft_state_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(next_fwft_state[0]),
        .Q(curr_fwft_state[0]),
        .R(SR));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gpregsm1.curr_fwft_state_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(next_fwft_state[1]),
        .Q(curr_fwft_state[1]),
        .R(SR));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gpregsm1.user_valid_reg 
       (.C(rd_clk),
        .CE(1'b1),
        .D(next_fwft_state[0]),
        .Q(user_valid),
        .R(SR));
  LUT4 #(
    .INIT(16'hFF08)) 
    plusOp_carry_i_1
       (.I0(curr_fwft_state[0]),
        .I1(curr_fwft_state[1]),
        .I2(rd_en),
        .I3(ram_empty_fb_i_reg),
        .O(p_0_out));
endmodule

module fifo_cmd_rd_logic
   (empty,
    prog_empty,
    ENB_I,
    tmp_ram_regout_en,
    Q,
    v1_reg,
    SR,
    rd_clk,
    WR_PNTR_RD,
    \dest_out_bin_ff_reg[7] ,
    \dest_out_bin_ff_reg[11] ,
    ENB_dly_reg_D,
    rd_en);
  output empty;
  output prog_empty;
  output ENB_I;
  output tmp_ram_regout_en;
  output [11:0]Q;
  input [5:0]v1_reg;
  input [0:0]SR;
  input rd_clk;
  input [11:0]WR_PNTR_RD;
  input [7:0]\dest_out_bin_ff_reg[7] ;
  input [3:0]\dest_out_bin_ff_reg[11] ;
  input ENB_dly_reg_D;
  input rd_en;

  wire ENB_I;
  wire ENB_dly_reg_D;
  wire [11:0]Q;
  wire [0:0]SR;
  wire [11:0]WR_PNTR_RD;
  wire [5:0]\c1/v1_reg ;
  wire [3:0]\dest_out_bin_ff_reg[11] ;
  wire [7:0]\dest_out_bin_ff_reg[7] ;
  wire empty;
  wire \gr1.gr1_int.rfwft_n_0 ;
  wire [0:0]p_0_in;
  wire p_0_out;
  wire p_2_out;
  wire p_8_out;
  wire prog_empty;
  wire rd_clk;
  wire rd_en;
  wire tmp_ram_regout_en;
  wire [5:0]v1_reg;

  fifo_cmd_rd_fwft \gr1.gr1_int.rfwft 
       (.E(p_8_out),
        .ENB_I(ENB_I),
        .ENB_dly_reg_D(ENB_dly_reg_D),
        .SR(SR),
        .empty(empty),
        .out({\gr1.gr1_int.rfwft_n_0 ,p_0_in}),
        .p_0_out(p_0_out),
        .ram_empty_fb_i_reg(p_2_out),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .tmp_ram_regout_en(tmp_ram_regout_en));
  fifo_cmd_rd_pe_as \gras.gpe.rdpe 
       (.SR(SR),
        .WR_PNTR_RD(WR_PNTR_RD[10:0]),
        .\dest_out_bin_ff_reg[11] (\dest_out_bin_ff_reg[11] ),
        .\dest_out_bin_ff_reg[7] (\dest_out_bin_ff_reg[7] ),
        .out(p_2_out),
        .p_0_out(p_0_out),
        .prog_empty(prog_empty),
        .rd_clk(rd_clk));
  fifo_cmd_rd_status_flags_as \gras.rsts 
       (.SR(SR),
        .\gpregsm1.curr_fwft_state_reg[1] ({\gr1.gr1_int.rfwft_n_0 ,p_0_in}),
        .out(p_2_out),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .v1_reg(v1_reg),
        .v1_reg_0(\c1/v1_reg ));
  fifo_cmd_rd_bin_cntr rpntr
       (.E(p_8_out),
        .Q(Q),
        .SR(SR),
        .WR_PNTR_RD(WR_PNTR_RD),
        .rd_clk(rd_clk),
        .v1_reg(\c1/v1_reg ));
endmodule

module fifo_cmd_rd_pe_as
   (prog_empty,
    p_0_out,
    WR_PNTR_RD,
    \dest_out_bin_ff_reg[7] ,
    \dest_out_bin_ff_reg[11] ,
    SR,
    rd_clk,
    out);
  output prog_empty;
  input p_0_out;
  input [10:0]WR_PNTR_RD;
  input [7:0]\dest_out_bin_ff_reg[7] ;
  input [3:0]\dest_out_bin_ff_reg[11] ;
  input [0:0]SR;
  input rd_clk;
  input out;

  wire [0:0]SR;
  wire [10:0]WR_PNTR_RD;
  wire [3:0]\dest_out_bin_ff_reg[11] ;
  wire [7:0]\dest_out_bin_ff_reg[7] ;
  wire [12:1]diff_pntr_pad;
  wire \gpe1.prog_empty_i_i_1_n_0 ;
  wire \gpe1.prog_empty_i_i_2_n_0 ;
  wire \gpe1.prog_empty_i_i_3_n_0 ;
  wire out;
  wire p_0_out;
  wire [12:1]plusOp;
  wire plusOp_carry__0_n_5;
  wire plusOp_carry__0_n_6;
  wire plusOp_carry__0_n_7;
  wire plusOp_carry_n_0;
  wire plusOp_carry_n_1;
  wire plusOp_carry_n_2;
  wire plusOp_carry_n_3;
  wire plusOp_carry_n_5;
  wire plusOp_carry_n_6;
  wire plusOp_carry_n_7;
  wire prog_empty;
  wire rd_clk;
  wire [3:3]NLW_plusOp_carry_CO_UNCONNECTED;
  wire [7:3]NLW_plusOp_carry__0_CO_UNCONNECTED;
  wire [7:4]NLW_plusOp_carry__0_O_UNCONNECTED;

  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[10] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(plusOp[10]),
        .Q(diff_pntr_pad[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[11] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(plusOp[11]),
        .Q(diff_pntr_pad[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[12] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(plusOp[12]),
        .Q(diff_pntr_pad[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(plusOp[1]),
        .Q(diff_pntr_pad[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[2] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(plusOp[2]),
        .Q(diff_pntr_pad[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[3] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(plusOp[3]),
        .Q(diff_pntr_pad[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[4] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(plusOp[4]),
        .Q(diff_pntr_pad[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[5] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(plusOp[5]),
        .Q(diff_pntr_pad[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[6] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(plusOp[6]),
        .Q(diff_pntr_pad[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[7] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(plusOp[7]),
        .Q(diff_pntr_pad[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[8] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(plusOp[8]),
        .Q(diff_pntr_pad[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[9] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(plusOp[9]),
        .Q(diff_pntr_pad[9]),
        .R(SR));
  LUT4 #(
    .INIT(16'hB888)) 
    \gpe1.prog_empty_i_i_1 
       (.I0(prog_empty),
        .I1(out),
        .I2(\gpe1.prog_empty_i_i_2_n_0 ),
        .I3(\gpe1.prog_empty_i_i_3_n_0 ),
        .O(\gpe1.prog_empty_i_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \gpe1.prog_empty_i_i_2 
       (.I0(diff_pntr_pad[12]),
        .I1(diff_pntr_pad[11]),
        .I2(diff_pntr_pad[8]),
        .I3(diff_pntr_pad[7]),
        .I4(diff_pntr_pad[10]),
        .I5(diff_pntr_pad[9]),
        .O(\gpe1.prog_empty_i_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7777777FFFFFFFFF)) 
    \gpe1.prog_empty_i_i_3 
       (.I0(diff_pntr_pad[6]),
        .I1(diff_pntr_pad[5]),
        .I2(diff_pntr_pad[2]),
        .I3(diff_pntr_pad[1]),
        .I4(diff_pntr_pad[3]),
        .I5(diff_pntr_pad[4]),
        .O(\gpe1.prog_empty_i_i_3_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \gpe1.prog_empty_i_reg 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\gpe1.prog_empty_i_i_1_n_0 ),
        .Q(prog_empty),
        .S(SR));
  CARRY8 plusOp_carry
       (.CI(p_0_out),
        .CI_TOP(1'b0),
        .CO({plusOp_carry_n_0,plusOp_carry_n_1,plusOp_carry_n_2,plusOp_carry_n_3,NLW_plusOp_carry_CO_UNCONNECTED[3],plusOp_carry_n_5,plusOp_carry_n_6,plusOp_carry_n_7}),
        .DI(WR_PNTR_RD[7:0]),
        .O(plusOp[8:1]),
        .S(\dest_out_bin_ff_reg[7] ));
  CARRY8 plusOp_carry__0
       (.CI(plusOp_carry_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_plusOp_carry__0_CO_UNCONNECTED[7:3],plusOp_carry__0_n_5,plusOp_carry__0_n_6,plusOp_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,WR_PNTR_RD[10:8]}),
        .O({NLW_plusOp_carry__0_O_UNCONNECTED[7:4],plusOp[12:9]}),
        .S({1'b0,1'b0,1'b0,1'b0,\dest_out_bin_ff_reg[11] }));
endmodule

module fifo_cmd_rd_status_flags_as
   (out,
    v1_reg,
    v1_reg_0,
    SR,
    rd_clk,
    rd_en,
    \gpregsm1.curr_fwft_state_reg[1] );
  output out;
  input [5:0]v1_reg;
  input [5:0]v1_reg_0;
  input [0:0]SR;
  input rd_clk;
  input rd_en;
  input [1:0]\gpregsm1.curr_fwft_state_reg[1] ;

  wire [0:0]SR;
  wire c0_n_0;
  wire comp1;
  wire [1:0]\gpregsm1.curr_fwft_state_reg[1] ;
  (* DONT_TOUCH *) wire ram_empty_fb_i;
  (* DONT_TOUCH *) wire ram_empty_i;
  wire rd_clk;
  wire rd_en;
  wire [5:0]v1_reg;
  wire [5:0]v1_reg_0;

  assign out = ram_empty_fb_i;
  fifo_cmd_compare_1 c0
       (.comp1(comp1),
        .\gpregsm1.curr_fwft_state_reg[1] (\gpregsm1.curr_fwft_state_reg[1] ),
        .out(ram_empty_fb_i),
        .ram_empty_fb_i_reg(c0_n_0),
        .rd_en(rd_en),
        .v1_reg(v1_reg));
  fifo_cmd_compare_2 c1
       (.comp1(comp1),
        .v1_reg_0(v1_reg_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    ram_empty_fb_i_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(c0_n_0),
        .Q(ram_empty_fb_i),
        .S(SR));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    ram_empty_i_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(c0_n_0),
        .Q(ram_empty_i),
        .S(SR));
endmodule

module fifo_cmd_reset_blk_ramfifo
   (\syncstages_ff_reg[0] ,
    SR,
    wr_rst_busy,
    out,
    ram_rstreg_b,
    rst,
    wr_clk,
    rd_clk,
    POR_B);
  output \syncstages_ff_reg[0] ;
  output [0:0]SR;
  output wr_rst_busy;
  output out;
  output ram_rstreg_b;
  input rst;
  input wr_clk;
  input rd_clk;
  input POR_B;

  wire POR_B;
  wire [0:0]SR;
  wire arst_sync_rd_rst;
  wire dest_out;
  wire dest_rst;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_i_1_n_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_i_1_n_0 ;
  wire ram_rstreg_b;
  wire rd_clk;
  wire [3:0]rd_rst_wr_ext;
  wire rst;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d1;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d2;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d3;
  wire sckt_rd_rst_wr;
  wire \syncstages_ff_reg[0] ;
  wire wr_clk;
  wire wr_rst_busy_i__0;
  wire wr_rst_busy_i_n_0;
  wire [1:0]wr_rst_rd_ext;

  assign out = rst_d3;
  assign wr_rst_busy = wr_rst_busy_i__0;
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_4 
       (.I0(SR),
        .I1(POR_B),
        .O(ram_rstreg_b));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d1_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(wr_rst_busy_i__0),
        .Q(rst_d1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d2_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(rst_d1),
        .Q(rst_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDSE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d3_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(rst_d2),
        .Q(rst_d3),
        .S(\syncstages_ff_reg[0] ));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.rd_rst_wr_ext_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(sckt_rd_rst_wr),
        .Q(rd_rst_wr_ext[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.rd_rst_wr_ext_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(rd_rst_wr_ext[0]),
        .Q(rd_rst_wr_ext[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.rd_rst_wr_ext_reg[2] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(rd_rst_wr_ext[1]),
        .Q(rd_rst_wr_ext[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.rd_rst_wr_ext_reg[3] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(rd_rst_wr_ext[2]),
        .Q(rd_rst_wr_ext[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_i_1 
       (.I0(wr_rst_rd_ext[1]),
        .I1(SR),
        .I2(arst_sync_rd_rst),
        .O(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_reg 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_rd_rst_ic_i_1_n_0 ),
        .Q(SR),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hD0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_i_1 
       (.I0(rd_rst_wr_ext[1]),
        .I1(rd_rst_wr_ext[0]),
        .I2(\syncstages_ff_reg[0] ),
        .O(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_i_1_n_0 ),
        .Q(\syncstages_ff_reg[0] ),
        .S(dest_rst));
  FDSE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_busy_i_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(wr_rst_busy_i_n_0),
        .Q(wr_rst_busy_i__0),
        .S(dest_rst));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_rd_ext_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(dest_out),
        .Q(wr_rst_rd_ext[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.wr_rst_rd_ext_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(wr_rst_rd_ext[0]),
        .Q(wr_rst_rd_ext[1]),
        .R(1'b0));
  (* DEST_SYNC_FF = "5" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SRC_INPUT_REG = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SINGLE" *) 
  (* XPM_MODULE = "TRUE" *) 
  fifo_cmd_xpm_cdc_single \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_rrst_wr 
       (.dest_clk(wr_clk),
        .dest_out(sckt_rd_rst_wr),
        .src_clk(rd_clk),
        .src_in(SR));
  (* DEST_SYNC_FF = "5" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SRC_INPUT_REG = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SINGLE" *) 
  (* XPM_MODULE = "TRUE" *) 
  fifo_cmd_xpm_cdc_single__1 \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_wrst_rd 
       (.dest_clk(rd_clk),
        .dest_out(dest_out),
        .src_clk(wr_clk),
        .src_in(\syncstages_ff_reg[0] ));
  (* DEF_VAL = "1'b1" *) 
  (* DEST_SYNC_FF = "5" *) 
  (* INIT = "1" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  (* XPM_MODULE = "TRUE" *) 
  fifo_cmd_xpm_cdc_sync_rst \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_sync_rst_inst_wrst 
       (.dest_clk(rd_clk),
        .dest_rst(arst_sync_rd_rst),
        .src_rst(rst));
  (* DEF_VAL = "1'b1" *) 
  (* DEST_SYNC_FF = "5" *) 
  (* INIT = "1" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  (* XPM_MODULE = "TRUE" *) 
  fifo_cmd_xpm_cdc_sync_rst__1 \ngwrdrst.grst.g7serrst.gsckt_wrst.xpm_cdc_sync_rst_inst_wrst 
       (.dest_clk(wr_clk),
        .dest_rst(dest_rst),
        .src_rst(rst));
  LUT5 #(
    .INIT(32'hF020F0F0)) 
    wr_rst_busy_i
       (.I0(rd_rst_wr_ext[1]),
        .I1(rd_rst_wr_ext[0]),
        .I2(wr_rst_busy_i__0),
        .I3(rd_rst_wr_ext[2]),
        .I4(rd_rst_wr_ext[3]),
        .O(wr_rst_busy_i_n_0));
endmodule

module fifo_cmd_wr_bin_cntr
   (Q,
    \gic0.gc0.count_d2_reg[11]_0 ,
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ,
    E,
    wr_clk);
  output [11:0]Q;
  output [11:0]\gic0.gc0.count_d2_reg[11]_0 ;
  output [11:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  input [0:0]E;
  input wr_clk;

  wire [11:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire [0:0]E;
  wire [11:0]Q;
  wire [11:0]\gic0.gc0.count_d2_reg[11]_0 ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  wire [11:0]plusOp__0;
  wire plusOp_carry__0_n_6;
  wire plusOp_carry__0_n_7;
  wire plusOp_carry_n_0;
  wire plusOp_carry_n_1;
  wire plusOp_carry_n_2;
  wire plusOp_carry_n_3;
  wire plusOp_carry_n_5;
  wire plusOp_carry_n_6;
  wire plusOp_carry_n_7;
  wire wr_clk;
  wire [3:3]NLW_plusOp_carry_CO_UNCONNECTED;
  wire [7:2]NLW_plusOp_carry__0_CO_UNCONNECTED;
  wire [7:3]NLW_plusOp_carry__0_O_UNCONNECTED;

  LUT1 #(
    .INIT(2'h1)) 
    \gic0.gc0.count[0]_i_1 
       (.I0(Q[0]),
        .O(plusOp__0[0]));
  FDSE #(
    .INIT(1'b1)) 
    \gic0.gc0.count_d1_reg[0] 
       (.C(wr_clk),
        .CE(E),
        .D(Q[0]),
        .Q(\gic0.gc0.count_d2_reg[11]_0 [0]),
        .S(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[10] 
       (.C(wr_clk),
        .CE(E),
        .D(Q[10]),
        .Q(\gic0.gc0.count_d2_reg[11]_0 [10]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[11] 
       (.C(wr_clk),
        .CE(E),
        .D(Q[11]),
        .Q(\gic0.gc0.count_d2_reg[11]_0 [11]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[1] 
       (.C(wr_clk),
        .CE(E),
        .D(Q[1]),
        .Q(\gic0.gc0.count_d2_reg[11]_0 [1]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[2] 
       (.C(wr_clk),
        .CE(E),
        .D(Q[2]),
        .Q(\gic0.gc0.count_d2_reg[11]_0 [2]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[3] 
       (.C(wr_clk),
        .CE(E),
        .D(Q[3]),
        .Q(\gic0.gc0.count_d2_reg[11]_0 [3]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[4] 
       (.C(wr_clk),
        .CE(E),
        .D(Q[4]),
        .Q(\gic0.gc0.count_d2_reg[11]_0 [4]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[5] 
       (.C(wr_clk),
        .CE(E),
        .D(Q[5]),
        .Q(\gic0.gc0.count_d2_reg[11]_0 [5]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[6] 
       (.C(wr_clk),
        .CE(E),
        .D(Q[6]),
        .Q(\gic0.gc0.count_d2_reg[11]_0 [6]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[7] 
       (.C(wr_clk),
        .CE(E),
        .D(Q[7]),
        .Q(\gic0.gc0.count_d2_reg[11]_0 [7]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[8] 
       (.C(wr_clk),
        .CE(E),
        .D(Q[8]),
        .Q(\gic0.gc0.count_d2_reg[11]_0 [8]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[9] 
       (.C(wr_clk),
        .CE(E),
        .D(Q[9]),
        .Q(\gic0.gc0.count_d2_reg[11]_0 [9]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[0] 
       (.C(wr_clk),
        .CE(E),
        .D(\gic0.gc0.count_d2_reg[11]_0 [0]),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram [0]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[10] 
       (.C(wr_clk),
        .CE(E),
        .D(\gic0.gc0.count_d2_reg[11]_0 [10]),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram [10]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[11] 
       (.C(wr_clk),
        .CE(E),
        .D(\gic0.gc0.count_d2_reg[11]_0 [11]),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram [11]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[1] 
       (.C(wr_clk),
        .CE(E),
        .D(\gic0.gc0.count_d2_reg[11]_0 [1]),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram [1]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[2] 
       (.C(wr_clk),
        .CE(E),
        .D(\gic0.gc0.count_d2_reg[11]_0 [2]),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram [2]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[3] 
       (.C(wr_clk),
        .CE(E),
        .D(\gic0.gc0.count_d2_reg[11]_0 [3]),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram [3]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[4] 
       (.C(wr_clk),
        .CE(E),
        .D(\gic0.gc0.count_d2_reg[11]_0 [4]),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram [4]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[5] 
       (.C(wr_clk),
        .CE(E),
        .D(\gic0.gc0.count_d2_reg[11]_0 [5]),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram [5]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[6] 
       (.C(wr_clk),
        .CE(E),
        .D(\gic0.gc0.count_d2_reg[11]_0 [6]),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram [6]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[7] 
       (.C(wr_clk),
        .CE(E),
        .D(\gic0.gc0.count_d2_reg[11]_0 [7]),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram [7]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[8] 
       (.C(wr_clk),
        .CE(E),
        .D(\gic0.gc0.count_d2_reg[11]_0 [8]),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram [8]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[9] 
       (.C(wr_clk),
        .CE(E),
        .D(\gic0.gc0.count_d2_reg[11]_0 [9]),
        .Q(\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram [9]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[0] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[0]),
        .Q(Q[0]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[10] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[10]),
        .Q(Q[10]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[11] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[11]),
        .Q(Q[11]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDSE #(
    .INIT(1'b1)) 
    \gic0.gc0.count_reg[1] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[1]),
        .Q(Q[1]),
        .S(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[2] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[2]),
        .Q(Q[2]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[3] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[3]),
        .Q(Q[3]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[4] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[4]),
        .Q(Q[4]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[5] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[5]),
        .Q(Q[5]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[6] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[6]),
        .Q(Q[6]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[7] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[7]),
        .Q(Q[7]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[8] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[8]),
        .Q(Q[8]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[9] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[9]),
        .Q(Q[9]),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  CARRY8 plusOp_carry
       (.CI(Q[0]),
        .CI_TOP(1'b0),
        .CO({plusOp_carry_n_0,plusOp_carry_n_1,plusOp_carry_n_2,plusOp_carry_n_3,NLW_plusOp_carry_CO_UNCONNECTED[3],plusOp_carry_n_5,plusOp_carry_n_6,plusOp_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp__0[8:1]),
        .S(Q[8:1]));
  CARRY8 plusOp_carry__0
       (.CI(plusOp_carry_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_plusOp_carry__0_CO_UNCONNECTED[7:2],plusOp_carry__0_n_6,plusOp_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_plusOp_carry__0_O_UNCONNECTED[7:3],plusOp__0[11:9]}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,Q[11:9]}));
endmodule

module fifo_cmd_wr_logic
   (full,
    out,
    E,
    Q,
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    prog_full,
    wr_en,
    \grstd1.grst_full.grst_f.rst_d3_reg ,
    S,
    \dest_out_bin_ff_reg[11] ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ,
    wr_clk,
    RD_PNTR_WR);
  output full;
  output out;
  output [0:0]E;
  output [11:0]Q;
  output [11:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  output prog_full;
  input wr_en;
  input \grstd1.grst_full.grst_f.rst_d3_reg ;
  input [7:0]S;
  input [3:0]\dest_out_bin_ff_reg[11] ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  input wr_clk;
  input [11:0]RD_PNTR_WR;

  wire [11:0]\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire [0:0]E;
  wire [11:0]Q;
  wire [11:0]RD_PNTR_WR;
  wire [7:0]S;
  wire [3:0]\dest_out_bin_ff_reg[11] ;
  wire full;
  wire \grstd1.grst_full.grst_f.rst_d3_reg ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  wire out;
  wire prog_full;
  wire wr_clk;
  wire wr_en;
  wire [11:0]wr_pntr_plus2;

  fifo_cmd_wr_pf_as \gwas.gpf.wrpf 
       (.E(E),
        .Q(Q[10:0]),
        .S(S),
        .\dest_out_bin_ff_reg[11] (\dest_out_bin_ff_reg[11] ),
        .\grstd1.grst_full.grst_f.rst_d3_reg (\grstd1.grst_full.grst_f.rst_d3_reg ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ),
        .out(out),
        .prog_full(prog_full),
        .wr_clk(wr_clk));
  fifo_cmd_wr_status_flags_as \gwas.wsts 
       (.E(E),
        .Q(Q),
        .RD_PNTR_WR(RD_PNTR_WR),
        .full(full),
        .\gic0.gc0.count_reg[11] (wr_pntr_plus2),
        .\grstd1.grst_full.grst_f.rst_d3_reg (\grstd1.grst_full.grst_f.rst_d3_reg ),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ),
        .out(out),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
  fifo_cmd_wr_bin_cntr wpntr
       (.\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .E(E),
        .Q(wr_pntr_plus2),
        .\gic0.gc0.count_d2_reg[11]_0 (Q),
        .\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg (\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ),
        .wr_clk(wr_clk));
endmodule

module fifo_cmd_wr_pf_as
   (prog_full,
    E,
    Q,
    S,
    \dest_out_bin_ff_reg[11] ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ,
    wr_clk,
    \grstd1.grst_full.grst_f.rst_d3_reg ,
    out);
  output prog_full;
  input [0:0]E;
  input [10:0]Q;
  input [7:0]S;
  input [3:0]\dest_out_bin_ff_reg[11] ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  input wr_clk;
  input \grstd1.grst_full.grst_f.rst_d3_reg ;
  input out;

  wire [0:0]E;
  wire [10:0]Q;
  wire [7:0]S;
  wire [3:0]\dest_out_bin_ff_reg[11] ;
  wire \gdiff.diff_pntr_pad_reg_n_0_[10] ;
  wire \gdiff.diff_pntr_pad_reg_n_0_[11] ;
  wire \gdiff.diff_pntr_pad_reg_n_0_[12] ;
  wire \gdiff.diff_pntr_pad_reg_n_0_[1] ;
  wire \gdiff.diff_pntr_pad_reg_n_0_[2] ;
  wire \gdiff.diff_pntr_pad_reg_n_0_[3] ;
  wire \gdiff.diff_pntr_pad_reg_n_0_[4] ;
  wire \gdiff.diff_pntr_pad_reg_n_0_[5] ;
  wire \gdiff.diff_pntr_pad_reg_n_0_[6] ;
  wire \gdiff.diff_pntr_pad_reg_n_0_[7] ;
  wire \gdiff.diff_pntr_pad_reg_n_0_[8] ;
  wire \gdiff.diff_pntr_pad_reg_n_0_[9] ;
  wire \gpf1.prog_full_i_i_1_n_0 ;
  wire \gpf1.prog_full_i_i_2_n_0 ;
  wire \gpf1.prog_full_i_i_3_n_0 ;
  wire \gpf1.prog_full_i_i_4_n_0 ;
  wire \grstd1.grst_full.grst_f.rst_d3_reg ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  wire out;
  wire plusOp_carry__0_n_12;
  wire plusOp_carry__0_n_13;
  wire plusOp_carry__0_n_14;
  wire plusOp_carry__0_n_15;
  wire plusOp_carry__0_n_5;
  wire plusOp_carry__0_n_6;
  wire plusOp_carry__0_n_7;
  wire plusOp_carry_n_0;
  wire plusOp_carry_n_1;
  wire plusOp_carry_n_10;
  wire plusOp_carry_n_11;
  wire plusOp_carry_n_12;
  wire plusOp_carry_n_13;
  wire plusOp_carry_n_14;
  wire plusOp_carry_n_15;
  wire plusOp_carry_n_2;
  wire plusOp_carry_n_3;
  wire plusOp_carry_n_5;
  wire plusOp_carry_n_6;
  wire plusOp_carry_n_7;
  wire plusOp_carry_n_8;
  wire plusOp_carry_n_9;
  wire prog_full;
  wire wr_clk;
  wire [3:3]NLW_plusOp_carry_CO_UNCONNECTED;
  wire [7:3]NLW_plusOp_carry__0_CO_UNCONNECTED;
  wire [7:4]NLW_plusOp_carry__0_O_UNCONNECTED;

  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[10] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(plusOp_carry__0_n_14),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_[10] ),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[11] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(plusOp_carry__0_n_13),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_[11] ),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[12] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(plusOp_carry__0_n_12),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_[12] ),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(plusOp_carry_n_15),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_[1] ),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[2] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(plusOp_carry_n_14),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_[2] ),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[3] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(plusOp_carry_n_13),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_[3] ),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[4] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(plusOp_carry_n_12),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_[4] ),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[5] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(plusOp_carry_n_11),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_[5] ),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[6] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(plusOp_carry_n_10),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_[6] ),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[7] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(plusOp_carry_n_9),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_[7] ),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[8] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(plusOp_carry_n_8),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_[8] ),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.diff_pntr_pad_reg[9] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(plusOp_carry__0_n_15),
        .Q(\gdiff.diff_pntr_pad_reg_n_0_[9] ),
        .R(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  LUT6 #(
    .INIT(64'h00FF000100000001)) 
    \gpf1.prog_full_i_i_1 
       (.I0(\gpf1.prog_full_i_i_2_n_0 ),
        .I1(\gpf1.prog_full_i_i_3_n_0 ),
        .I2(\gpf1.prog_full_i_i_4_n_0 ),
        .I3(\grstd1.grst_full.grst_f.rst_d3_reg ),
        .I4(out),
        .I5(prog_full),
        .O(\gpf1.prog_full_i_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \gpf1.prog_full_i_i_2 
       (.I0(\gdiff.diff_pntr_pad_reg_n_0_[8] ),
        .I1(\gdiff.diff_pntr_pad_reg_n_0_[9] ),
        .I2(\gdiff.diff_pntr_pad_reg_n_0_[6] ),
        .I3(\gdiff.diff_pntr_pad_reg_n_0_[7] ),
        .O(\gpf1.prog_full_i_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h777FFFFF)) 
    \gpf1.prog_full_i_i_3 
       (.I0(\gdiff.diff_pntr_pad_reg_n_0_[4] ),
        .I1(\gdiff.diff_pntr_pad_reg_n_0_[5] ),
        .I2(\gdiff.diff_pntr_pad_reg_n_0_[1] ),
        .I3(\gdiff.diff_pntr_pad_reg_n_0_[2] ),
        .I4(\gdiff.diff_pntr_pad_reg_n_0_[3] ),
        .O(\gpf1.prog_full_i_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \gpf1.prog_full_i_i_4 
       (.I0(\gdiff.diff_pntr_pad_reg_n_0_[12] ),
        .I1(\gdiff.diff_pntr_pad_reg_n_0_[10] ),
        .I2(\gdiff.diff_pntr_pad_reg_n_0_[11] ),
        .O(\gpf1.prog_full_i_i_4_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \gpf1.prog_full_i_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gpf1.prog_full_i_i_1_n_0 ),
        .Q(prog_full),
        .S(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  CARRY8 plusOp_carry
       (.CI(E),
        .CI_TOP(1'b0),
        .CO({plusOp_carry_n_0,plusOp_carry_n_1,plusOp_carry_n_2,plusOp_carry_n_3,NLW_plusOp_carry_CO_UNCONNECTED[3],plusOp_carry_n_5,plusOp_carry_n_6,plusOp_carry_n_7}),
        .DI(Q[7:0]),
        .O({plusOp_carry_n_8,plusOp_carry_n_9,plusOp_carry_n_10,plusOp_carry_n_11,plusOp_carry_n_12,plusOp_carry_n_13,plusOp_carry_n_14,plusOp_carry_n_15}),
        .S(S));
  CARRY8 plusOp_carry__0
       (.CI(plusOp_carry_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_plusOp_carry__0_CO_UNCONNECTED[7:3],plusOp_carry__0_n_5,plusOp_carry__0_n_6,plusOp_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,Q[10:8]}),
        .O({NLW_plusOp_carry__0_O_UNCONNECTED[7:4],plusOp_carry__0_n_12,plusOp_carry__0_n_13,plusOp_carry__0_n_14,plusOp_carry__0_n_15}),
        .S({1'b0,1'b0,1'b0,1'b0,\dest_out_bin_ff_reg[11] }));
endmodule

module fifo_cmd_wr_status_flags_as
   (full,
    out,
    E,
    wr_en,
    \grstd1.grst_full.grst_f.rst_d3_reg ,
    \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ,
    wr_clk,
    RD_PNTR_WR,
    Q,
    \gic0.gc0.count_reg[11] );
  output full;
  output out;
  output [0:0]E;
  input wr_en;
  input \grstd1.grst_full.grst_f.rst_d3_reg ;
  input \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  input wr_clk;
  input [11:0]RD_PNTR_WR;
  input [11:0]Q;
  input [11:0]\gic0.gc0.count_reg[11] ;

  wire \/i__n_0 ;
  wire [0:0]E;
  wire [11:0]Q;
  wire [11:0]RD_PNTR_WR;
  wire comp1;
  wire comp2;
  wire [11:0]\gic0.gc0.count_reg[11] ;
  wire \grstd1.grst_full.grst_f.rst_d3_reg ;
  wire \ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ;
  (* DONT_TOUCH *) wire ram_full_fb_i;
  (* DONT_TOUCH *) wire ram_full_i;
  wire wr_clk;
  wire wr_en;

  assign full = ram_full_i;
  assign out = ram_full_fb_i;
  LUT5 #(
    .INIT(32'h0000FF20)) 
    \/i_ 
       (.I0(comp2),
        .I1(ram_full_fb_i),
        .I2(wr_en),
        .I3(comp1),
        .I4(\grstd1.grst_full.grst_f.rst_d3_reg ),
        .O(\/i__n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_5 
       (.I0(wr_en),
        .I1(ram_full_fb_i),
        .O(E));
  fifo_cmd_compare c1
       (.Q(Q),
        .RD_PNTR_WR(RD_PNTR_WR),
        .comp1(comp1));
  fifo_cmd_compare_0 c2
       (.RD_PNTR_WR(RD_PNTR_WR),
        .comp2(comp2),
        .\gic0.gc0.count_reg[11] (\gic0.gc0.count_reg[11] ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b0)) 
    ram_full_fb_i_reg
       (.C(wr_clk),
        .CE(1'b1),
        .D(\/i__n_0 ),
        .Q(ram_full_fb_i),
        .S(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b0)) 
    ram_full_i_reg
       (.C(wr_clk),
        .CE(1'b1),
        .D(\/i__n_0 ),
        .Q(ram_full_i),
        .S(\ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.sckt_wr_rst_ic_reg ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif

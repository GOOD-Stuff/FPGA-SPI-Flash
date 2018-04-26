// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
// Date        : Thu Apr 19 13:50:56 2018
// Host        : vldmr-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               C:/Projects/mrdk_adc_ab/mrdk_adc_ab/mrdk_adc_ab.srcs/sources_1/misc/cmd/ip/fifo_cmd/fifo_cmd_sim_netlist.v
// Design      : fifo_cmd
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku035-fbva676-1-c
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_cmd,fifo_generator_v13_2_1,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_1,Vivado 2017.4.1" *) 
(* NotValidForBitStream *)
module fifo_cmd
   (srst,
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
  input srst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 78000000, PHASE 0.000" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 78000000, PHASE 0.000" *) input rd_clk;
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
  wire srst;
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
  wire [13:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [13:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [13:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "14" *) 
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
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "kintexu" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
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
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "1" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "6" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "2" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "2" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "2" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "4" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "8kx4" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "6" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "7" *) 
  (* C_PROG_EMPTY_TYPE = "1" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "16376" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "16375" *) 
  (* C_PROG_FULL_TYPE = "1" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "14" *) 
  (* C_RD_DEPTH = "16384" *) 
  (* C_RD_FREQ = "78" *) 
  (* C_RD_PNTR_WIDTH = "14" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "14" *) 
  (* C_WR_DEPTH = "16384" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "78" *) 
  (* C_WR_PNTR_WIDTH = "14" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  fifo_cmd_fifo_generator_v13_2_1 U0
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
        .data_count(NLW_U0_data_count_UNCONNECTED[13:0]),
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(prog_full),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[13:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(1'b0),
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
        .srst(srst),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[13:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module fifo_cmd_builtin_extdepth
   (p_50_out,
    rrst_busy_i,
    wrst_busy_i,
    p_49_out,
    dout,
    prog_empty,
    wr_rst_busy,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1]_0 ,
    din,
    \gbi8s_srst.srst_qr_reg[1]_1 ,
    p_61_out,
    p_34_out,
    p_43_out,
    p_60_out,
    p_33_out,
    p_42_out);
  output p_50_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output p_49_out;
  output [3:0]dout;
  output prog_empty;
  output wr_rst_busy;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1]_0 ;
  input [3:0]din;
  input \gbi8s_srst.srst_qr_reg[1]_1 ;
  input p_61_out;
  input p_34_out;
  input p_43_out;
  input p_60_out;
  input p_33_out;
  input p_42_out;

  wire [3:0]din;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1]_0 ;
  wire \gbi8s_srst.srst_qr_reg[1]_1 ;
  wire [3:0]p_14_out;
  wire p_15_out;
  wire p_33_out;
  wire p_34_out;
  wire p_42_out;
  wire p_43_out;
  wire p_49_out;
  wire p_50_out;
  wire p_60_out;
  wire p_61_out;
  wire prog_empty;
  wire rd_clk;
  wire [1:1]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;
  wire wr_rst_busy;
  wire [0:0]wrst_busy_i;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst),
        .Q(srst_qr[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst_qr[0]),
        .Q(srst_qr[1]),
        .R(1'b0));
  fifo_cmd_builtin_prim_40 \gmult_prim.gbi_chain.gp1[1].gbi_top.top_inst_prim 
       (.CASDOUT(p_14_out),
        .din(din),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_0 ),
        .p_15_out(p_15_out),
        .p_34_out(p_34_out),
        .p_43_out(p_43_out),
        .p_50_out(p_50_out),
        .p_61_out(p_61_out),
        .prog_empty(prog_empty),
        .rd_clk(rd_clk),
        .re(re),
        .rrst_busy_i(rrst_busy_i),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i));
  fifo_cmd_builtin_prim__parameterized0_41 \gmult_prim.gbi_chain.gp1[2].gbi_last.inst_prim 
       (.CASDOUT(p_14_out),
        .dout(dout),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_1 ),
        .out(srst_qr[1]),
        .p_15_out(p_15_out),
        .p_33_out(p_33_out),
        .p_42_out(p_42_out),
        .p_49_out(p_49_out),
        .p_60_out(p_60_out),
        .rd_clk(rd_clk),
        .re(re),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module fifo_cmd_builtin_extdepth_0
   (p_43_out,
    p_41_out,
    rrst_busy_i,
    wrst_busy_i,
    p_42_out,
    p_40_out,
    dout,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1]_0 ,
    din,
    \gbi8s_srst.srst_qr_reg[1]_1 );
  output p_43_out;
  output p_41_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output p_42_out;
  output p_40_out;
  output [3:0]dout;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1]_0 ;
  input [3:0]din;
  input \gbi8s_srst.srst_qr_reg[1]_1 ;

  wire [3:0]din;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1]_0 ;
  wire \gbi8s_srst.srst_qr_reg[1]_1 ;
  wire [3:0]p_14_out;
  wire p_15_out;
  wire p_40_out;
  wire p_41_out;
  wire p_42_out;
  wire p_43_out;
  wire rd_clk;
  wire [1:1]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;
  wire [0:0]wrst_busy_i;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst),
        .Q(srst_qr[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst_qr[0]),
        .Q(srst_qr[1]),
        .R(1'b0));
  fifo_cmd_builtin_prim_38 \gmult_prim.gbi_chain.gp1[1].gbi_top.top_inst_prim 
       (.CASDOUT(p_14_out),
        .din(din),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_0 ),
        .p_15_out(p_15_out),
        .p_41_out(p_41_out),
        .p_43_out(p_43_out),
        .rd_clk(rd_clk),
        .re(re),
        .rrst_busy_i(rrst_busy_i),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i));
  fifo_cmd_builtin_prim__parameterized0_39 \gmult_prim.gbi_chain.gp1[2].gbi_last.inst_prim 
       (.CASDOUT(p_14_out),
        .dout(dout),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_1 ),
        .out(srst_qr[1]),
        .p_15_out(p_15_out),
        .p_40_out(p_40_out),
        .p_42_out(p_42_out),
        .rd_clk(rd_clk),
        .re(re));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module fifo_cmd_builtin_extdepth_1
   (p_34_out,
    p_32_out,
    rrst_busy_i,
    wrst_busy_i,
    p_33_out,
    p_31_out,
    dout,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1]_0 ,
    din,
    \gbi8s_srst.srst_qr_reg[1]_1 );
  output p_34_out;
  output p_32_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output p_33_out;
  output p_31_out;
  output [3:0]dout;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1]_0 ;
  input [3:0]din;
  input \gbi8s_srst.srst_qr_reg[1]_1 ;

  wire [3:0]din;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1]_0 ;
  wire \gbi8s_srst.srst_qr_reg[1]_1 ;
  wire [3:0]p_14_out;
  wire p_15_out;
  wire p_31_out;
  wire p_32_out;
  wire p_33_out;
  wire p_34_out;
  wire rd_clk;
  wire [1:1]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;
  wire [0:0]wrst_busy_i;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst),
        .Q(srst_qr[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst_qr[0]),
        .Q(srst_qr[1]),
        .R(1'b0));
  fifo_cmd_builtin_prim_36 \gmult_prim.gbi_chain.gp1[1].gbi_top.top_inst_prim 
       (.CASDOUT(p_14_out),
        .din(din),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_0 ),
        .p_15_out(p_15_out),
        .p_32_out(p_32_out),
        .p_34_out(p_34_out),
        .rd_clk(rd_clk),
        .re(re),
        .rrst_busy_i(rrst_busy_i),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i));
  fifo_cmd_builtin_prim__parameterized0_37 \gmult_prim.gbi_chain.gp1[2].gbi_last.inst_prim 
       (.CASDOUT(p_14_out),
        .dout(dout),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_1 ),
        .out(srst_qr[1]),
        .p_15_out(p_15_out),
        .p_31_out(p_31_out),
        .p_33_out(p_33_out),
        .rd_clk(rd_clk),
        .re(re));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module fifo_cmd_builtin_extdepth_10
   (p_88_out,
    p_86_out,
    rrst_busy_i,
    wrst_busy_i,
    p_87_out,
    prog_empty,
    dout,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1]_0 ,
    din,
    \gbi8s_srst.srst_qr_reg[1]_1 );
  output p_88_out;
  output p_86_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output p_87_out;
  output prog_empty;
  output [3:0]dout;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1]_0 ;
  input [3:0]din;
  input \gbi8s_srst.srst_qr_reg[1]_1 ;

  wire [3:0]din;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1]_0 ;
  wire \gbi8s_srst.srst_qr_reg[1]_1 ;
  wire [3:0]p_14_out;
  wire p_15_out;
  wire p_86_out;
  wire p_87_out;
  wire p_88_out;
  wire prog_empty;
  wire rd_clk;
  wire [1:1]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;
  wire [0:0]wrst_busy_i;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst),
        .Q(srst_qr[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst_qr[0]),
        .Q(srst_qr[1]),
        .R(1'b0));
  fifo_cmd_builtin_prim_18 \gmult_prim.gbi_chain.gp1[1].gbi_top.top_inst_prim 
       (.CASDOUT(p_14_out),
        .din(din),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_0 ),
        .p_15_out(p_15_out),
        .p_86_out(p_86_out),
        .p_88_out(p_88_out),
        .rd_clk(rd_clk),
        .re(re),
        .rrst_busy_i(rrst_busy_i),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i));
  fifo_cmd_builtin_prim__parameterized0_19 \gmult_prim.gbi_chain.gp1[2].gbi_last.inst_prim 
       (.CASDOUT(p_14_out),
        .dout(dout),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_1 ),
        .out(srst_qr[1]),
        .p_15_out(p_15_out),
        .p_87_out(p_87_out),
        .prog_empty(prog_empty),
        .rd_clk(rd_clk),
        .re(re));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module fifo_cmd_builtin_extdepth_11
   (p_79_out,
    p_77_out,
    rrst_busy_i,
    wrst_busy_i,
    p_78_out,
    prog_empty,
    dout,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1]_0 ,
    din,
    \gbi8s_srst.srst_qr_reg[1]_1 );
  output p_79_out;
  output p_77_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output p_78_out;
  output prog_empty;
  output [3:0]dout;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1]_0 ;
  input [3:0]din;
  input \gbi8s_srst.srst_qr_reg[1]_1 ;

  wire [3:0]din;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1]_0 ;
  wire \gbi8s_srst.srst_qr_reg[1]_1 ;
  wire [3:0]p_14_out;
  wire p_15_out;
  wire p_77_out;
  wire p_78_out;
  wire p_79_out;
  wire prog_empty;
  wire rd_clk;
  wire [1:1]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;
  wire [0:0]wrst_busy_i;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst),
        .Q(srst_qr[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst_qr[0]),
        .Q(srst_qr[1]),
        .R(1'b0));
  fifo_cmd_builtin_prim_16 \gmult_prim.gbi_chain.gp1[1].gbi_top.top_inst_prim 
       (.CASDOUT(p_14_out),
        .din(din),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_0 ),
        .p_15_out(p_15_out),
        .p_77_out(p_77_out),
        .p_79_out(p_79_out),
        .rd_clk(rd_clk),
        .re(re),
        .rrst_busy_i(rrst_busy_i),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i));
  fifo_cmd_builtin_prim__parameterized0_17 \gmult_prim.gbi_chain.gp1[2].gbi_last.inst_prim 
       (.CASDOUT(p_14_out),
        .dout(dout),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_1 ),
        .out(srst_qr[1]),
        .p_15_out(p_15_out),
        .p_78_out(p_78_out),
        .prog_empty(prog_empty),
        .rd_clk(rd_clk),
        .re(re));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module fifo_cmd_builtin_extdepth_12
   (p_68_out,
    rrst_busy_i,
    wrst_busy_i,
    p_67_out,
    dout,
    prog_empty,
    wr_rst_busy,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1]_0 ,
    din,
    \gbi8s_srst.srst_qr_reg[1]_1 ,
    p_79_out,
    p_88_out,
    p_97_out,
    p_78_out,
    p_87_out,
    p_96_out);
  output p_68_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output p_67_out;
  output [3:0]dout;
  output prog_empty;
  output wr_rst_busy;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1]_0 ;
  input [3:0]din;
  input \gbi8s_srst.srst_qr_reg[1]_1 ;
  input p_79_out;
  input p_88_out;
  input p_97_out;
  input p_78_out;
  input p_87_out;
  input p_96_out;

  wire [3:0]din;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1]_0 ;
  wire \gbi8s_srst.srst_qr_reg[1]_1 ;
  wire [3:0]p_14_out;
  wire p_15_out;
  wire p_67_out;
  wire p_68_out;
  wire p_78_out;
  wire p_79_out;
  wire p_87_out;
  wire p_88_out;
  wire p_96_out;
  wire p_97_out;
  wire prog_empty;
  wire rd_clk;
  wire [1:1]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;
  wire wr_rst_busy;
  wire [0:0]wrst_busy_i;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst),
        .Q(srst_qr[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst_qr[0]),
        .Q(srst_qr[1]),
        .R(1'b0));
  fifo_cmd_builtin_prim_14 \gmult_prim.gbi_chain.gp1[1].gbi_top.top_inst_prim 
       (.CASDOUT(p_14_out),
        .din(din),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_0 ),
        .p_15_out(p_15_out),
        .p_68_out(p_68_out),
        .p_79_out(p_79_out),
        .p_88_out(p_88_out),
        .p_97_out(p_97_out),
        .prog_empty(prog_empty),
        .rd_clk(rd_clk),
        .re(re),
        .rrst_busy_i(rrst_busy_i),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i));
  fifo_cmd_builtin_prim__parameterized0_15 \gmult_prim.gbi_chain.gp1[2].gbi_last.inst_prim 
       (.CASDOUT(p_14_out),
        .dout(dout),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_1 ),
        .out(srst_qr[1]),
        .p_15_out(p_15_out),
        .p_67_out(p_67_out),
        .p_78_out(p_78_out),
        .p_87_out(p_87_out),
        .p_96_out(p_96_out),
        .rd_clk(rd_clk),
        .re(re),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module fifo_cmd_builtin_extdepth_13
   (p_61_out,
    p_59_out,
    rrst_busy_i,
    wrst_busy_i,
    p_60_out,
    p_58_out,
    dout,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1]_0 ,
    din,
    \gbi8s_srst.srst_qr_reg[1]_1 );
  output p_61_out;
  output p_59_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output p_60_out;
  output p_58_out;
  output [3:0]dout;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1]_0 ;
  input [3:0]din;
  input \gbi8s_srst.srst_qr_reg[1]_1 ;

  wire [3:0]din;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1]_0 ;
  wire \gbi8s_srst.srst_qr_reg[1]_1 ;
  wire [3:0]p_14_out;
  wire p_15_out;
  wire p_58_out;
  wire p_59_out;
  wire p_60_out;
  wire p_61_out;
  wire rd_clk;
  wire [1:1]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;
  wire [0:0]wrst_busy_i;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst),
        .Q(srst_qr[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst_qr[0]),
        .Q(srst_qr[1]),
        .R(1'b0));
  fifo_cmd_builtin_prim \gmult_prim.gbi_chain.gp1[1].gbi_top.top_inst_prim 
       (.CASDOUT(p_14_out),
        .din(din),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_0 ),
        .p_15_out(p_15_out),
        .p_59_out(p_59_out),
        .p_61_out(p_61_out),
        .rd_clk(rd_clk),
        .re(re),
        .rrst_busy_i(rrst_busy_i),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i));
  fifo_cmd_builtin_prim__parameterized0 \gmult_prim.gbi_chain.gp1[2].gbi_last.inst_prim 
       (.CASDOUT(p_14_out),
        .dout(dout),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_1 ),
        .out(srst_qr[1]),
        .p_15_out(p_15_out),
        .p_58_out(p_58_out),
        .p_60_out(p_60_out),
        .rd_clk(rd_clk),
        .re(re));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module fifo_cmd_builtin_extdepth_2
   (p_25_out,
    p_23_out,
    rrst_busy_i,
    wrst_busy_i,
    p_24_out,
    p_22_out,
    dout,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1]_0 ,
    din,
    \gbi8s_srst.srst_qr_reg[1]_1 );
  output p_25_out;
  output p_23_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output p_24_out;
  output p_22_out;
  output [3:0]dout;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1]_0 ;
  input [3:0]din;
  input \gbi8s_srst.srst_qr_reg[1]_1 ;

  wire [3:0]din;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1]_0 ;
  wire \gbi8s_srst.srst_qr_reg[1]_1 ;
  wire [3:0]p_14_out;
  wire p_15_out;
  wire p_22_out;
  wire p_23_out;
  wire p_24_out;
  wire p_25_out;
  wire rd_clk;
  wire [1:1]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;
  wire [0:0]wrst_busy_i;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst),
        .Q(srst_qr[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst_qr[0]),
        .Q(srst_qr[1]),
        .R(1'b0));
  fifo_cmd_builtin_prim_34 \gmult_prim.gbi_chain.gp1[1].gbi_top.top_inst_prim 
       (.CASDOUT(p_14_out),
        .din(din),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_0 ),
        .p_15_out(p_15_out),
        .p_23_out(p_23_out),
        .p_25_out(p_25_out),
        .rd_clk(rd_clk),
        .re(re),
        .rrst_busy_i(rrst_busy_i),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i));
  fifo_cmd_builtin_prim__parameterized0_35 \gmult_prim.gbi_chain.gp1[2].gbi_last.inst_prim 
       (.CASDOUT(p_14_out),
        .dout(dout),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_1 ),
        .out(srst_qr[1]),
        .p_15_out(p_15_out),
        .p_22_out(p_22_out),
        .p_24_out(p_24_out),
        .rd_clk(rd_clk),
        .re(re));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module fifo_cmd_builtin_extdepth_3
   (p_16_out,
    p_14_out,
    rrst_busy_i,
    wrst_busy_i,
    p_15_out,
    p_13_out,
    dout,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1]_0 ,
    din,
    \gbi8s_srst.srst_qr_reg[1]_1 );
  output p_16_out;
  output p_14_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output p_15_out;
  output p_13_out;
  output [3:0]dout;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1]_0 ;
  input [3:0]din;
  input \gbi8s_srst.srst_qr_reg[1]_1 ;

  wire [3:0]din;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1]_0 ;
  wire \gbi8s_srst.srst_qr_reg[1]_1 ;
  wire p_13_out;
  wire p_14_out;
  wire [3:0]p_14_out_0;
  wire p_15_out;
  wire p_15_out_1;
  wire p_16_out;
  wire rd_clk;
  wire [1:1]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;
  wire [0:0]wrst_busy_i;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst),
        .Q(srst_qr[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst_qr[0]),
        .Q(srst_qr[1]),
        .R(1'b0));
  fifo_cmd_builtin_prim_32 \gmult_prim.gbi_chain.gp1[1].gbi_top.top_inst_prim 
       (.CASDOUT(p_14_out_0),
        .din(din),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_0 ),
        .p_14_out(p_14_out),
        .p_15_out_1(p_15_out_1),
        .p_16_out(p_16_out),
        .rd_clk(rd_clk),
        .re(re),
        .rrst_busy_i(rrst_busy_i),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i));
  fifo_cmd_builtin_prim__parameterized0_33 \gmult_prim.gbi_chain.gp1[2].gbi_last.inst_prim 
       (.CASDOUT(p_14_out_0),
        .dout(dout),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_1 ),
        .out(srst_qr[1]),
        .p_13_out(p_13_out),
        .p_15_out(p_15_out),
        .p_15_out_1(p_15_out_1),
        .rd_clk(rd_clk),
        .re(re));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module fifo_cmd_builtin_extdepth_4
   (p_7_out,
    p_5_out,
    rrst_busy_i,
    wrst_busy_i,
    prog_empty,
    p_6_out,
    p_4_out,
    dout,
    wr_rst_busy,
    rd_clk,
    srst,
    wr_clk,
    din,
    wr_en,
    \gbi8s_srst.srst_qr_reg[1]_0 ,
    \gbi8s_srst.srst_qr_reg[1]_1 ,
    \gbi8s_srst.srst_qr_reg[1]_2 ,
    rd_en,
    \gbi8s_srst.srst_qr_reg[1]_3 ,
    \gbi8s_srst.srst_qr_reg[1]_4 ,
    \gbi8s_srst.srst_qr_reg[1]_5 ,
    p_25_out,
    p_16_out,
    p_24_out,
    p_15_out);
  output p_7_out;
  output p_5_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output prog_empty;
  output p_6_out;
  output p_4_out;
  output [3:0]dout;
  output wr_rst_busy;
  input rd_clk;
  input srst;
  input wr_clk;
  input [3:0]din;
  input wr_en;
  input \gbi8s_srst.srst_qr_reg[1]_0 ;
  input \gbi8s_srst.srst_qr_reg[1]_1 ;
  input \gbi8s_srst.srst_qr_reg[1]_2 ;
  input rd_en;
  input \gbi8s_srst.srst_qr_reg[1]_3 ;
  input \gbi8s_srst.srst_qr_reg[1]_4 ;
  input \gbi8s_srst.srst_qr_reg[1]_5 ;
  input p_25_out;
  input p_16_out;
  input p_24_out;
  input p_15_out;

  wire [3:0]din;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1]_0 ;
  wire \gbi8s_srst.srst_qr_reg[1]_1 ;
  wire \gbi8s_srst.srst_qr_reg[1]_2 ;
  wire \gbi8s_srst.srst_qr_reg[1]_3 ;
  wire \gbi8s_srst.srst_qr_reg[1]_4 ;
  wire \gbi8s_srst.srst_qr_reg[1]_5 ;
  wire [3:0]p_14_out;
  wire p_15_out;
  wire p_15_out_0;
  wire p_16_out;
  wire p_24_out;
  wire p_25_out;
  wire p_4_out;
  wire p_5_out;
  wire p_6_out;
  wire p_7_out;
  wire prog_empty;
  wire rd_clk;
  wire rd_en;
  wire [1:1]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire [0:0]wrst_busy_i;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst),
        .Q(srst_qr[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst_qr[0]),
        .Q(srst_qr[1]),
        .R(1'b0));
  fifo_cmd_builtin_prim_30 \gmult_prim.gbi_chain.gp1[1].gbi_top.top_inst_prim 
       (.CASDOUT(p_14_out),
        .din(din),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_0 ),
        .\gbi8s_srst.srst_qr_reg[1]_0 (\gbi8s_srst.srst_qr_reg[1]_1 ),
        .\gbi8s_srst.srst_qr_reg[1]_1 (\gbi8s_srst.srst_qr_reg[1]_2 ),
        .p_15_out_0(p_15_out_0),
        .p_16_out(p_16_out),
        .p_25_out(p_25_out),
        .p_5_out(p_5_out),
        .p_7_out(p_7_out),
        .prog_empty(prog_empty),
        .rd_clk(rd_clk),
        .re(re),
        .rrst_busy_i(rrst_busy_i),
        .srst(srst),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .wrst_busy_i(wrst_busy_i));
  fifo_cmd_builtin_prim__parameterized0_31 \gmult_prim.gbi_chain.gp1[2].gbi_last.inst_prim 
       (.CASDOUT(p_14_out),
        .dout(dout),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_3 ),
        .\gbi8s_srst.srst_qr_reg[1]_0 (\gbi8s_srst.srst_qr_reg[1]_4 ),
        .\gbi8s_srst.srst_qr_reg[1]_1 (\gbi8s_srst.srst_qr_reg[1]_5 ),
        .out(srst_qr[1]),
        .p_15_out(p_15_out),
        .p_15_out_0(p_15_out_0),
        .p_24_out(p_24_out),
        .p_4_out(p_4_out),
        .p_6_out(p_6_out),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .re(re),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module fifo_cmd_builtin_extdepth_5
   (p_133_out,
    p_131_out,
    rrst_busy_i,
    wrst_busy_i,
    p_132_out,
    prog_empty,
    dout,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1]_0 ,
    din,
    \gbi8s_srst.srst_qr_reg[1]_1 );
  output p_133_out;
  output p_131_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output p_132_out;
  output prog_empty;
  output [3:0]dout;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1]_0 ;
  input [3:0]din;
  input \gbi8s_srst.srst_qr_reg[1]_1 ;

  wire [3:0]din;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1]_0 ;
  wire \gbi8s_srst.srst_qr_reg[1]_1 ;
  wire p_131_out;
  wire p_132_out;
  wire p_133_out;
  wire [3:0]p_14_out;
  wire p_15_out;
  wire prog_empty;
  wire rd_clk;
  wire [1:1]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;
  wire [0:0]wrst_busy_i;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst),
        .Q(srst_qr[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst_qr[0]),
        .Q(srst_qr[1]),
        .R(1'b0));
  fifo_cmd_builtin_prim_28 \gmult_prim.gbi_chain.gp1[1].gbi_top.top_inst_prim 
       (.CASDOUT(p_14_out),
        .din(din),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_0 ),
        .p_131_out(p_131_out),
        .p_133_out(p_133_out),
        .p_15_out(p_15_out),
        .rd_clk(rd_clk),
        .re(re),
        .rrst_busy_i(rrst_busy_i),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i));
  fifo_cmd_builtin_prim__parameterized0_29 \gmult_prim.gbi_chain.gp1[2].gbi_last.inst_prim 
       (.CASDOUT(p_14_out),
        .dout(dout),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_1 ),
        .out(srst_qr[1]),
        .p_132_out(p_132_out),
        .p_15_out(p_15_out),
        .prog_empty(prog_empty),
        .rd_clk(rd_clk),
        .re(re));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module fifo_cmd_builtin_extdepth_6
   (p_122_out,
    rrst_busy_i,
    wrst_busy_i,
    prog_empty,
    dout,
    full,
    prog_empty_0,
    empty,
    wr_rst_busy,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1]_0 ,
    din,
    \gbi8s_srst.srst_qr_reg[1]_1 ,
    \gbi8s_srst.srst_qr_reg[1]_2 ,
    \gbi8s_srst.srst_qr_reg[1]_3 ,
    p_7_out,
    p_25_out,
    p_16_out,
    p_133_out,
    p_106_out,
    p_115_out,
    \gbi8s_srst.srst_qr_reg[1]_4 ,
    \gbi8s_srst.srst_qr_reg[1]_5 ,
    p_6_out,
    p_24_out,
    p_15_out,
    p_132_out,
    p_105_out,
    p_114_out);
  output p_122_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output prog_empty;
  output [3:0]dout;
  output full;
  output prog_empty_0;
  output empty;
  output wr_rst_busy;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1]_0 ;
  input [3:0]din;
  input \gbi8s_srst.srst_qr_reg[1]_1 ;
  input \gbi8s_srst.srst_qr_reg[1]_2 ;
  input \gbi8s_srst.srst_qr_reg[1]_3 ;
  input p_7_out;
  input p_25_out;
  input p_16_out;
  input p_133_out;
  input p_106_out;
  input p_115_out;
  input \gbi8s_srst.srst_qr_reg[1]_4 ;
  input \gbi8s_srst.srst_qr_reg[1]_5 ;
  input p_6_out;
  input p_24_out;
  input p_15_out;
  input p_132_out;
  input p_105_out;
  input p_114_out;

  wire [3:0]din;
  wire [3:0]dout;
  wire empty;
  wire full;
  wire \gbi8s_srst.srst_qr_reg[1]_0 ;
  wire \gbi8s_srst.srst_qr_reg[1]_1 ;
  wire \gbi8s_srst.srst_qr_reg[1]_2 ;
  wire \gbi8s_srst.srst_qr_reg[1]_3 ;
  wire \gbi8s_srst.srst_qr_reg[1]_4 ;
  wire \gbi8s_srst.srst_qr_reg[1]_5 ;
  wire p_105_out;
  wire p_106_out;
  wire p_114_out;
  wire p_115_out;
  wire p_122_out;
  wire p_132_out;
  wire p_133_out;
  wire [3:0]p_14_out;
  wire p_15_out;
  wire p_15_out_0;
  wire p_16_out;
  wire p_24_out;
  wire p_25_out;
  wire p_6_out;
  wire p_7_out;
  wire prog_empty;
  wire prog_empty_0;
  wire rd_clk;
  wire [1:1]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;
  wire wr_rst_busy;
  wire [0:0]wrst_busy_i;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst),
        .Q(srst_qr[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst_qr[0]),
        .Q(srst_qr[1]),
        .R(1'b0));
  fifo_cmd_builtin_prim_26 \gmult_prim.gbi_chain.gp1[1].gbi_top.top_inst_prim 
       (.CASDOUT(p_14_out),
        .din(din),
        .full(full),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_0 ),
        .\gbi8s_srst.srst_qr_reg[1]_0 (\gbi8s_srst.srst_qr_reg[1]_2 ),
        .\gbi8s_srst.srst_qr_reg[1]_1 (\gbi8s_srst.srst_qr_reg[1]_3 ),
        .p_106_out(p_106_out),
        .p_115_out(p_115_out),
        .p_122_out(p_122_out),
        .p_133_out(p_133_out),
        .p_15_out_0(p_15_out_0),
        .p_16_out(p_16_out),
        .p_25_out(p_25_out),
        .p_7_out(p_7_out),
        .prog_empty(prog_empty_0),
        .rd_clk(rd_clk),
        .re(re),
        .rrst_busy_i(rrst_busy_i),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i));
  fifo_cmd_builtin_prim__parameterized0_27 \gmult_prim.gbi_chain.gp1[2].gbi_last.inst_prim 
       (.CASDOUT(p_14_out),
        .dout(dout),
        .empty(empty),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_1 ),
        .\gbi8s_srst.srst_qr_reg[1]_0 (\gbi8s_srst.srst_qr_reg[1]_4 ),
        .\gbi8s_srst.srst_qr_reg[1]_1 (\gbi8s_srst.srst_qr_reg[1]_5 ),
        .out(srst_qr[1]),
        .p_105_out(p_105_out),
        .p_114_out(p_114_out),
        .p_132_out(p_132_out),
        .p_15_out(p_15_out),
        .p_15_out_0(p_15_out_0),
        .p_24_out(p_24_out),
        .p_6_out(p_6_out),
        .prog_empty(prog_empty),
        .rd_clk(rd_clk),
        .re(re),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module fifo_cmd_builtin_extdepth_7
   (p_115_out,
    p_113_out,
    rrst_busy_i,
    wrst_busy_i,
    p_114_out,
    prog_empty,
    dout,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1]_0 ,
    din,
    \gbi8s_srst.srst_qr_reg[1]_1 );
  output p_115_out;
  output p_113_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output p_114_out;
  output prog_empty;
  output [3:0]dout;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1]_0 ;
  input [3:0]din;
  input \gbi8s_srst.srst_qr_reg[1]_1 ;

  wire [3:0]din;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1]_0 ;
  wire \gbi8s_srst.srst_qr_reg[1]_1 ;
  wire p_113_out;
  wire p_114_out;
  wire p_115_out;
  wire [3:0]p_14_out;
  wire p_15_out;
  wire prog_empty;
  wire rd_clk;
  wire [1:1]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;
  wire [0:0]wrst_busy_i;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst),
        .Q(srst_qr[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst_qr[0]),
        .Q(srst_qr[1]),
        .R(1'b0));
  fifo_cmd_builtin_prim_24 \gmult_prim.gbi_chain.gp1[1].gbi_top.top_inst_prim 
       (.CASDOUT(p_14_out),
        .din(din),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_0 ),
        .p_113_out(p_113_out),
        .p_115_out(p_115_out),
        .p_15_out(p_15_out),
        .rd_clk(rd_clk),
        .re(re),
        .rrst_busy_i(rrst_busy_i),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i));
  fifo_cmd_builtin_prim__parameterized0_25 \gmult_prim.gbi_chain.gp1[2].gbi_last.inst_prim 
       (.CASDOUT(p_14_out),
        .dout(dout),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_1 ),
        .out(srst_qr[1]),
        .p_114_out(p_114_out),
        .p_15_out(p_15_out),
        .prog_empty(prog_empty),
        .rd_clk(rd_clk),
        .re(re));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module fifo_cmd_builtin_extdepth_8
   (p_106_out,
    p_104_out,
    rrst_busy_i,
    wrst_busy_i,
    p_105_out,
    prog_empty,
    dout,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1]_0 ,
    din,
    \gbi8s_srst.srst_qr_reg[1]_1 );
  output p_106_out;
  output p_104_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output p_105_out;
  output prog_empty;
  output [3:0]dout;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1]_0 ;
  input [3:0]din;
  input \gbi8s_srst.srst_qr_reg[1]_1 ;

  wire [3:0]din;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1]_0 ;
  wire \gbi8s_srst.srst_qr_reg[1]_1 ;
  wire p_104_out;
  wire p_105_out;
  wire p_106_out;
  wire [3:0]p_14_out;
  wire p_15_out;
  wire prog_empty;
  wire rd_clk;
  wire [1:1]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;
  wire [0:0]wrst_busy_i;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst),
        .Q(srst_qr[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst_qr[0]),
        .Q(srst_qr[1]),
        .R(1'b0));
  fifo_cmd_builtin_prim_22 \gmult_prim.gbi_chain.gp1[1].gbi_top.top_inst_prim 
       (.CASDOUT(p_14_out),
        .din(din),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_0 ),
        .p_104_out(p_104_out),
        .p_106_out(p_106_out),
        .p_15_out(p_15_out),
        .rd_clk(rd_clk),
        .re(re),
        .rrst_busy_i(rrst_busy_i),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i));
  fifo_cmd_builtin_prim__parameterized0_23 \gmult_prim.gbi_chain.gp1[2].gbi_last.inst_prim 
       (.CASDOUT(p_14_out),
        .dout(dout),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_1 ),
        .out(srst_qr[1]),
        .p_105_out(p_105_out),
        .p_15_out(p_15_out),
        .prog_empty(prog_empty),
        .rd_clk(rd_clk),
        .re(re));
endmodule

(* ORIG_REF_NAME = "builtin_extdepth" *) 
module fifo_cmd_builtin_extdepth_9
   (p_97_out,
    p_95_out,
    rrst_busy_i,
    wrst_busy_i,
    p_96_out,
    prog_empty,
    dout,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1]_0 ,
    din,
    \gbi8s_srst.srst_qr_reg[1]_1 );
  output p_97_out;
  output p_95_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output p_96_out;
  output prog_empty;
  output [3:0]dout;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1]_0 ;
  input [3:0]din;
  input \gbi8s_srst.srst_qr_reg[1]_1 ;

  wire [3:0]din;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1]_0 ;
  wire \gbi8s_srst.srst_qr_reg[1]_1 ;
  wire [3:0]p_14_out;
  wire p_15_out;
  wire p_95_out;
  wire p_96_out;
  wire p_97_out;
  wire prog_empty;
  wire rd_clk;
  wire [1:1]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire wr_clk;
  wire [0:0]wrst_busy_i;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst),
        .Q(srst_qr[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b1)) 
    \gbi8s_srst.srst_qr_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(srst_qr[0]),
        .Q(srst_qr[1]),
        .R(1'b0));
  fifo_cmd_builtin_prim_20 \gmult_prim.gbi_chain.gp1[1].gbi_top.top_inst_prim 
       (.CASDOUT(p_14_out),
        .din(din),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_0 ),
        .p_15_out(p_15_out),
        .p_95_out(p_95_out),
        .p_97_out(p_97_out),
        .rd_clk(rd_clk),
        .re(re),
        .rrst_busy_i(rrst_busy_i),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i));
  fifo_cmd_builtin_prim__parameterized0_21 \gmult_prim.gbi_chain.gp1[2].gbi_last.inst_prim 
       (.CASDOUT(p_14_out),
        .dout(dout),
        .\gbi8s_srst.srst_qr_reg[1] (\gbi8s_srst.srst_qr_reg[1]_1 ),
        .out(srst_qr[1]),
        .p_15_out(p_15_out),
        .p_96_out(p_96_out),
        .prog_empty(prog_empty),
        .rd_clk(rd_clk),
        .re(re));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim
   (p_15_out,
    p_61_out,
    p_59_out,
    rrst_busy_i,
    wrst_busy_i,
    CASDOUT,
    re,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    din);
  output p_15_out;
  output p_61_out;
  output p_59_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output [3:0]CASDOUT;
  input [0:0]re;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [3:0]din;

  wire [3:0]CASDOUT;
  wire [3:0]din;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_164 ;
  wire \gf36e2_inst.sngfifo36e2_n_165 ;
  wire \gf36e2_inst.sngfifo36e2_n_166 ;
  wire \gf36e2_inst.sngfifo36e2_n_167 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_2 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_3 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_9 ;
  wire p_15_out;
  wire p_59_out;
  wire p_61_out;
  wire rd_clk;
  wire [0:0]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  wire wr_clk;
  wire [0:0]wrst_busy_i;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("FIRST"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(10),
    .PROG_FULL_THRESH(8184),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],CASDOUT}),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(p_15_out),
        .CASNXTRDEN(re),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(\gf36e2_inst.sngfifo36e2_n_2 ),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_164 ,\gf36e2_inst.sngfifo36e2_n_165 ,\gf36e2_inst.sngfifo36e2_n_166 ,\gf36e2_inst.sngfifo36e2_n_167 }),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(\gf36e2_inst.sngfifo36e2_n_3 ),
        .FULL(p_61_out),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_59_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(1'b0),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(rrst_busy_i),
        .REGCE(1'b0),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(\gf36e2_inst.sngfifo36e2_n_9 ),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(\gbi8s_srst.srst_qr_reg[1] ),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(wrst_busy_i));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim_14
   (p_15_out,
    p_68_out,
    rrst_busy_i,
    wrst_busy_i,
    CASDOUT,
    prog_empty,
    re,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    din,
    p_79_out,
    p_88_out,
    p_97_out);
  output p_15_out;
  output p_68_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output [3:0]CASDOUT;
  output prog_empty;
  input [0:0]re;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [3:0]din;
  input p_79_out;
  input p_88_out;
  input p_97_out;

  wire [3:0]CASDOUT;
  wire [3:0]din;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_164 ;
  wire \gf36e2_inst.sngfifo36e2_n_165 ;
  wire \gf36e2_inst.sngfifo36e2_n_166 ;
  wire \gf36e2_inst.sngfifo36e2_n_167 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_2 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_3 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_9 ;
  wire p_15_out;
  wire p_68_out;
  wire p_70_out;
  wire p_79_out;
  wire p_88_out;
  wire p_97_out;
  wire prog_empty;
  wire rd_clk;
  wire [0:0]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  wire wr_clk;
  wire [0:0]wrst_busy_i;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  LUT4 #(
    .INIT(16'h0001)) 
    full_INST_0_i_2
       (.I0(p_70_out),
        .I1(p_79_out),
        .I2(p_88_out),
        .I3(p_97_out),
        .O(prog_empty));
  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("FIRST"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(10),
    .PROG_FULL_THRESH(8184),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],CASDOUT}),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(p_15_out),
        .CASNXTRDEN(re),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(\gf36e2_inst.sngfifo36e2_n_2 ),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_164 ,\gf36e2_inst.sngfifo36e2_n_165 ,\gf36e2_inst.sngfifo36e2_n_166 ,\gf36e2_inst.sngfifo36e2_n_167 }),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(\gf36e2_inst.sngfifo36e2_n_3 ),
        .FULL(p_70_out),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_68_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(1'b0),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(rrst_busy_i),
        .REGCE(1'b0),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(\gf36e2_inst.sngfifo36e2_n_9 ),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(\gbi8s_srst.srst_qr_reg[1] ),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(wrst_busy_i));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim_16
   (p_15_out,
    p_79_out,
    p_77_out,
    rrst_busy_i,
    wrst_busy_i,
    CASDOUT,
    re,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    din);
  output p_15_out;
  output p_79_out;
  output p_77_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output [3:0]CASDOUT;
  input [0:0]re;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [3:0]din;

  wire [3:0]CASDOUT;
  wire [3:0]din;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_164 ;
  wire \gf36e2_inst.sngfifo36e2_n_165 ;
  wire \gf36e2_inst.sngfifo36e2_n_166 ;
  wire \gf36e2_inst.sngfifo36e2_n_167 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_2 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_3 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_9 ;
  wire p_15_out;
  wire p_77_out;
  wire p_79_out;
  wire rd_clk;
  wire [0:0]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  wire wr_clk;
  wire [0:0]wrst_busy_i;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("FIRST"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(10),
    .PROG_FULL_THRESH(8184),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],CASDOUT}),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(p_15_out),
        .CASNXTRDEN(re),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(\gf36e2_inst.sngfifo36e2_n_2 ),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_164 ,\gf36e2_inst.sngfifo36e2_n_165 ,\gf36e2_inst.sngfifo36e2_n_166 ,\gf36e2_inst.sngfifo36e2_n_167 }),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(\gf36e2_inst.sngfifo36e2_n_3 ),
        .FULL(p_79_out),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_77_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(1'b0),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(rrst_busy_i),
        .REGCE(1'b0),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(\gf36e2_inst.sngfifo36e2_n_9 ),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(\gbi8s_srst.srst_qr_reg[1] ),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(wrst_busy_i));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim_18
   (p_15_out,
    p_88_out,
    p_86_out,
    rrst_busy_i,
    wrst_busy_i,
    CASDOUT,
    re,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    din);
  output p_15_out;
  output p_88_out;
  output p_86_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output [3:0]CASDOUT;
  input [0:0]re;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [3:0]din;

  wire [3:0]CASDOUT;
  wire [3:0]din;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_164 ;
  wire \gf36e2_inst.sngfifo36e2_n_165 ;
  wire \gf36e2_inst.sngfifo36e2_n_166 ;
  wire \gf36e2_inst.sngfifo36e2_n_167 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_2 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_3 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_9 ;
  wire p_15_out;
  wire p_86_out;
  wire p_88_out;
  wire rd_clk;
  wire [0:0]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  wire wr_clk;
  wire [0:0]wrst_busy_i;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("FIRST"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(10),
    .PROG_FULL_THRESH(8184),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],CASDOUT}),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(p_15_out),
        .CASNXTRDEN(re),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(\gf36e2_inst.sngfifo36e2_n_2 ),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_164 ,\gf36e2_inst.sngfifo36e2_n_165 ,\gf36e2_inst.sngfifo36e2_n_166 ,\gf36e2_inst.sngfifo36e2_n_167 }),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(\gf36e2_inst.sngfifo36e2_n_3 ),
        .FULL(p_88_out),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_86_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(1'b0),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(rrst_busy_i),
        .REGCE(1'b0),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(\gf36e2_inst.sngfifo36e2_n_9 ),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(\gbi8s_srst.srst_qr_reg[1] ),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(wrst_busy_i));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim_20
   (p_15_out,
    p_97_out,
    p_95_out,
    rrst_busy_i,
    wrst_busy_i,
    CASDOUT,
    re,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    din);
  output p_15_out;
  output p_97_out;
  output p_95_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output [3:0]CASDOUT;
  input [0:0]re;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [3:0]din;

  wire [3:0]CASDOUT;
  wire [3:0]din;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_164 ;
  wire \gf36e2_inst.sngfifo36e2_n_165 ;
  wire \gf36e2_inst.sngfifo36e2_n_166 ;
  wire \gf36e2_inst.sngfifo36e2_n_167 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_2 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_3 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_9 ;
  wire p_15_out;
  wire p_95_out;
  wire p_97_out;
  wire rd_clk;
  wire [0:0]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  wire wr_clk;
  wire [0:0]wrst_busy_i;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("FIRST"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(10),
    .PROG_FULL_THRESH(8184),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],CASDOUT}),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(p_15_out),
        .CASNXTRDEN(re),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(\gf36e2_inst.sngfifo36e2_n_2 ),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_164 ,\gf36e2_inst.sngfifo36e2_n_165 ,\gf36e2_inst.sngfifo36e2_n_166 ,\gf36e2_inst.sngfifo36e2_n_167 }),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(\gf36e2_inst.sngfifo36e2_n_3 ),
        .FULL(p_97_out),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_95_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(1'b0),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(rrst_busy_i),
        .REGCE(1'b0),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(\gf36e2_inst.sngfifo36e2_n_9 ),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(\gbi8s_srst.srst_qr_reg[1] ),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(wrst_busy_i));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim_22
   (p_15_out,
    p_106_out,
    p_104_out,
    rrst_busy_i,
    wrst_busy_i,
    CASDOUT,
    re,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    din);
  output p_15_out;
  output p_106_out;
  output p_104_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output [3:0]CASDOUT;
  input [0:0]re;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [3:0]din;

  wire [3:0]CASDOUT;
  wire [3:0]din;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_164 ;
  wire \gf36e2_inst.sngfifo36e2_n_165 ;
  wire \gf36e2_inst.sngfifo36e2_n_166 ;
  wire \gf36e2_inst.sngfifo36e2_n_167 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_2 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_3 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_9 ;
  wire p_104_out;
  wire p_106_out;
  wire p_15_out;
  wire rd_clk;
  wire [0:0]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  wire wr_clk;
  wire [0:0]wrst_busy_i;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("FIRST"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(10),
    .PROG_FULL_THRESH(8184),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],CASDOUT}),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(p_15_out),
        .CASNXTRDEN(re),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(\gf36e2_inst.sngfifo36e2_n_2 ),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_164 ,\gf36e2_inst.sngfifo36e2_n_165 ,\gf36e2_inst.sngfifo36e2_n_166 ,\gf36e2_inst.sngfifo36e2_n_167 }),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(\gf36e2_inst.sngfifo36e2_n_3 ),
        .FULL(p_106_out),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_104_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(1'b0),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(rrst_busy_i),
        .REGCE(1'b0),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(\gf36e2_inst.sngfifo36e2_n_9 ),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(\gbi8s_srst.srst_qr_reg[1] ),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(wrst_busy_i));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim_24
   (p_15_out,
    p_115_out,
    p_113_out,
    rrst_busy_i,
    wrst_busy_i,
    CASDOUT,
    re,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    din);
  output p_15_out;
  output p_115_out;
  output p_113_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output [3:0]CASDOUT;
  input [0:0]re;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [3:0]din;

  wire [3:0]CASDOUT;
  wire [3:0]din;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_164 ;
  wire \gf36e2_inst.sngfifo36e2_n_165 ;
  wire \gf36e2_inst.sngfifo36e2_n_166 ;
  wire \gf36e2_inst.sngfifo36e2_n_167 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_2 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_3 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_9 ;
  wire p_113_out;
  wire p_115_out;
  wire p_15_out;
  wire rd_clk;
  wire [0:0]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  wire wr_clk;
  wire [0:0]wrst_busy_i;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("FIRST"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(10),
    .PROG_FULL_THRESH(8184),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],CASDOUT}),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(p_15_out),
        .CASNXTRDEN(re),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(\gf36e2_inst.sngfifo36e2_n_2 ),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_164 ,\gf36e2_inst.sngfifo36e2_n_165 ,\gf36e2_inst.sngfifo36e2_n_166 ,\gf36e2_inst.sngfifo36e2_n_167 }),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(\gf36e2_inst.sngfifo36e2_n_3 ),
        .FULL(p_115_out),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_113_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(1'b0),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(rrst_busy_i),
        .REGCE(1'b0),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(\gf36e2_inst.sngfifo36e2_n_9 ),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(\gbi8s_srst.srst_qr_reg[1] ),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(wrst_busy_i));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim_26
   (p_15_out_0,
    p_122_out,
    rrst_busy_i,
    wrst_busy_i,
    CASDOUT,
    full,
    prog_empty,
    re,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    din,
    \gbi8s_srst.srst_qr_reg[1]_0 ,
    \gbi8s_srst.srst_qr_reg[1]_1 ,
    p_7_out,
    p_25_out,
    p_16_out,
    p_133_out,
    p_106_out,
    p_115_out);
  output p_15_out_0;
  output p_122_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output [3:0]CASDOUT;
  output full;
  output prog_empty;
  input [0:0]re;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [3:0]din;
  input \gbi8s_srst.srst_qr_reg[1]_0 ;
  input \gbi8s_srst.srst_qr_reg[1]_1 ;
  input p_7_out;
  input p_25_out;
  input p_16_out;
  input p_133_out;
  input p_106_out;
  input p_115_out;

  wire [3:0]CASDOUT;
  wire [3:0]din;
  wire full;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gbi8s_srst.srst_qr_reg[1]_0 ;
  wire \gbi8s_srst.srst_qr_reg[1]_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_164 ;
  wire \gf36e2_inst.sngfifo36e2_n_165 ;
  wire \gf36e2_inst.sngfifo36e2_n_166 ;
  wire \gf36e2_inst.sngfifo36e2_n_167 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_2 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_3 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_9 ;
  wire p_106_out;
  wire p_115_out;
  wire p_122_out;
  wire p_124_out;
  wire p_133_out;
  wire p_15_out_0;
  wire p_16_out;
  wire p_25_out;
  wire p_7_out;
  wire prog_empty;
  wire rd_clk;
  wire [0:0]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  wire wr_clk;
  wire [0:0]wrst_busy_i;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    full_INST_0
       (.I0(prog_empty),
        .I1(\gbi8s_srst.srst_qr_reg[1]_0 ),
        .I2(\gbi8s_srst.srst_qr_reg[1]_1 ),
        .I3(p_7_out),
        .I4(p_25_out),
        .I5(p_16_out),
        .O(full));
  LUT4 #(
    .INIT(16'hFFFE)) 
    full_INST_0_i_1
       (.I0(p_124_out),
        .I1(p_133_out),
        .I2(p_106_out),
        .I3(p_115_out),
        .O(prog_empty));
  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("FIRST"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(10),
    .PROG_FULL_THRESH(8184),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],CASDOUT}),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(p_15_out_0),
        .CASNXTRDEN(re),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(\gf36e2_inst.sngfifo36e2_n_2 ),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_164 ,\gf36e2_inst.sngfifo36e2_n_165 ,\gf36e2_inst.sngfifo36e2_n_166 ,\gf36e2_inst.sngfifo36e2_n_167 }),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(\gf36e2_inst.sngfifo36e2_n_3 ),
        .FULL(p_124_out),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_122_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(1'b0),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(rrst_busy_i),
        .REGCE(1'b0),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(\gf36e2_inst.sngfifo36e2_n_9 ),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(\gbi8s_srst.srst_qr_reg[1] ),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(wrst_busy_i));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim_28
   (p_15_out,
    p_133_out,
    p_131_out,
    rrst_busy_i,
    wrst_busy_i,
    CASDOUT,
    re,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    din);
  output p_15_out;
  output p_133_out;
  output p_131_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output [3:0]CASDOUT;
  input [0:0]re;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [3:0]din;

  wire [3:0]CASDOUT;
  wire [3:0]din;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_164 ;
  wire \gf36e2_inst.sngfifo36e2_n_165 ;
  wire \gf36e2_inst.sngfifo36e2_n_166 ;
  wire \gf36e2_inst.sngfifo36e2_n_167 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_2 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_3 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_9 ;
  wire p_131_out;
  wire p_133_out;
  wire p_15_out;
  wire rd_clk;
  wire [0:0]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  wire wr_clk;
  wire [0:0]wrst_busy_i;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("FIRST"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(10),
    .PROG_FULL_THRESH(8184),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],CASDOUT}),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(p_15_out),
        .CASNXTRDEN(re),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(\gf36e2_inst.sngfifo36e2_n_2 ),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_164 ,\gf36e2_inst.sngfifo36e2_n_165 ,\gf36e2_inst.sngfifo36e2_n_166 ,\gf36e2_inst.sngfifo36e2_n_167 }),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(\gf36e2_inst.sngfifo36e2_n_3 ),
        .FULL(p_133_out),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_131_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(1'b0),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(rrst_busy_i),
        .REGCE(1'b0),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(\gf36e2_inst.sngfifo36e2_n_9 ),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(\gbi8s_srst.srst_qr_reg[1] ),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(wrst_busy_i));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim_30
   (p_15_out_0,
    p_7_out,
    p_5_out,
    rrst_busy_i,
    wrst_busy_i,
    CASDOUT,
    prog_empty,
    re,
    rd_clk,
    srst,
    wr_clk,
    din,
    wr_en,
    \gbi8s_srst.srst_qr_reg[1] ,
    \gbi8s_srst.srst_qr_reg[1]_0 ,
    \gbi8s_srst.srst_qr_reg[1]_1 ,
    p_25_out,
    p_16_out);
  output p_15_out_0;
  output p_7_out;
  output p_5_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output [3:0]CASDOUT;
  output prog_empty;
  input [0:0]re;
  input rd_clk;
  input srst;
  input wr_clk;
  input [3:0]din;
  input wr_en;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input \gbi8s_srst.srst_qr_reg[1]_0 ;
  input \gbi8s_srst.srst_qr_reg[1]_1 ;
  input p_25_out;
  input p_16_out;

  wire [3:0]CASDOUT;
  wire [3:0]din;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gbi8s_srst.srst_qr_reg[1]_0 ;
  wire \gbi8s_srst.srst_qr_reg[1]_1 ;
  wire \gf36e2_inst.sngfifo36e2_i_2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_164 ;
  wire \gf36e2_inst.sngfifo36e2_n_165 ;
  wire \gf36e2_inst.sngfifo36e2_n_166 ;
  wire \gf36e2_inst.sngfifo36e2_n_167 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_2 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_3 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_9 ;
  wire p_15_out_0;
  wire p_16_out;
  wire p_25_out;
  wire p_5_out;
  wire p_7_out;
  wire prog_empty;
  wire rd_clk;
  wire [0:0]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  wire wr_clk;
  wire wr_en;
  wire [0:0]wrst_busy_i;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("FIRST"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(10),
    .PROG_FULL_THRESH(8184),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],CASDOUT}),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(p_15_out_0),
        .CASNXTRDEN(re),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(\gf36e2_inst.sngfifo36e2_n_2 ),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_164 ,\gf36e2_inst.sngfifo36e2_n_165 ,\gf36e2_inst.sngfifo36e2_n_166 ,\gf36e2_inst.sngfifo36e2_n_167 }),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(\gf36e2_inst.sngfifo36e2_n_3 ),
        .FULL(p_7_out),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_5_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(1'b0),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(rrst_busy_i),
        .REGCE(1'b0),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(\gf36e2_inst.sngfifo36e2_n_9 ),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(prog_empty),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(wrst_busy_i));
  LUT5 #(
    .INIT(32'h00000800)) 
    \gf36e2_inst.sngfifo36e2_i_1 
       (.I0(wr_en),
        .I1(\gf36e2_inst.sngfifo36e2_i_2_n_0 ),
        .I2(\gbi8s_srst.srst_qr_reg[1] ),
        .I3(\gbi8s_srst.srst_qr_reg[1]_0 ),
        .I4(\gbi8s_srst.srst_qr_reg[1]_1 ),
        .O(prog_empty));
  LUT3 #(
    .INIT(8'h01)) 
    \gf36e2_inst.sngfifo36e2_i_2 
       (.I0(p_7_out),
        .I1(p_25_out),
        .I2(p_16_out),
        .O(\gf36e2_inst.sngfifo36e2_i_2_n_0 ));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim_32
   (p_15_out_1,
    p_16_out,
    p_14_out,
    rrst_busy_i,
    wrst_busy_i,
    CASDOUT,
    re,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    din);
  output p_15_out_1;
  output p_16_out;
  output p_14_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output [3:0]CASDOUT;
  input [0:0]re;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [3:0]din;

  wire [3:0]CASDOUT;
  wire [3:0]din;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_164 ;
  wire \gf36e2_inst.sngfifo36e2_n_165 ;
  wire \gf36e2_inst.sngfifo36e2_n_166 ;
  wire \gf36e2_inst.sngfifo36e2_n_167 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_2 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_3 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_9 ;
  wire p_14_out;
  wire p_15_out_1;
  wire p_16_out;
  wire rd_clk;
  wire [0:0]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  wire wr_clk;
  wire [0:0]wrst_busy_i;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("FIRST"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(10),
    .PROG_FULL_THRESH(8184),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],CASDOUT}),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(p_15_out_1),
        .CASNXTRDEN(re),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(\gf36e2_inst.sngfifo36e2_n_2 ),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_164 ,\gf36e2_inst.sngfifo36e2_n_165 ,\gf36e2_inst.sngfifo36e2_n_166 ,\gf36e2_inst.sngfifo36e2_n_167 }),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(\gf36e2_inst.sngfifo36e2_n_3 ),
        .FULL(p_16_out),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_14_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(1'b0),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(rrst_busy_i),
        .REGCE(1'b0),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(\gf36e2_inst.sngfifo36e2_n_9 ),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(\gbi8s_srst.srst_qr_reg[1] ),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(wrst_busy_i));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim_34
   (p_15_out,
    p_25_out,
    p_23_out,
    rrst_busy_i,
    wrst_busy_i,
    CASDOUT,
    re,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    din);
  output p_15_out;
  output p_25_out;
  output p_23_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output [3:0]CASDOUT;
  input [0:0]re;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [3:0]din;

  wire [3:0]CASDOUT;
  wire [3:0]din;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_164 ;
  wire \gf36e2_inst.sngfifo36e2_n_165 ;
  wire \gf36e2_inst.sngfifo36e2_n_166 ;
  wire \gf36e2_inst.sngfifo36e2_n_167 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_2 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_3 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_9 ;
  wire p_15_out;
  wire p_23_out;
  wire p_25_out;
  wire rd_clk;
  wire [0:0]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  wire wr_clk;
  wire [0:0]wrst_busy_i;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("FIRST"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(10),
    .PROG_FULL_THRESH(8184),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],CASDOUT}),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(p_15_out),
        .CASNXTRDEN(re),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(\gf36e2_inst.sngfifo36e2_n_2 ),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_164 ,\gf36e2_inst.sngfifo36e2_n_165 ,\gf36e2_inst.sngfifo36e2_n_166 ,\gf36e2_inst.sngfifo36e2_n_167 }),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(\gf36e2_inst.sngfifo36e2_n_3 ),
        .FULL(p_25_out),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_23_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(1'b0),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(rrst_busy_i),
        .REGCE(1'b0),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(\gf36e2_inst.sngfifo36e2_n_9 ),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(\gbi8s_srst.srst_qr_reg[1] ),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(wrst_busy_i));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim_36
   (p_15_out,
    p_34_out,
    p_32_out,
    rrst_busy_i,
    wrst_busy_i,
    CASDOUT,
    re,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    din);
  output p_15_out;
  output p_34_out;
  output p_32_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output [3:0]CASDOUT;
  input [0:0]re;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [3:0]din;

  wire [3:0]CASDOUT;
  wire [3:0]din;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_164 ;
  wire \gf36e2_inst.sngfifo36e2_n_165 ;
  wire \gf36e2_inst.sngfifo36e2_n_166 ;
  wire \gf36e2_inst.sngfifo36e2_n_167 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_2 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_3 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_9 ;
  wire p_15_out;
  wire p_32_out;
  wire p_34_out;
  wire rd_clk;
  wire [0:0]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  wire wr_clk;
  wire [0:0]wrst_busy_i;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("FIRST"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(10),
    .PROG_FULL_THRESH(8184),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],CASDOUT}),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(p_15_out),
        .CASNXTRDEN(re),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(\gf36e2_inst.sngfifo36e2_n_2 ),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_164 ,\gf36e2_inst.sngfifo36e2_n_165 ,\gf36e2_inst.sngfifo36e2_n_166 ,\gf36e2_inst.sngfifo36e2_n_167 }),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(\gf36e2_inst.sngfifo36e2_n_3 ),
        .FULL(p_34_out),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_32_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(1'b0),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(rrst_busy_i),
        .REGCE(1'b0),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(\gf36e2_inst.sngfifo36e2_n_9 ),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(\gbi8s_srst.srst_qr_reg[1] ),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(wrst_busy_i));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim_38
   (p_15_out,
    p_43_out,
    p_41_out,
    rrst_busy_i,
    wrst_busy_i,
    CASDOUT,
    re,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    din);
  output p_15_out;
  output p_43_out;
  output p_41_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output [3:0]CASDOUT;
  input [0:0]re;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [3:0]din;

  wire [3:0]CASDOUT;
  wire [3:0]din;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_164 ;
  wire \gf36e2_inst.sngfifo36e2_n_165 ;
  wire \gf36e2_inst.sngfifo36e2_n_166 ;
  wire \gf36e2_inst.sngfifo36e2_n_167 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_2 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_3 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_9 ;
  wire p_15_out;
  wire p_41_out;
  wire p_43_out;
  wire rd_clk;
  wire [0:0]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  wire wr_clk;
  wire [0:0]wrst_busy_i;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("FIRST"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(10),
    .PROG_FULL_THRESH(8184),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],CASDOUT}),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(p_15_out),
        .CASNXTRDEN(re),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(\gf36e2_inst.sngfifo36e2_n_2 ),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_164 ,\gf36e2_inst.sngfifo36e2_n_165 ,\gf36e2_inst.sngfifo36e2_n_166 ,\gf36e2_inst.sngfifo36e2_n_167 }),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(\gf36e2_inst.sngfifo36e2_n_3 ),
        .FULL(p_43_out),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_41_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(1'b0),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(rrst_busy_i),
        .REGCE(1'b0),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(\gf36e2_inst.sngfifo36e2_n_9 ),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(\gbi8s_srst.srst_qr_reg[1] ),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(wrst_busy_i));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim_40
   (p_15_out,
    p_50_out,
    rrst_busy_i,
    wrst_busy_i,
    CASDOUT,
    prog_empty,
    re,
    rd_clk,
    srst,
    wr_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    din,
    p_61_out,
    p_34_out,
    p_43_out);
  output p_15_out;
  output p_50_out;
  output [0:0]rrst_busy_i;
  output [0:0]wrst_busy_i;
  output [3:0]CASDOUT;
  output prog_empty;
  input [0:0]re;
  input rd_clk;
  input srst;
  input wr_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [3:0]din;
  input p_61_out;
  input p_34_out;
  input p_43_out;

  wire [3:0]CASDOUT;
  wire [3:0]din;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_164 ;
  wire \gf36e2_inst.sngfifo36e2_n_165 ;
  wire \gf36e2_inst.sngfifo36e2_n_166 ;
  wire \gf36e2_inst.sngfifo36e2_n_167 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_2 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_3 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_5 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_9 ;
  wire p_15_out;
  wire p_34_out;
  wire p_43_out;
  wire p_50_out;
  wire p_52_out;
  wire p_61_out;
  wire prog_empty;
  wire rd_clk;
  wire [0:0]re;
  wire [0:0]rrst_busy_i;
  wire srst;
  wire wr_clk;
  wire [0:0]wrst_busy_i;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  LUT4 #(
    .INIT(16'hFFFE)) 
    full_INST_0_i_3
       (.I0(p_52_out),
        .I1(p_61_out),
        .I2(p_34_out),
        .I3(p_43_out),
        .O(prog_empty));
  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("FIRST"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(10),
    .PROG_FULL_THRESH(8184),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],CASDOUT}),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(p_15_out),
        .CASNXTRDEN(re),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf36e2_inst.sngfifo36e2_n_1 ),
        .DBITERR(\gf36e2_inst.sngfifo36e2_n_2 ),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_164 ,\gf36e2_inst.sngfifo36e2_n_165 ,\gf36e2_inst.sngfifo36e2_n_166 ,\gf36e2_inst.sngfifo36e2_n_167 }),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(\gf36e2_inst.sngfifo36e2_n_3 ),
        .FULL(p_52_out),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(\gf36e2_inst.sngfifo36e2_n_5 ),
        .PROGFULL(p_50_out),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(1'b0),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(rrst_busy_i),
        .REGCE(1'b0),
        .RST(srst),
        .RSTREG(srst),
        .SBITERR(\gf36e2_inst.sngfifo36e2_n_9 ),
        .SLEEP(1'b0),
        .WRCLK(wr_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(\gbi8s_srst.srst_qr_reg[1] ),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(wrst_busy_i));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim__parameterized0
   (re,
    p_60_out,
    p_58_out,
    dout,
    p_15_out,
    rd_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    out,
    CASDOUT);
  output [0:0]re;
  output p_60_out;
  output p_58_out;
  output [3:0]dout;
  input p_15_out;
  input rd_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [0:0]out;
  input [3:0]CASDOUT;

  wire [3:0]CASDOUT;
  wire [9:9]dbiterr_col;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_11 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_4 ;
  wire \gf36e2_inst.sngfifo36e2_n_6 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_8 ;
  wire [0:0]out;
  wire p_15_out;
  wire p_58_out;
  wire p_60_out;
  wire rd_clk;
  wire [0:0]re;
  wire [9:9]sbiterr_col;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("LAST"),
    .CLOCK_DOMAINS("COMMON"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(6),
    .PROG_FULL_THRESH(10),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CASDOUT}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(p_15_out),
        .CASPRVRDEN(re),
        .DBITERR(dbiterr_col),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],dout}),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(p_60_out),
        .FULL(\gf36e2_inst.sngfifo36e2_n_4 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(p_58_out),
        .PROGFULL(\gf36e2_inst.sngfifo36e2_n_6 ),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(\gbi8s_srst.srst_qr_reg[1] ),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(\gf36e2_inst.sngfifo36e2_n_8 ),
        .REGCE(\gbi8s_srst.srst_qr_reg[1] ),
        .RST(out),
        .RSTREG(out),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(rd_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(1'b0),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(\gf36e2_inst.sngfifo36e2_n_11 ));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim__parameterized0_15
   (re,
    p_67_out,
    dout,
    wr_rst_busy,
    p_15_out,
    rd_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    out,
    CASDOUT,
    p_78_out,
    p_87_out,
    p_96_out);
  output [0:0]re;
  output p_67_out;
  output [3:0]dout;
  output wr_rst_busy;
  input p_15_out;
  input rd_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [0:0]out;
  input [3:0]CASDOUT;
  input p_78_out;
  input p_87_out;
  input p_96_out;

  wire [3:0]CASDOUT;
  wire [8:8]dbiterr_col;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_11 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_4 ;
  wire \gf36e2_inst.sngfifo36e2_n_6 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_8 ;
  wire [0:0]out;
  wire p_15_out;
  wire p_67_out;
  wire p_69_out;
  wire p_78_out;
  wire p_87_out;
  wire p_96_out;
  wire rd_clk;
  wire [0:0]re;
  wire [8:8]sbiterr_col;
  wire wr_rst_busy;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  LUT4 #(
    .INIT(16'h0001)) 
    empty_INST_0_i_2
       (.I0(p_69_out),
        .I1(p_78_out),
        .I2(p_87_out),
        .I3(p_96_out),
        .O(wr_rst_busy));
  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("LAST"),
    .CLOCK_DOMAINS("COMMON"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(6),
    .PROG_FULL_THRESH(10),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CASDOUT}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(p_15_out),
        .CASPRVRDEN(re),
        .DBITERR(dbiterr_col),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],dout}),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(p_69_out),
        .FULL(\gf36e2_inst.sngfifo36e2_n_4 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(p_67_out),
        .PROGFULL(\gf36e2_inst.sngfifo36e2_n_6 ),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(\gbi8s_srst.srst_qr_reg[1] ),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(\gf36e2_inst.sngfifo36e2_n_8 ),
        .REGCE(\gbi8s_srst.srst_qr_reg[1] ),
        .RST(out),
        .RSTREG(out),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(rd_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(1'b0),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(\gf36e2_inst.sngfifo36e2_n_11 ));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim__parameterized0_17
   (re,
    p_78_out,
    prog_empty,
    dout,
    p_15_out,
    rd_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    out,
    CASDOUT);
  output [0:0]re;
  output p_78_out;
  output prog_empty;
  output [3:0]dout;
  input p_15_out;
  input rd_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [0:0]out;
  input [3:0]CASDOUT;

  wire [3:0]CASDOUT;
  wire [7:7]dbiterr_col;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_11 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_4 ;
  wire \gf36e2_inst.sngfifo36e2_n_6 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_8 ;
  wire [0:0]out;
  wire p_15_out;
  wire p_78_out;
  wire prog_empty;
  wire rd_clk;
  wire [0:0]re;
  wire [7:7]sbiterr_col;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("LAST"),
    .CLOCK_DOMAINS("COMMON"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(6),
    .PROG_FULL_THRESH(10),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CASDOUT}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(p_15_out),
        .CASPRVRDEN(re),
        .DBITERR(dbiterr_col),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],dout}),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(p_78_out),
        .FULL(\gf36e2_inst.sngfifo36e2_n_4 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(prog_empty),
        .PROGFULL(\gf36e2_inst.sngfifo36e2_n_6 ),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(\gbi8s_srst.srst_qr_reg[1] ),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(\gf36e2_inst.sngfifo36e2_n_8 ),
        .REGCE(\gbi8s_srst.srst_qr_reg[1] ),
        .RST(out),
        .RSTREG(out),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(rd_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(1'b0),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(\gf36e2_inst.sngfifo36e2_n_11 ));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim__parameterized0_19
   (re,
    p_87_out,
    prog_empty,
    dout,
    p_15_out,
    rd_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    out,
    CASDOUT);
  output [0:0]re;
  output p_87_out;
  output prog_empty;
  output [3:0]dout;
  input p_15_out;
  input rd_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [0:0]out;
  input [3:0]CASDOUT;

  wire [3:0]CASDOUT;
  wire [6:6]dbiterr_col;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_11 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_4 ;
  wire \gf36e2_inst.sngfifo36e2_n_6 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_8 ;
  wire [0:0]out;
  wire p_15_out;
  wire p_87_out;
  wire prog_empty;
  wire rd_clk;
  wire [0:0]re;
  wire [6:6]sbiterr_col;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("LAST"),
    .CLOCK_DOMAINS("COMMON"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(6),
    .PROG_FULL_THRESH(10),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CASDOUT}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(p_15_out),
        .CASPRVRDEN(re),
        .DBITERR(dbiterr_col),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],dout}),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(p_87_out),
        .FULL(\gf36e2_inst.sngfifo36e2_n_4 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(prog_empty),
        .PROGFULL(\gf36e2_inst.sngfifo36e2_n_6 ),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(\gbi8s_srst.srst_qr_reg[1] ),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(\gf36e2_inst.sngfifo36e2_n_8 ),
        .REGCE(\gbi8s_srst.srst_qr_reg[1] ),
        .RST(out),
        .RSTREG(out),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(rd_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(1'b0),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(\gf36e2_inst.sngfifo36e2_n_11 ));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim__parameterized0_21
   (re,
    p_96_out,
    prog_empty,
    dout,
    p_15_out,
    rd_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    out,
    CASDOUT);
  output [0:0]re;
  output p_96_out;
  output prog_empty;
  output [3:0]dout;
  input p_15_out;
  input rd_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [0:0]out;
  input [3:0]CASDOUT;

  wire [3:0]CASDOUT;
  wire [5:5]dbiterr_col;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_11 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_4 ;
  wire \gf36e2_inst.sngfifo36e2_n_6 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_8 ;
  wire [0:0]out;
  wire p_15_out;
  wire p_96_out;
  wire prog_empty;
  wire rd_clk;
  wire [0:0]re;
  wire [5:5]sbiterr_col;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("LAST"),
    .CLOCK_DOMAINS("COMMON"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(6),
    .PROG_FULL_THRESH(10),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CASDOUT}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(p_15_out),
        .CASPRVRDEN(re),
        .DBITERR(dbiterr_col),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],dout}),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(p_96_out),
        .FULL(\gf36e2_inst.sngfifo36e2_n_4 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(prog_empty),
        .PROGFULL(\gf36e2_inst.sngfifo36e2_n_6 ),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(\gbi8s_srst.srst_qr_reg[1] ),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(\gf36e2_inst.sngfifo36e2_n_8 ),
        .REGCE(\gbi8s_srst.srst_qr_reg[1] ),
        .RST(out),
        .RSTREG(out),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(rd_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(1'b0),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(\gf36e2_inst.sngfifo36e2_n_11 ));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim__parameterized0_23
   (re,
    p_105_out,
    prog_empty,
    dout,
    p_15_out,
    rd_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    out,
    CASDOUT);
  output [0:0]re;
  output p_105_out;
  output prog_empty;
  output [3:0]dout;
  input p_15_out;
  input rd_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [0:0]out;
  input [3:0]CASDOUT;

  wire [3:0]CASDOUT;
  wire [4:4]dbiterr_col;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_11 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_4 ;
  wire \gf36e2_inst.sngfifo36e2_n_6 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_8 ;
  wire [0:0]out;
  wire p_105_out;
  wire p_15_out;
  wire prog_empty;
  wire rd_clk;
  wire [0:0]re;
  wire [4:4]sbiterr_col;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("LAST"),
    .CLOCK_DOMAINS("COMMON"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(6),
    .PROG_FULL_THRESH(10),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CASDOUT}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(p_15_out),
        .CASPRVRDEN(re),
        .DBITERR(dbiterr_col),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],dout}),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(p_105_out),
        .FULL(\gf36e2_inst.sngfifo36e2_n_4 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(prog_empty),
        .PROGFULL(\gf36e2_inst.sngfifo36e2_n_6 ),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(\gbi8s_srst.srst_qr_reg[1] ),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(\gf36e2_inst.sngfifo36e2_n_8 ),
        .REGCE(\gbi8s_srst.srst_qr_reg[1] ),
        .RST(out),
        .RSTREG(out),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(rd_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(1'b0),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(\gf36e2_inst.sngfifo36e2_n_11 ));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim__parameterized0_25
   (re,
    p_114_out,
    prog_empty,
    dout,
    p_15_out,
    rd_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    out,
    CASDOUT);
  output [0:0]re;
  output p_114_out;
  output prog_empty;
  output [3:0]dout;
  input p_15_out;
  input rd_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [0:0]out;
  input [3:0]CASDOUT;

  wire [3:0]CASDOUT;
  wire [3:3]dbiterr_col;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_11 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_4 ;
  wire \gf36e2_inst.sngfifo36e2_n_6 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_8 ;
  wire [0:0]out;
  wire p_114_out;
  wire p_15_out;
  wire prog_empty;
  wire rd_clk;
  wire [0:0]re;
  wire [3:3]sbiterr_col;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("LAST"),
    .CLOCK_DOMAINS("COMMON"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(6),
    .PROG_FULL_THRESH(10),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CASDOUT}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(p_15_out),
        .CASPRVRDEN(re),
        .DBITERR(dbiterr_col),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],dout}),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(p_114_out),
        .FULL(\gf36e2_inst.sngfifo36e2_n_4 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(prog_empty),
        .PROGFULL(\gf36e2_inst.sngfifo36e2_n_6 ),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(\gbi8s_srst.srst_qr_reg[1] ),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(\gf36e2_inst.sngfifo36e2_n_8 ),
        .REGCE(\gbi8s_srst.srst_qr_reg[1] ),
        .RST(out),
        .RSTREG(out),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(rd_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(1'b0),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(\gf36e2_inst.sngfifo36e2_n_11 ));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim__parameterized0_27
   (re,
    prog_empty,
    dout,
    empty,
    wr_rst_busy,
    p_15_out_0,
    rd_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    out,
    CASDOUT,
    \gbi8s_srst.srst_qr_reg[1]_0 ,
    \gbi8s_srst.srst_qr_reg[1]_1 ,
    p_6_out,
    p_24_out,
    p_15_out,
    p_132_out,
    p_105_out,
    p_114_out);
  output [0:0]re;
  output prog_empty;
  output [3:0]dout;
  output empty;
  output wr_rst_busy;
  input p_15_out_0;
  input rd_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [0:0]out;
  input [3:0]CASDOUT;
  input \gbi8s_srst.srst_qr_reg[1]_0 ;
  input \gbi8s_srst.srst_qr_reg[1]_1 ;
  input p_6_out;
  input p_24_out;
  input p_15_out;
  input p_132_out;
  input p_105_out;
  input p_114_out;

  wire [3:0]CASDOUT;
  wire [2:2]dbiterr_col;
  wire [3:0]dout;
  wire empty;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gbi8s_srst.srst_qr_reg[1]_0 ;
  wire \gbi8s_srst.srst_qr_reg[1]_1 ;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_11 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_4 ;
  wire \gf36e2_inst.sngfifo36e2_n_6 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_8 ;
  wire [0:0]out;
  wire p_105_out;
  wire p_114_out;
  wire p_123_out;
  wire p_132_out;
  wire p_15_out;
  wire p_15_out_0;
  wire p_24_out;
  wire p_6_out;
  wire prog_empty;
  wire rd_clk;
  wire [0:0]re;
  wire [2:2]sbiterr_col;
  wire wr_rst_busy;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    empty_INST_0
       (.I0(wr_rst_busy),
        .I1(\gbi8s_srst.srst_qr_reg[1]_0 ),
        .I2(\gbi8s_srst.srst_qr_reg[1]_1 ),
        .I3(p_6_out),
        .I4(p_24_out),
        .I5(p_15_out),
        .O(empty));
  LUT4 #(
    .INIT(16'hFFFE)) 
    empty_INST_0_i_1
       (.I0(p_123_out),
        .I1(p_132_out),
        .I2(p_105_out),
        .I3(p_114_out),
        .O(wr_rst_busy));
  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("LAST"),
    .CLOCK_DOMAINS("COMMON"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(6),
    .PROG_FULL_THRESH(10),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CASDOUT}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(p_15_out_0),
        .CASPRVRDEN(re),
        .DBITERR(dbiterr_col),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],dout}),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(p_123_out),
        .FULL(\gf36e2_inst.sngfifo36e2_n_4 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(prog_empty),
        .PROGFULL(\gf36e2_inst.sngfifo36e2_n_6 ),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(\gbi8s_srst.srst_qr_reg[1] ),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(\gf36e2_inst.sngfifo36e2_n_8 ),
        .REGCE(\gbi8s_srst.srst_qr_reg[1] ),
        .RST(out),
        .RSTREG(out),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(rd_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(1'b0),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(\gf36e2_inst.sngfifo36e2_n_11 ));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim__parameterized0_29
   (re,
    p_132_out,
    prog_empty,
    dout,
    p_15_out,
    rd_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    out,
    CASDOUT);
  output [0:0]re;
  output p_132_out;
  output prog_empty;
  output [3:0]dout;
  input p_15_out;
  input rd_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [0:0]out;
  input [3:0]CASDOUT;

  wire [3:0]CASDOUT;
  wire [1:1]dbiterr_col;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_11 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_4 ;
  wire \gf36e2_inst.sngfifo36e2_n_6 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_8 ;
  wire [0:0]out;
  wire p_132_out;
  wire p_15_out;
  wire prog_empty;
  wire rd_clk;
  wire [0:0]re;
  wire [1:1]sbiterr_col;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("LAST"),
    .CLOCK_DOMAINS("COMMON"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(6),
    .PROG_FULL_THRESH(10),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CASDOUT}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(p_15_out),
        .CASPRVRDEN(re),
        .DBITERR(dbiterr_col),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],dout}),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(p_132_out),
        .FULL(\gf36e2_inst.sngfifo36e2_n_4 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(prog_empty),
        .PROGFULL(\gf36e2_inst.sngfifo36e2_n_6 ),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(\gbi8s_srst.srst_qr_reg[1] ),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(\gf36e2_inst.sngfifo36e2_n_8 ),
        .REGCE(\gbi8s_srst.srst_qr_reg[1] ),
        .RST(out),
        .RSTREG(out),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(rd_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(1'b0),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(\gf36e2_inst.sngfifo36e2_n_11 ));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim__parameterized0_31
   (re,
    p_6_out,
    p_4_out,
    dout,
    wr_rst_busy,
    p_15_out_0,
    rd_clk,
    out,
    CASDOUT,
    rd_en,
    \gbi8s_srst.srst_qr_reg[1] ,
    \gbi8s_srst.srst_qr_reg[1]_0 ,
    \gbi8s_srst.srst_qr_reg[1]_1 ,
    p_24_out,
    p_15_out);
  output [0:0]re;
  output p_6_out;
  output p_4_out;
  output [3:0]dout;
  output wr_rst_busy;
  input p_15_out_0;
  input rd_clk;
  input [0:0]out;
  input [3:0]CASDOUT;
  input rd_en;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input \gbi8s_srst.srst_qr_reg[1]_0 ;
  input \gbi8s_srst.srst_qr_reg[1]_1 ;
  input p_24_out;
  input p_15_out;

  wire [3:0]CASDOUT;
  wire [15:15]dbiterr_col;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gbi8s_srst.srst_qr_reg[1]_0 ;
  wire \gbi8s_srst.srst_qr_reg[1]_1 ;
  wire \gf36e2_inst.sngfifo36e2_i_2__0_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_11 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_4 ;
  wire \gf36e2_inst.sngfifo36e2_n_6 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_8 ;
  wire [0:0]out;
  wire p_15_out;
  wire p_15_out_0;
  wire p_24_out;
  wire p_4_out;
  wire p_6_out;
  wire rd_clk;
  wire rd_en;
  wire [0:0]re;
  wire [15:15]sbiterr_col;
  wire wr_rst_busy;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("LAST"),
    .CLOCK_DOMAINS("COMMON"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(6),
    .PROG_FULL_THRESH(10),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CASDOUT}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(p_15_out_0),
        .CASPRVRDEN(re),
        .DBITERR(dbiterr_col),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],dout}),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(p_6_out),
        .FULL(\gf36e2_inst.sngfifo36e2_n_4 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(p_4_out),
        .PROGFULL(\gf36e2_inst.sngfifo36e2_n_6 ),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(wr_rst_busy),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(\gf36e2_inst.sngfifo36e2_n_8 ),
        .REGCE(wr_rst_busy),
        .RST(out),
        .RSTREG(out),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(rd_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(1'b0),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(\gf36e2_inst.sngfifo36e2_n_11 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \gf36e2_inst.sngfifo36e2_i_1__0 
       (.I0(rd_en),
        .I1(\gf36e2_inst.sngfifo36e2_i_2__0_n_0 ),
        .I2(\gbi8s_srst.srst_qr_reg[1] ),
        .I3(\gbi8s_srst.srst_qr_reg[1]_0 ),
        .I4(\gbi8s_srst.srst_qr_reg[1]_1 ),
        .O(wr_rst_busy));
  LUT3 #(
    .INIT(8'h01)) 
    \gf36e2_inst.sngfifo36e2_i_2__0 
       (.I0(p_6_out),
        .I1(p_24_out),
        .I2(p_15_out),
        .O(\gf36e2_inst.sngfifo36e2_i_2__0_n_0 ));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim__parameterized0_33
   (re,
    p_15_out,
    p_13_out,
    dout,
    p_15_out_1,
    rd_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    out,
    CASDOUT);
  output [0:0]re;
  output p_15_out;
  output p_13_out;
  output [3:0]dout;
  input p_15_out_1;
  input rd_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [0:0]out;
  input [3:0]CASDOUT;

  wire [3:0]CASDOUT;
  wire [14:14]dbiterr_col;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_11 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_4 ;
  wire \gf36e2_inst.sngfifo36e2_n_6 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_8 ;
  wire [0:0]out;
  wire p_13_out;
  wire p_15_out;
  wire p_15_out_1;
  wire rd_clk;
  wire [0:0]re;
  wire [14:14]sbiterr_col;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("LAST"),
    .CLOCK_DOMAINS("COMMON"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(6),
    .PROG_FULL_THRESH(10),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CASDOUT}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(p_15_out_1),
        .CASPRVRDEN(re),
        .DBITERR(dbiterr_col),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],dout}),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(p_15_out),
        .FULL(\gf36e2_inst.sngfifo36e2_n_4 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(p_13_out),
        .PROGFULL(\gf36e2_inst.sngfifo36e2_n_6 ),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(\gbi8s_srst.srst_qr_reg[1] ),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(\gf36e2_inst.sngfifo36e2_n_8 ),
        .REGCE(\gbi8s_srst.srst_qr_reg[1] ),
        .RST(out),
        .RSTREG(out),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(rd_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(1'b0),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(\gf36e2_inst.sngfifo36e2_n_11 ));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim__parameterized0_35
   (re,
    p_24_out,
    p_22_out,
    dout,
    p_15_out,
    rd_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    out,
    CASDOUT);
  output [0:0]re;
  output p_24_out;
  output p_22_out;
  output [3:0]dout;
  input p_15_out;
  input rd_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [0:0]out;
  input [3:0]CASDOUT;

  wire [3:0]CASDOUT;
  wire [13:13]dbiterr_col;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_11 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_4 ;
  wire \gf36e2_inst.sngfifo36e2_n_6 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_8 ;
  wire [0:0]out;
  wire p_15_out;
  wire p_22_out;
  wire p_24_out;
  wire rd_clk;
  wire [0:0]re;
  wire [13:13]sbiterr_col;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("LAST"),
    .CLOCK_DOMAINS("COMMON"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(6),
    .PROG_FULL_THRESH(10),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CASDOUT}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(p_15_out),
        .CASPRVRDEN(re),
        .DBITERR(dbiterr_col),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],dout}),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(p_24_out),
        .FULL(\gf36e2_inst.sngfifo36e2_n_4 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(p_22_out),
        .PROGFULL(\gf36e2_inst.sngfifo36e2_n_6 ),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(\gbi8s_srst.srst_qr_reg[1] ),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(\gf36e2_inst.sngfifo36e2_n_8 ),
        .REGCE(\gbi8s_srst.srst_qr_reg[1] ),
        .RST(out),
        .RSTREG(out),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(rd_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(1'b0),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(\gf36e2_inst.sngfifo36e2_n_11 ));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim__parameterized0_37
   (re,
    p_33_out,
    p_31_out,
    dout,
    p_15_out,
    rd_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    out,
    CASDOUT);
  output [0:0]re;
  output p_33_out;
  output p_31_out;
  output [3:0]dout;
  input p_15_out;
  input rd_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [0:0]out;
  input [3:0]CASDOUT;

  wire [3:0]CASDOUT;
  wire [12:12]dbiterr_col;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_11 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_4 ;
  wire \gf36e2_inst.sngfifo36e2_n_6 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_8 ;
  wire [0:0]out;
  wire p_15_out;
  wire p_31_out;
  wire p_33_out;
  wire rd_clk;
  wire [0:0]re;
  wire [12:12]sbiterr_col;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("LAST"),
    .CLOCK_DOMAINS("COMMON"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(6),
    .PROG_FULL_THRESH(10),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CASDOUT}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(p_15_out),
        .CASPRVRDEN(re),
        .DBITERR(dbiterr_col),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],dout}),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(p_33_out),
        .FULL(\gf36e2_inst.sngfifo36e2_n_4 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(p_31_out),
        .PROGFULL(\gf36e2_inst.sngfifo36e2_n_6 ),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(\gbi8s_srst.srst_qr_reg[1] ),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(\gf36e2_inst.sngfifo36e2_n_8 ),
        .REGCE(\gbi8s_srst.srst_qr_reg[1] ),
        .RST(out),
        .RSTREG(out),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(rd_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(1'b0),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(\gf36e2_inst.sngfifo36e2_n_11 ));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim__parameterized0_39
   (re,
    p_42_out,
    p_40_out,
    dout,
    p_15_out,
    rd_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    out,
    CASDOUT);
  output [0:0]re;
  output p_42_out;
  output p_40_out;
  output [3:0]dout;
  input p_15_out;
  input rd_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [0:0]out;
  input [3:0]CASDOUT;

  wire [3:0]CASDOUT;
  wire [11:11]dbiterr_col;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_11 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_4 ;
  wire \gf36e2_inst.sngfifo36e2_n_6 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_8 ;
  wire [0:0]out;
  wire p_15_out;
  wire p_40_out;
  wire p_42_out;
  wire rd_clk;
  wire [0:0]re;
  wire [11:11]sbiterr_col;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("LAST"),
    .CLOCK_DOMAINS("COMMON"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(6),
    .PROG_FULL_THRESH(10),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CASDOUT}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(p_15_out),
        .CASPRVRDEN(re),
        .DBITERR(dbiterr_col),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],dout}),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(p_42_out),
        .FULL(\gf36e2_inst.sngfifo36e2_n_4 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(p_40_out),
        .PROGFULL(\gf36e2_inst.sngfifo36e2_n_6 ),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(\gbi8s_srst.srst_qr_reg[1] ),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(\gf36e2_inst.sngfifo36e2_n_8 ),
        .REGCE(\gbi8s_srst.srst_qr_reg[1] ),
        .RST(out),
        .RSTREG(out),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(rd_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(1'b0),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(\gf36e2_inst.sngfifo36e2_n_11 ));
endmodule

(* ORIG_REF_NAME = "builtin_prim" *) 
module fifo_cmd_builtin_prim__parameterized0_41
   (re,
    p_49_out,
    dout,
    wr_rst_busy,
    p_15_out,
    rd_clk,
    \gbi8s_srst.srst_qr_reg[1] ,
    out,
    CASDOUT,
    p_60_out,
    p_33_out,
    p_42_out);
  output [0:0]re;
  output p_49_out;
  output [3:0]dout;
  output wr_rst_busy;
  input p_15_out;
  input rd_clk;
  input \gbi8s_srst.srst_qr_reg[1] ;
  input [0:0]out;
  input [3:0]CASDOUT;
  input p_60_out;
  input p_33_out;
  input p_42_out;

  wire [3:0]CASDOUT;
  wire [10:10]dbiterr_col;
  wire [3:0]dout;
  wire \gbi8s_srst.srst_qr_reg[1] ;
  wire \gf36e2_inst.sngfifo36e2_n_0 ;
  wire \gf36e2_inst.sngfifo36e2_n_10 ;
  wire \gf36e2_inst.sngfifo36e2_n_100 ;
  wire \gf36e2_inst.sngfifo36e2_n_101 ;
  wire \gf36e2_inst.sngfifo36e2_n_102 ;
  wire \gf36e2_inst.sngfifo36e2_n_103 ;
  wire \gf36e2_inst.sngfifo36e2_n_11 ;
  wire \gf36e2_inst.sngfifo36e2_n_12 ;
  wire \gf36e2_inst.sngfifo36e2_n_13 ;
  wire \gf36e2_inst.sngfifo36e2_n_14 ;
  wire \gf36e2_inst.sngfifo36e2_n_15 ;
  wire \gf36e2_inst.sngfifo36e2_n_16 ;
  wire \gf36e2_inst.sngfifo36e2_n_17 ;
  wire \gf36e2_inst.sngfifo36e2_n_18 ;
  wire \gf36e2_inst.sngfifo36e2_n_184 ;
  wire \gf36e2_inst.sngfifo36e2_n_185 ;
  wire \gf36e2_inst.sngfifo36e2_n_186 ;
  wire \gf36e2_inst.sngfifo36e2_n_187 ;
  wire \gf36e2_inst.sngfifo36e2_n_188 ;
  wire \gf36e2_inst.sngfifo36e2_n_189 ;
  wire \gf36e2_inst.sngfifo36e2_n_19 ;
  wire \gf36e2_inst.sngfifo36e2_n_190 ;
  wire \gf36e2_inst.sngfifo36e2_n_191 ;
  wire \gf36e2_inst.sngfifo36e2_n_20 ;
  wire \gf36e2_inst.sngfifo36e2_n_21 ;
  wire \gf36e2_inst.sngfifo36e2_n_22 ;
  wire \gf36e2_inst.sngfifo36e2_n_23 ;
  wire \gf36e2_inst.sngfifo36e2_n_24 ;
  wire \gf36e2_inst.sngfifo36e2_n_25 ;
  wire \gf36e2_inst.sngfifo36e2_n_26 ;
  wire \gf36e2_inst.sngfifo36e2_n_27 ;
  wire \gf36e2_inst.sngfifo36e2_n_28 ;
  wire \gf36e2_inst.sngfifo36e2_n_29 ;
  wire \gf36e2_inst.sngfifo36e2_n_30 ;
  wire \gf36e2_inst.sngfifo36e2_n_31 ;
  wire \gf36e2_inst.sngfifo36e2_n_32 ;
  wire \gf36e2_inst.sngfifo36e2_n_33 ;
  wire \gf36e2_inst.sngfifo36e2_n_34 ;
  wire \gf36e2_inst.sngfifo36e2_n_35 ;
  wire \gf36e2_inst.sngfifo36e2_n_36 ;
  wire \gf36e2_inst.sngfifo36e2_n_37 ;
  wire \gf36e2_inst.sngfifo36e2_n_38 ;
  wire \gf36e2_inst.sngfifo36e2_n_39 ;
  wire \gf36e2_inst.sngfifo36e2_n_4 ;
  wire \gf36e2_inst.sngfifo36e2_n_6 ;
  wire \gf36e2_inst.sngfifo36e2_n_7 ;
  wire \gf36e2_inst.sngfifo36e2_n_8 ;
  wire [0:0]out;
  wire p_15_out;
  wire p_33_out;
  wire p_42_out;
  wire p_49_out;
  wire p_51_out;
  wire p_60_out;
  wire rd_clk;
  wire [0:0]re;
  wire [10:10]sbiterr_col;
  wire wr_rst_busy;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED ;
  wire [63:4]\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED ;

  LUT4 #(
    .INIT(16'hFFFE)) 
    empty_INST_0_i_3
       (.I0(p_51_out),
        .I1(p_60_out),
        .I2(p_33_out),
        .I3(p_42_out),
        .O(wr_rst_busy));
  (* box_type = "PRIMITIVE" *) 
  FIFO36E2 #(
    .CASCADE_ORDER("LAST"),
    .CLOCK_DOMAINS("COMMON"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .FIRST_WORD_FALL_THROUGH("TRUE"),
    .INIT(72'h000000000000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(6),
    .PROG_FULL_THRESH(10),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(4),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(72'h000000000000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(4)) 
    \gf36e2_inst.sngfifo36e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CASDOUT}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\NLW_gf36e2_inst.sngfifo36e2_CASDOUT_UNCONNECTED [63:4],\gf36e2_inst.sngfifo36e2_n_100 ,\gf36e2_inst.sngfifo36e2_n_101 ,\gf36e2_inst.sngfifo36e2_n_102 ,\gf36e2_inst.sngfifo36e2_n_103 }),
        .CASDOUTP(\NLW_gf36e2_inst.sngfifo36e2_CASDOUTP_UNCONNECTED [7:0]),
        .CASNXTEMPTY(\gf36e2_inst.sngfifo36e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(p_15_out),
        .CASPRVRDEN(re),
        .DBITERR(dbiterr_col),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINP({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\NLW_gf36e2_inst.sngfifo36e2_DOUT_UNCONNECTED [63:4],dout}),
        .DOUTP(\NLW_gf36e2_inst.sngfifo36e2_DOUTP_UNCONNECTED [7:0]),
        .ECCPARITY({\gf36e2_inst.sngfifo36e2_n_184 ,\gf36e2_inst.sngfifo36e2_n_185 ,\gf36e2_inst.sngfifo36e2_n_186 ,\gf36e2_inst.sngfifo36e2_n_187 ,\gf36e2_inst.sngfifo36e2_n_188 ,\gf36e2_inst.sngfifo36e2_n_189 ,\gf36e2_inst.sngfifo36e2_n_190 ,\gf36e2_inst.sngfifo36e2_n_191 }),
        .EMPTY(p_51_out),
        .FULL(\gf36e2_inst.sngfifo36e2_n_4 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .PROGEMPTY(p_49_out),
        .PROGFULL(\gf36e2_inst.sngfifo36e2_n_6 ),
        .RDCLK(rd_clk),
        .RDCOUNT({\gf36e2_inst.sngfifo36e2_n_12 ,\gf36e2_inst.sngfifo36e2_n_13 ,\gf36e2_inst.sngfifo36e2_n_14 ,\gf36e2_inst.sngfifo36e2_n_15 ,\gf36e2_inst.sngfifo36e2_n_16 ,\gf36e2_inst.sngfifo36e2_n_17 ,\gf36e2_inst.sngfifo36e2_n_18 ,\gf36e2_inst.sngfifo36e2_n_19 ,\gf36e2_inst.sngfifo36e2_n_20 ,\gf36e2_inst.sngfifo36e2_n_21 ,\gf36e2_inst.sngfifo36e2_n_22 ,\gf36e2_inst.sngfifo36e2_n_23 ,\gf36e2_inst.sngfifo36e2_n_24 ,\gf36e2_inst.sngfifo36e2_n_25 }),
        .RDEN(\gbi8s_srst.srst_qr_reg[1] ),
        .RDERR(\gf36e2_inst.sngfifo36e2_n_7 ),
        .RDRSTBUSY(\gf36e2_inst.sngfifo36e2_n_8 ),
        .REGCE(\gbi8s_srst.srst_qr_reg[1] ),
        .RST(out),
        .RSTREG(out),
        .SBITERR(sbiterr_col),
        .SLEEP(1'b0),
        .WRCLK(rd_clk),
        .WRCOUNT({\gf36e2_inst.sngfifo36e2_n_26 ,\gf36e2_inst.sngfifo36e2_n_27 ,\gf36e2_inst.sngfifo36e2_n_28 ,\gf36e2_inst.sngfifo36e2_n_29 ,\gf36e2_inst.sngfifo36e2_n_30 ,\gf36e2_inst.sngfifo36e2_n_31 ,\gf36e2_inst.sngfifo36e2_n_32 ,\gf36e2_inst.sngfifo36e2_n_33 ,\gf36e2_inst.sngfifo36e2_n_34 ,\gf36e2_inst.sngfifo36e2_n_35 ,\gf36e2_inst.sngfifo36e2_n_36 ,\gf36e2_inst.sngfifo36e2_n_37 ,\gf36e2_inst.sngfifo36e2_n_38 ,\gf36e2_inst.sngfifo36e2_n_39 }),
        .WREN(1'b0),
        .WRERR(\gf36e2_inst.sngfifo36e2_n_10 ),
        .WRRSTBUSY(\gf36e2_inst.sngfifo36e2_n_11 ));
endmodule

(* ORIG_REF_NAME = "builtin_top" *) 
module fifo_cmd_builtin_top
   (dout,
    prog_full,
    prog_empty,
    wr_rst_busy,
    rd_rst_busy,
    full,
    empty,
    wr_en,
    rd_en,
    rd_clk,
    srst,
    wr_clk,
    din);
  output [59:0]dout;
  output prog_full;
  output prog_empty;
  output wr_rst_busy;
  output rd_rst_busy;
  output full;
  output empty;
  input wr_en;
  input rd_en;
  input rd_clk;
  input srst;
  input wr_clk;
  input [59:0]din;

  wire [59:0]din;
  wire [59:0]dout;
  wire empty;
  wire full;
  wire p_104_out;
  wire p_105_out;
  wire p_106_out;
  wire p_113_out;
  wire p_114_out;
  wire p_115_out;
  wire p_122_out;
  wire p_131_out;
  wire p_132_out;
  wire p_133_out;
  wire p_13_out;
  wire p_14_out;
  wire p_15_out;
  wire p_16_out;
  wire p_22_out;
  wire p_23_out;
  wire p_24_out;
  wire p_25_out;
  wire p_31_out;
  wire p_32_out;
  wire p_33_out;
  wire p_34_out;
  wire p_40_out;
  wire p_41_out;
  wire p_42_out;
  wire p_43_out;
  wire p_49_out;
  wire p_4_out;
  wire p_50_out;
  wire p_58_out;
  wire p_59_out;
  wire p_5_out;
  wire p_60_out;
  wire p_61_out;
  wire p_67_out;
  wire p_68_out;
  wire p_6_out;
  wire p_77_out;
  wire p_78_out;
  wire p_79_out;
  wire p_7_out;
  wire p_86_out;
  wire p_87_out;
  wire p_88_out;
  wire p_95_out;
  wire p_96_out;
  wire p_97_out;
  wire prog_empty;
  wire prog_empty_INST_0_i_1_n_0;
  wire prog_empty_INST_0_i_2_n_0;
  wire prog_full;
  wire prog_full_INST_0_i_1_n_0;
  wire prog_full_INST_0_i_2_n_0;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire rd_rst_busy_INST_0_i_1_n_0;
  wire rd_rst_busy_INST_0_i_2_n_0;
  wire [15:1]rrst_busy_i;
  wire \rst_val_sym.gextw_sym[10].inst_extd_n_8 ;
  wire \rst_val_sym.gextw_sym[10].inst_extd_n_9 ;
  wire \rst_val_sym.gextw_sym[15].inst_extd_n_11 ;
  wire \rst_val_sym.gextw_sym[15].inst_extd_n_4 ;
  wire \rst_val_sym.gextw_sym[1].inst_extd_n_5 ;
  wire \rst_val_sym.gextw_sym[2].inst_extd_n_11 ;
  wire \rst_val_sym.gextw_sym[2].inst_extd_n_3 ;
  wire \rst_val_sym.gextw_sym[2].inst_extd_n_9 ;
  wire \rst_val_sym.gextw_sym[3].inst_extd_n_5 ;
  wire \rst_val_sym.gextw_sym[4].inst_extd_n_5 ;
  wire \rst_val_sym.gextw_sym[5].inst_extd_n_5 ;
  wire \rst_val_sym.gextw_sym[6].inst_extd_n_5 ;
  wire \rst_val_sym.gextw_sym[7].inst_extd_n_5 ;
  wire \rst_val_sym.gextw_sym[8].inst_extd_n_8 ;
  wire \rst_val_sym.gextw_sym[8].inst_extd_n_9 ;
  wire srst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire wr_rst_busy_INST_0_i_1_n_0;
  wire wr_rst_busy_INST_0_i_2_n_0;
  wire [15:1]wrst_busy_i;

  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    prog_empty_INST_0
       (.I0(prog_empty_INST_0_i_1_n_0),
        .I1(prog_empty_INST_0_i_2_n_0),
        .I2(\rst_val_sym.gextw_sym[1].inst_extd_n_5 ),
        .I3(\rst_val_sym.gextw_sym[2].inst_extd_n_3 ),
        .I4(\rst_val_sym.gextw_sym[3].inst_extd_n_5 ),
        .O(prog_empty));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    prog_empty_INST_0_i_1
       (.I0(p_13_out),
        .I1(p_4_out),
        .I2(p_31_out),
        .I3(p_22_out),
        .I4(p_40_out),
        .I5(p_49_out),
        .O(prog_empty_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    prog_empty_INST_0_i_2
       (.I0(p_67_out),
        .I1(p_58_out),
        .I2(\rst_val_sym.gextw_sym[6].inst_extd_n_5 ),
        .I3(\rst_val_sym.gextw_sym[7].inst_extd_n_5 ),
        .I4(\rst_val_sym.gextw_sym[5].inst_extd_n_5 ),
        .I5(\rst_val_sym.gextw_sym[4].inst_extd_n_5 ),
        .O(prog_empty_INST_0_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    prog_full_INST_0
       (.I0(prog_full_INST_0_i_1_n_0),
        .I1(prog_full_INST_0_i_2_n_0),
        .I2(p_131_out),
        .I3(p_122_out),
        .I4(p_113_out),
        .O(prog_full));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    prog_full_INST_0_i_1
       (.I0(p_14_out),
        .I1(p_5_out),
        .I2(p_32_out),
        .I3(p_23_out),
        .I4(p_41_out),
        .I5(p_50_out),
        .O(prog_full_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    prog_full_INST_0_i_2
       (.I0(p_68_out),
        .I1(p_59_out),
        .I2(p_86_out),
        .I3(p_77_out),
        .I4(p_95_out),
        .I5(p_104_out),
        .O(prog_full_INST_0_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    rd_rst_busy_INST_0
       (.I0(rd_rst_busy_INST_0_i_1_n_0),
        .I1(rd_rst_busy_INST_0_i_2_n_0),
        .I2(rrst_busy_i[1]),
        .I3(rrst_busy_i[2]),
        .I4(rrst_busy_i[3]),
        .O(rd_rst_busy));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    rd_rst_busy_INST_0_i_1
       (.I0(rrst_busy_i[14]),
        .I1(rrst_busy_i[15]),
        .I2(rrst_busy_i[12]),
        .I3(rrst_busy_i[13]),
        .I4(rrst_busy_i[11]),
        .I5(rrst_busy_i[10]),
        .O(rd_rst_busy_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    rd_rst_busy_INST_0_i_2
       (.I0(rrst_busy_i[8]),
        .I1(rrst_busy_i[9]),
        .I2(rrst_busy_i[6]),
        .I3(rrst_busy_i[7]),
        .I4(rrst_busy_i[5]),
        .I5(rrst_busy_i[4]),
        .O(rd_rst_busy_INST_0_i_2_n_0));
  fifo_cmd_builtin_extdepth \rst_val_sym.gextw_sym[10].inst_extd 
       (.din(din[39:36]),
        .dout(dout[39:36]),
        .\gbi8s_srst.srst_qr_reg[1]_0 (\rst_val_sym.gextw_sym[15].inst_extd_n_4 ),
        .\gbi8s_srst.srst_qr_reg[1]_1 (\rst_val_sym.gextw_sym[15].inst_extd_n_11 ),
        .p_33_out(p_33_out),
        .p_34_out(p_34_out),
        .p_42_out(p_42_out),
        .p_43_out(p_43_out),
        .p_49_out(p_49_out),
        .p_50_out(p_50_out),
        .p_60_out(p_60_out),
        .p_61_out(p_61_out),
        .prog_empty(\rst_val_sym.gextw_sym[10].inst_extd_n_8 ),
        .rd_clk(rd_clk),
        .rrst_busy_i(rrst_busy_i[10]),
        .srst(srst),
        .wr_clk(wr_clk),
        .wr_rst_busy(\rst_val_sym.gextw_sym[10].inst_extd_n_9 ),
        .wrst_busy_i(wrst_busy_i[10]));
  fifo_cmd_builtin_extdepth_0 \rst_val_sym.gextw_sym[11].inst_extd 
       (.din(din[43:40]),
        .dout(dout[43:40]),
        .\gbi8s_srst.srst_qr_reg[1]_0 (\rst_val_sym.gextw_sym[15].inst_extd_n_4 ),
        .\gbi8s_srst.srst_qr_reg[1]_1 (\rst_val_sym.gextw_sym[15].inst_extd_n_11 ),
        .p_40_out(p_40_out),
        .p_41_out(p_41_out),
        .p_42_out(p_42_out),
        .p_43_out(p_43_out),
        .rd_clk(rd_clk),
        .rrst_busy_i(rrst_busy_i[11]),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i[11]));
  fifo_cmd_builtin_extdepth_1 \rst_val_sym.gextw_sym[12].inst_extd 
       (.din(din[47:44]),
        .dout(dout[47:44]),
        .\gbi8s_srst.srst_qr_reg[1]_0 (\rst_val_sym.gextw_sym[15].inst_extd_n_4 ),
        .\gbi8s_srst.srst_qr_reg[1]_1 (\rst_val_sym.gextw_sym[15].inst_extd_n_11 ),
        .p_31_out(p_31_out),
        .p_32_out(p_32_out),
        .p_33_out(p_33_out),
        .p_34_out(p_34_out),
        .rd_clk(rd_clk),
        .rrst_busy_i(rrst_busy_i[12]),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i[12]));
  fifo_cmd_builtin_extdepth_2 \rst_val_sym.gextw_sym[13].inst_extd 
       (.din(din[51:48]),
        .dout(dout[51:48]),
        .\gbi8s_srst.srst_qr_reg[1]_0 (\rst_val_sym.gextw_sym[15].inst_extd_n_4 ),
        .\gbi8s_srst.srst_qr_reg[1]_1 (\rst_val_sym.gextw_sym[15].inst_extd_n_11 ),
        .p_22_out(p_22_out),
        .p_23_out(p_23_out),
        .p_24_out(p_24_out),
        .p_25_out(p_25_out),
        .rd_clk(rd_clk),
        .rrst_busy_i(rrst_busy_i[13]),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i[13]));
  fifo_cmd_builtin_extdepth_3 \rst_val_sym.gextw_sym[14].inst_extd 
       (.din(din[55:52]),
        .dout(dout[55:52]),
        .\gbi8s_srst.srst_qr_reg[1]_0 (\rst_val_sym.gextw_sym[15].inst_extd_n_4 ),
        .\gbi8s_srst.srst_qr_reg[1]_1 (\rst_val_sym.gextw_sym[15].inst_extd_n_11 ),
        .p_13_out(p_13_out),
        .p_14_out(p_14_out),
        .p_15_out(p_15_out),
        .p_16_out(p_16_out),
        .rd_clk(rd_clk),
        .rrst_busy_i(rrst_busy_i[14]),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i[14]));
  fifo_cmd_builtin_extdepth_4 \rst_val_sym.gextw_sym[15].inst_extd 
       (.din(din[59:56]),
        .dout(dout[59:56]),
        .\gbi8s_srst.srst_qr_reg[1]_0 (\rst_val_sym.gextw_sym[10].inst_extd_n_8 ),
        .\gbi8s_srst.srst_qr_reg[1]_1 (\rst_val_sym.gextw_sym[8].inst_extd_n_8 ),
        .\gbi8s_srst.srst_qr_reg[1]_2 (\rst_val_sym.gextw_sym[2].inst_extd_n_9 ),
        .\gbi8s_srst.srst_qr_reg[1]_3 (\rst_val_sym.gextw_sym[10].inst_extd_n_9 ),
        .\gbi8s_srst.srst_qr_reg[1]_4 (\rst_val_sym.gextw_sym[8].inst_extd_n_9 ),
        .\gbi8s_srst.srst_qr_reg[1]_5 (\rst_val_sym.gextw_sym[2].inst_extd_n_11 ),
        .p_15_out(p_15_out),
        .p_16_out(p_16_out),
        .p_24_out(p_24_out),
        .p_25_out(p_25_out),
        .p_4_out(p_4_out),
        .p_5_out(p_5_out),
        .p_6_out(p_6_out),
        .p_7_out(p_7_out),
        .prog_empty(\rst_val_sym.gextw_sym[15].inst_extd_n_4 ),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rrst_busy_i(rrst_busy_i[15]),
        .srst(srst),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .wr_rst_busy(\rst_val_sym.gextw_sym[15].inst_extd_n_11 ),
        .wrst_busy_i(wrst_busy_i[15]));
  fifo_cmd_builtin_extdepth_5 \rst_val_sym.gextw_sym[1].inst_extd 
       (.din(din[3:0]),
        .dout(dout[3:0]),
        .\gbi8s_srst.srst_qr_reg[1]_0 (\rst_val_sym.gextw_sym[15].inst_extd_n_4 ),
        .\gbi8s_srst.srst_qr_reg[1]_1 (\rst_val_sym.gextw_sym[15].inst_extd_n_11 ),
        .p_131_out(p_131_out),
        .p_132_out(p_132_out),
        .p_133_out(p_133_out),
        .prog_empty(\rst_val_sym.gextw_sym[1].inst_extd_n_5 ),
        .rd_clk(rd_clk),
        .rrst_busy_i(rrst_busy_i[1]),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i[1]));
  fifo_cmd_builtin_extdepth_6 \rst_val_sym.gextw_sym[2].inst_extd 
       (.din(din[7:4]),
        .dout(dout[7:4]),
        .empty(empty),
        .full(full),
        .\gbi8s_srst.srst_qr_reg[1]_0 (\rst_val_sym.gextw_sym[15].inst_extd_n_4 ),
        .\gbi8s_srst.srst_qr_reg[1]_1 (\rst_val_sym.gextw_sym[15].inst_extd_n_11 ),
        .\gbi8s_srst.srst_qr_reg[1]_2 (\rst_val_sym.gextw_sym[8].inst_extd_n_8 ),
        .\gbi8s_srst.srst_qr_reg[1]_3 (\rst_val_sym.gextw_sym[10].inst_extd_n_8 ),
        .\gbi8s_srst.srst_qr_reg[1]_4 (\rst_val_sym.gextw_sym[8].inst_extd_n_9 ),
        .\gbi8s_srst.srst_qr_reg[1]_5 (\rst_val_sym.gextw_sym[10].inst_extd_n_9 ),
        .p_105_out(p_105_out),
        .p_106_out(p_106_out),
        .p_114_out(p_114_out),
        .p_115_out(p_115_out),
        .p_122_out(p_122_out),
        .p_132_out(p_132_out),
        .p_133_out(p_133_out),
        .p_15_out(p_15_out),
        .p_16_out(p_16_out),
        .p_24_out(p_24_out),
        .p_25_out(p_25_out),
        .p_6_out(p_6_out),
        .p_7_out(p_7_out),
        .prog_empty(\rst_val_sym.gextw_sym[2].inst_extd_n_3 ),
        .prog_empty_0(\rst_val_sym.gextw_sym[2].inst_extd_n_9 ),
        .rd_clk(rd_clk),
        .rrst_busy_i(rrst_busy_i[2]),
        .srst(srst),
        .wr_clk(wr_clk),
        .wr_rst_busy(\rst_val_sym.gextw_sym[2].inst_extd_n_11 ),
        .wrst_busy_i(wrst_busy_i[2]));
  fifo_cmd_builtin_extdepth_7 \rst_val_sym.gextw_sym[3].inst_extd 
       (.din(din[11:8]),
        .dout(dout[11:8]),
        .\gbi8s_srst.srst_qr_reg[1]_0 (\rst_val_sym.gextw_sym[15].inst_extd_n_4 ),
        .\gbi8s_srst.srst_qr_reg[1]_1 (\rst_val_sym.gextw_sym[15].inst_extd_n_11 ),
        .p_113_out(p_113_out),
        .p_114_out(p_114_out),
        .p_115_out(p_115_out),
        .prog_empty(\rst_val_sym.gextw_sym[3].inst_extd_n_5 ),
        .rd_clk(rd_clk),
        .rrst_busy_i(rrst_busy_i[3]),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i[3]));
  fifo_cmd_builtin_extdepth_8 \rst_val_sym.gextw_sym[4].inst_extd 
       (.din(din[15:12]),
        .dout(dout[15:12]),
        .\gbi8s_srst.srst_qr_reg[1]_0 (\rst_val_sym.gextw_sym[15].inst_extd_n_4 ),
        .\gbi8s_srst.srst_qr_reg[1]_1 (\rst_val_sym.gextw_sym[15].inst_extd_n_11 ),
        .p_104_out(p_104_out),
        .p_105_out(p_105_out),
        .p_106_out(p_106_out),
        .prog_empty(\rst_val_sym.gextw_sym[4].inst_extd_n_5 ),
        .rd_clk(rd_clk),
        .rrst_busy_i(rrst_busy_i[4]),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i[4]));
  fifo_cmd_builtin_extdepth_9 \rst_val_sym.gextw_sym[5].inst_extd 
       (.din(din[19:16]),
        .dout(dout[19:16]),
        .\gbi8s_srst.srst_qr_reg[1]_0 (\rst_val_sym.gextw_sym[15].inst_extd_n_4 ),
        .\gbi8s_srst.srst_qr_reg[1]_1 (\rst_val_sym.gextw_sym[15].inst_extd_n_11 ),
        .p_95_out(p_95_out),
        .p_96_out(p_96_out),
        .p_97_out(p_97_out),
        .prog_empty(\rst_val_sym.gextw_sym[5].inst_extd_n_5 ),
        .rd_clk(rd_clk),
        .rrst_busy_i(rrst_busy_i[5]),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i[5]));
  fifo_cmd_builtin_extdepth_10 \rst_val_sym.gextw_sym[6].inst_extd 
       (.din(din[23:20]),
        .dout(dout[23:20]),
        .\gbi8s_srst.srst_qr_reg[1]_0 (\rst_val_sym.gextw_sym[15].inst_extd_n_4 ),
        .\gbi8s_srst.srst_qr_reg[1]_1 (\rst_val_sym.gextw_sym[15].inst_extd_n_11 ),
        .p_86_out(p_86_out),
        .p_87_out(p_87_out),
        .p_88_out(p_88_out),
        .prog_empty(\rst_val_sym.gextw_sym[6].inst_extd_n_5 ),
        .rd_clk(rd_clk),
        .rrst_busy_i(rrst_busy_i[6]),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i[6]));
  fifo_cmd_builtin_extdepth_11 \rst_val_sym.gextw_sym[7].inst_extd 
       (.din(din[27:24]),
        .dout(dout[27:24]),
        .\gbi8s_srst.srst_qr_reg[1]_0 (\rst_val_sym.gextw_sym[15].inst_extd_n_4 ),
        .\gbi8s_srst.srst_qr_reg[1]_1 (\rst_val_sym.gextw_sym[15].inst_extd_n_11 ),
        .p_77_out(p_77_out),
        .p_78_out(p_78_out),
        .p_79_out(p_79_out),
        .prog_empty(\rst_val_sym.gextw_sym[7].inst_extd_n_5 ),
        .rd_clk(rd_clk),
        .rrst_busy_i(rrst_busy_i[7]),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i[7]));
  fifo_cmd_builtin_extdepth_12 \rst_val_sym.gextw_sym[8].inst_extd 
       (.din(din[31:28]),
        .dout(dout[31:28]),
        .\gbi8s_srst.srst_qr_reg[1]_0 (\rst_val_sym.gextw_sym[15].inst_extd_n_4 ),
        .\gbi8s_srst.srst_qr_reg[1]_1 (\rst_val_sym.gextw_sym[15].inst_extd_n_11 ),
        .p_67_out(p_67_out),
        .p_68_out(p_68_out),
        .p_78_out(p_78_out),
        .p_79_out(p_79_out),
        .p_87_out(p_87_out),
        .p_88_out(p_88_out),
        .p_96_out(p_96_out),
        .p_97_out(p_97_out),
        .prog_empty(\rst_val_sym.gextw_sym[8].inst_extd_n_8 ),
        .rd_clk(rd_clk),
        .rrst_busy_i(rrst_busy_i[8]),
        .srst(srst),
        .wr_clk(wr_clk),
        .wr_rst_busy(\rst_val_sym.gextw_sym[8].inst_extd_n_9 ),
        .wrst_busy_i(wrst_busy_i[8]));
  fifo_cmd_builtin_extdepth_13 \rst_val_sym.gextw_sym[9].inst_extd 
       (.din(din[35:32]),
        .dout(dout[35:32]),
        .\gbi8s_srst.srst_qr_reg[1]_0 (\rst_val_sym.gextw_sym[15].inst_extd_n_4 ),
        .\gbi8s_srst.srst_qr_reg[1]_1 (\rst_val_sym.gextw_sym[15].inst_extd_n_11 ),
        .p_58_out(p_58_out),
        .p_59_out(p_59_out),
        .p_60_out(p_60_out),
        .p_61_out(p_61_out),
        .rd_clk(rd_clk),
        .rrst_busy_i(rrst_busy_i[9]),
        .srst(srst),
        .wr_clk(wr_clk),
        .wrst_busy_i(wrst_busy_i[9]));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    wr_rst_busy_INST_0
       (.I0(wr_rst_busy_INST_0_i_1_n_0),
        .I1(wr_rst_busy_INST_0_i_2_n_0),
        .I2(wrst_busy_i[1]),
        .I3(wrst_busy_i[2]),
        .I4(wrst_busy_i[3]),
        .O(wr_rst_busy));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    wr_rst_busy_INST_0_i_1
       (.I0(wrst_busy_i[14]),
        .I1(wrst_busy_i[15]),
        .I2(wrst_busy_i[12]),
        .I3(wrst_busy_i[13]),
        .I4(wrst_busy_i[11]),
        .I5(wrst_busy_i[10]),
        .O(wr_rst_busy_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    wr_rst_busy_INST_0_i_2
       (.I0(wrst_busy_i[8]),
        .I1(wrst_busy_i[9]),
        .I2(wrst_busy_i[6]),
        .I3(wrst_busy_i[7]),
        .I4(wrst_busy_i[5]),
        .I5(wrst_busy_i[4]),
        .O(wr_rst_busy_INST_0_i_2_n_0));
endmodule

(* ORIG_REF_NAME = "fifo_generator_top" *) 
module fifo_cmd_fifo_generator_top
   (dout,
    prog_full,
    prog_empty,
    wr_rst_busy,
    rd_rst_busy,
    full,
    empty,
    wr_en,
    rd_en,
    rd_clk,
    srst,
    wr_clk,
    din);
  output [59:0]dout;
  output prog_full;
  output prog_empty;
  output wr_rst_busy;
  output rd_rst_busy;
  output full;
  output empty;
  input wr_en;
  input rd_en;
  input rd_clk;
  input srst;
  input wr_clk;
  input [59:0]din;

  wire [59:0]din;
  wire [59:0]dout;
  wire empty;
  wire full;
  wire prog_empty;
  wire prog_full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire srst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;

  fifo_cmd_fifo_generator_v13_2_1_builtin \gbi.bi 
       (.din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .prog_empty(prog_empty),
        .prog_full(prog_full),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rd_rst_busy(rd_rst_busy),
        .srst(srst),
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
(* C_DATA_COUNT_WIDTH = "14" *) (* C_DEFAULT_VALUE = "BlankString" *) (* C_DIN_WIDTH = "60" *) 
(* C_DIN_WIDTH_AXIS = "1" *) (* C_DIN_WIDTH_RACH = "32" *) (* C_DIN_WIDTH_RDCH = "64" *) 
(* C_DIN_WIDTH_WACH = "1" *) (* C_DIN_WIDTH_WDCH = "64" *) (* C_DIN_WIDTH_WRCH = "2" *) 
(* C_DOUT_RST_VAL = "0" *) (* C_DOUT_WIDTH = "60" *) (* C_ENABLE_RLOCS = "0" *) 
(* C_ENABLE_RST_SYNC = "1" *) (* C_EN_SAFETY_CKT = "0" *) (* C_ERROR_INJECTION_TYPE = "0" *) 
(* C_ERROR_INJECTION_TYPE_AXIS = "0" *) (* C_ERROR_INJECTION_TYPE_RACH = "0" *) (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
(* C_ERROR_INJECTION_TYPE_WACH = "0" *) (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
(* C_FAMILY = "kintexu" *) (* C_FULL_FLAGS_RST_VAL = "0" *) (* C_HAS_ALMOST_EMPTY = "0" *) 
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
(* C_HAS_RD_RST = "0" *) (* C_HAS_RST = "0" *) (* C_HAS_SLAVE_CE = "0" *) 
(* C_HAS_SRST = "1" *) (* C_HAS_UNDERFLOW = "0" *) (* C_HAS_VALID = "0" *) 
(* C_HAS_WR_ACK = "0" *) (* C_HAS_WR_DATA_COUNT = "0" *) (* C_HAS_WR_RST = "0" *) 
(* C_IMPLEMENTATION_TYPE = "6" *) (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) (* C_IMPLEMENTATION_TYPE_RACH = "2" *) 
(* C_IMPLEMENTATION_TYPE_RDCH = "1" *) (* C_IMPLEMENTATION_TYPE_WACH = "2" *) (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
(* C_IMPLEMENTATION_TYPE_WRCH = "2" *) (* C_INIT_WR_PNTR_VAL = "0" *) (* C_INTERFACE_TYPE = "0" *) 
(* C_MEMORY_TYPE = "4" *) (* C_MIF_FILE_NAME = "BlankString" *) (* C_MSGON_VAL = "1" *) 
(* C_OPTIMIZATION_MODE = "0" *) (* C_OVERFLOW_LOW = "0" *) (* C_POWER_SAVING_MODE = "0" *) 
(* C_PRELOAD_LATENCY = "0" *) (* C_PRELOAD_REGS = "1" *) (* C_PRIM_FIFO_TYPE = "8kx4" *) 
(* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
(* C_PRIM_FIFO_TYPE_WACH = "512x36" *) (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL = "6" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "7" *) (* C_PROG_EMPTY_TYPE = "1" *) 
(* C_PROG_EMPTY_TYPE_AXIS = "0" *) (* C_PROG_EMPTY_TYPE_RACH = "0" *) (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
(* C_PROG_EMPTY_TYPE_WACH = "0" *) (* C_PROG_EMPTY_TYPE_WDCH = "0" *) (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL = "16376" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) (* C_PROG_FULL_THRESH_NEGATE_VAL = "16375" *) (* C_PROG_FULL_TYPE = "1" *) 
(* C_PROG_FULL_TYPE_AXIS = "0" *) (* C_PROG_FULL_TYPE_RACH = "0" *) (* C_PROG_FULL_TYPE_RDCH = "0" *) 
(* C_PROG_FULL_TYPE_WACH = "0" *) (* C_PROG_FULL_TYPE_WDCH = "0" *) (* C_PROG_FULL_TYPE_WRCH = "0" *) 
(* C_RACH_TYPE = "0" *) (* C_RDCH_TYPE = "0" *) (* C_RD_DATA_COUNT_WIDTH = "14" *) 
(* C_RD_DEPTH = "16384" *) (* C_RD_FREQ = "78" *) (* C_RD_PNTR_WIDTH = "14" *) 
(* C_REG_SLICE_MODE_AXIS = "0" *) (* C_REG_SLICE_MODE_RACH = "0" *) (* C_REG_SLICE_MODE_RDCH = "0" *) 
(* C_REG_SLICE_MODE_WACH = "0" *) (* C_REG_SLICE_MODE_WDCH = "0" *) (* C_REG_SLICE_MODE_WRCH = "0" *) 
(* C_SELECT_XPM = "0" *) (* C_SYNCHRONIZER_STAGE = "2" *) (* C_UNDERFLOW_LOW = "0" *) 
(* C_USE_COMMON_OVERFLOW = "0" *) (* C_USE_COMMON_UNDERFLOW = "0" *) (* C_USE_DEFAULT_SETTINGS = "0" *) 
(* C_USE_DOUT_RST = "1" *) (* C_USE_ECC = "0" *) (* C_USE_ECC_AXIS = "0" *) 
(* C_USE_ECC_RACH = "0" *) (* C_USE_ECC_RDCH = "0" *) (* C_USE_ECC_WACH = "0" *) 
(* C_USE_ECC_WDCH = "0" *) (* C_USE_ECC_WRCH = "0" *) (* C_USE_EMBEDDED_REG = "1" *) 
(* C_USE_FIFO16_FLAGS = "0" *) (* C_USE_FWFT_DATA_COUNT = "0" *) (* C_USE_PIPELINE_REG = "0" *) 
(* C_VALID_LOW = "0" *) (* C_WACH_TYPE = "0" *) (* C_WDCH_TYPE = "0" *) 
(* C_WRCH_TYPE = "0" *) (* C_WR_ACK_LOW = "0" *) (* C_WR_DATA_COUNT_WIDTH = "14" *) 
(* C_WR_DEPTH = "16384" *) (* C_WR_DEPTH_AXIS = "1024" *) (* C_WR_DEPTH_RACH = "16" *) 
(* C_WR_DEPTH_RDCH = "1024" *) (* C_WR_DEPTH_WACH = "16" *) (* C_WR_DEPTH_WDCH = "1024" *) 
(* C_WR_DEPTH_WRCH = "16" *) (* C_WR_FREQ = "78" *) (* C_WR_PNTR_WIDTH = "14" *) 
(* C_WR_PNTR_WIDTH_AXIS = "10" *) (* C_WR_PNTR_WIDTH_RACH = "4" *) (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
(* C_WR_PNTR_WIDTH_WACH = "4" *) (* C_WR_PNTR_WIDTH_WDCH = "10" *) (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
(* C_WR_RESPONSE_LATENCY = "1" *) (* ORIG_REF_NAME = "fifo_generator_v13_2_1" *) 
module fifo_cmd_fifo_generator_v13_2_1
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
  input [13:0]prog_empty_thresh;
  input [13:0]prog_empty_thresh_assert;
  input [13:0]prog_empty_thresh_negate;
  input [13:0]prog_full_thresh;
  input [13:0]prog_full_thresh_assert;
  input [13:0]prog_full_thresh_negate;
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
  output [13:0]data_count;
  output [13:0]rd_data_count;
  output [13:0]wr_data_count;
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
  wire srst;
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
  assign data_count[13] = \<const0> ;
  assign data_count[12] = \<const0> ;
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
  assign rd_data_count[13] = \<const0> ;
  assign rd_data_count[12] = \<const0> ;
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
  assign wr_data_count[13] = \<const0> ;
  assign wr_data_count[12] = \<const0> ;
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
  fifo_cmd_fifo_generator_v13_2_1_synth inst_fifo_gen
       (.din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .prog_empty(prog_empty),
        .prog_full(prog_full),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rd_rst_busy(rd_rst_busy),
        .srst(srst),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* ORIG_REF_NAME = "fifo_generator_v13_2_1_builtin" *) 
module fifo_cmd_fifo_generator_v13_2_1_builtin
   (dout,
    prog_full,
    prog_empty,
    wr_rst_busy,
    rd_rst_busy,
    full,
    empty,
    wr_en,
    rd_en,
    rd_clk,
    srst,
    wr_clk,
    din);
  output [59:0]dout;
  output prog_full;
  output prog_empty;
  output wr_rst_busy;
  output rd_rst_busy;
  output full;
  output empty;
  input wr_en;
  input rd_en;
  input rd_clk;
  input srst;
  input wr_clk;
  input [59:0]din;

  wire [59:0]din;
  wire [59:0]dout;
  wire empty;
  wire full;
  wire prog_empty;
  wire prog_full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire srst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;

  fifo_cmd_builtin_top \v8_fifo.fblk 
       (.din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .prog_empty(prog_empty),
        .prog_full(prog_full),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rd_rst_busy(rd_rst_busy),
        .srst(srst),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* ORIG_REF_NAME = "fifo_generator_v13_2_1_synth" *) 
module fifo_cmd_fifo_generator_v13_2_1_synth
   (dout,
    prog_full,
    prog_empty,
    wr_rst_busy,
    rd_rst_busy,
    full,
    empty,
    wr_en,
    rd_en,
    rd_clk,
    srst,
    wr_clk,
    din);
  output [59:0]dout;
  output prog_full;
  output prog_empty;
  output wr_rst_busy;
  output rd_rst_busy;
  output full;
  output empty;
  input wr_en;
  input rd_en;
  input rd_clk;
  input srst;
  input wr_clk;
  input [59:0]din;

  wire [59:0]din;
  wire [59:0]dout;
  wire empty;
  wire full;
  wire prog_empty;
  wire prog_full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire srst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;

  fifo_cmd_fifo_generator_top \gconvfifo.rf 
       (.din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .prog_empty(prog_empty),
        .prog_full(prog_full),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rd_rst_busy(rd_rst_busy),
        .srst(srst),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .wr_rst_busy(wr_rst_busy));
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

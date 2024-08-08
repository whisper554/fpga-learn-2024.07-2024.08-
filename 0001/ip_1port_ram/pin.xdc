#----------------------sys_clk---------------------------

set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports sys_clk];
set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS33} [get_ports {sys_rst_n}];
#----------------------LED_core---------------------------

#set_property -dict {PACKAGE_PIN R19 IOSTANDARD LVCMOS33} [get_ports led]; #led

#----------------------HDMI---------------------------

#set_property -dict {PACKAGE_PIN K19  IOSTANDARD TMDS_33 } [get_ports {hdmi_out_data_p[2]}];  #tmds_data_p[2]
#set_property -dict {PACKAGE_PIN J19  IOSTANDARD TMDS_33 } [get_ports {hdmi_out_data_n[2]}];  #tmds_data_p[2]
#set_property -dict {PACKAGE_PIN J18  IOSTANDARD TMDS_33 } [get_ports {hdmi_out_data_p[1]}];  #tmds_data_p[1]
#set_property -dict {PACKAGE_PIN H18  IOSTANDARD TMDS_33 } [get_ports {hdmi_out_data_n[1]}];  #tmds_data_p[1]
#set_property -dict {PACKAGE_PIN G17  IOSTANDARD TMDS_33 } [get_ports {hdmi_out_data_p[0]}];  #tmds_data_p[0]
#set_property -dict {PACKAGE_PIN G18  IOSTANDARD TMDS_33 } [get_ports {hdmi_out_data_n[0]}];  #tmds_data_p[0]
#set_property -dict {PACKAGE_PIN E18  IOSTANDARD TMDS_33 } [get_ports hdmi_out_clk_p];        #tmds_clk_p
#set_property -dict {PACKAGE_PIN E19  IOSTANDARD TMDS_33 } [get_ports hdmi_out_clk_n];        #tmds_clk_n
#set_property -dict {PACKAGE_PIN D18 IOSTANDARD  LVCMOS33} [get_ports hdmi_out_ddc_scl_io];               #SCL
#set_property -dict {PACKAGE_PIN K14 IOSTANDARD  LVCMOS33} [get_ports hdmi_out_ddc_sda_io];               #SDA
#set_property -dict {PACKAGE_PIN E7 IOSTANDARD   LVCMOS33} [get_ports CEC];               #CEC
#set_property -dict {PACKAGE_PIN J14 IOSTANDARD  LVCMOS33} [get_ports HDP];               #HDP

#HDMI TX ZYBO Z7
#set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { hdmi_out_scl   }]; #IO_L16P_T2_35 Sch=hdmi_tx_scl
#set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 } [get_ports { hdmi_out_sda   }]; #IO_L16N_T2_35 Sch=hdmi_tx_sda
#set_property -dict { PACKAGE_PIN H17   IOSTANDARD TMDS_33  } [get_ports { hdmi_out_clk_n }]; #IO_L13N_T2_MRCC_35 Sch=hdmi_tx_clk_n
#set_property -dict { PACKAGE_PIN H16   IOSTANDARD TMDS_33  } [get_ports { hdmi_out_clk_p }]; #IO_L13P_T2_MRCC_35 Sch=hdmi_tx_clk_p
#set_property -dict { PACKAGE_PIN D20   IOSTANDARD TMDS_33  } [get_ports { hdmi_out_data_n[0]  }]; #IO_L4N_T0_35 Sch=hdmi_tx_n[0]
#set_property -dict { PACKAGE_PIN D19   IOSTANDARD TMDS_33  } [get_ports { hdmi_out_data_p[0]  }]; #IO_L4P_T0_35 Sch=hdmi_tx_p[0]
#set_property -dict { PACKAGE_PIN B20   IOSTANDARD TMDS_33  } [get_ports { hdmi_out_data_n[1]  }]; #IO_L1N_T0_AD0N_35 Sch=hdmi_tx_n[1]
#set_property -dict { PACKAGE_PIN C20   IOSTANDARD TMDS_33  } [get_ports { hdmi_out_data_p[1]  }]; #IO_L1P_T0_AD0P_35 Sch=hdmi_tx_p[1]
#set_property -dict { PACKAGE_PIN A20   IOSTANDARD TMDS_33  } [get_ports { hdmi_out_data_n[2]  }]; #IO_L2N_T0_AD8N_35 Sch=hdmi_tx_n[2]
#set_property -dict { PACKAGE_PIN B19   IOSTANDARD TMDS_33  } [get_ports { hdmi_out_data_p[2]  }]; #IO_L2P_T0_AD8P_35 Sch=hdmi_tx_p[2]

#set_property -dict { PACKAGE_PIN E18   IOSTANDARD LVCMOS33 } [get_ports { hdmi_out_hpd   }]; #IO_L5P_T0_AD9P_35 Sch=hdmi_tx_hpd

#set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { hdmi_out_ddc_scl_io }];
#set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 } [get_ports { hdmi_out_ddc_sda_io }];


#----------------------GPIO---------------------------
#VDD5V 37 35 33 31 29 27 GND 23 21 19 17 15 13 GND  9 7 5 3 GND
#VDD5V 38 36 34 32 30 28 GND 24 22 20 18 16 14 GND 10 8 6 4 GND

#set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports {led}];  #GPIO[3]
set_property -dict {PACKAGE_PIN L17 IOSTANDARD LVCMOS33} [get_ports {led[1]}];  #GPIO[4]
                                                                                
set_property -dict {PACKAGE_PIN N15 IOSTANDARD LVCMOS33} [get_ports {led[0]}];  #GPIO[5]
#set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports {led[3]}];  #GPIO[6]
                                                                                
#set_property -dict {PACKAGE_PIN L19 IOSTANDARD LVCMOS33} [get_ports {GPIO[7]}];  #GPIO[7]
#set_property -dict {PACKAGE_PIN L20 IOSTANDARD LVCMOS33} [get_ports {GPIO[8]}];  #GPIO[8]
                                                                                
#set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVCMOS33} [get_ports {GPIO[9]}];  #GPIO[9]
#set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS33} [get_ports {GPIO[10]}]; #GPIO[10]
                                                                                
#set_property -dict {PACKAGE_PIN Y16 IOSTANDARD LVCMOS33} [get_ports {GPIO[13]}]; #GPIO[13]
#set_property -dict {PACKAGE_PIN Y17 IOSTANDARD LVCMOS33} [get_ports {key[3]}]; #GPIO[14]
                                                                                      
#set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports {GPIO[15]}]; #GPIO[15]
#set_property -dict {PACKAGE_PIN W15 IOSTANDARD LVCMOS33} [get_ports {GPIO[16]}]; #GPIO[16]
                                                                                        
#set_property -dict {PACKAGE_PIN Y14 IOSTANDARD LVCMOS33} [get_ports {key[2]}]; #GPIO[17]
#set_property -dict {PACKAGE_PIN W14 IOSTANDARD LVCMOS33} [get_ports {GPIO[18]}]; #GPIO[18]
                                                                                       
#set_property -dict {PACKAGE_PIN T16 IOSTANDARD LVCMOS33} [get_ports {key[2]}]; #GPIO[19]
#set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS33} [get_ports {GPIO[20]}]; #GPIO[20]
                                                                                       
#set_property -dict {PACKAGE_PIN T12 IOSTANDARD LVCMOS33} [get_ports {key[1]}]; #GPIO[21]
#set_property -dict {PACKAGE_PIN U12 IOSTANDARD LVCMOS33} [get_ports {GPIO[22]}]; #GPIO[22]
                                                                                       
#set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports {key[0]}]; #GPIO[23]
#set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports {GPIO[24]}]; #GPIO[24]
                                                                                 
#set_property -dict {PACKAGE_PIN U7 IOSTANDARD LVCMOS33} [get_ports {GPIO[27]}];  #GPIO[27]
#set_property -dict {PACKAGE_PIN V7 IOSTANDARD LVCMOS33} [get_ports {GPIO[28]}];  #GPIO[28]
                                                                                 
#set_property -dict {PACKAGE_PIN T5 IOSTANDARD LVCMOS33} [get_ports {GPIO[29]}];  #GPIO[29]
#set_property -dict {PACKAGE_PIN U5 IOSTANDARD LVCMOS33} [get_ports {GPIO[30]}];  #GPIO[30]
                                                                                 
#set_property -dict {PACKAGE_PIN W11 IOSTANDARD LVCMOS33} [get_ports {GPIO[31]}]; #GPIO[31]
#set_property -dict {PACKAGE_PIN Y11 IOSTANDARD LVCMOS33} [get_ports {GPIO[32]}]; #GPIO[32]
                                                                                 
#set_property -dict {PACKAGE_PIN W10 IOSTANDARD LVCMOS33} [get_ports {GPIO[33]}]; #GPIO[33]
#set_property -dict {PACKAGE_PIN W9 IOSTANDARD LVCMOS33} [get_ports {GPIO[34]}];  #GPIO[34]
                                                                                 
#set_property -dict {PACKAGE_PIN Y9 IOSTANDARD LVCMOS33} [get_ports {GPIO[35]}];  #GPIO[35]
#set_property -dict {PACKAGE_PIN Y8 IOSTANDARD LVCMOS33} [get_ports {GPIO[36]}];  #GPIO[36]
                                                                                 
#set_property -dict {PACKAGE_PIN Y7 IOSTANDARD LVCMOS33} [get_ports {GPIO[37]}];  #GPIO[37]
#set_property -dict {PACKAGE_PIN Y6 IOSTANDARD LVCMOS33} [get_ports {GPIO[38]}];  #GPIO[38]
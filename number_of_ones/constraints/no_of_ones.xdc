set_property -dict { PACKAGE_PIN D19   IOSTANDARD LVCMOS33 } [get_ports { In[0] }]; #IO_L4P_T0_35 Sch=btn[0]
set_property -dict { PACKAGE_PIN D20   IOSTANDARD LVCMOS33 } [get_ports { In[1] }]; #IO_L4N_T0_35 Sch=btn[1]
set_property -dict { PACKAGE_PIN L20   IOSTANDARD LVCMOS33 } [get_ports { In[2] }]; #IO_L9N_T1_DQS_AD3N_35 Sch=btn[2]
set_property -dict { PACKAGE_PIN L19   IOSTANDARD LVCMOS33 } [get_ports { In[3] }]; #IO_L9P_T1_DQS_AD3P_35 Sch=btn[3]

set_property -dict { PACKAGE_PIN R14   IOSTANDARD LVCMOS33 } [get_ports { out[0] }]; #IO_L6N_T0_VREF_34 Sch=led[0]
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { out[1] }]; #IO_L6P_T0_34 Sch=led[1]
set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { out[2] }]; #IO_L21N_T3_DQS_AD14N_35 Sch=led[2]
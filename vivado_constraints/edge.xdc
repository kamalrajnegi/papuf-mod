# Clock signal
set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports { clk }];

set_property -dict { PACKAGE_PIN P15 IOSTANDARD LVCMOS33 } [get_ports { enable_rx }];#MSB
set_property -dict { PACKAGE_PIN N17 IOSTANDARD LVCMOS33 } [get_ports { check }];
 
# LEDs
set_property -dict { PACKAGE_PIN R16 IOSTANDARD LVCMOS33 } [get_ports { enable }];#LSB
set_property -dict { PACKAGE_PIN R17 IOSTANDARD LVCMOS33 } [get_ports { done_rx }];
set_property -dict { PACKAGE_PIN T17 IOSTANDARD LVCMOS33 } [get_ports { tx_done }];


set_property -dict { PACKAGE_PIN H20 IOSTANDARD LVCMOS33} [get_ports {rx}]; 
set_property -dict { PACKAGE_PIN G20 IOSTANDARD LVCMOS33} [get_ports {tx_out}];
module uart_loopback(
    input wire sys_clk,          // clk
    input wire sys_rst_n,        // rst
    input wire uart_rxd,         // uart_rxd
    output wire uart_txd         // uart_txd
);
parameter CLK_FREQ = 50000000;
parameter UART_BPS =115200;

wire [7:0] uart_rx_data;  // uart_rx_data
wire uart_rx_done;        // uart_rx_done

uart_rx  # (
.CLK_FREQ (CLK_FREQ),
.UART_BPS (UART_BPS)
)
u_uart_rx (
.clk (sys_clk),                  // clk
.rst_n (sys_rst_n),              // rst
    
.uart_rxd (uart_rxd),            // uart_rxd
.uart_rx_data (uart_rx_data),    // uart_rx_data
.uart_rx_done (uart_rx_done)     // uart_rx_done
);

uart_tx # (
.CLK_FREQ (CLK_FREQ),
.UART_BPS (UART_BPS)
)
 u_uart_tx(
.clk (sys_clk),                  // clk
.rst_n (sys_rst_n),              // rst
    
.uart_tx_en (uart_rx_done),      // uart_tx_en
.uart_tx_data (uart_rx_data),    // uart_tx_data
.uart_txd (uart_txd),            // uart_txd
.uart_tx_busy ()                 // uart_tx_busy
);

        endmodule
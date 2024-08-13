module uart_tx(
    input         clk ,
    input         rst_n ,
    input         uart_tx_en,
    input  [7:0]  uart_tx_data,
    output reg    uart_txd,
    output reg    uart_tx_busy
);
parameter        CLK_FREQ = 50000000;
parameter        UART_BPS =115200;
localparam        BAUD_CNT_MAX = CLK_FREQ / UART_BPS;

reg   [3:0]       tx_cnt;
reg   [15:0]      baud_cnt;
reg   [7:0]       tx_data_t;

// tx_data_t
// uart_tx_busy
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        tx_data_t <= 8'b0;
        uart_tx_busy <= 1'b0;
    end else if(uart_tx_en) begin
        uart_tx_busy <= 1'b1;
        tx_data_t <= uart_tx_data;    
    end else if(tx_cnt == 4'd9 && baud_cnt == BAUD_CNT_MAX - 1'b1) begin
        tx_data_t <= 8'b0;
        uart_tx_busy <= 1'b0;
    end else begin
        tx_data_t <= tx_data_t;
        uart_tx_busy <= uart_tx_busy;
    end
end

// baud_cnt    
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        baud_cnt <= 16'd0;
    else if(uart_tx_en)
        baud_cnt <= 16'd0;
    else if(uart_tx_busy) begin
        if(baud_cnt < BAUD_CNT_MAX - 1'b1)
            baud_cnt <= baud_cnt + 16'd1;
        else    
            baud_cnt <= 16'd0;
    end else
        baud_cnt <= 16'd0;
end 

// tx_cnt
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        tx_cnt <= 4'd0;
    else if(uart_tx_busy)begin
        if(baud_cnt == BAUD_CNT_MAX - 1'b1)
            tx_cnt <= tx_cnt + 4'd1;
        else    
            tx_cnt <= tx_cnt;
    end else
        tx_cnt <= 4'd0;  
end 

// uart_txd
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        uart_txd <= 1'b1;
    else if(uart_tx_busy)begin
        case(tx_cnt)
            4'b0 : uart_txd<=1'b0;
            4'd1 : uart_txd <= tx_data_t[0];
            4'd2 : uart_txd <= tx_data_t[1];
            4'd3 : uart_txd <= tx_data_t[2];
            4'd4 : uart_txd <= tx_data_t[3];
            4'd5 : uart_txd <= tx_data_t[4];
            4'd6 : uart_txd <= tx_data_t[5];
            4'd7 : uart_txd <= tx_data_t[6];
            4'd8 : uart_txd <= tx_data_t[7];
            default : uart_txd <= 1'b1;
        endcase
    end else
        uart_txd<=1'b1;
end

        endmodule
module breath_led(
    input sys_clk,
    input sys_rst_n,
    
    output reg led
);

parameter CNT_2US_MAX = 10'd100;
parameter CNT_2MS_MAX = 10'd1000;
parameter CNT_2S_MAX = 10'd1000;

reg [9:0] cnt_2us;
reg [9:0] cnt_2ms;
reg [9:0] cnt_2s;
reg inc_dec_flag;

//2us
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        cnt_2us <= 10'd0;
    else if(cnt_2us == (CNT_2US_MAX - 10'd1))
        cnt_2us <= 10'd0;
    else
        cnt_2us <= cnt_2us + 10'd1;
end

//2ms
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        cnt_2ms <= 10'd0;
    else if(cnt_2ms == (CNT_2MS_MAX - 10'd1) && cnt_2us == (CNT_2US_MAX - 10'd1))
        cnt_2ms <= 10'd0;
    else if(cnt_2us == (CNT_2US_MAX - 10'd1))
        cnt_2ms <= cnt_2ms + 10'd1;
    else
        cnt_2ms <= cnt_2ms;
end

//2s
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        cnt_2s <= 10'd0;
        inc_dec_flag <= 10'd0;
    end
    else if(cnt_2s == (CNT_2S_MAX - 10'd1) && cnt_2ms == (CNT_2MS_MAX - 10'd1) && cnt_2us == (CNT_2US_MAX - 10'd1)) begin
        cnt_2s <= 10'd0;
        inc_dec_flag <= ~inc_dec_flag;
    end
    else if(cnt_2ms == (CNT_2MS_MAX - 10'd1) && cnt_2us == (CNT_2US_MAX - 10'd1))
        cnt_2s <= cnt_2s + 10'd1;
    else
        cnt_2s <= cnt_2s;
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        led <= 0;
    end else begin
        led <= (cnt_2s < cnt_2ms && inc_dec_flag) || (cnt_2s > cnt_2ms && !inc_dec_flag);
    end
end

ila_0 u_ila_0 (
    .clk(sys_clk),
    .probe0(sys_rst_n),
    .probe1(led),
    .probe2(cnt_2us),
    .probe3(cnt_2ms),
    .probe4(cnt_2s),
    .probe5(inc_dec_flag)
);

endmodule
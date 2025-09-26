module vendingmachine(
input clk,
input rst,
input [1:0] in,       // 01=5rs, 10=10rs
output reg out,       // Dispense item signal
output reg change5,   // Return 5 Rs change
output reg change10   // Return 10 Rs change
);

// Defining States
parameter s0 = 2'b00; // Reset state
parameter s1 = 2'b01; // 5 Rs state
parameter s2 = 2'b10; // 10 Rs state
parameter s3 = 2'b11; // 15 Rs state (Dispense)

reg [1:0] c_state, n_state;

always @(posedge clk or posedge rst) begin
if (rst) begin
// Reset all states and outputs
c_state   <= s0;
n_state   <= s0;
out       <= 0;
change5   <= 0;
change10  <= 0;
end
else begin
c_state <= n_state; // Update current state

// Reset change outputs each cycle
change5  <= 0;
change10 <= 0;
out      <= 0; // Default no dispense

case(c_state)
s0: begin // Reset State
if (in == 2'b00) begin
n_state <= s0;
end
else if (in == 2'b01) begin
// Insert 5 Rs
n_state <= s1;
end
else if (in == 2'b10) begin
// Insert 10 Rs
n_state <= s2;
end
end

s1: begin // 5 Rs Inserted
if (in == 2'b00) begin
n_state <= s1;
end
else if (in == 2'b01) begin
// Total 10 Rs
n_state <= s2;
end
else if (in == 2'b10) begin
// Total 15 Rs, dispense item
n_state  <= s0;
out      <= 1;
end
end

s2: begin // 10 Rs Inserted
if (in == 2'b00) begin
n_state <= s2;
end
else if (in == 2'b01) begin
// Total 15 Rs, dispense item
n_state  <= s0;
out      <= 1;
end
else if (in == 2'b10) begin
// Total 20 Rs, dispense item and return 5 Rs change
n_state  <= s0;
out      <= 1;
change5  <= 1;
end
end

s3: begin // 15 Rs Inserted, Dispense State
n_state <= s0;
out <= 1; // Dispense item
end
endcase
end
end
endmodule

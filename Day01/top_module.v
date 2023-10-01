module top_module (output Y, input A, B);
/******Gate Level Modeling*****/
and(Y,A,B);

/******Data-flow Level Modeling******/
// assign Y = A & B;

/******Behavioral Level Modeling******/
// reg Y;
// always @ (A or B) begin
//     if (A == 1'b1 & B == 1'b1) begin
//         Y = 1'b1;
//     end
//     else 
//         Y = 1'b0; 
// end
endmodule


/* HamidNE@mail.ru*/

module FullAdder(A, B, Cin, Sum, Cout);
	
	input A, B, Cin;
	output Sum, Cout;

	wire s1, s2, c1;

	xor (s1, A, B);
	and (c1, A, B);
	xor (Sum, s1, Cin);
	and (s2, s1, Cin);
	or (Cout, s2, c1);

endmodule

module Adder_8Bit(Input1, Input2, Sum, OverFlow);
	
	input [7:0] Input1, Input2;
	output [7:0] Sum;
	output OverFlow;

	wire [6:0]c;

	FullAdder FA0(Input1[0], Input2[0], 0, Sum[0], c[0]);
	FullAdder FA1(Input1[1], Input2[1], c[0], Sum[1], c[1]);
	FullAdder FA2(Input1[2], Input2[2], c[1], Sum[2], c[2]);
	FullAdder FA3(Input1[3], Input2[3], c[2], Sum[3], c[3]);
	FullAdder FA4(Input1[4], Input2[4], c[3], Sum[4], c[4]);
	FullAdder FA5(Input1[5], Input2[5], c[4], Sum[5], c[5]);
	FullAdder FA6(Input1[6], Input2[6], c[5], Sum[6], c[6]);
	FullAdder FA7(Input1[7], Input2[7], c[6], Sum[7], OverFlow);

endmodule

module Adder_16Bit(Input1, Input2, Sum, OverFlow, E);
	
	input E;
	input [15:0] Input1, Input2;
	output [15:0] Sum;
	output OverFlow;

	wire [14:0]c;

	FullAdder FA0(Input1[0], Input2[0], 0, Sum[0], c[0]);
	FullAdder FA1(Input1[1], Input2[1], c[0], Sum[1], c[1]);
	FullAdder FA2(Input1[2], Input2[2], c[1], Sum[2], c[2]);
	FullAdder FA3(Input1[3], Input2[3], c[2], Sum[3], c[3]);
	FullAdder FA4(Input1[4], Input2[4], c[3], Sum[4], c[4]);
	FullAdder FA5(Input1[5], Input2[5], c[4], Sum[5], c[5]);
	FullAdder FA6(Input1[6], Input2[6], c[5], Sum[6], c[6]);
	FullAdder FA7(Input1[7], Input2[7], c[6], Sum[7], c[7]);
	FullAdder FA8(Input1[8], Input2[8], c[7], Sum[8], c[8]);
	FullAdder FA9(Input1[9], Input2[9], c[8], Sum[9], c[9]);
	FullAdder FA10(Input1[10], Input2[10], c[9], Sum[10], c[10]);
	FullAdder FA11(Input1[11], Input2[11], c[10], Sum[11], c[11]);
	FullAdder FA12(Input1[12], Input2[12], c[11], Sum[12], c[12]);
	FullAdder FA13(Input1[13], Input2[13], c[12], Sum[13], c[13]);
	FullAdder FA14(Input1[14], Input2[14], c[13], Sum[14], c[14]);
	FullAdder FA15(Input1[15], Input2[15], c[14], Sum[15], OverFlow);

	and (OverFlow, OverFlow, E);
	AndByOne_16Bit AndGate(Sum, E, Sum);

endmodule

module Subtractor_16Bit(Input1, Input2, Sub, OverFlow, E);
	
	input E;
	input [15:0] Input1, Input2;
	output [15:0] Sub;
	output OverFlow;

	NOT_16Bit notasd(Input2, Input2);
	wire [14:0]c;

	FullAdder FA0(Input1[0], Input2[0], 1, Sub[0], c[0]);
	FullAdder FA1(Input1[1], Input2[1], c[0], Sub[1], c[1]);
	FullAdder FA2(Input1[2], Input2[2], c[1], Sub[2], c[2]);
	FullAdder FA3(Input1[3], Input2[3], c[2], Sub[3], c[3]);
	FullAdder FA4(Input1[4], Input2[4], c[3], Sub[4], c[4]);
	FullAdder FA5(Input1[5], Input2[5], c[4], Sub[5], c[5]);
	FullAdder FA6(Input1[6], Input2[6], c[5], Sub[6], c[6]);
	FullAdder FA7(Input1[7], Input2[7], c[6], Sub[7], c[7]);
	FullAdder FA8(Input1[8], Input2[8], c[7], Sub[8], c[8]);
	FullAdder FA9(Input1[9], Input2[9], c[8], Sub[9], c[9]);
	FullAdder FA10(Input1[10], Input2[10], c[9], Sub[10], c[10]);
	FullAdder FA11(Input1[11], Input2[11], c[10], Sub[11], c[11]);
	FullAdder FA12(Input1[12], Input2[12], c[11], Sub[12], c[12]);
	FullAdder FA13(Input1[13], Input2[13], c[12], Sub[13], c[13]);
	FullAdder FA14(Input1[14], Input2[14], c[13], Sub[14], c[14]);
	FullAdder FA15(Input1[15], Input2[15], c[14], Sub[15], OverFlow);

	AndByOne_16Bit AndGate(Sub, E, Sub);

endmodule

module AdderBy1(Input, Sum, OverFlow, E);
	
	input E;
	input [15:0] Input;
	output [15:0] Sum;
	output OverFlow;

	Adder_16Bit add(Input, 1, Sum, OverFlow);
	AndByOne_16Bit AndGate(Sum, E, Sum);

endmodule

module SubtractorBy1(Input, Sub, OverFlow, E);
	
	input E;
	input [15:0] Input;
	output [15:0] Sub;
	output OverFlow;

	Subtractor_16Bit sub(Input, 1, Sub, OverFlow);
	AndByOne_16Bit AndGate(Sub, E, Sub);

endmodule

module AndByOne_16Bit(Input, E, Output);

	input E;
	input [15:0] Input;
	output [15:0] Output;

	and (Output[0], Input[0], E);
	and (Output[1], Input[1], E);
	and (Output[2], Input[2], E);
	and (Output[3], Input[3], E);
	and (Output[4], Input[4], E);
	and (Output[5], Input[5], E);
	and (Output[6], Input[6], E);
	and (Output[7], Input[7], E);
	and (Output[8], Input[8], E);
	and (Output[9], Input[9], E);
	and (Output[10], Input[10], E);
	and (Output[11], Input[11], E);
	and (Output[12], Input[12], E);
	and (Output[13], Input[13], E);
	and (Output[14], Input[14], E);
	and (Output[15], Input[15], E);

endmodule

module AndByOne_8Bit(Input, E, Output);

	input E;
	input [7:0] Input;
	output [7:0] Output;

	and (Output[0], Input[0], E);
	and (Output[1], Input[1], E);
	and (Output[2], Input[2], E);
	and (Output[3], Input[3], E);
	and (Output[4], Input[4], E);
	and (Output[5], Input[5], E);
	and (Output[6], Input[6], E);
	and (Output[7], Input[7], E);

endmodule

module AND_16Bit(Input1, Input2, Output, E);
	
	input E;
	input [15:0] Input1, Input2;
	output [15:0] Output;

	and (Output[0], Input1[0], Input2[0]);
	and (Output[1], Input1[1], Input2[1]);
	and (Output[2], Input1[2], Input2[2]);
	and (Output[3], Input1[3], Input2[3]);
	and (Output[4], Input1[4], Input2[4]);
	and (Output[5], Input1[5], Input2[5]);
	and (Output[6], Input1[6], Input2[6]);
	and (Output[7], Input1[7], Input2[7]);
	and (Output[8], Input1[8], Input2[8]);
	and (Output[9], Input1[9], Input2[9]);
	and (Output[10], Input1[10], Input2[10]);
	and (Output[11], Input1[11], Input2[11]);
	and (Output[12], Input1[12], Input2[12]);
	and (Output[13], Input1[13], Input2[13]);
	and (Output[14], Input1[14], Input2[14]);
	and (Output[15], Input1[15], Input2[15]);

	AndByOne_16Bit AndGate(Output, E, Output);

endmodule

module OR_16Bit(Input1, Input2, Output, E);

	input E;
	input [15:0] Input1, Input2;
	output [15:0] Output;

	or (Output[0], Input1[0], Input2[0]);
	or (Output[1], Input1[1], Input2[1]);
	or (Output[2], Input1[2], Input2[2]);
	or (Output[3], Input1[3], Input2[3]);
	or (Output[4], Input1[4], Input2[4]);
	or (Output[5], Input1[5], Input2[5]);
	or (Output[6], Input1[6], Input2[6]);
	or (Output[7], Input1[7], Input2[7]);
	or (Output[8], Input1[8], Input2[8]);
	or (Output[9], Input1[9], Input2[9]);
	or (Output[10], Input1[10], Input2[10]);
	or (Output[11], Input1[11], Input2[11]);
	or (Output[12], Input1[12], Input2[12]);
	or (Output[13], Input1[13], Input2[13]);
	or (Output[14], Input1[14], Input2[14]);
	or (Output[15], Input1[15], Input2[15]);

	AndByOne_16Bit AndGate(Output, E, Output);

endmodule

module XOR_16Bit(Input1, Input2, Output, E);
	
	input E;
	input [15:0] Input1, Input2;
	output [15:0] Output;

	xor (Output[0], Input1[0], Input2[0]);
	xor (Output[1], Input1[1], Input2[1]);
	xor (Output[2], Input1[2], Input2[2]);
	xor (Output[3], Input1[3], Input2[3]);
	xor (Output[4], Input1[4], Input2[4]);
	xor (Output[5], Input1[5], Input2[5]);
	xor (Output[6], Input1[6], Input2[6]);
	xor (Output[7], Input1[7], Input2[7]);
	xor (Output[8], Input1[8], Input2[8]);
	xor (Output[9], Input1[9], Input2[9]);
	xor (Output[10], Input1[10], Input2[10]);
	xor (Output[11], Input1[11], Input2[11]);
	xor (Output[12], Input1[12], Input2[12]);
	xor (Output[13], Input1[13], Input2[13]);
	xor (Output[14], Input1[14], Input2[14]);
	xor (Output[15], Input1[15], Input2[15]);

	AndByOne_16Bit AndGate(Output, E, Output);

endmodule

module NOT_16Bit(Input, Output, E);
	
	input E;
	input [15:0] Input;
	output [15:0] Output;

	not (Output[0], Input[0]);
	not (Output[1], Input[1]);
	not (Output[2], Input[2]);
	not (Output[3], Input[3]);
	not (Output[4], Input[4]);
	not (Output[5], Input[5]);
	not (Output[6], Input[6]);
	not (Output[7], Input[7]);
	not (Output[8], Input[8]);
	not (Output[9], Input[9]);
	not (Output[10], Input[10]);
	not (Output[11], Input[11]);
	not (Output[12], Input[12]);
	not (Output[13], Input[13]);
	not (Output[14], Input[14]);
	not (Output[15], Input[15]);

	AndByOne_16Bit AndGate(Output, E, Output);

endmodule

module NOT_32Bit(Input, Output);
	
	input [31:0] Input;
	output [31:0] Output;

	not (Output[0], Input[0]);
	not (Output[1], Input[1]);
	not (Output[2], Input[2]);
	not (Output[3], Input[3]);
	not (Output[4], Input[4]);
	not (Output[5], Input[5]);
	not (Output[6], Input[6]);
	not (Output[7], Input[7]);
	not (Output[8], Input[8]);
	not (Output[9], Input[9]);
	not (Output[10], Input[10]);
	not (Output[11], Input[11]);
	not (Output[12], Input[12]);
	not (Output[13], Input[13]);
	not (Output[14], Input[14]);
	not (Output[15], Input[15]);

	not (Output[16], Input[16]);
	not (Output[17], Input[17]);
	not (Output[18], Input[18]);
	not (Output[19], Input[19]);
	not (Output[20], Input[20]);
	not (Output[21], Input[21]);
	not (Output[22], Input[22]);
	not (Output[23], Input[23]);
	not (Output[24], Input[24]);
	not (Output[25], Input[25]);
	not (Output[26], Input[26]);
	not (Output[27], Input[27]);
	not (Output[28], Input[28]);
	not (Output[29], Input[29]);
	not (Output[30], Input[30]);
	not (Output[31], Input[31]);

endmodule

module DEMUX_32_1(Select, E, Out);
	
	input E;
	input [4:0] Select;
	output [31:0] Out;

	wire [31:0] NotSelect;

	NOT_32Bit NOTGate32Bit(Select, NotSelect);

	and (Out[0], NotSelect[4], NotSelect[3], NotSelect[2], NotSelect[1], NotSelect[0], E);
	and (Out[1], NotSelect[4], NotSelect[3], NotSelect[2], NotSelect[1], Select[0], E);
	and (Out[2], NotSelect[4], NotSelect[3], NotSelect[2], Select[1], NotSelect[0], E);
	and (Out[3], NotSelect[4], NotSelect[3], NotSelect[2], Select[1], Select[0], E);
	and (Out[4], NotSelect[4], NotSelect[3], Select[2], NotSelect[1], NotSelect[0], E);
	and (Out[5], NotSelect[4], NotSelect[3], Select[2], NotSelect[1], Select[0], E);
	and (Out[6], NotSelect[4], NotSelect[3], Select[2], Select[1], NotSelect[0], E);
	and (Out[7], NotSelect[4], NotSelect[3], Select[2], Select[1], Select[0], E);

	and (Out[8], NotSelect[4], Select[3], NotSelect[2], NotSelect[1], NotSelect[0], E);
	and (Out[9], NotSelect[4], Select[3], NotSelect[2], NotSelect[1], Select[0], E);
	and (Out[10], NotSelect[4], Select[3], NotSelect[2], Select[1], NotSelect[0], E);
	and (Out[11], NotSelect[4], Select[3], NotSelect[2], Select[1], Select[0], E);
	and (Out[12], NotSelect[4], Select[3], Select[2], NotSelect[1], NotSelect[0], E);
	and (Out[13], NotSelect[4], Select[3], Select[2], NotSelect[1], Select[0], E);
	and (Out[14], NotSelect[4], Select[3], Select[2], Select[1], NotSelect[0], E);
	and (Out[15], NotSelect[4], Select[3], Select[2], Select[1], Select[0], E);

	and (Out[16], Select[4], NotSelect[3], NotSelect[2], NotSelect[1], NotSelect[0], E);
	and (Out[17], Select[4], NotSelect[3], NotSelect[2], NotSelect[1], Select[0], E);
	and (Out[18], Select[4], NotSelect[3], NotSelect[2], Select[1], NotSelect[0], E);
	and (Out[19], Select[4], NotSelect[3], NotSelect[2], Select[1], Select[0], E);
	and (Out[20], Select[4], NotSelect[3], Select[2], NotSelect[1], NotSelect[0], E);
	and (Out[21], Select[4], NotSelect[3], Select[2], NotSelect[1], Select[0], E);
	and (Out[22], Select[4], NotSelect[3], Select[2], Select[1], NotSelect[0], E);
	and (Out[23], Select[4], NotSelect[3], Select[2], Select[1], Select[0], E);

	and (Out[24], Select[4], Select[3], NotSelect[2], NotSelect[1], NotSelect[0], E);
	and (Out[25], Select[4], Select[3], NotSelect[2], NotSelect[1], Select[0], E);
	and (Out[26], Select[4], Select[3], NotSelect[2], Select[1], NotSelect[0], E);
	and (Out[27], Select[4], Select[3], NotSelect[2], Select[1], Select[0], E);
	and (Out[28], Select[4], Select[3], Select[2], NotSelect[1], NotSelect[0], E);
	and (Out[29], Select[4], Select[3], Select[2], NotSelect[1], Select[0], E);
	and (Out[30], Select[4], Select[3], Select[2], Select[1], NotSelect[0], E);
	and (Out[31], Select[4], Select[3], Select[2], Select[1], Select[0], E);
	
endmodule

module rooting(Input, Cin, Output);

	input [7:0]Input;
	input Cin;
	output [7:0]Output;

	assign Output[0] = Input[1];
	assign Output[1] = Input[2];
	assign Output[2] = Input[3];
	assign Output[3] = Input[4];
	assign Output[4] = Input[5];
	assign Output[5] = Input[6];
	assign Output[6] = Input[7];
	assign Output[7] = Cin;

endmodule

module SRA(Input, Output, Rotate, E);

	input Rotate, E;
	input [15:0] Input;
	output [15:0] Output;
	wire last;
	and(last, Rotate, Input[0]);

	assign Output[0] = Input[1];
	assign Output[1] = Input[2];
	assign Output[2] = Input[3];
	assign Output[3] = Input[4];
	assign Output[4] = Input[5];
	assign Output[5] = Input[6];
	assign Output[6] = Input[7];
	assign Output[7] = Input[8];
	assign Output[8] = Input[9];
	assign Output[9] = Input[10];
	assign Output[10] = Input[11];
	assign Output[11] = Input[12];
	assign Output[12] = Input[13];
	assign Output[13] = Input[14];
	assign Output[14] = Input[15];
	assign Output[15] = last;

endmodule

module SLA(Input, Output, Rotate, E);

	input Rotate, E;
	input [15:0] Input;
	output [15:0] Output;
	wire first;
	and(first, Rotate, Input[15]);

	assign Output[0] = first;
	assign Output[1] = Input[0];
	assign Output[2] = Input[1];
	assign Output[3] = Input[2];
	assign Output[4] = Input[3];
	assign Output[5] = Input[4];
	assign Output[6] = Input[5];
	assign Output[7] = Input[6];
	assign Output[8] = Input[7];
	assign Output[9] = Input[8];
	assign Output[10] = Input[9];
	assign Output[11] = Input[10];
	assign Output[12] = Input[11];
	assign Output[13] = Input[12];
	assign Output[14] = Input[13];
	assign Output[15] = Input[14];

endmodule

module Multiplier_16Bit(Input1, Input2, Output, E);
	
	input E;
	input [7:0] Input1, Input2;
	output [15:0] Output;

	wire [7:0] w0, w1, w2, w3, w4, w5, w6, w7;

	AndByOne_8Bit and0(Input2, Input1[0], w0);
	AndByOne_8Bit and1(Input2, Input1[1], w1);
	AndByOne_8Bit and2(Input2, Input1[2], w2);
	AndByOne_8Bit and3(Input2, Input1[3], w3);
	AndByOne_8Bit and4(Input2, Input1[4], w4);
	AndByOne_8Bit and5(Input2, Input1[5], w5);
	AndByOne_8Bit and6(Input2, Input1[6], w6);
	AndByOne_8Bit and7(Input2, Input1[7], w7);

	wire [7:0]temp;

	wire [7:0]sum0;
	wire [7:0]sum1;
	wire [7:0]sum2;
	wire [7:0]sum3;
	wire [7:0]sum4;
	wire [7:0]sum5;
	wire [7:0]sum6;
	wire [7:0]sum7;

	wire [7:0]root0;
	wire [7:0]root1;
	wire [7:0]root2;
	wire [7:0]root3;
	wire [7:0]root4;
	wire [7:0]root5;
	wire [7:0]root6;
	wire [7:0]root7;

	wire carry0;
	wire carry1;
	wire carry2;
	wire carry3;
	wire carry4;
	wire carry5;
	wire carry6;
	wire carry7;

	rooting rooting0(w0, 0, root0);
	Adder_8Bit add0(w1, root0, sum0, carry0);
	assign Output[0] = root0[0];
	assign Output[1] = sum0[0];

	rooting rooting1(sum0, carry0, root1);
	Adder_8Bit add1(w2, root1, sum1, carry1);
	assign Output[2] = sum1[0];

	rooting rooting2(sum1, carry1, root2);
	Adder_8Bit add2(w3, root2, sum2, carry2);
	assign Output[3] = sum2[0];

	rooting rooting3(sum2, carry2, root3);
	Adder_8Bit add3(w4, root3, sum3, carry3);
	assign Output[4] = sum3[0];

	rooting rooting4(sum3, carry3, root4);
	Adder_8Bit add4(w5, root4, sum4, carry4);
	assign Output[5] = sum4[0];

	rooting rooting5(sum4, carry4, root5);
	Adder_8Bit add5(w6, root5, sum5, carry5);
	assign Output[6] = sum5[0];

	rooting rooting6(sum5, carry5, root6);
	Adder_8Bit add6(w7, root6, sum6, carry6);
	assign Output[7] = sum6[0];
	assign Output[8] = sum6[1];
	assign Output[9] = sum6[2];
	assign Output[10] = sum6[3];
	assign Output[11] = sum6[4];
	assign Output[12] = sum6[5];
	assign Output[13] = sum6[6];
	assign Output[14] = sum6[7];
	assign Output[15] = carry6;

endmodule

module ALU_16Bit(Input1, Input2, Select, Output, Rotate, E);
	
	input Rotate, E;
	input [15:0] Input1, Input2;
	input [4:0] Select;
	output [15:0] Output;

	wire [31:0] EnableWire;

	wire [15:0] Output0;
	wire [15:0] Output1;
	wire [15:0] Output2;
	wire [15:0] Output3;

	wire [15:0] Output4;
	wire [15:0] Output5;
	wire [15:0] Output6;
	wire [15:0] Output7;

	wire [15:0] Output8;
	wire [15:0] Output9;
	wire [15:0] Output10;
	wire [15:0] Output11;

	wire [15:0] Output16;
	wire [15:0] Output17;
	wire [15:0] Output18;
	wire [15:0] Output19;

	wire [15:0] Output24;
	wire [15:0] Output25;
	wire [15:0] Output26;
	wire [15:0] Output27;

	DEMUX_32_1 DeMux(Select, E, EnableWire);

	Adder_16Bit adder(Input1, Input2, Output0, EnableWire[0]);
	AdderBy1 adderByOne(Input1, Input2, Output1, EnableWire[1]);
	Subtractor_16Bit sub(Input1, Input2, Output2, EnableWire[2]);
	SubtractorBy1 subByOne(Input1, Input2, Output3, EnableWire[3]);

	Multiplier_16Bit mul1(Input1, Input2, Output4, EnableWire[4]);
	Multiplier_16Bit mul2(Input1, Input2, Output5, EnableWire[5]);
	Multiplier_16Bit mul3(Input1, Input2, Output6, EnableWire[6]);
	Multiplier_16Bit mul4(Input1, Input2, Output7, EnableWire[7]);

	SRA sra1(Input1, Output8, Rotate, EnableWire[8]);
	SRA sra2(Input1, Output9, Rotate, EnableWire[9]);
	SRA sra3(Input1, Output10, Rotate, EnableWire[10]);
	SRA sra4(Input1, Output11, Rotate, EnableWire[11]);

	AND_16Bit and16(Input1, Input2, Output16, EnableWire[16]);
	XOR_16Bit xor16(Input1, Input2, Output17, EnableWire[17]);
	OR_16Bit or16(Input1, Input2, Output18, EnableWire[18]);
	NOT_16Bit not16(Input1, Input2, Output19, EnableWire[19]);

	SLA sla1(Input1, Output24, Rotate, EnableWire[24]);
	SLA sla2(Input1, Output25, Rotate, EnableWire[25]);
	SLA sla3(Input1, Output26, Rotate, EnableWire[26]);
	SLA sla4(Input1, Output27, Rotate, EnableWire[27]);

	or(Output[0], Output1[0], Output2[0], Output3[0], Output4[0], Output5[0], Output6[0], Output7[0], Output8[0], Output9[0], Output10[0], Output11[0], Output16[0], Output17[0], Output18[0], Output19[0], Output24[0], Output25[0], Output26[0], Output27[0]);
	or(Output[1], Output1[1], Output2[1], Output3[1], Output4[1], Output5[1], Output6[1], Output7[1], Output8[1], Output9[1], Output10[1], Output11[1], Output16[1], Output17[1], Output18[1], Output19[1], Output24[1], Output25[1], Output26[1], Output27[1]);
	or(Output[2], Output1[2], Output2[2], Output3[2], Output4[2], Output5[2], Output6[2], Output7[2], Output8[2], Output9[2], Output10[2], Output11[2], Output16[2], Output17[2], Output18[2], Output19[2], Output24[2], Output25[2], Output26[2], Output27[2]);
	or(Output[3], Output1[3], Output2[3], Output3[3], Output4[3], Output5[3], Output6[3], Output7[3], Output8[3], Output9[3], Output10[3], Output11[3], Output16[3], Output17[3], Output18[3], Output19[3], Output24[3], Output25[3], Output26[3], Output27[3]);
	or(Output[4], Output1[4], Output2[4], Output3[4], Output4[4], Output5[4], Output6[4], Output7[4], Output8[4], Output9[4], Output10[4], Output11[4], Output16[4], Output17[4], Output18[4], Output19[4], Output24[4], Output25[4], Output26[4], Output27[4]);
	or(Output[5], Output1[5], Output2[5], Output3[5], Output4[5], Output5[5], Output6[5], Output7[5], Output8[5], Output9[5], Output10[5], Output11[5], Output16[5], Output17[5], Output18[5], Output19[5], Output24[5], Output25[5], Output26[5], Output27[5]);
	or(Output[6], Output1[6], Output2[6], Output3[6], Output4[6], Output5[6], Output6[6], Output7[6], Output8[6], Output9[6], Output10[6], Output11[6], Output16[6], Output17[6], Output18[6], Output19[6], Output24[6], Output25[6], Output26[6], Output27[6]);
	or(Output[7], Output1[7], Output2[7], Output3[7], Output4[7], Output5[7], Output6[7], Output7[7], Output8[7], Output9[7], Output10[7], Output11[7], Output16[7], Output17[7], Output18[7], Output19[7], Output24[7], Output25[7], Output26[7], Output27[7]);
	or(Output[8], Output1[8], Output2[8], Output3[8], Output4[8], Output5[8], Output6[8], Output7[8], Output8[8], Output9[8], Output10[8], Output11[8], Output16[8], Output17[8], Output18[8], Output19[8], Output24[8], Output25[8], Output26[8], Output27[8]);
	or(Output[9], Output1[9], Output2[9], Output3[9], Output4[9], Output5[9], Output6[9], Output7[9], Output8[9], Output9[9], Output10[9], Output11[9], Output16[9], Output17[9], Output18[9], Output19[9], Output24[9], Output25[9], Output26[9], Output27[9]);
	or(Output[10], Output1[10], Output2[10], Output3[10], Output4[10], Output5[10], Output6[10], Output7[10], Output8[10], Output9[10], Output10[10], Output11[10], Output16[10], Output17[10], Output18[10], Output19[10], Output24[10], Output25[10], Output26[10], Output27[10]);
	or(Output[11], Output1[11], Output2[11], Output3[11], Output4[11], Output5[11], Output6[11], Output7[11], Output8[11], Output9[11], Output10[11], Output11[11], Output16[11], Output17[11], Output18[11], Output19[11], Output24[11], Output25[11], Output26[11], Output27[11]);
	or(Output[12], Output1[12], Output2[12], Output3[12], Output4[12], Output5[12], Output6[12], Output7[12], Output8[12], Output9[12], Output10[12], Output11[12], Output16[12], Output17[12], Output18[12], Output19[12], Output24[12], Output25[12], Output26[12], Output27[12]);
	or(Output[13], Output1[13], Output2[13], Output3[13], Output4[13], Output5[13], Output6[13], Output7[13], Output8[13], Output9[13], Output10[13], Output11[13], Output16[13], Output17[13], Output18[13], Output19[13], Output24[13], Output25[13], Output26[13], Output27[13]);
	or(Output[14], Output1[14], Output2[14], Output3[14], Output4[14], Output5[14], Output6[14], Output7[14], Output8[14], Output9[14], Output10[14], Output11[14], Output16[14], Output17[14], Output18[14], Output19[14], Output24[14], Output25[14], Output26[14], Output27[14]);
	or(Output[15], Output1[15], Output2[15], Output3[15], Output4[15], Output5[15], Output6[15], Output7[15], Output8[15], Output9[15], Output10[15], Output11[15], Output16[15], Output17[15], Output18[15], Output19[15], Output24[15], Output25[15], Output26[15], Output27[15]);
	
endmodule

module main(Input1, Input2, Select, Output, Rotate, E);

	input Rotate, E;
	input [15:0] Input1, Input2;
	input [4:0] Select;
	output [15:0] Output;

	ALU_16Bit alu(Input1, Input2, Select, Output, Rotate, E);

endmodule
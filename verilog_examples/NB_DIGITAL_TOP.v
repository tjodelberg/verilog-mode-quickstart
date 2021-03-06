module NB_DIGITAL_TOP(
		//PADS
		SS,		    //i
		SCLK,		//i
		MOSI,		//i
		MISO,		//o
		START_FFT,	//i
		DATA_READY,	//o
		RESETn,		//i
		WAKEUP,		//o
		CLK,		//i

		//ADC
		ADC_I,
		ADC_Q,

		//CHIP IO
		LNA_REG_1,
		LNA_REG_2,
		LC_VCO_REG,
		XO_DRIVER_REG,
		CP_REG_1,
		CP_REG_2,
		AMP_POLY_PHASE_REG_1,
		AMP_POLY_PHASE_REG_2,
		AMP_POLY_PHASE_REG_3,
		AMP_POLY_PHASE_REG_4,
		PGA_STAGE1_REG,
		BIQUAD_STAGE1_REG_1,
		BIQUAD_STAGE1_REG_2,
		BIQUAD_STAGE1_REG_3,
		BIQUAD_STAGE2_REG_1,
		BIQUAD_STAGE2_REG_2,
		BIQUAD_STAGE2_REG_3,
		PGA_STAGE2_REG,
		PGA_CMFB_REG_1,
		PGA_CMFB_REG_2,
		DSM_REG_1,
		DSM_REG_2,
		DSM_REG_3,
		DSM_REG_4,
		DSM_REG_5,
		DSM_REG_6,
		IO_AMP_REG,
		MIRROR_REG_1,
		MIRROR_REG_2,
		ADC_REG_1,
		ADC_REG_2,
		ADC_REG_3,
		ADC_REG_4,
		EXTRA_REG_1,
		EXTRA_REG_2

);
//IO
input SS;
input SCLK;
input MOSI;
output reg MISO;
input START_FFT;
output reg DATA_READY;
input RESETn;
output reg WAKEUP;
input CLK;

output reg [19:0] LNA_REG_1;
output reg [19:0] LNA_REG_2;
output reg [19:0] LC_VCO_REG;
output reg [19:0] XO_DRIVER_REG;
output reg [19:0] CP_REG_1;
output reg [19:0] CP_REG_2;
output reg [19:0] AMP_POLY_PHASE_REG_1;
output reg [19:0] AMP_POLY_PHASE_REG_2;
output reg [19:0] AMP_POLY_PHASE_REG_3;
output reg [19:0] AMP_POLY_PHASE_REG_4;
output reg [19:0] PGA_STAGE1_REG;
output reg [19:0] BIQUAD_STAGE1_REG_1;
output reg [19:0] BIQUAD_STAGE1_REG_2;
output reg [19:0] BIQUAD_STAGE1_REG_3;
output reg [19:0] BIQUAD_STAGE2_REG_1;
output reg [19:0] BIQUAD_STAGE2_REG_2;
output reg [19:0] BIQUAD_STAGE2_REG_3;
output reg [19:0] PGA_STAGE2_REG;
output reg [19:0] PGA_CMFB_REG_1;
output reg [19:0] PGA_CMFB_REG_2;
output reg [19:0] DSM_REG_1;
output reg [19:0] DSM_REG_2;
output reg [19:0] DSM_REG_3;
output reg [19:0] DSM_REG_4;
output reg [19:0] DSM_REG_5;
output reg [19:0] DSM_REG_6;
output reg [19:0] IO_AMP_REG;
output reg [19:0] MIRROR_REG_1;
output reg [19:0] MIRROR_REG_2;
output reg [19:0] ADC_REG_1;
output reg [19:0] ADC_REG_2;
output reg [19:0] ADC_REG_3;
output reg [19:0] ADC_REG_4;
output reg [19:0] EXTRA_REG_1;
output reg [19:0] EXTRA_REG_2;

input [9:0] ADC_I;
input [9:0] ADC_Q;




//LOCAL REG
reg [9:0] I1_OUT;
reg [9:0] I2_OUT;
reg [9:0] I3_OUT;
reg [9:0] I4_OUT;
reg [9:0] I5_OUT;
reg [9:0] I6_OUT;
reg [9:0] I7_OUT;
reg [9:0] I8_OUT;
reg [9:0] I9_OUT;
reg [9:0] I10_OUT;
reg [9:0] I11_OUT;
reg [9:0] I12_OUT;
reg [9:0] Q1_OUT;
reg [9:0] Q2_OUT;
reg [9:0] Q3_OUT;
reg [9:0] Q4_OUT;
reg [9:0] Q5_OUT;
reg [9:0] Q6_OUT;
reg [9:0] Q7_OUT;
reg [9:0] Q8_OUT;
reg [9:0] Q9_OUT;
reg [9:0] Q10_OUT;
reg [9:0] Q11_OUT;
reg [9:0] Q12_OUT;
reg [19:0] FI0;
reg [19:0] FI1;
reg [19:0] FI2;
reg [19:0] FI3;
reg [19:0] FI4;
reg [19:0] FI5;
reg [19:0] FI6;
reg [19:0] FI7;
reg [19:0] FI8;
reg [19:0] FI9;
reg [19:0] FI10;
reg [19:0] FI11;
reg [19:0] FQ0;
reg [19:0] FQ1;
reg [19:0] FQ2;
reg [19:0] FQ3;
reg [19:0] FQ4;
reg [19:0] FQ5;
reg [19:0] FQ6;
reg [19:0] FQ7;
reg [19:0] FQ8;
reg [19:0] FQ9;
reg [19:0] FQ10;
reg [19:0] FQ11;
reg [19:0] FINAL_DATA_OUT1; //Truncate 50_24 to [49:30]
reg [19:0] FINAL_DATA_OUT2; //                  [29:10]

reg [19:0] ZCI_0_WRITE;  
reg [19:0] ZCQ_0_WRITE;
reg [19:0] ZCI_1_WRITE;
reg [19:0] ZCQ_1_WRITE;
reg [19:0] ZCI_2_WRITE;
reg [19:0] ZCQ_2_WRITE;
reg [19:0] ZCI_3_WRITE;
reg [19:0] ZCQ_3_WRITE;
reg [19:0] ZCI_4_WRITE;
reg [19:0] ZCQ_4_WRITE;
reg [19:0] ZCI_5_WRITE;
reg [19:0] ZCQ_5_WRITE;
reg [19:0] ZCI_6_WRITE;
reg [19:0] ZCQ_6_WRITE;
reg [19:0] ZCI_7_WRITE;
reg [19:0] ZCQ_7_WRITE;
reg [19:0] ZCI_8_WRITE;
reg [19:0] ZCQ_8_WRITE;
reg [19:0] ZCI_9_WRITE;
reg [19:0] ZCQ_9_WRITE;
reg [19:0] ZCI_10_WRITE;
reg [19:0] ZCQ_10_WRITE;
reg [19:0] ZCI_11_WRITE;
reg [19:0] ZCQ_11_WRITE;

reg [19:0] ZCI_0_READ;  
reg [19:0] ZCQ_0_READ;
reg [19:0] ZCI_1_READ;
reg [19:0] ZCQ_1_READ;
reg [19:0] ZCI_2_READ;
reg [19:0] ZCQ_2_READ;
reg [19:0] ZCI_3_READ;
reg [19:0] ZCQ_3_READ;
reg [19:0] ZCI_4_READ;
reg [19:0] ZCQ_4_READ;
reg [19:0] ZCI_5_READ;
reg [19:0] ZCQ_5_READ;
reg [19:0] ZCI_6_READ;
reg [19:0] ZCQ_6_READ;
reg [19:0] ZCI_7_READ;
reg [19:0] ZCQ_7_READ;
reg [19:0] ZCI_8_READ;
reg [19:0] ZCQ_8_READ;
reg [19:0] ZCI_9_READ;
reg [19:0] ZCQ_9_READ;
reg [19:0] ZCI_10_READ;
reg [19:0] ZCQ_10_READ;
reg [19:0] ZCI_11_READ;
reg [19:0] ZCQ_11_READ;

reg [3:0] R_SEL;
reg [19:0] LOAD;
reg [19:0] W_SEL;
reg [19:0] DECIMATE_FACTOR_REG;
reg [19:0] THRESH_REG_1;
reg [19:0] THRESH_REG_2;

reg READ;




		//MODULES

		//NB_DSP_TOP
		//NB_SPI_FINAL
		//NB_WUS_LUT

		NB_DSP_TOP nb_dsp1(
				.CLK(CLK),
				.RESETn(START_FFT),
				.DATA_READY(DATA_READY),
				.WAKEUP(WAKEUP),
				.I_IN(ADC_I),
				.Q_IN(ADC_Q),

				.decimate_factor(DECIMATE_FACTOR_REG[2:0]),
				.THRESH_reg1(THRESH_REG_1),
				.THRESH_reg2(THRESH_REG_2),

				.I1_OUT(I1_OUT),
				.I2_OUT(I2_OUT),
				.I3_OUT(I3_OUT),
				.I4_OUT(I4_OUT),
				.I5_OUT(I5_OUT),
				.I6_OUT(I6_OUT),
				.I7_OUT(I7_OUT),
				.I8_OUT(I8_OUT),
				.I9_OUT(I9_OUT),
				.I10_OUT(I10_OUT),        
				.I11_OUT(I11_OUT),        
				.I12_OUT(I12_OUT),        
				.Q1_OUT(Q1_OUT),
				.Q2_OUT(Q2_OUT),
				.Q3_OUT(Q3_OUT),
				.Q4_OUT(Q4_OUT),
				.Q5_OUT(Q5_OUT),
				.Q6_OUT(Q6_OUT),
				.Q7_OUT(Q7_OUT),
				.Q8_OUT(Q8_OUT),
				.Q9_OUT(Q9_OUT),
				.Q10_OUT(Q10_OUT),        
				.Q11_OUT(Q11_OUT),        
				.Q12_OUT(Q12_OUT),        
				.FI0(FI0),
				.FI1(FI1),
				.FI2(FI2),
				.FI3(FI3),
				.FI4(FI4),
				.FI5(FI5),
				.FI6(FI6),
				.FI7(FI7),
				.FI8(FI8),
				.FI9(FI9),
				.FI10(FI10),
				.FI11(FI11),
				.FQ0(FQ0),
				.FQ1(FQ1),
				.FQ2(FQ2),
				.FQ3(FQ3),
				.FQ4(FQ4),
				.FQ5(FQ5),
				.FQ6(FQ6),
				.FQ7(FQ7),
				.FQ8(FQ8),
				.FQ9(FQ9),
				.FQ10(FQ10),
				.FQ11(FQ11),
				.FINAL_DATA_OUT1(FINAL_DATA_OUT1),
				.FINAL_DATA_OUT2(FINAL_DATA_OUT2),

				.ZCI_0_READ(ZCI_0_READ),
				.ZCQ_0_READ(ZCQ_0_READ),
				.ZCI_1_READ(ZCI_1_READ),
				.ZCQ_1_READ(ZCQ_1_READ),
				.ZCI_2_READ(ZCI_2_READ),
				.ZCQ_2_READ(ZCQ_2_READ),
				.ZCI_3_READ(ZCI_3_READ),
				.ZCQ_3_READ(ZCQ_3_READ),
				.ZCI_4_READ(ZCI_4_READ),
				.ZCQ_4_READ(ZCQ_4_READ),
				.ZCI_5_READ(ZCI_5_READ),
				.ZCQ_5_READ(ZCQ_5_READ),
				.ZCI_6_READ(ZCI_6_READ),
				.ZCQ_6_READ(ZCQ_6_READ),
				.ZCI_7_READ(ZCI_7_READ),
				.ZCQ_7_READ(ZCQ_7_READ),
				.ZCI_8_READ(ZCI_8_READ),
				.ZCQ_8_READ(ZCQ_8_READ),
				.ZCI_9_READ(ZCI_9_READ),
				.ZCQ_9_READ(ZCQ_9_READ),
				.ZCI_10_READ(ZCI_10_READ),
				.ZCQ_10_READ(ZCQ_10_READ),
				.ZCI_11_READ(ZCI_11_READ),
				.ZCQ_11_READ(ZCQ_11_READ),
                                .RESETn_FFT(READ),
				.R_SEL(R_SEL)

	);


	NB_SPI_FINAL sp1 (
			.SS(SS),
			.SCLK(SCLK),
			.MOSI(MOSI),
			.MISO(MISO),
			.resetn(RESETn),

			.I1_OUT({10'd0, I1_OUT}),
			.I2_OUT({10'd0, I2_OUT}),
			.I3_OUT({10'd0, I3_OUT}),
			.I4_OUT({10'd0, I4_OUT}),
			.I5_OUT({10'd0, I5_OUT}),
			.I6_OUT({10'd0, I6_OUT}),
			.I7_OUT({10'd0, I7_OUT}),
			.I8_OUT({10'd0, I8_OUT}),
			.I9_OUT({10'd0, I9_OUT}),
			.I10_OUT({10'd0, I10_OUT}),        
			.I11_OUT({10'd0, I11_OUT}),        
			.I12_OUT({10'd0, I12_OUT}),        
			.Q1_OUT({10'd0, Q1_OUT}),
			.Q2_OUT({10'd0, Q2_OUT}),
			.Q3_OUT({10'd0, Q3_OUT}),
			.Q4_OUT({10'd0, Q4_OUT}),
			.Q5_OUT({10'd0, Q5_OUT}),
			.Q6_OUT({10'd0, Q6_OUT}),
			.Q7_OUT({10'd0, Q7_OUT}),
			.Q8_OUT({10'd0, Q8_OUT}),
			.Q9_OUT({10'd0, Q9_OUT}),
			.Q10_OUT({10'd0, Q10_OUT}),        
			.Q11_OUT({10'd0, Q11_OUT}),        
			.Q12_OUT({10'd0, Q12_OUT}),        
			.FI0(FI0),
			.FI1(FI1),
			.FI2(FI2),
			.FI3(FI3),
			.FI4(FI4),
			.FI5(FI5),
			.FI6(FI6),
			.FI7(FI7),
			.FI8(FI8),
			.FI9(FI9),
			.FI10(FI10),
			.FI11(FI11),
			.FQ0(FQ0),
			.FQ1(FQ1),
			.FQ2(FQ2),
			.FQ3(FQ3),
			.FQ4(FQ4),
			.FQ5(FQ5),
			.FQ6(FQ6),
			.FQ7(FQ7),
			.FQ8(FQ8),
			.FQ9(FQ9),
			.FQ10(FQ10),
			.FQ11(FQ11),
			.FINAL_DATA_OUT1(FINAL_DATA_OUT1),
			.FINAL_DATA_OUT2(FINAL_DATA_OUT2),

			.LNA_REG_1(LNA_REG_1),
			.LNA_REG_2(LNA_REG_2),
			.LC_VCO_REG(LC_VCO_REG),
			.XO_DRIVER_REG(XO_DRIVER_REG),
			.CP_REG_1(CP_REG_1),
			.CP_REG_2(CP_REG_2),
			.AMP_POLY_PHASE_REG_1(AMP_POLY_PHASE_REG_1),
			.AMP_POLY_PHASE_REG_2(AMP_POLY_PHASE_REG_2),
			.AMP_POLY_PHASE_REG_3(AMP_POLY_PHASE_REG_3),
			.AMP_POLY_PHASE_REG_4(AMP_POLY_PHASE_REG_4),
			.PGA_STAGE1_REG(PGA_STAGE1_REG),
			.BIQUAD_STAGE1_REG_1(BIQUAD_STAGE1_REG_1),  
			.BIQUAD_STAGE1_REG_2(BIQUAD_STAGE1_REG_2),
			.BIQUAD_STAGE1_REG_3(BIQUAD_STAGE1_REG_3),
			.BIQUAD_STAGE2_REG_1(BIQUAD_STAGE2_REG_1),
			.BIQUAD_STAGE2_REG_2(BIQUAD_STAGE2_REG_2),
			.BIQUAD_STAGE2_REG_3(BIQUAD_STAGE2_REG_3),
			.PGA_STAGE2_REG(PGA_STAGE2_REG),
			.PGA_CMFB_REG_1(PGA_CMFB_REG_1),
			.PGA_CMFB_REG_2(PGA_CMFB_REG_2),
			.DSM_REG_1(DSM_REG_1),
			.DSM_REG_2(DSM_REG_2),
			.DSM_REG_3(DSM_REG_3),
			.DSM_REG_4(DSM_REG_4),
			.DSM_REG_5(DSM_REG_5),
			.DSM_REG_6(DSM_REG_6),
			.IO_AMP_REG(IO_AMP_REG),
			.MIRROR_REG_1(MIRROR_REG_1),
			.MIRROR_REG_2(MIRROR_REG_2),
			.ADC_REG_1(ADC_REG_1),
			.ADC_REG_2(ADC_REG_2),
			.ADC_REG_3(ADC_REG_3),
			.ADC_REG_4(ADC_REG_4), 
			.EXTRA_REG_1(EXTRA_REG_1),   
			.EXTRA_REG_2(EXTRA_REG_2),
			.ZCI_0_WRITE(ZCI_0_WRITE),
			.ZCQ_0_WRITE(ZCQ_0_WRITE),
			.ZCI_1_WRITE(ZCI_1_WRITE),
			.ZCQ_1_WRITE(ZCQ_1_WRITE),
			.ZCI_2_WRITE(ZCI_2_WRITE),
			.ZCQ_2_WRITE(ZCQ_2_WRITE),
			.ZCI_3_WRITE(ZCI_3_WRITE),
			.ZCQ_3_WRITE(ZCQ_3_WRITE),
			.ZCI_4_WRITE(ZCI_4_WRITE),
			.ZCQ_4_WRITE(ZCQ_4_WRITE),
			.ZCI_5_WRITE(ZCI_5_WRITE),
			.ZCQ_5_WRITE(ZCQ_5_WRITE),
			.ZCI_6_WRITE(ZCI_6_WRITE),
			.ZCQ_6_WRITE(ZCQ_6_WRITE),
			.ZCI_7_WRITE(ZCI_7_WRITE),
			.ZCQ_7_WRITE(ZCQ_7_WRITE),
			.ZCI_8_WRITE(ZCI_8_WRITE),
			.ZCQ_8_WRITE(ZCQ_8_WRITE),
			.ZCI_9_WRITE(ZCI_9_WRITE),
			.ZCQ_9_WRITE(ZCQ_9_WRITE),   
			.ZCI_10_WRITE(ZCI_10_WRITE),
			.ZCQ_10_WRITE(ZCQ_10_WRITE),
			.ZCI_11_WRITE(ZCI_11_WRITE),
			.ZCQ_11_WRITE(ZCQ_11_WRITE),
			.LOAD(LOAD),
			.W_SEL(W_SEL),
			.DECIMATE_FACTOR_REG(DECIMATE_FACTOR_REG),
			.THRESH_REG_1(THRESH_REG_1),
			.THRESH_REG_2(THRESH_REG_2)
	);

	NB_WUS_LUT nb_wus (
			.ZCI_0_WRITE(ZCI_0_WRITE),
			.ZCQ_0_WRITE(ZCQ_0_WRITE),
			.ZCI_1_WRITE(ZCI_1_WRITE),
			.ZCQ_1_WRITE(ZCQ_1_WRITE),
			.ZCI_2_WRITE(ZCI_2_WRITE),
			.ZCQ_2_WRITE(ZCQ_2_WRITE),
			.ZCI_3_WRITE(ZCI_3_WRITE),
			.ZCQ_3_WRITE(ZCQ_3_WRITE),
			.ZCI_4_WRITE(ZCI_4_WRITE),
			.ZCQ_4_WRITE(ZCQ_4_WRITE),
			.ZCI_5_WRITE(ZCI_5_WRITE),
			.ZCQ_5_WRITE(ZCQ_5_WRITE),
			.ZCI_6_WRITE(ZCI_6_WRITE),
			.ZCQ_6_WRITE(ZCQ_6_WRITE),
			.ZCI_7_WRITE(ZCI_7_WRITE),
			.ZCQ_7_WRITE(ZCQ_7_WRITE),
			.ZCI_8_WRITE(ZCI_8_WRITE),
			.ZCQ_8_WRITE(ZCQ_8_WRITE),
			.ZCI_9_WRITE(ZCI_9_WRITE),
			.ZCQ_9_WRITE(ZCQ_9_WRITE),
			.ZCI_10_WRITE(ZCI_10_WRITE),
			.ZCQ_10_WRITE(ZCQ_10_WRITE),
			.ZCI_11_WRITE(ZCI_11_WRITE),
			.ZCQ_11_WRITE(ZCQ_11_WRITE),
			.W_SEL(W_SEL[3:0]),
			.R_SEL(R_SEL),
			.LOAD(LOAD[0]),
			.READ(READ),
			.ZCI_0_READ(ZCI_0_READ),
			.ZCQ_0_READ(ZCQ_0_READ),
			.ZCI_1_READ(ZCI_1_READ),
			.ZCQ_1_READ(ZCQ_1_READ),
			.ZCI_2_READ(ZCI_2_READ),
			.ZCQ_2_READ(ZCQ_2_READ),
			.ZCI_3_READ(ZCI_3_READ),
			.ZCQ_3_READ(ZCQ_3_READ),
			.ZCI_4_READ(ZCI_4_READ),
			.ZCQ_4_READ(ZCQ_4_READ),
			.ZCI_5_READ(ZCI_5_READ),
			.ZCQ_5_READ(ZCQ_5_READ),
			.ZCI_6_READ(ZCI_6_READ),
			.ZCQ_6_READ(ZCQ_6_READ),
			.ZCI_7_READ(ZCI_7_READ),
			.ZCQ_7_READ(ZCQ_7_READ),
			.ZCI_8_READ(ZCI_8_READ),
			.ZCQ_8_READ(ZCQ_8_READ),
			.ZCI_9_READ(ZCI_9_READ),
			.ZCQ_9_READ(ZCQ_9_READ),
			.ZCI_10_READ(ZCI_10_READ),
			.ZCQ_10_READ(ZCQ_10_READ),
			.ZCI_11_READ(ZCI_11_READ),
			.ZCQ_11_READ(ZCQ_11_READ)
	);






endmodule

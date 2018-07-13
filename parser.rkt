#lang brag

int-seq : [delimeter] [digits] (delimeter [digits])*
@delimeter : /(" " | "\n")+
digits  : (digit+)
@digit  : "0" | "1"
	| "2" | "3"
	| "4" | "5"
	| "6" | "7"
	| "8" | "9"
MODULE pMain

	LOCAL CONST jointtarget p0 :=[ [0,0,0,0,0,0], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p1 :=[ [0,0,0,0,0,0], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p2 :=[ [0.107102,-0.00695519,0.391459,15.5503,-0.399132,-15.55], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p3 :=[ [0.214057,-0.0101632,0.778819,15.5621,-0.797903,-15.5607], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p4 :=[ [0.320866,-0.00963506,1.16211,15.5592,-1.1963,-15.5559], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p5 :=[ [0.427528,-0.0053797,1.54136,15.5562,-1.59435,-15.5505], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p6 :=[ [0.534042,0.00259414,1.91659,15.5532,-1.99207,-15.5443], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p7 :=[ [0.640409,0.0142783,2.28783,15.5503,-2.38948,-15.5374], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p8 :=[ [0.746627,0.029665,2.6551,15.5474,-2.78658,-15.5299], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p9 :=[ [0.852696,0.0487471,3.01843,15.5445,-3.18339,-15.5216], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p10 :=[ [0.958616,0.0715179,3.37783,15.5416,-3.57992,-15.5127], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p11 :=[ [1.06439,0.0979709,3.73333,15.5387,-3.97619,-15.5031], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p12 :=[ [1.17001,0.1281,4.08494,15.5359,-4.3722,-15.4929], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p13 :=[ [1.27548,0.161901,4.43269,15.5332,-4.76797,-15.482], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p14 :=[ [1.3808,0.199366,4.77658,15.5304,-5.16352,-15.4704], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p15 :=[ [1.48596,0.240493,5.11665,15.5278,-5.55884,-15.4583], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p16 :=[ [1.59098,0.285276,5.4529,15.5252,-5.95394,-15.4454], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p17 :=[ [1.69584,0.33371,5.78535,15.5226,-6.34885,-15.432], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p18 :=[ [1.80056,0.385793,6.11401,15.5202,-6.74356,-15.4179], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p19 :=[ [1.90512,0.441519,6.4389,15.5178,-7.13808,-15.4032], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p20 :=[ [2.00952,0.500886,6.76002,15.5155,-7.53242,-15.388], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p21 :=[ [2.11378,0.56389,7.0774,15.5132,-7.92659,-15.3721], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p22 :=[ [2.21788,0.630527,7.39103,15.5111,-8.32059,-15.3556], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p23 :=[ [2.32182,0.700795,7.70094,15.5091,-8.71443,-15.3385], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p24 :=[ [2.42561,0.774692,8.00712,15.5071,-9.10811,-15.3209], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p25 :=[ [2.52925,0.852213,8.3096,15.5053,-9.50165,-15.3026], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p26 :=[ [2.63273,0.933356,8.60837,15.5036,-9.89503,-15.2838], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p27 :=[ [2.73606,1.01812,8.90345,15.502,-10.2883,-15.2645], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p28 :=[ [2.83923,1.1065,9.19484,15.5005,-10.6814,-15.2446], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p29 :=[ [2.94224,1.19849,9.48255,15.4992,-11.0743,-15.2241], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p30 :=[ [3.0451,1.2941,9.76658,15.498,-11.4672,-15.2031], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p31 :=[ [3.1478,1.39332,10.0469,15.4969,-11.8599,-15.1815], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p32 :=[ [3.25034,1.49614,10.3236,15.496,-12.2524,-15.1595], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p33 :=[ [3.35273,1.60257,10.5967,15.4952,-12.6448,-15.1369], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p34 :=[ [3.45496,1.71259,10.8661,15.4946,-13.0371,-15.1137], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p35 :=[ [3.55703,1.82622,11.1318,15.4942,-13.4293,-15.0901], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p36 :=[ [3.65895,1.94345,11.3939,15.4939,-13.8213,-15.0659], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p37 :=[ [3.7607,2.06427,11.6523,15.4937,-14.2132,-15.0413], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p38 :=[ [3.8623,2.18868,11.9071,15.4938,-14.605,-15.0161], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p39 :=[ [3.96374,2.31667,12.1582,15.494,-14.9966,-14.9905], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p40 :=[ [4.06502,2.44825,12.4057,15.4944,-15.3881,-14.9643], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p41 :=[ [4.16614,2.58342,12.6496,15.4951,-15.7794,-14.9377], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p42 :=[ [4.2671,2.72216,12.8898,15.4959,-16.1706,-14.9106], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p43 :=[ [4.3679,2.86447,13.1264,15.4969,-16.5616,-14.8831], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p44 :=[ [4.46854,3.01036,13.3593,15.4981,-16.9525,-14.855], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p45 :=[ [4.56901,3.15981,13.5886,15.4995,-17.3432,-14.8265], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p46 :=[ [4.66933,3.31282,13.8143,15.5011,-17.7338,-14.7976], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p47 :=[ [4.76949,3.46939,14.0363,15.503,-18.1241,-14.7682], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p48 :=[ [4.86949,3.62951,14.2547,15.5051,-18.5143,-14.7384], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p49 :=[ [4.96932,3.79318,14.4694,15.5074,-18.9043,-14.7081], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	LOCAL CONST jointtarget p50 :=[ [5.069,3.9604,14.6805,15.5099,-19.2941,-14.6774], [ 0, 9E9,9E9, 9E9, 9E9, 9E9] ];
	PERS tooldata tt;

PROC Path()

	VAR speeddata v;
	VAR zonedata z;

	v:=v100;
	z:=z50;
	tt:=tool0;

	MoveAbsJ p0 , v, z, tt;
	MoveAbsJ p1 , v, z, tt;
	MoveAbsJ p2 , v, z, tt;
	MoveAbsJ p3 , v, z, tt;
	MoveAbsJ p4 , v, z, tt;
	MoveAbsJ p5 , v, z, tt;
	MoveAbsJ p6 , v, z, tt;
	MoveAbsJ p7 , v, z, tt;
	MoveAbsJ p8 , v, z, tt;
	MoveAbsJ p9 , v, z, tt;
	MoveAbsJ p10 , v, z, tt;
	MoveAbsJ p11 , v, z, tt;
	MoveAbsJ p12 , v, z, tt;
	MoveAbsJ p13 , v, z, tt;
	MoveAbsJ p14 , v, z, tt;
	MoveAbsJ p15 , v, z, tt;
	MoveAbsJ p16 , v, z, tt;
	MoveAbsJ p17 , v, z, tt;
	MoveAbsJ p18 , v, z, tt;
	MoveAbsJ p19 , v, z, tt;
	MoveAbsJ p20 , v, z, tt;
	MoveAbsJ p21 , v, z, tt;
	MoveAbsJ p22 , v, z, tt;
	MoveAbsJ p23 , v, z, tt;
	MoveAbsJ p24 , v, z, tt;
	MoveAbsJ p25 , v, z, tt;
	MoveAbsJ p26 , v, z, tt;
	MoveAbsJ p27 , v, z, tt;
	MoveAbsJ p28 , v, z, tt;
	MoveAbsJ p29 , v, z, tt;
	MoveAbsJ p30 , v, z, tt;
	MoveAbsJ p31 , v, z, tt;
	MoveAbsJ p32 , v, z, tt;
	MoveAbsJ p33 , v, z, tt;
	MoveAbsJ p34 , v, z, tt;
	MoveAbsJ p35 , v, z, tt;
	MoveAbsJ p36 , v, z, tt;
	MoveAbsJ p37 , v, z, tt;
	MoveAbsJ p38 , v, z, tt;
	MoveAbsJ p39 , v, z, tt;
	MoveAbsJ p40 , v, z, tt;
	MoveAbsJ p41 , v, z, tt;
	MoveAbsJ p42 , v, z, tt;
	MoveAbsJ p43 , v, z, tt;
	MoveAbsJ p44 , v, z, tt;
	MoveAbsJ p45 , v, z, tt;
	MoveAbsJ p46 , v, z, tt;
	MoveAbsJ p47 , v, z, tt;
	MoveAbsJ p48 , v, z, tt;
	MoveAbsJ p49 , v, z, tt;
	MoveAbsJ p50 , v, z, tt;
ENDPROC
PROC main()
	Path;
ENDPROC

ENDMODULE
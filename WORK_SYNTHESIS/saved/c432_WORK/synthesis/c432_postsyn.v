
module c432 ( N1, N4, N8, N11, N14, N17, N21, N24, N27, N30, N34, N37, N40, 
        N43, N47, N50, N53, N56, N60, N63, N66, N69, N73, N76, N79, N82, N86, 
        N89, N92, N95, N99, N102, N105, N108, N112, N115, N223, N329, N370, 
        N421, N430, N431, N432 );
  input N1, N4, N8, N11, N14, N17, N21, N24, N27, N30, N34, N37, N40, N43, N47,
         N50, N53, N56, N60, N63, N66, N69, N73, N76, N79, N82, N86, N89, N92,
         N95, N99, N102, N105, N108, N112, N115;
  output N223, N329, N370, N421, N430, N431, N432;
  wire   n84, n85, n86, n89, n90, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n102, n103, n104, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n205, n207, n208,
         n209, n210, n211, n212, n213, n215, n216, n217, n218, n219, n220,
         n221, n222;

  HS65_LH_IVX2 U88 ( .A(N40), .Z(n143) );
  HS65_LH_OAI112X1 U89 ( .A(N53), .B(n147), .C(n146), .D(n145), .Z(n148) );
  HS65_LH_IVX2 U90 ( .A(N27), .Z(n140) );
  HS65_LH_IVX2 U91 ( .A(N92), .Z(n165) );
  HS65_LH_IVX4 U96 ( .A(n196), .Z(n198) );
  HS65_LL_AOI21X2 U98 ( .A(n98), .B(n165), .C(n97), .Z(n166) );
  HS65_LH_NOR2X6 U99 ( .A(n100), .B(n99), .Z(n167) );
  HS65_LL_NAND2X7 U101 ( .A(n211), .B(n210), .Z(n213) );
  HS65_LH_IVX2 U108 ( .A(n163), .Z(n98) );
  HS65_LH_OAI21X3 U109 ( .A(N27), .B(n156), .C(n96), .Z(n97) );
  HS65_LH_NAND2X7 U111 ( .A(N37), .B(N223), .Z(n122) );
  HS65_LH_NAND2X7 U117 ( .A(n207), .B(n186), .Z(n189) );
  HS65_LH_IVX4 U118 ( .A(n180), .Z(n181) );
  HS65_LH_NAND2X7 U121 ( .A(N53), .B(n191), .Z(n160) );
  HS65_LL_AOI12X6 U124 ( .A(n154), .B(n171), .C(n153), .Z(n164) );
  HS65_LH_NOR2AX3 U125 ( .A(N99), .B(n171), .Z(n172) );
  HS65_LL_NOR2X13 U126 ( .A(n133), .B(n84), .Z(n171) );
  HS65_LL_NAND2X14 U148 ( .A(n213), .B(n212), .Z(N431) );
  HS65_LH_NAND2X7 U150 ( .A(n195), .B(n160), .Z(n180) );
  HS65_LH_NOR2X5 U151 ( .A(N108), .B(n195), .Z(n203) );
  HS65_LH_AOI21X2 U153 ( .A(n167), .B(n166), .C(N329), .Z(n178) );
  HS65_LH_NOR2X6 U158 ( .A(N66), .B(n138), .Z(n169) );
  HS65_LH_OAI22X3 U159 ( .A(N40), .B(n155), .C(N53), .D(n159), .Z(n100) );
  HS65_LH_NAND2X7 U160 ( .A(N4), .B(n104), .Z(n192) );
  HS65_LL_AOI22X4 U163 ( .A(N4), .B(n85), .C(N17), .D(n108), .Z(n94) );
  HS65_LH_IVX9 U167 ( .A(N43), .Z(n89) );
  HS65_LH_AOI12X6 U173 ( .A(N86), .B(N329), .C(n163), .Z(n199) );
  HS65_LL_OR3ABCX35 U184 ( .A(n94), .B(n93), .C(n92), .Z(N223) );
  HS65_LH_NAND4ABX3 U192 ( .A(n222), .B(n175), .C(n174), .D(n173), .Z(n177) );
  HS65_LH_NAND2X7 U193 ( .A(N82), .B(n115), .Z(n163) );
  HS65_LH_NAND2X7 U203 ( .A(N11), .B(N223), .Z(n139) );
  HS65_LH_NAND2X7 U213 ( .A(N73), .B(N329), .Z(n184) );
  HS65_LH_NAND2X7 U214 ( .A(n185), .B(n184), .Z(n202) );
  HS65_LH_IVX9 U218 ( .A(n207), .Z(n208) );
  HS65_LL_IVX18 U83 ( .A(n164), .Z(N370) );
  HS65_LL_NAND4ABX3 U84 ( .A(n200), .B(n199), .C(n198), .D(n197), .Z(n201) );
  HS65_LH_NAND2AX4 U85 ( .A(n123), .B(n122), .Z(n147) );
  HS65_LL_NAND3X2 U86 ( .A(n144), .B(n143), .C(n142), .Z(n145) );
  HS65_LL_IVX4 U87 ( .A(n102), .Z(n215) );
  HS65_LL_IVX9 U92 ( .A(n215), .Z(n216) );
  HS65_LL_NAND3X2 U93 ( .A(n141), .B(n140), .C(n139), .Z(n146) );
  HS65_LH_AND3ABCX9 U94 ( .A(N79), .B(n183), .C(n182), .Z(n134) );
  HS65_LL_IVX7 U95 ( .A(n216), .Z(n182) );
  HS65_LL_IVX27 U97 ( .A(n217), .Z(N432) );
  HS65_LL_NAND2X14 U100 ( .A(n212), .B(n210), .Z(N430) );
  HS65_LH_AOI12X2 U102 ( .A(N21), .B(N329), .C(n156), .Z(n200) );
  HS65_LL_IVX4 U103 ( .A(N108), .Z(n128) );
  HS65_LH_AOI12X2 U104 ( .A(N40), .B(n191), .C(n197), .Z(n188) );
  HS65_LL_AOI12X2 U105 ( .A(N79), .B(n191), .C(n202), .Z(n207) );
  HS65_LL_AOI12X2 U106 ( .A(N105), .B(n178), .C(n177), .Z(n179) );
  HS65_LL_NAND3AX3 U107 ( .A(n132), .B(n138), .C(n137), .Z(n84) );
  HS65_LH_AOI12X2 U110 ( .A(N329), .B(N8), .C(n192), .Z(n193) );
  HS65_LL_IVX22 U112 ( .A(n171), .Z(N329) );
  HS65_LL_CB4I1X9 U113 ( .A(n190), .B(n189), .C(n188), .D(n187), .Z(n217) );
  HS65_LH_NOR2AX3 U114 ( .A(N17), .B(N21), .Z(n141) );
  HS65_LH_AOI32X3 U115 ( .A(n218), .B(N4), .C(n104), .D(n103), .E(n216), .Z(
        n117) );
  HS65_LH_IVX2 U116 ( .A(N8), .Z(n218) );
  HS65_LL_NOR2AX13 U119 ( .A(n187), .B(n188), .Z(n212) );
  HS65_LL_NAND4ABX3 U120 ( .A(n179), .B(n201), .C(n203), .D(n202), .Z(n219) );
  HS65_LH_NOR2AX3 U122 ( .A(N30), .B(N34), .Z(n144) );
  HS65_LL_AND2X18 U123 ( .A(n205), .B(n219), .Z(N421) );
  HS65_LL_AOI212X2 U127 ( .A(n220), .B(N56), .C(n221), .D(N82), .E(n90), .Z(
        n92) );
  HS65_LH_IVX2 U128 ( .A(N50), .Z(n220) );
  HS65_LH_IVX2 U129 ( .A(N76), .Z(n221) );
  HS65_LH_NAND2X7 U130 ( .A(N24), .B(N223), .Z(n142) );
  HS65_LH_AOI21X6 U131 ( .A(N30), .B(n109), .C(n86), .Z(n93) );
  HS65_LH_AND2X4 U132 ( .A(N89), .B(N223), .Z(n222) );
  HS65_LL_NAND2X5 U133 ( .A(N66), .B(N370), .Z(n162) );
  HS65_LL_AO12X4 U134 ( .A(N34), .B(N329), .C(n155), .Z(n197) );
  HS65_LH_IVX9 U135 ( .A(N24), .Z(n109) );
  HS65_LL_OAI22X3 U136 ( .A(N102), .B(n128), .C(N89), .D(n175), .Z(n86) );
  HS65_LH_NAND2X7 U137 ( .A(N102), .B(N223), .Z(n129) );
  HS65_LL_OAI22X3 U138 ( .A(N37), .B(n89), .C(N63), .D(n183), .Z(n90) );
  HS65_LH_IVX9 U139 ( .A(N69), .Z(n183) );
  HS65_LH_IVX18 U140 ( .A(N95), .Z(n175) );
  HS65_LL_NAND2X4 U141 ( .A(N56), .B(n126), .Z(n161) );
  HS65_LL_NAND2AX4 U142 ( .A(n127), .B(n126), .Z(n138) );
  HS65_LH_NAND3X2 U143 ( .A(N108), .B(n95), .C(n129), .Z(n96) );
  HS65_LH_NAND2AX4 U144 ( .A(n130), .B(n129), .Z(n137) );
  HS65_LL_AOI21X4 U145 ( .A(n209), .B(n179), .C(n181), .Z(n190) );
  HS65_LL_NAND4ABX6 U146 ( .A(n136), .B(n134), .C(n166), .D(n167), .Z(n154) );
  HS65_LL_AOI22X6 U147 ( .A(n118), .B(n136), .C(n135), .D(n134), .Z(n152) );
  HS65_LH_AND3ABCX9 U149 ( .A(N105), .B(n175), .C(n222), .Z(n136) );
  HS65_LH_OAI13X1 U152 ( .A(n170), .B(n169), .C(n168), .D(N105), .Z(n174) );
  HS65_LL_NOR2X6 U154 ( .A(n170), .B(n168), .Z(n151) );
  HS65_LL_NOR3X1 U155 ( .A(N14), .B(N8), .C(n192), .Z(n168) );
  HS65_LL_NOR2X5 U156 ( .A(N115), .B(n137), .Z(n170) );
  HS65_LL_OAI22X3 U157 ( .A(N66), .B(n161), .C(N14), .D(n192), .Z(n99) );
  HS65_LL_NAND2X2 U161 ( .A(n209), .B(n208), .Z(n211) );
  HS65_LL_IVX7 U162 ( .A(n164), .Z(n191) );
  HS65_LL_NAND2X4 U164 ( .A(n196), .B(n162), .Z(n186) );
  HS65_LH_NAND2X2 U165 ( .A(N56), .B(n125), .Z(n127) );
  HS65_LH_IVX2 U166 ( .A(N60), .Z(n125) );
  HS65_LH_NAND2X2 U168 ( .A(N43), .B(n121), .Z(n123) );
  HS65_LH_IVX2 U169 ( .A(N47), .Z(n121) );
  HS65_LL_AOI12X2 U170 ( .A(N47), .B(N329), .C(n159), .Z(n195) );
  HS65_LH_NOR2X2 U171 ( .A(n183), .B(n182), .Z(n185) );
  HS65_LL_NAND3X3 U172 ( .A(n152), .B(n151), .C(n150), .Z(n153) );
  HS65_LL_NAND2X4 U174 ( .A(n117), .B(n116), .Z(n133) );
  HS65_LH_AOI31X3 U175 ( .A(N82), .B(n115), .C(n114), .D(n113), .Z(n116) );
  HS65_LH_NAND2X2 U176 ( .A(N50), .B(N223), .Z(n126) );
  HS65_LH_NAND2X2 U177 ( .A(n122), .B(N43), .Z(n159) );
  HS65_LH_NAND2X2 U178 ( .A(N30), .B(n142), .Z(n155) );
  HS65_LH_IVX2 U179 ( .A(N115), .Z(n95) );
  HS65_LH_NAND2X2 U180 ( .A(N17), .B(n139), .Z(n156) );
  HS65_LH_OR2X4 U181 ( .A(n128), .B(N112), .Z(n130) );
  HS65_LH_NAND2X2 U182 ( .A(N89), .B(N223), .Z(n119) );
  HS65_LH_NAND2X2 U183 ( .A(N63), .B(N223), .Z(n102) );
  HS65_LH_NAND2X4 U185 ( .A(N1), .B(N223), .Z(n104) );
  HS65_LH_AOI21X2 U186 ( .A(N60), .B(N329), .C(n161), .Z(n196) );
  HS65_LH_IVX2 U187 ( .A(n172), .Z(n173) );
  HS65_LH_IVX2 U188 ( .A(N99), .Z(n118) );
  HS65_LH_IVX2 U189 ( .A(N73), .Z(n135) );
  HS65_LL_NOR3X1 U190 ( .A(n169), .B(n149), .C(n148), .Z(n150) );
  HS65_LH_NOR3X1 U191 ( .A(N92), .B(N86), .C(n163), .Z(n149) );
  HS65_LH_NAND2X4 U194 ( .A(N76), .B(N223), .Z(n115) );
  HS65_LH_CBI4I1X3 U195 ( .A(n112), .B(n111), .C(N223), .D(n110), .Z(n113) );
  HS65_LH_IVX2 U196 ( .A(n141), .Z(n112) );
  HS65_LH_IVX2 U197 ( .A(n144), .Z(n111) );
  HS65_LH_AOI22X1 U198 ( .A(n109), .B(n144), .C(n141), .D(n108), .Z(n110) );
  HS65_LH_IVX2 U199 ( .A(N86), .Z(n114) );
  HS65_LH_NAND2X2 U200 ( .A(n124), .B(n147), .Z(n132) );
  HS65_LH_NAND2AX4 U201 ( .A(n120), .B(n119), .Z(n124) );
  HS65_LH_NAND2X2 U202 ( .A(N95), .B(n118), .Z(n120) );
  HS65_LH_NOR2X2 U204 ( .A(N73), .B(n183), .Z(n103) );
  HS65_LH_NAND2X4 U205 ( .A(n200), .B(n157), .Z(n187) );
  HS65_LH_NAND2AX4 U206 ( .A(n140), .B(n191), .Z(n157) );
  HS65_LH_OAI12X2 U207 ( .A(n165), .B(n164), .C(n199), .Z(n209) );
  HS65_LH_AND2X18 U208 ( .A(n180), .B(n186), .Z(n210) );
  HS65_LH_IVX2 U209 ( .A(N11), .Z(n108) );
  HS65_LH_IVX2 U210 ( .A(N1), .Z(n85) );
  HS65_LH_OAI12X2 U211 ( .A(n194), .B(n164), .C(n193), .Z(n205) );
  HS65_LH_IVX2 U212 ( .A(N14), .Z(n194) );
endmodule


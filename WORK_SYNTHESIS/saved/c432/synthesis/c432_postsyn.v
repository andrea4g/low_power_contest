
module c432 ( N1, N4, N8, N11, N14, N17, N21, N24, N27, N30, N34, N37, N40, 
        N43, N47, N50, N53, N56, N60, N63, N66, N69, N73, N76, N79, N82, N86, 
        N89, N92, N95, N99, N102, N105, N108, N112, N115, N223, N329, N370, 
        N421, N430, N431, N432 );
  input N1, N4, N8, N11, N14, N17, N21, N24, N27, N30, N34, N37, N40, N43, N47,
         N50, N53, N56, N60, N63, N66, N69, N73, N76, N79, N82, N86, N89, N92,
         N95, N99, N102, N105, N108, N112, N115;
  output N223, N329, N370, N421, N430, N431, N432;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n121,
         n120, n119, n106, n108, n109, n110, n111, n112, n113, n114, n115,
         n117;

  HS65_LL_NOR3X4 U106 ( .A(N112), .B(n86), .C(n34), .Z(n87) );
  HS65_LL_NOR4ABX9 U107 ( .A(n65), .B(n72), .C(n7), .D(n87), .Z(n90) );
  HS65_LL_IVX53 U108 ( .A(N370), .Z(n5) );
  HS65_LL_BFX18 U109 ( .A(n35), .Z(n109) );
  HS65_LL_BFX106 U110 ( .A(n121), .Z(N370) );
  HS65_LL_NAND4ABX13 U111 ( .A(n57), .B(n58), .C(n59), .D(n60), .Z(n121) );
  HS65_LL_BFX106 U112 ( .A(n119), .Z(N223) );
  HS65_LL_NOR4ABX9 U113 ( .A(n38), .B(n37), .C(n108), .D(n109), .Z(n44) );
  HS65_LL_NAND2AX7 U114 ( .A(N89), .B(N95), .Z(n51) );
  HS65_LL_NAND2X7 U115 ( .A(N4), .B(n9), .Z(n97) );
  HS65_LL_NOR2X6 U116 ( .A(N102), .B(n34), .Z(n91) );
  HS65_LL_NAND4ABX13 U117 ( .A(n94), .B(n93), .C(n98), .D(n99), .Z(n119) );
  HS65_LL_NOR3X9 U118 ( .A(n54), .B(n96), .C(n95), .Z(n98) );
  HS65_LL_NOR4ABX9 U119 ( .A(n51), .B(n97), .C(n92), .D(n91), .Z(n99) );
  HS65_LL_BFX9 U120 ( .A(n120), .Z(n106) );
  HS65_LL_BFX27 U121 ( .A(n120), .Z(N329) );
  HS65_LL_NAND4ABX6 U122 ( .A(n82), .B(n89), .C(n66), .D(n90), .Z(n120) );
  HS65_LL_IVX2 U123 ( .A(n37), .Z(n3) );
  HS65_LL_BFX9 U124 ( .A(n41), .Z(n108) );
  HS65_LL_AOI212X2 U125 ( .A(N329), .B(N47), .C(N370), .D(N53), .E(n53), .Z(
        n41) );
  HS65_LL_NAND2X2 U126 ( .A(n114), .B(N329), .Z(n115) );
  HS65_LL_IVX18 U127 ( .A(N108), .Z(n34) );
  HS65_LL_AOI13X20 U128 ( .A(n34), .B(n44), .C(n45), .D(n46), .Z(N421) );
  HS65_LL_AOI212X4 U129 ( .A(N14), .B(N370), .C(N8), .D(N329), .E(n47), .Z(n46) );
  HS65_LL_IVX9 U130 ( .A(N43), .Z(n18) );
  HS65_LL_OA212X4 U131 ( .A(n6), .B(n16), .C(n5), .D(n17), .E(n52), .Z(n35) );
  HS65_LL_NOR2X6 U132 ( .A(N76), .B(n28), .Z(n92) );
  HS65_LL_NOR2X6 U133 ( .A(N11), .B(n11), .Z(n96) );
  HS65_LL_NOR2X6 U134 ( .A(N24), .B(n15), .Z(n95) );
  HS65_LL_NOR2X6 U135 ( .A(N37), .B(n18), .Z(n54) );
  HS65_LL_AOI33X5 U136 ( .A(n61), .B(n23), .C(n62), .D(n63), .E(n27), .F(n64), 
        .Z(n60) );
  HS65_LL_IVX9 U137 ( .A(n71), .Z(n7) );
  HS65_LL_OA212X4 U138 ( .A(n6), .B(n25), .C(n5), .D(n27), .E(n49), .Z(n110)
         );
  HS65_LL_IVX13 U139 ( .A(N329), .Z(n6) );
  HS65_LL_OR2X9 U140 ( .A(N47), .B(n18), .Z(n111) );
  HS65_LL_NAND3AX6 U141 ( .A(n88), .B(n81), .C(n80), .Z(n89) );
  HS65_LL_OAI212X5 U142 ( .A(n6), .B(n12), .C(n5), .D(n14), .E(n55), .Z(n37)
         );
  HS65_LL_OAI12X24 U143 ( .A(n109), .B(n36), .C(n37), .Z(N432) );
  HS65_LL_AOI212X4 U144 ( .A(n110), .B(n38), .C(n39), .D(n40), .E(n108), .Z(
        n36) );
  HS65_LL_IVX7 U145 ( .A(n94), .Z(n19) );
  HS65_LL_IVX9 U146 ( .A(n95), .Z(n13) );
  HS65_LL_IVX2 U147 ( .A(N223), .Z(n8) );
  HS65_LL_NAND2X4 U148 ( .A(N223), .B(n22), .Z(n63) );
  HS65_LL_NAND2X2 U149 ( .A(N223), .B(n10), .Z(n112) );
  HS65_LL_IVX18 U150 ( .A(n44), .Z(N430) );
  HS65_LL_NOR2X2 U151 ( .A(n8), .B(n117), .Z(n74) );
  HS65_LL_OR3X4 U152 ( .A(n74), .B(N53), .C(n73), .Z(n113) );
  HS65_LL_IVX2 U153 ( .A(n82), .Z(n114) );
  HS65_LL_AOI33X2 U154 ( .A(n67), .B(n30), .C(n68), .D(n69), .E(n33), .F(n70), 
        .Z(n59) );
  HS65_LL_NAND2X7 U155 ( .A(n113), .B(n75), .Z(n58) );
  HS65_LL_NAND2X2 U156 ( .A(n115), .B(N43), .Z(n73) );
  HS65_LL_AOI33X2 U157 ( .A(n76), .B(n14), .C(n77), .D(n78), .E(n17), .F(n79), 
        .Z(n75) );
  HS65_LL_OAI21X2 U158 ( .A(n8), .B(n9), .C(N4), .Z(n47) );
  HS65_LL_IVX9 U159 ( .A(n108), .Z(n4) );
  HS65_LL_NOR2X2 U160 ( .A(N37), .B(n18), .Z(n117) );
  HS65_LL_NAND2X2 U161 ( .A(N223), .B(n13), .Z(n78) );
  HS65_LL_NAND2X2 U162 ( .A(N223), .B(n10), .Z(n76) );
  HS65_LL_OAI12X2 U163 ( .A(N223), .B(n31), .C(n51), .Z(n50) );
  HS65_LL_NOR2X6 U164 ( .A(n111), .B(n74), .Z(n82) );
  HS65_LL_OAI12X2 U165 ( .A(N223), .B(n11), .C(n10), .Z(n55) );
  HS65_LL_AND2X4 U166 ( .A(n97), .B(N223), .Z(n84) );
  HS65_LL_NAND3X2 U167 ( .A(n63), .B(n25), .C(N69), .Z(n65) );
  HS65_LL_NAND2X2 U168 ( .A(N223), .B(n26), .Z(n67) );
  HS65_LL_NAND2X2 U169 ( .A(N223), .B(n19), .Z(n61) );
  HS65_LL_OAI12X2 U170 ( .A(N223), .B(n20), .C(n19), .Z(n56) );
  HS65_LL_OAI212X3 U171 ( .A(n6), .B(n29), .C(n5), .D(n30), .E(n48), .Z(n40)
         );
  HS65_LL_OAI12X2 U172 ( .A(N223), .B(n28), .C(n26), .Z(n48) );
  HS65_LL_OAI212X3 U173 ( .A(n6), .B(n25), .C(n5), .D(n27), .E(n49), .Z(n42)
         );
  HS65_LL_OAI12X2 U174 ( .A(N223), .B(n24), .C(n22), .Z(n49) );
  HS65_LL_NAND2X2 U175 ( .A(N223), .B(n51), .Z(n69) );
  HS65_LL_OAI12X2 U176 ( .A(N223), .B(n15), .C(n13), .Z(n52) );
  HS65_LL_IVX2 U177 ( .A(n96), .Z(n10) );
  HS65_LL_NAND3X3 U178 ( .A(n61), .B(n21), .C(N56), .Z(n66) );
  HS65_LL_NAND3X2 U179 ( .A(n78), .B(n16), .C(N30), .Z(n80) );
  HS65_LL_NAND3X2 U180 ( .A(n112), .B(n12), .C(N17), .Z(n81) );
  HS65_LL_NAND3X2 U181 ( .A(n69), .B(n32), .C(N95), .Z(n71) );
  HS65_LL_OAI12X3 U182 ( .A(n87), .B(n6), .C(N108), .Z(n85) );
  HS65_LL_OAI12X3 U183 ( .A(n88), .B(n6), .C(N4), .Z(n83) );
  HS65_LL_NAND3X2 U184 ( .A(n67), .B(n29), .C(N82), .Z(n72) );
  HS65_LL_IVX2 U185 ( .A(N95), .Z(n31) );
  HS65_LL_NAND2X7 U186 ( .A(n42), .B(n40), .Z(n43) );
  HS65_LL_OAI212X5 U187 ( .A(n6), .B(n21), .C(n5), .D(n23), .E(n56), .Z(n38)
         );
  HS65_LL_AO311X18 U188 ( .A(n43), .B(n4), .C(n38), .D(n109), .E(n3), .Z(N431)
         );
  HS65_LL_AOI21X2 U189 ( .A(N329), .B(n71), .C(n31), .Z(n70) );
  HS65_LL_AOI21X2 U190 ( .A(N329), .B(n65), .C(n24), .Z(n64) );
  HS65_LL_AOI21X2 U191 ( .A(N329), .B(n81), .C(n11), .Z(n77) );
  HS65_LL_AOI21X2 U192 ( .A(n106), .B(n72), .C(n28), .Z(n68) );
  HS65_LL_AOI21X2 U193 ( .A(N329), .B(n66), .C(n20), .Z(n62) );
  HS65_LL_NOR2X6 U194 ( .A(n8), .B(n91), .Z(n86) );
  HS65_LL_OA212X4 U195 ( .A(n6), .B(n32), .C(n5), .D(n33), .E(n50), .Z(n39) );
  HS65_LL_IVX9 U196 ( .A(n92), .Z(n26) );
  HS65_LL_IVX9 U197 ( .A(n93), .Z(n22) );
  HS65_LL_OAI33X3 U198 ( .A(n83), .B(N14), .C(n84), .D(n85), .E(N115), .F(n86), 
        .Z(n57) );
  HS65_LL_NOR2X6 U199 ( .A(n39), .B(n43), .Z(n45) );
  HS65_LL_AOI12X2 U200 ( .A(n8), .B(N43), .C(n117), .Z(n53) );
  HS65_LL_NOR3AX2 U201 ( .A(N4), .B(n84), .C(N8), .Z(n88) );
  HS65_LL_IVX9 U202 ( .A(N69), .Z(n24) );
  HS65_LL_IVX9 U203 ( .A(N17), .Z(n11) );
  HS65_LL_IVX9 U204 ( .A(N30), .Z(n15) );
  HS65_LL_IVX9 U205 ( .A(N82), .Z(n28) );
  HS65_LL_IVX9 U206 ( .A(N56), .Z(n20) );
  HS65_LL_AOI21X2 U207 ( .A(N329), .B(n80), .C(n15), .Z(n79) );
  HS65_LL_NOR2X6 U208 ( .A(N50), .B(n20), .Z(n94) );
  HS65_LL_NOR2X6 U209 ( .A(N63), .B(n24), .Z(n93) );
  HS65_LL_IVX9 U210 ( .A(N1), .Z(n9) );
  HS65_LL_IVX9 U211 ( .A(N79), .Z(n27) );
  HS65_LL_IVX9 U212 ( .A(N21), .Z(n12) );
  HS65_LL_IVX9 U213 ( .A(N73), .Z(n25) );
  HS65_LL_IVX9 U214 ( .A(N60), .Z(n21) );
  HS65_LL_IVX9 U215 ( .A(N86), .Z(n29) );
  HS65_LL_IVX9 U216 ( .A(N27), .Z(n14) );
  HS65_LL_IVX9 U217 ( .A(N92), .Z(n30) );
  HS65_LL_IVX9 U218 ( .A(N66), .Z(n23) );
  HS65_LL_IVX9 U219 ( .A(N34), .Z(n16) );
  HS65_LL_IVX9 U220 ( .A(N99), .Z(n32) );
  HS65_LL_IVX9 U221 ( .A(N40), .Z(n17) );
  HS65_LL_IVX9 U222 ( .A(N105), .Z(n33) );
endmodule


module outlayer(in1, in2, in3, in4, out);

  input   [7:0] in1, in2, in3, in4;
  output  [4:0] out;
  wire  [7:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z;

  wire  [7:0] ab,cd,ef,gh,ij,kl,mn,op,qr,st,uv,wx,yz;
  wire  [7:0] abcd,efgh,ijkl,mnop,qrst,uvwx;
  wire  [7:0] abcdefgh,ijklmnop,qrstuvwx;
  wire  [7:0] ap,qz, maxval;

  wire  [4:0] ab_l,cd_l,ef_l,gh_l,ij_l,kl_l,mn_l,op_l,qr_l,st_l,uv_l,wx_l,yz_l;
  wire  [4:0] abcd_l,efgh_l,ijkl_l,mnop_l,qrst_l,uvwx_l;
  wire  [4:0] abcdefgh_l,ijklmnop_l,qrstuvwx_l;
  wire  [4:0] ap_l,qz_l;

  neuron ha(rom.weights[04], in1, in2, in3, in4, a);
  neuron hb(rom.weights[05], in1, in2, in3, in4, b);
  neuron hc(rom.weights[06], in1, in2, in3, in4, c);
  neuron hd(rom.weights[07], in1, in2, in3, in4, d);
  neuron he(rom.weights[08], in1, in2, in3, in4, e);
  neuron hf(rom.weights[09], in1, in2, in3, in4, f);
  neuron hg(rom.weights[10], in1, in2, in3, in4, g);
  neuron hh(rom.weights[11], in1, in2, in3, in4, h);
  neuron hi(rom.weights[12], in1, in2, in3, in4, i);
  neuron hj(rom.weights[13], in1, in2, in3, in4, j);
  neuron hk(rom.weights[14], in1, in2, in3, in4, k);
  neuron hl(rom.weights[15], in1, in2, in3, in4, l);
  neuron hm(rom.weights[16], in1, in2, in3, in4, m);
  neuron hn(rom.weights[17], in1, in2, in3, in4, n);
  neuron ho(rom.weights[18], in1, in2, in3, in4, o);
  neuron hp(rom.weights[19], in1, in2, in3, in4, p);
  neuron hq(rom.weights[20], in1, in2, in3, in4, q);
  neuron hr(rom.weights[21], in1, in2, in3, in4, r);
  neuron hs(rom.weights[22], in1, in2, in3, in4, s);
  neuron ht(rom.weights[23], in1, in2, in3, in4, t);
  neuron hu(rom.weights[24], in1, in2, in3, in4, u);
  neuron hv(rom.weights[25], in1, in2, in3, in4, v);
  neuron hw(rom.weights[26], in1, in2, in3, in4, w);
  neuron hx(rom.weights[27], in1, in2, in3, in4, x);
  neuron hy(rom.weights[28], in1, in2, in3, in4, y);
  neuron hz(rom.weights[29], in1, in2, in3, in4, z);

  comparator ab_c(a, 5'd0,  b, 5'd1, ab, ab_l);
  comparator cd_c(c, 5'd2,  d, 5'd3, cd, cd_l);
  comparator ef_c(e, 5'd4,  f, 5'd5, ef, ef_l);
  comparator gh_c(g, 5'd6,  h, 5'd7, gh, gh_l);
  comparator ij_c(i, 5'd8,  j, 5'd9, ij, ij_l);
  comparator kl_c(k, 5'd10, l, 5'd11, kl, kl_l);
  comparator mn_c(m, 5'd12, n, 5'd13, mn, mn_l);
  comparator op_c(o, 5'd14, p, 5'd15, op, op_l);
  comparator qr_c(q, 5'd16, r, 5'd17, qr, qr_l);
  comparator st_c(s, 5'd18, t, 5'd19, st, st_l);
  comparator uv_c(u, 5'd20, v, 5'd21, uv, uv_l);
  comparator wx_c(w, 5'd22, x, 5'd23, wx, wx_l);
  comparator yz_c(y, 5'd24, z, 5'd25, yz, yz_l);

  comparator abcd_c(ab, ab_l, cd, cd_l, abcd, abcd_l);
  comparator efgh_c(ef, ef_l, gh, gh_l, efgh, efgh_l);
  comparator ijkl_c(ij, ij_l, kl, kl_l, ijkl, ijkl_l);
  comparator mnop_c(mn, mn_l, op, op_l, mnop, mnop_l);
  comparator qrst_c(qr, qr_l, st, st_l, qrst, qrst_l);
  comparator uvwx_c(uv, uv_l, wx, wx_l, uvwx, uvwx_l);

  comparator abcdefgh_c(abcd, abcd_l, efgh, efgh_l, abcdefgh, abcdefgh_l);
  comparator ijklmnop_c(ijkl, ijkl_l, mnop, mnop_l, ijklmnop, ijklmnop_l);
  comparator qrstuvwx_c(qrst, qrst_l, uvwx, uvwx_l, qrstuvwx, qrstuvwx_l);

  comparator ap_c(abcdefgh, abcdefgh_l, ijklmnop, ijklmnop_l, ap, ap_l);
  comparator qz_c(qrstuvwx, qrstuvwx_l, yz, yz_l, qz, qz_l);

  comparator out_c(ap, ap_l, qz, qz_l, maxval, out);

endmodule

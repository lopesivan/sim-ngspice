% F  = 1E-15
% P  = 1E-12
% N  = 1E-9
% U  = 1E-6
% MIL= 1E-3
% K  = 1E3
% MEG= 1E6
% G  = 1E9
% T  = 1E12

% V1 = <12, 0°>    f = 60 Hz
% R1 = 30          C = 100u

m = 1E-3
u = 1E-6;

f  = 50;
V  = to_rd(100,-30);

R1 = 50;
R2 = 100;
C  = .0075*m;
L  = .3;

w  = 2*pi*f;

XC= 1/(w*C);
XL= w*L;

ZC = to_rd(XC,-90);
ZL = to_rd(XL,90);

ZR1 = to_rd(R1,0);
ZR2 = to_rd(R2,0);

Z1  = ZR1 + ZC
Z2  = ZR2 + ZL


Zeq = (1/Z1+1/Z2)^-1
I   = V/Zeq
to_pd(I)

S  = V*conj(I)
s  = abs(S)
P  = real(S)
Q  = imag(S)
FP = P/s

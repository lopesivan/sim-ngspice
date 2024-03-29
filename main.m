% This is octave file.
% V1 = <12, 0°>    f = 60 Hz
% R1 = 30          C = 100u
%
% w = 2*pi*f  ->  2*3.14*60 = 376.991
% XC = (1/w*C) = (1/(376.991*100u)) = (1/(376.991*100*10^-6)) = 26.525
% Z[C1] = J(-26.525)
%
% Zeq = R1 + JXC = 30 + J(-26.525)
%                = <40.045, -41.48°>
% I = V/Zeq = <12, 0°>/(30 -J26.525) = <.2996, 41.4829°>     [ A]
%                                    = .22446 + J 0.19849    [ A]
%                                    = <299.6, 41.4829°>     [mA]
%                                    = 224.4463 + J 198.4539 [mA]
%
% V[R1] = R1*I = <30, 0> * <0.2996, 41.4829°>
%       = <8.9898, 41.4829°>
%       = 6.7347 + J 5.9548
%
% V[C1] = Z[C1]*I = <26.525, -90°> * <0.2996, 41.4829°>
%       = <7.9485, -48.517°>
%       = 5.2650 + J(-5.95465)
%
%***************************************************************
%
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

u = 1E-6;

R1 = 30;
f  = 60;
V  = to_rd(12,0);
C  = 100*u;
w = 2*pi*f;
XC= 1/(w*C);

ZC = to_rd(XC,-90);
ZR = to_rd(R1,0);

Z  = ZR + ZC
%                = <40.045, -41.48°>
to_pd(Z)

I = V/Z
%                                    = 224.4463 + J 198.4539 [mA]
to_pd(I)  % polar display
%                                    = <299.6, 41.4829°>     [mA]

ZR = R1
VR=ZR*I
%                                    = 6.7347 + J 5.9548
to_pd(VR)  % polar display
%                                    = <8.9898, 41.4829°>
%
VC = ZC*I
%                                    = 5.2650 + J(-5.95465)
to_pd(VC)  % polar display
%                                    = <7.9485, -48.517°>

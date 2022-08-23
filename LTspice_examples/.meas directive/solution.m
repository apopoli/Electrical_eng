clc
clear variables

j = complex(0,1);
f = 500;
omega = 2*pi*f;

zr1 = 1;
zr2 = 2;
C1 = 10E-6;
zc1 = 1/(j*omega*C1);
L1 = 1E-3;
zL1 = j*omega*L1;
alpha = 2;
vg1 = 5;

a = 1/zc1+1/zr2;
b = -1/zr2 + alpha/zr1;
c = -1/zr2;
d = 1/zr1+1/zr2+1/zL1;

K = zeros(2,2);
K(1,1) = a;
K(1,2) = b;
K(2,1) = c;
K(2,2) = d;

rhs = zeros(2,1);
rhs(1) = vg1*(alpha/zr1+1/zc1);
rhs(2) = vg1/zr1;

ee = K\rhs;

ec = ee(1);
ed = ee(2);

print_z('ec',ec)
print_z('ed',ed)

% LTspice
% V(c):	mag:    5.35324 phase:   -17.0798° 	voltage
% V(d):	mag:    4.95555 phase:     6.0423° 	voltage

ic = (vg1-ec)/zc1;
ir1 = (vg1-ed)/zr1;
ig1 = ic+ir1;
print_z('ig1',ig1);

% LT: I(Vg1):	mag:     0.5258 phase:    92.4617° 	device_current

Pg1 = real(vg1*conj(ig1));
print_z('Pg1',Pg1);

% LT: 0.1129 W

function angls = inverse_k(H)
angls = [0,0,0,0,0];
P = H(1:3,4);
Pc = P - 215 * H(1:3,3);
angls(1) = atan2(Pc(2), Pc(1));
L2 = 1075;
L3 = sqrt(1280^2+225^2);
r = sqrt(Pc(1)^2 + Pc(2)^2)-312;
c = Pc(3) - 670;
angls(3) = acos((r^2 + c^2 - L2^2-L3^2)/(2*L2*L3))- acos(225/L3);
angls(2) = atan2(L2 + L3*sin(angls(3)), L3*cos(angls(3)))+atan2(c, r) - pi/2;
R1 = Rotz(angls(1))*Rotx(pi/2);
R2 = Rotz(angls(2));
R3 = Rotz(angls(3))*Roty(pi/2)*Rotz(-pi/2);
R_0_3 = R1*R2*R3;
R_0_3 =  R_0_3(1:3,1:3); %rotz(angls(1))* rotx(90)*rotz(angls(2))*rotz(angls(3))*roty(90)*rotz(-90)
%syms theta4 theta5;
%syms rt;
%R4 = Rotz(theta4)*Rotx(rt);
%R5 = Rotz(theta5)*Rotx(-rt);
%R4*R5
R_3_5 = R_0_3'*H(1:3,1:3);
R_3_5(1,2);
%angls(4) = atan2(-R_3_5(1,2), R_3_5(2,2));
%angls(5) = atan2(R_3_5(3,1), R_3_5(3,3));
end


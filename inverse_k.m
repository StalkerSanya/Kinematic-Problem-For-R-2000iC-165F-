function angls = inverse_k(H)
angls = [0,0,0,0,0,0];
P = H(1:3,4);
Pc = P - 215 * H(1:3,3);
angls(1) = atan2(Pc(2), Pc(1));
L2 = 1075;
L3 = sqrt(1280^2+225^2);
r = sqrt(Pc(1)^2 + Pc(2)^2)-312;
c = Pc(3) - 670;
angls(3) = acos((r^2 + c^2 - L2^2-L3^2)/(2*L2*L3))- acos(225/L3);
angls(2) = -atan2(L3*sin(angls(3)+acos(225/L3)),L2 + L3*cos(angls(3)+acos(225/L3)))+atan2(c, r) ;
R1 = Rotz(angls(1));
R2 = Rotx(pi/2)*Rotz(angls(2));
R3 = Rotz(angls(3)); %
R_0_3 = R1*R2*R3;
R_0_3 =  R_0_3(1:3,1:3); %rotz(angls(1))* rotx(90)*rotz(angls(2))*rotz(angls(3))*roty(90)*rotz(-90)
syms q4 q5 q6;
syms rt ; %rt is the same pi/2
%R4 = Roty(rt)*Rotz(-rt)*Rotz(q4);
%R5 = Rotx(rt)*Rotz(q5);
%%R6 = Rotx(-rt)*Rotz(q6);
%R4*R5*R6
R_4_6 = R_0_3'*H(1:3,1:3);
angls(5) = acos(R_4_6(1,3));
if sin(angls(5)) > 0.1 || sin(angls(5)) < -0.1
angls(4) = atan2(R_4_6(3,3), R_4_6(2,3)); %if sin(q5) != 0
end
if sin(angls(5)) > 0.1 || sin(angls(5)) < -0.1
angls(6) = acos(R_4_6(1,1)/sin(angls(5))); %if sin(q5) != 0
end
end


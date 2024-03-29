function p = forward_k(angles)
theta1 = angles(1);
theta2 = angles(2);
theta3 = angles(3);
theta4 = angles(4);
theta5 = angles(5);
theta6 = angles(6);
Tz0 = [1 0 0 0;
       0 1 0 0;
       0 0 1 (670-324);
       0 0 0 1];
Tx1 = [1 0 0 312;
       0 1 0 0;
       0 0 1 0;
       0 0 0 1];
Tz1 = [1 0 0 0;
       0 1 0 0;
       0 0 1 324;
       0 0 0 1];
Ty2 = [1 0 0 0;
       0 1 0 1075;
       0 0 1 0;
       0 0 0 1];
Ty3 = [1 0 0 0;
       0 1 0 225;
       0 0 1 0;
       0 0 0 1];
Tx3 = [1 0 0 1280;
       0 1 0 0;
       0 0 1 0;
       0 0 0 1];
Ty5 = [1 0 0 0;
       0 1 0 215;
       0 0 1 0;
       0 0 0 1];
H1 = Tz0*Rotz(theta1);
H2 = Tx1*Tz1*Rotx(pi/2)*Rotz(theta2);
H3 = Ty2*Rotz(theta3);
H4 = Ty3*Tx3*Roty(pi/2)*Rotz(-pi/2)*Rotz(theta4);
H5 = Rotx(pi/2)*Rotz(theta5);
H6 = Ty5*Rotx(-pi/2)*Rotz(theta6);
H = H1*H2*H3*H4*H5*H6
p = H * [0;0;0;1];
p = p(1:3);
end


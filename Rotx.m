function Hx = Rotx(angl)
Hx = [1 0  0 0;
      0 cos(angl) -sin(angl) 0;
      0 sin(angl) cos(angl) 0;
      0 0 0 1];
end


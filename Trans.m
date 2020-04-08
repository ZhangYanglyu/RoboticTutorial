function H = Trans(vector3)
%TRANSLATION Translation Transformation
%   Detailed explanation goes here
H = [1 0 0 vector3(1);
     0 1 0 vector3(2);
     0 0 1 vector3(3);
     0 0 0 1];
end


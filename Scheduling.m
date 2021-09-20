function [Shift_rank] = Scheduling(Sum_happy,m,n)
% THIS SCRIPT ORGANIZES THE IMPORTANCE OF WHICH SHIFTS OF THE DAY
% TO START WITH.

Shift_rank = m*ones(m,1);

for h = 1:m
    int_rank = m;
for g = 1:m
if Sum_happy(h) < Sum_happy(g)
    Shift_rank(h) = int_rank - 1;
    int_rank = Shift_rank(h);
elseif Sum_happy(h) == Sum_happy(g) && h<g
    Shift_rank(h) = int_rank - 1;
    int_rank = Shift_rank(h); 
else
    
end
end
end
%Shift_rank






    
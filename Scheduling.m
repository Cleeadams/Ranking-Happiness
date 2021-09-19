function [Shift_rank, A] = Scheduling(m,n)
% THIS SCRIPT ORGANIZES THE IMPORTANCE OF WHICH SHIFTS OF THE DAY
% TO START WITH.

%m -> shifts
%m = 5;
%n -> employees
%n = 8;

A = zeros(1,m*n);


% One Day:

for i = 1:m:m*n
A(1,i:i+(m-1)) = randi([-1,1],1,m);
end
 
Sum_happy = zeros(m,1);

for i = 1:m
   for t = 1:n
      Sum_happy(i) = A(1,m*(t-1)+i) + Sum_happy(i);
   end
end
%Sum_happy

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






    
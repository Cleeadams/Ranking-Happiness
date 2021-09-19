clear;

%m -> shifts
m = 5;
%n -> employees
n = 6;

A = zeros(1,m*n);


% Day 1:

for i = 1:m:m*(n-1)
A(1,i:i+(m-1)) = randi([-1,1],1,m);
end

Sum_happy = zeros(m,1);

for i = 1:m
   for t = 1:n
      Sum_happy(i) = A(1,m*(t-1)+i) + Sum_happy(i);
   end
end
Sum_happy

dumby_shift = m;
Shift = m*ones(m,1);

for h = 1:m
    int_rank = m;
for g = 1:m
if Sum_happy(h) < Sum_happy(g)
    Shift(h) = int_rank - 1;
    int_rank = Shift(h);
elseif Sum_happy(h) == Sum_happy(g) && h<g
    Shift(h) = int_rank - 1;
    int_rank = Shift(h); 
else
    
end
end
end
Shift
% sum_A = zeros(2,2);
% 
% 
% %Sum of the employees availability.
% 
% for i = 1:6
%     
%     sum_A = A(:,2*i-1:2*i) + sum_A;
% 
% end
% reorg_sum_A = sum_A
% 
% shift = zeros(1,4);
% 
% if reorg_sum_A(1,1) < 6 || reorg_sum_A(1,1) == 6
%     shift(1) = 1;
%     prev_sum_A = reorg_sum_A(1,1);
% end
% 
% %for v = 1:2 
% v=1;
% for c = 1:2
%     if reorg_sum_A(v,c) < reorg_sum_A(1,1)
%         if reorg_sum_A(v,c) < prev_sum_A
%         shift(c) = 1;
%         shift(c-1) = 2;
%         prev_sum_A = reorg_sum_A(v,c);
%         else
%             shift(c) = 2;
%         end
%     else
%     end
% end
% %end
%     





    
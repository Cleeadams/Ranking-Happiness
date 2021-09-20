function [A] = Staff_Shuffler(A,m,n) 

shuf = zeros(1,m*n);
for t = 1:m:m*(n-1)
   shuf(t:t+(m-1)) = A(t+m:t+2*m-1);
    
end
shuf(m*(n-1)+1:m*n) = A(1:m);

A = shuf;

end
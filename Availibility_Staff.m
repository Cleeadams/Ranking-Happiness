function[A] = Availibility_Staff(m,n)
A = zeros(1,m*n);

for i = 1:m:m*n
A(1,i:i+(m-1)) = randi([-1,1],1,m);
end
end
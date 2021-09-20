function[Determ_Shifts, Unhappy_shift, Sum_happy, Determ_Staff] = Determiner(A,m,n)
Sum_happy = zeros(m,1);

for i = 1:m
   for t = 1:n
      Sum_happy(i) = A(1,m*(t-1)+i) + Sum_happy(i);
   end
   if Sum_happy(i) == -n
       Determ_Shifts = 'A schedule can not be made because no one is available to work shift %d\n';
       Unhappy_shift = i;
       break
   else
       Determ_Shifts = 0;
       Unhappy_shift = 0;
   end
end

Sum_Shifts = zeros(1,n);
if m == n
    for p = 1:n
        for g = 1:n
        Sum_Shifts(p) = A(m*(p-1)+g) + Sum_Shifts(p);
        end
        if Sum_Shifts(p) == -n 
            Determ_Staff = 'There is not enough staff to complete the schedule \n';
            break
        else
            Determ_Staff = 0;
        end
    end
end

end
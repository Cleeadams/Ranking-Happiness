function [Day_Schedule_BACKUP, Unschedule_Shift_BACKUP] = Scheduling_Shifts_backup(A, Shift_rank, m, n, sched)

Day_Schedule_BACKUP = zeros(m,1);
Staff = zeros(n,1);

%h represents happiness scale order. So starting with Shift_rank = 1.
for h = 1:m
shift_avail = zeros(n,1);
%Collect just the selected shift from staff.
for s = 1:n
    %Start while loop and a will be the shift that is rank = h.
    a = 1;
    while Shift_rank(a) ~= h
        a = a+1;
    end
    shift_avail(s) = A(a+m*(s-1));
end
%shift_avail
%Select shift_rank
for j = 1:m
if Shift_rank(j) == h
    for k = 1:n
        % preffered = 1, so we want to pick staff memebers that prefer to 
        % to work that shift.
        if shift_avail(k) > -1 && Staff(k) == 0
            if mod(sched-1+k,n) == 0
                Day_Schedule_BACKUP(j) = n;
                Staff(k) = 1;
                break
            else
                Day_Schedule_BACKUP(j) = mod(sched-1+k,n); % = k for shed = 1
                Staff(k) = 1;
                break
            end
        else 
        end
    end
else
end
end
end

%Storing the failures as vectors
outcome = 1;
for r = 1:m
    if Day_Schedule_BACKUP(r) == 0
        Unschedule_Shift_BACKUP(outcome) = r;
        outcome = outcome+1;
    else
    end
end
if outcome == 1
Unschedule_Shift_BACKUP = -1;
end



end
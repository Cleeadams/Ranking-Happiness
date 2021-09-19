function [Day_Schedule, Unschedule_Shift] = Scheduling_Shifts(A, Shift_rank, m, n)
% THIS SCRIPT CREATES A SCHEDULE STARTING WITH THE IMPORTANT SHIFTS

% Called from Scheduling script.
%Shift_rank = [1;3;4;2];
%m -> # of shifts.
%m = 4;
%n -> # of staff.
%n = 4;
%Create blank schedule to fill.
Day_Schedule = zeros(m,1);
Staff = zeros(n,1);

%Create staff availability.
%A = zeros(1,m*n);
%for i = 1:m:m*n
%A(1,i:i+(m-1)) = randi([-1,1],1,m);
%end

%Focus on shift_rank 1:
for h = 1:m
shift_avail = zeros(n,1);
%Collect just the selected shift from staff.
for s = 1:n
    % a starts my while loop and shuffles through Shift_rank
    a = 1;
    % d will make sure to select the correct staff's avail.
    d = 1;
    while Shift_rank(a) ~= h
        d = Shift_rank(a);
        a = a+1;
    end
    shift_avail(s) = A(d+m*(s-1));
end
%shift_avail
%Select shift_rank
for j = 1:m
if Shift_rank(j) == h
    for k = 1:n
        % preffered = 1, so we want to pick staff memebers that prefer to 
        % to work that shift.
        if shift_avail(k) == 1 && Staff(k) == 0
            Day_Schedule(j) = k;
            Staff(k) = 1;
            break
        else 
        end
    end
else
end
end
end
%Schedule

% Finish schedule based upon availibility.
for h = 1:m
shift_avail = zeros(n,1);
%Collect just the selected shift from staff.
for s = 1:n
    % a starts my while loop and shuffles through Shift_rank
    a = 1;
    % d will make sure to select the correct staff's avail.
    d = 1;
    while Shift_rank(a) ~= h
        d = Shift_rank(a);
        a = a+1;
    end
    shift_avail(s) = A(d+m*(s-1));
end

%Select shift_rank
for j = 1:m
if Shift_rank(j) == h
    for f = 1:m
        if Day_Schedule(f) == 0
            for x = 1:n
                if Staff(x) == 0 && shift_avail(x) == 0
                    Day_Schedule(f) = x;
                    Staff(x) = 1;
                    break
                end
            end
         else
         end
     end
end
end
end
%Day_Schedule

%Stroing the failures as vectors
outcome = 1;
for r = 1:m
    if Day_Schedule(r) == 0
        Unschedule_Shift(outcome) = r;
        outcome = outcome+1;
    else
    end
end
if outcome == 1
Unschedule_Shift = -1;
end
end
% WE STILL NEED TO TAKE IN TO CONSIDERATION:
    % SHIFTS THAT REQUIRE MULTIPLE STAFF MEMBERS.
    % CREATE A FUNCTION THAT REORGANIZES THE STAFF MEMBERS TO ELIMINATE
    % BIASES.
    
    

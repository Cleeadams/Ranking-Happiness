function [] = Schedule_day_builder(m,n)

Incomplete_Schedules = 0;
%The availability vector is created below.
[A] = Availibility_Staff(m,n);

%Determines if a schedule can even be created from the availability.
[Determ_Shifts, Unhappy_shift, Sum_happy, Determ_Staff] = Determiner(A,m,n);
if Determ_Shifts ~= 0
    fprintf(Determ_Shifts, Unhappy_shift);
elseif Determ_Staff ~= 0
    fprintf(Determ_Staff);
else
    
%Determines a ordering system for which shifts to start scheduling first.
[Shift_rank] = Scheduling(Sum_happy,m,n);

%This creates (n-STAFF) schedules to remove staff bias by displaying
%multiple schedules to choose from.
for sched = 1:n
    %Creates a schedule for the day in question while also collecting
    %the number schedules that couldn't be completed.
[Day_Schedule, Unschedule_Shift] = Scheduling_Shifts(A, Shift_rank, m, n, sched);
fprintf('Day 1: Schedule %d\n', sched);
disp(Day_Schedule)

%Let's the user know about any shifts that couldn't be scheduled.
if Unschedule_Shift ~= -1
    for w = 1:length(Unschedule_Shift)
    fprintf('No one is available to work shift %d\n', Unschedule_Shift(w));
    end
    %If the variable = n, then we have a problem of the inability to create
    %a complete schedule which leaves us to develop a new way of creating a
    %schedule.
    Incomplete_Schedules = 1 + Incomplete_Schedules;
else
end

%Rotates which staff member is considered first for a shift.
[A] = Staff_Shuffler(A,m,n);
end

%If a complete schedule is unable to be made due to optimization
%method, then a new way of creating a schedule is ran in hopes of producing
%a working schedule.
if Incomplete_Schedules == n
    for sched = 1:n
        [Day_Schedule_BACKUP, Unschedule_Shift_BACKUP] = Scheduling_Shifts_backup(A, Shift_rank, m, n, sched);
        fprintf('Day 1: Schedule %d\n', sched);
        disp(Day_Schedule_BACKUP)

        if Unschedule_Shift_BACKUP ~= -1
            for w = 1:length(Unschedule_Shift_BACKUP)
            fprintf('No one is available to work shift %d\n', Unschedule_Shift_BACKUP(w));
            end
        else
        end

        [A] = Staff_Shuffler(A,m,n);
    end
end
end

end
function [] = Schedule_day_builder(m,n)

Incomplete_Schedules = 0;
[Shift_rank, A] = Scheduling(m,n);
for sched = 1:n
[Day_Schedule, Unschedule_Shift] = Scheduling_Shifts(A, Shift_rank, m, n, sched);
fprintf('Day 1: Schedule %d\n', sched);
disp(Day_Schedule)

if Unschedule_Shift ~= -1
    for w = 1:length(Unschedule_Shift)
    fprintf('No one is available to work shift %d\n', Unschedule_Shift(w));
    end
    Incomplete_Schedules = 1 + Incomplete_Schedules;
else
end

[A] = Staff_Shuffler(A,m,n);
end

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
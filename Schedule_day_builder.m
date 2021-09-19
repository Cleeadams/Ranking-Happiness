function [] = Schedule_day_builder(m,n)

[Shift_rank, A] = Scheduling(m,n);
[Day_Schedule, Unschedule_Shift] = Scheduling_Shifts(A, Shift_rank, m, n);
disp(Day_Schedule)

if Unschedule_Shift ~= -1
    for w = 1:length(Unschedule_Shift)
    fprintf('No one is available to work shift %d\n', Unschedule_Shift(w));
    end
else
end


end
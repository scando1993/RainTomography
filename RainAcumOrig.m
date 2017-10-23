function [TRR,events] = RainAcumOrig(imp,cap,t_period)

% Inputs: 
% imp: Imported data from the rain gauges files.
% cap: Rain gauge bucket capacity [mm]

% Outputs: 
% TT: One minute rain rate time series (time table + rain rate) of the rain
% gauge [mm/h] according to the "Original Algorithm"
% events: Number of events detected by the rain gauge according to the
% "Original Algorithm"

B = imp.textdata(2:end,2); % date and time in one row
t = datetime(B,'InputFormat','yyyy-MM-dd HH:mm:ss.S'); % date and time in one row with correct format
n = datevec(t);
j = 0;
i = 1;

while i < size (n,1)
    T = etime(n(i+1,:),n(i,:));
    if (T < 1)
        n(i+1,:) = [];
        i = i-1;
    else
        j = j+1;
        R = 3600*(cap/T);
        %R = cap;
        Ta(j,1) = T;
        Ra(j,1) = R;
    end
 i = i+1;   
end

%n = round(n);
Time = datetime(n,'InputFormat','yyyy-MM-dd HH:mm:ss');
Ta(length(Ta)+1,1) = 0;
Ra(length(Ra)+1,1) = 0;
%TRR = timetable(Time,Ta,Ra);

events = 0;

k = 1;
while k < length(Ta)
    if (Ta(k) > 3600) 
        Ta(k) = 0;
        Ra(k) = 0;
    end
    k = k+1;
end

k = 1;
while k < length(Ta)
    if (Ta(k) == 0) & (Ta(k+1) ~= 0)
            Ta(k+1,:) = [];
            Ra(k+1,:) = [];
            Time(k+1,:) = [];
    end
    k = k+1;
end

for l = 1:(length(Ta)-1)
    if (Ta(l) == 0) & (Ta(l+1) ~= 0)
        events = events+1;
    end
end

if (Ta(1) < 3600)
        Ta(1,:) = [];
        Ra(1,:) = [];
        Time(1,:) = [];
        if (Ta(1) ~= 0)
            events = events+1;
        end
end

TRR = timetable(Time,Ta,Ra);
%TRR = retime(TRR,'secondly','previous');
%newTimes = datetime('2016-03-22 12:00:00'):seconds(1):datetime('2016-04-28 12:00:00');
%newTimes = datetime('2016-03-22 12:00:00'):seconds(1):datetime('2017-05-29 12:00:00');
TRR = retime(TRR,t_period,'previous');
TRR{:,:}(isnan(TRR{:,:})) = 0;
TRR = retime(TRR,'secondly','mean');
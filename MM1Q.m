%% M/M/1 QUEUE VERSION 4

clear; 

% Initializations 

lambda = 9 ;   % parameter for arrival process
mu = 10 ;      % parameter for service time

T = 100000 ;    % total simulation runtime
N = 0 ;        % no. of people in the queue

present_time = (1/lambda)*log(1/(1-rand)); % arrival time of first person 
event_kind = 1; % arrival required first

iter1 = 1;      % this variable keeps track of arrivals
iter2 = 1;      % this variable keeps track of deprtures

N_TOT = zeros(200000, 1);

% customer_data array structure is as follows: 
% customer_number | arrival_time | start_of_service_time | departure_time

customer_data = NaN(lambda*T + 1000, 4) ; % initializing array with expected no. of customers


service_station = 0; % initially service station is empty (flag)

% start of main loop
while present_time < T
    
    % disp("present_time = " + num2str(present_time));

    if event_kind == 1                      % event is an arrival

        N = N + 1;                          % add person to queue
        customer_data(iter1, 1) = iter1 ;   
        customer_data(iter1, 2) = present_time ; % record their arrival time
        
        if service_station == 0  % if service station is idle

            customer_data(iter2, 3) = present_time ;  % arrival time is also service starting time 
            N = N - 1 ; % queue length decreases

            service_station = 1; % raise flag : occupied
            customer_data(iter2, 4) = present_time + (1/mu)*log(1/(1-rand)); % record his departure time
            next_departure_time = customer_data(iter2, 4) ;

            iter2 = iter2 + 1 ;

        end

        next_arrival_time = present_time + (1/lambda)*log(1/(1-rand));
        iter1 = iter1 + 1 ;

    else        % departure / service end time occurring

        if N > 0 % people are present in the queue
            customer_data(iter2,3) = present_time ;  % record his service start time
            N = N - 1;
            service_station = 1 ; % raise flag -- occupied
            customer_data(iter2, 4) = present_time + (1/mu)*log(1/(1-rand)); % record his departure time
            next_departure_time = customer_data(iter2, 4) ;

            iter2 = iter2 + 1 ;

        else
            % no customers ahead, last person just left, 
            % station becomes idle
            service_station = 0 ;
            
        end
   
    end

    

    % if the queue if empty, 
    % and if the service station is empty
    % we can skip to the arrival of the next person immediately
    if N == 0 && service_station==0 

        N_TOT(N+1) = N_TOT(N+1) + (next_arrival_time - present_time) ;

        present_time = next_arrival_time ;
        event_kind = 1;

    else

        if next_arrival_time < next_departure_time

        if service_station==1
            N_TOT(N+1 +1) = N_TOT(N+1+1) + (next_arrival_time - present_time);
        else
            N_TOT(N+1) = N_TOT(N+1) + (next_arrival_time - present_time) ;
        end

        present_time = next_arrival_time ; 
        event_kind = 1 ; 

        
    else

        if service_station==1
            N_TOT(N+1+1) = N_TOT(N+1+1) + (next_departure_time - present_time);
        else
            N_TOT(N+1) = N_TOT(N+1) + (next_departure_time - present_time) ;
        end

        present_time = next_departure_time ;
        event_kind = 2 ;
        end

        
    end


end

customer_data = rmmissing(customer_data) ;

% ignore the customers that were in line, 
% but simulation ended before any processing 

last_serviced_person = find(customer_data(:,3) == 0, 1) - 1 ;

if(isempty(last_serviced_person))
    last_serviced_person = length(customer_data(:,1)) ;

end


% calculating statistics 

mean_waiting_time_queue = mean(customer_data(1:last_serviced_person,3) - customer_data(1:last_serviced_person,2)) ;

mean_service_time = mean(customer_data(1:last_serviced_person,4) - customer_data(1:last_serviced_person,3)) ;

mean_time_in_system = mean(customer_data(1:last_serviced_person,4) - customer_data(1:last_serviced_person,2)) ;

disp(num2str(mean_waiting_time_queue));
disp(num2str(mean_time_in_system)) ;
disp(num2str(mean_service_time)) ;

% save("wait_times_rho=0.75.mat", "mean_waiting_time_queue", "mean_service_time","mean_time_in_system");

lastidx = find(N_TOT ~=0 ,1, "last") ;

N_TOT = N_TOT(1:lastidx);

for i = 1:length(N_TOT)
    mean_n(i) = N_TOT(i)/ T ;

    rho = lambda/mu ;
    mean_n_analytical(i) = rho^(i-1) * (1-rho);
end


% save("Pn_0.9.mat", "mean_n", "mean_n_analytical");


% (1/lambda)*log(1/(1-rand))
% (1/mu)*log(1/(1-rand))
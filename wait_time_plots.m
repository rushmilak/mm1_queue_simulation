% wait time plots

load("wait_times_rho=0.9.mat", "mean_waiting_time_queue","mean_service_time","mean_time_in_system");

WQ1 = mean_waiting_time_queue ;
WS1 = mean_service_time ;
WT1 = mean_time_in_system ;

WQ1_A = 9/(10*(10-9)) ;
WT1_A = 1/(10-9);
WS1_A = WT1_A - WQ1_A  ;


load("wait_times_rho=0.5.mat", "mean_waiting_time_queue","mean_service_time","mean_time_in_system");

WQ2 = mean_waiting_time_queue ;
WS2 = mean_service_time ;
WT2 = mean_time_in_system ;


WQ2_A = 5/(10*(10-5)) ;
WT2_A = 1/(10-5);
WS2_A = WT2_A - WQ2_A;


load("wait_times_rho=0.25.mat", "mean_waiting_time_queue","mean_service_time","mean_time_in_system");

WQ3 = mean_waiting_time_queue ;
WS3 = mean_service_time ;
WT3 = mean_time_in_system ;

WQ3_A = 2.5/(10*(10-2.5)) ;
WT3_A = 1/(10-2.5);
WS3_A = WT3_A - WQ3_A;


load("wait_times_rho=0.75.mat", "mean_waiting_time_queue","mean_service_time","mean_time_in_system");

WQ4 = mean_waiting_time_queue ;
WS4 = mean_service_time ;
WT4 = mean_time_in_system ;

WQ4_A = 7.5/(10*(10-7.5)) ;
WT4_A = 1/(10-7.5);
WS4_A = WT4_A - WQ4_A;



x_axis_rho = [0.25 0.5 0.75 0.9] ;

WQ_S = [WQ3 WQ2 WQ4 WQ1] ;
WQ_A = [WQ3_A WQ2_A WQ4_A WQ1_A] ;

WS_S = [WS3 WS2 WS4 WS1] ;
WS_A = [WS3_A WS2_A WS4_A WS1_A] ;


WT_S = [WT3 WT2 WT4 WT1] ;
WT_A = [WT3_A WT2_A WT4_A WT1_A] ;


figure(1)
plot(x_axis_rho,WQ_S, "Color","k", LineWidth=5, DisplayName="Simulated", LineStyle="-", Marker="diamond") ;
hold on ;
plot(x_axis_rho,WQ_A, "Color","g", LineWidth=5, DisplayName="Analytical", LineStyle=":", Marker="+") ;
xlabel("\rho") ;
ylabel("W_Q") ;
legend(fontsize=25);
set(gca,fontsize=25);
xlim([0.25 0.9]) ;
ylim([0 1]);

figure(2)
plot(x_axis_rho,WS_S, "Color","k", LineWidth=5, DisplayName="Simulated", LineStyle="-", Marker="diamond") ;
hold on ;
plot(x_axis_rho,WS_A, "Color","g", LineWidth=5, DisplayName="Analytical", LineStyle=":", Marker="+") ;
xlabel("\rho") ;
ylabel("W_S") ;
legend(fontsize=25);
set(gca,fontsize=25);
xlim([0.25 0.9]) ;
ylim([0 1]);

figure(3)
plot(x_axis_rho,WT_S, "Color","k", LineWidth=5, DisplayName="Simulated", LineStyle="-", Marker="diamond") ;
hold on ;
plot(x_axis_rho,WT_A, "Color","g", LineWidth=5, DisplayName="Analytical", LineStyle=":", Marker="+") ;
xlabel("\rho") ;
ylabel("W_T") ;
legend(fontsize=25);
set(gca,fontsize=25);
xlim([0.25 0.9]) ;
ylim([0 1]);
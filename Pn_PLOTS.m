% plot stationary probability 

%load data

load("Pn_0.25.mat", "mean_n", "mean_n_analytical");
PN1_S = mean_n ;
PN1_A = mean_n_analytical;

load("Pn_0.5.mat", "mean_n", "mean_n_analytical");
PN2_S = mean_n ;
PN2_A = mean_n_analytical;

load("Pn_0.75.mat", "mean_n", "mean_n_analytical");
PN3_S = mean_n ;
PN3_A = mean_n_analytical;

load("Pn_0.9.mat", "mean_n", "mean_n_analytical");
PN4_S = mean_n ;
PN4_A = mean_n_analytical;

% plot analytical VS simulated
figure(1)
plot([0:1:length(PN3_S)-1], PN3_S, DisplayName="Simulated", LineStyle="-",Color="k", LineWidth=5);
hold on;
plot([0:1:length(PN3_A)-1], PN3_A, DisplayName="Analytical", LineStyle=":",Color="g", LineWidth=5);
xlabel("n");
ylabel("P_n");
set(gca,fontsize=25);
legend(FontSize=25);
xlim([0 length(PN3_S)-1]);


% plot comparing Pn
figure(2)
plot([0:1:length(PN1_S)-1], PN1_S, DisplayName="\rho = 0.25", LineStyle="-",Color="b", LineWidth=5);
hold on;
plot([0:1:length(PN2_S)-1], PN2_S, DisplayName="\rho = 0.5", LineStyle="-",Color="r", LineWidth=5);
hold on;
plot([0:1:length(PN4_S)-1], PN4_S, DisplayName="\rho = 0.9", LineStyle="-",Color="g", LineWidth=5);
xlabel("n");
ylabel("P_n");
set(gca,fontsize=25);
legend(FontSize=25);
xlim([0 length(PN2_S)-1]);



%% Generates Uniform RV in [0,1]  : X ~ U(0,1)
%  plots the distribution in [0.75 1] 
%  f(x) = 1/(b-a)
clear ;


function PUrv = uniform_rv(upper_lim, lower_lim)

PUrv = (upper_lim - lower_lim) ;

end

x_vec = linspace(0.75,1,100) ;

Pr_value = zeros(1,100);

for i=1:100

    x = x_vec(i) ;

    Pr_value(i) = uniform_rv(1, x) ;

end


URV = zeros(10^6,1);

for i=1:length(URV)

    URV(i) = rand ;

end


points = [0.750 0.775 0.800 0.825 0.850 0.900 0.925 0.950 1] ;


for j=1:length(points)
    
    PRV(j) = sum(URV > points(j)) / length(URV) ;

end

plot(points, PRV, LineWidth=5, Color="k", DisplayName="Sample") ;
xlabel("x") ;
ylabel("P(X>x)") ;
set(gca,fontsize=25);
xlim([0.75 1]);
hold on;

plot(x_vec, Pr_value, LineWidth=5, Color="g" , LineStyle=":", DisplayName="Deterministic") ;
set(gca,fontsize=25);
xlim([0.75 1]);
legend(FontSize=25) ;
hold on;





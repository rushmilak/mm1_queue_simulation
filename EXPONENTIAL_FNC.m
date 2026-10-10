%% function to generate exponential random variable
clear;

% INVERSE TRANSFORM SAMPLING

E_X = 10 ;

mu = 1/E_X ;

P = zeros(10^6, 1);

for i = 1: length(P)

    U = rand;

    P(i) = (1/mu)*log(1/(1-U));
end

cc=0;

for i=1:floor(max(P))
    cf = sum(P<i)/length(P) ; % P(X<x)
    
    CF(i) = cf ;

end


x = linspace(0,floor(max(P)), length(CF)) ;


% plot to compare pdf
figure(1)

plot(x, gradient(CF,1), DisplayName="Sample", LineWidth=5, Color="k", LineStyle="-");
hold on;
plot(x, exppdf(x,1/mu), DisplayName="MATLAB function", LineWidth=5, Color="g", LineStyle=":") ;
xlabel("x");
ylabel("f(x)");
legend(FontSize=25);
set(gca,fontsize=25) ;
xlim([0 max(x)]);

figure(2)

plot(x, (1-CF), DisplayName="Sample", LineWidth=5, Color="k", LineStyle="-");
hold on;
plot(x,  1-expcdf(x,1/mu), DisplayName="MATLAB function", LineWidth=5, Color="m", LineStyle=":");
xlabel("x");
ylabel("P(X>x)");
legend(FontSize=25);
set(gca,fontsize=25) ;
xlim([0 max(x)]);

% figure(3)
% plot(gradient(CF,1));
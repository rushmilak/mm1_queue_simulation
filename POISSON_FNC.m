%% function to generate poisson random variable

% INVERSE TRANSFORM SAMPLING
clear ;

lambda = 10 ;   % parameter

P = zeros(1,10^6) ;

for i = 1:length(P)
    n=0;
    U = 0;

while U<1

    n = n+1 ;

    E = (1/lambda)*log(1/(1-rand));
    U = U + (E) ;

end

P(i) = n-1;
end

cf = 0 ;
for i = 1:max(P)

    s(i) = sum(P==i) / length(P);
    cf = cf + s(i) ;

    CF(i) = cf ;
end

x  = [1:1:max(P)] ;


for i=1:max(P)
ss(i) = poisspdf(i,10) ;
end

% figures for pdf
figure(1) % simulated
bar(s, "k") ;
xlabel("x")
xlim([1 max(P)] ) ;
set(gca,fontsize=25) ;

figure(2)
bar(ss, "b"); % analytical
xlabel("x");
xlim([1 max(P)] ) ;
set(gca,fontsize=25) ;

% figure(3) ;
% plot(gs);

figure(3)

plot(x, 1-CF, DisplayName="Sample", LineWidth=5, Color="k", LineStyle="-") ;
hold on;
plot(x, 1-poisscdf(x,lambda), DisplayName="MATLAB func", LineWidth=5, Color="m", LineStyle=":") ;
ylabel("P(X>x)");
xlabel("x")
legend(FontSize=25);
set(gca,fontsize=25) ;
xlim([1 max(x)]);

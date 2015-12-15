%% SSP Homework - Tobias Schuster

%%
% Pinging the www.google.com

%out=pingstats_linux('www.google.com',1000,'v');
%save out
load('out.mat')
close all

%% Problem iii)

%%
% Gauss Distribution
mu_g = sum(out)/length(out)

var_g = sum((out-mu_g).^2)/length(out)

%%
% Rayleigh Distribution

var_ray = (1/(2*length(out))) * sum((out).^2)

%%
% Erlang Distribution

lamda_0 = length(out)/sum(out)

lamda_1 = (2*length(out))/sum(out)

lamda_2 = (3*length(out))/sum(out)

%%
% Exponential Distribution

alpha_exp = min(out)

Y = (out-alpha_exp);
lambda_exp = length(out)/sum(Y)

%%
% SR (Shifted Rayleigh Distribution)

alpha_SR = min(out)

lambda_SR = (sum(((out-alpha_SR).^2)/(2*length(out))))
%%
% Since I couldnt solve the equation from ii f), the equation for alpha
% is missing. I just estimated for the 
% exponential density that alpha is the minimum.

%% Problem iv)

hist(out,200)
title('Histogram')

%%
% Gaussian
gaus     = (1/(sqrt(2*pi*var_g)))*exp(-(((g_out)-mu_g).^2/(2*var_g)));
gaus_sec = (1/(sqrt(2*pi*var_g)))*exp(-(((.1:70)-mu_g).^2/(2*var_g)));
figure
hold on
bar(x,f/sum(f))
plot(g_out,gaus,'*')
plot(.1:70,gaus_sec,'r')
xlabel('Ping time [ms]')
title('Gaussian')
hold off

%%
% Rayleigh
rayleigh     = ((out/var_ray).*exp(-((out.^2)/(2*var_ray))));
rayleigh_sec = (((.1:70)/var_ray).*exp(-(((.1:70).^2)/(2*var_ray))));
figure
hold on
bar(x,f/sum(f))
plot(out_n,rayleigh,'*')
plot(.1:70,rayleigh_sec,'r')
xlabel('Ping time [ms]')
title('Rayleigh Distribution')
hold off

%%
% Erlang
erlang_0   = (lamda_0 * exp(-lamda_0*out_n));
erlang_0_2 = (lamda_0 * exp(-lamda_0*(.1:70)));

erlang_1   = ((lamda_1^2) .* out_n .* exp(-lamda_1*out_n));
erlang_1_2 = ((lamda_1^2) .* (.1:70) .* exp(-lamda_1*(.1:70)));

erlang_2   = (((lamda_2^3)/2) .* (out_n.^2) .* exp(-lamda_2*out_n));
erlang_2_2 = (((lamda_2^3)/2) .* ((.1:70).^2) .* exp(-lamda_2*(.1:70)));
figure
hold on
bar(x,f/sum(f))
plot(out_n,erlang_0,'*')
plot(out_n,erlang_1,'g*')
plot(out_n,erlang_2,'c*')
plot(.1:70,erlang_0_2,'r')
plot(.1:70,erlang_1_2,'r')
plot(.1:70,erlang_2_2,'r')
xlabel('Ping time [ms]')
title('Erlang Distribution')
legend('Histogr','m = 0','m = 1','m = 2')
hold off

%%
% Exponent
exponent     = (lambda_exp)*exp(-lambda_exp*(out-alpha_exp));
exponent_sec = (lambda_exp)*exp(-lambda_exp*((.1:70)-alpha_exp));
figure
hold on
bar(x,f/sum(f))
plot(out_n,exponent,'*')
plot(.1:70,exponent_sec,'r')
xlabel('Ping time [ms]')
title('Exponential Distribution')
hold off

%%
% Shifted Rayleigh
SR   = ((out_n-alpha_SR)/lambda_SR).*exp(-1*(((out_n-alpha_SR).^2)/(2*lambda_SR)));
SR_2 = (((.1:70)-alpha_SR)/lambda_SR).*exp(-1*((((.1:70)-alpha_SR).^2)/(2*lambda_SR)));
figure
hold on
bar(x,f/sum(f))
plot(out_n,SR,'*')
plot(.1:70,SR_2,'r')
xlabel('Ping time [ms]')
title('Shifted Rayleigh Distribution')
hold off

%%

figure('Name','Histogram','NumberTitle','off')

y_min = min(out);
y_max = max(out);
out_n = out;
g_out = sort(out_n);
subplot(3,2,1)
hist(out,200)
[f,x]=hist(out,200);
title('Histogram for www.google.com')

subplot(3,2,2)
hold on
bar(x,f/sum(f))
plot(g_out,gaus,'*')
plot(.1:70,gaus_sec,'r')
xlabel('Ping time [ms]')
hold off
title('Gaussian')

subplot(3,2,3)
hold on
bar(x,f/sum(f))
plot(out_n,rayleigh,'*')
plot(.1:70,rayleigh_sec,'r')
xlabel('Ping time [ms]')
hold off
title('Rayleigh Distribution')


subplot(3,2,4)
hold on
bar(x,f/sum(f))
plot(out_n,erlang_0,'*')
plot(out_n,erlang_1,'g*')
plot(out_n,erlang_2,'c*')
plot(.1:70,erlang_0_2,'r')
plot(.1:70,erlang_1_2,'r')
plot(.1:70,erlang_2_2,'r')
hold off
xlabel('Ping time [ms]')
title('Erlang Distribution')


subplot(3,2,5)
hold on
bar(x,f/sum(f))
plot(out_n,exponent,'*')
plot(.1:70,exponent_sec,'r')
hold off
xlabel('Ping time [ms]')
title('Exponential Distribution')

subplot(3,2,6)
hold on
bar(x,f/sum(f))
plot(out_n,SR,'*')
plot(.1:70,SR_2,'r')
hold off
xlabel('Ping time [ms]')
title('Shifted Rayleigh Distribution')

figure('Name','Final Plot','NumberTitle','off')
hold on
hist(out,200)
plot(g_out,(1/max(gaus))*278*gaus,'*')
plot(out_n,(1/max(rayleigh))*rayleigh*278,'r*')
plot(out_n,(1/max(erlang_0))*erlang_0*278,'c*')
plot(out_n,(1/max(erlang_1))*erlang_1*278,'y*')
plot(out_n,(1/max(erlang_2))*erlang_2*278,'m*')
plot(out_n,(1/max(exponent))*exponent*278,'*')
plot(out_n,(1/max(SR))*SR*278,'g*')
xlabel('Ping time [ms]')
title('Histogram with all the normalized Distributions')


legend('Hist','Gaus','Rayleigh','Erlang0','Erlang1','Erlang2','Exponent','Shifted Rayleigh')


%% Problem v)

Name = {'Gaus','Rayleigh','Erlang 0','Erlang 1','Erlang 2','Exponential','SR'};

maxlikelihood(1) = max(sum(log(gaus)));
maxlikelihood(2) = max(sum(log(rayleigh)));
maxlikelihood(3) = max(sum(log(erlang_0)));
maxlikelihood(4) = max(sum(log(erlang_1)));
maxlikelihood(5) = max(sum(log(erlang_2)));
maxlikelihood(6) = max(sum(log(exponent)));
maxlikelihood(7) = max(sum(log(SR)));

[val ind] = max((maxlikelihood));
Name(ind)

%%
% According to the Maximum Likelihood we just applied, the output is, that 
% the Exponential distribution is the best one. By looking at the graphs this looks
% reasonable. 


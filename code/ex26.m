syms x %requires symbolic toolbox

%wave parameters
S = 1/sqrt(2);
n = (2*pi*S) / acos(1-2*S*S);

%error function
f = 100 * (1 - 2*pi / (x*acos(1+(1 / (S*S))*(cos(2*pi*S / x) - 1))));
fplot(f, [n 80])

set(gca, 'YScale','log')
xlabel('Ny')
ylabel('Error (%)')

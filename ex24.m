syms x %requires symbolic toolbox

%wave parameters
S = 1/sqrt(2);
n = (2*pi*S) / acos(1-2*S*S);

%Ny < Ny_transição
f1 = 2/x;
fplot(f1,[1 n])
hold on

%Ny > Ny_transição
f2 = 2*pi/(x*acos(1+(1/(S*S))*(cos(2*pi*S/x) - 1)));
fplot(f2,[n 10])

%atenuação
f3 = 1 + 1/(S*S) * (cos(2*pi*S/x) - 1);
fplot(-log(-f3 - sqrt(power(f3,2) - 1)),[1 n])

legend({'Ny < Ny_{transição}','Ny > Ny_{transição}', 'constante de atenuação'},'Location','northeast');
xlabel('Ny')
hold off
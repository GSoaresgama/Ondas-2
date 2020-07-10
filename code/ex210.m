%wave parameters
Nt = 250;
Nz = 250;
S = 1.0005;

%matrix values
u1 = zeros(Nt,Nz);

%gaussian pulse parameters
sigma = 1/sqrt(2*pi);
nDt = 40; %interval between 1/e points
interval = 2*sigma*sqrt(2)/nDt; %size of interval
i_pico = 60; %max position
media = interval * i_pico;

for i = 1:(i_pico * 2)
    u1(i, 1) = normpdf((i-1)*interval, media, sigma);
end

for n = 2:(Nt-1)
    for z = 2:(Nz-1)
        u1(n+1, z) = S*S*(u1(n, z+1) - 2*u1(n, z) + u1(n,z-1)) + 2*u1(n,z) - u1(n-1, z);
    end
end

%normal
figure(1)
x = 1:Nz;
plot(x, u1(200,:))
hold on
plot(x, u1(210,:))
plot(x, u1(220,:))
hold off
legend({'n = 200','n = 210', 'n = 220'},'Location','northeast');
xlabel('coordenada i da grid')
ylabel('função de onda u(i)')

%zoom
figure(2)
x = 1:Nz;
plot(x, u1(200,:))
hold on
plot(x, u1(210,:))
plot(x, u1(220,:))
xlim([1 20]);
hold off
legend({'n = 200','n = 210', 'n = 220'},'Location','northeast');
xlabel('coordenada i da grid')
ylabel('função de onda u(i)')

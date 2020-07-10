%wave parameters
Nt = 300;
Nz = 300;
S = 1;

%matrix values
u1 = zeros(Nt,Nz);

%gaussian pulse parameters
sigma = 1/sqrt(2*pi);
nDt = 10; %interval between 1/e points
interval = 2*sigma*sqrt(2)/nDt; %size of interval
i_pico = 60; %max position
media = interval * i_pico;

for i = 1:(i_pico * 2)
    u1(i, 1) = normpdf((i-1)*interval, media, sigma);
end

for n = 2:(Nt-1)
    for z = 2:(Nz-1)
        S = 1;
        if z == 90
            S = 1.075;
        end
        u1(n+1, z) = S*S*(u1(n, z+1) - 2*u1(n, z) + u1(n,z-1)) + 2*u1(n,z) - u1(n-1, z);
    end
end

%normal
figure(1)
x = 1:Nz;
plot(x, u1(260,:))
hold on
plot(x, u1(270,:))
xlim([0 Nz])
hold off
legend({'n = 260','n = 270'},'Location','northeast');
xlabel('coordenada i da grid')
ylabel('função de onda u(i)')

%zoom
figure(2)
x = 1:Nz;
plot(x, u1(260,:))
hold on
plot(x, u1(270,:))
xlim([70 110])
hold off
legend({'n = 260','n = 270'},'Location','northeast');
xlabel('coordenada i da grid')
ylabel('função de onda u(i)')

%wave parameters
Nt = 200;
Nz = 200;
S1 = 1;
S2 = 0.99;
S3 = 0.5;

%matrix values
u1 = zeros(Nt,Nz);
u2 = zeros(Nt,Nz);
u3 = zeros(Nt,Nz);

%gaussian pulse parameters
sigma = 1/sqrt(2*pi);
nDt = 40; %interval between 1/e points
interval = 2*sigma*sqrt(2)/nDt; %size of interval
i_pico = 60; %max position
media = interval * i_pico;

for i = 1:(i_pico * 2)
    u1(i, 1) = normpdf((i-1)*interval, media, sigma);
    u2(i, 1) = normpdf((i-1)*interval, media, sigma);
    u3(i, 1) = normpdf((i-1)*interval, media, sigma);
end

for n = 2:(Nt-1)
    for z = 2:(Nz-1)
        u1(n+1, z) = S1*S1*(u1(n, z+1) - 2*u1(n, z) + u1(n,z-1)) + 2*u1(n,z) - u1(n-1, z);
        u2(n+1, z) = S2*S2*(u2(n, z+1) - 2*u2(n, z) + u2(n,z-1)) + 2*u2(n,z) - u2(n-1, z);
        u3(n+1, z) = S3*S3*(u3(n, z+1) - 2*u3(n, z) + u3(n,z-1)) + 2*u3(n,z) - u3(n-1, z);
    end
end

%S = 1 and S = 0.99
figure(1)
x = 1:Nz;
plot(x, u1(150,:))
hold on
plot(x, u2(150,:))
hold off
legend({'S = 1','S = 0.99'},'Location','northeast');
xlabel('coordenada i da grid')
ylabel('função de onda u(i)')

%S = 1 and S = 0.5
figure(2)
plot(x, u1(150,:))
hold on
x3 = (1/S3:1/S3:Nz/S3);
plot(x3, u3(150,:))
xlim([0 Nz])
hold off
legend({'S = 1','S = 0.5'},'Location','northeast');
xlabel('coordenada i da grid')
ylabel('função de onda u(i)')


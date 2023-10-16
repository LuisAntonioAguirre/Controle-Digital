% O objetivo do script eh ilustrar o mapeamento z=exp(Ts)
%
% o codigo eh explicado no video: https://youtu.be/3iN1vNwIpJo
%
% LAA 11/6/21

clear
close

% definir parametros basicos
% tempo de amostragem
T=1;
% frequencia de amostragem
ws=2*pi/T;

% gerar valores aleatorios no semiplano esquerdo da faixa
% primaria ateh s>-2
% parte real
Rs=-rand(1000,1)*2;
% parte imaginaria
Is=(rand(1000,1)-0.5)*2*(ws/2);

% grafico
figure(1)
subplot(211)
plot(Rs,Is,'b.')
axis([-3 1 -ws ws])
xlabel('Re')
ylabel('Im')

% mapeamento para o plano z
j=sqrt(-1);
% modulo de z
Mz=exp(T*Rs);
% fase de z
Fz=T*Is*180/pi;
subplot(212)
polarplot(Fz,Mz,'r.')

%% gerar valores aleatorios no semiplano direito da faixa
% primaria ateh s<0,5
% parte real
Rs=rand(1000,1)*0.5;
% parte imaginaria 
Is=(rand(1000,1)-0.5)*2*(ws/2);

% grafico
figure(2)
subplot(211)
plot(Rs,Is,'b.')
axis([-3 1 -ws ws])
xlabel('Re')
ylabel('Im')

% mapeamento para o plano z
% modulo de z
Mz=exp(T*Rs);
% fase de z
Fz=T*Is*180/pi;
subplot(212)
polarplot(Fz,Mz,'r.')

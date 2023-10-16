% Interpolacao
% video associado: https://youtu.be/gdS1V3e5GR4

% LAA 16/03/2018

clear
close all

% vetor de tempo "continuo"
delta=pi/100;
t=0:delta:3*pi;

% sinal continuo
m_de_t=sin(t);

figure(1)
set(gca,'FontSize',18)
plot(t,m_de_t)
axis([-0.1 10 -1.1 1.1])
xlabel('t')
ylabel('m(t)')

% tempo de amostragem
T=pi/3;

% frequencia de amostragem
ws=2*pi/T;

% vetor de "tempo" com instantes de amostragem
t_amos=t(1:round(T/delta):end);

% vetor de indices correspondentes aos instantes de amostragem
k=1:round(T/delta):length(t);

% sinal estrelado (apos o amostrador). Ainda eh um sinal continuo.
m_estrela=m_de_t(k);

figure(1)
hold on
stem(t_amos,m_estrela)
ylabel('m(t), m*(t)')
hold off

% resposta ao impulso de um interplador "ideal" (funcao sinc)
% usaremos um vetor de tempo bem mais longo e comecando em tempo negativo
% para calcular a sinc:

t_sinc=-10*pi:delta:10*pi;
h_de_t=sinc(t_sinc/T);

% centro da sinc
c=find(h_de_t==max(h_de_t));

figure(2)
set(gca,'FontSize',18)
plot(t_sinc,h_de_t)
axis([-10 10 -0.3 1.1])
xlabel('t')
ylabel('h(t)')


m_int=zeros(1,c-k(end));
for j=1:length(k)
m_int=m_int+m_estrela(j)*h_de_t(c-(k(j)-1):c-(k(j)-1)+c-k(end)-1);
end

figure(1)
hold on
plot(t,m_int(1:length(t)))
ylabel('m(t), m*(t), m~(t)')
hold off

%% Segurador de ordem zero

% para ficar melhor, reduzimos delta e T

% vetor de tempo "continuo"
delta=pi/1000;
t=0:delta:3*pi;

% sinal continuo
m_de_t=sin(t);
% tempo de amostragem
T=pi/10;

% frequencia de amostragem
ws=2*pi/T;

% vetor de "tempo" com instantes de amostragem
t_amos=t(1:round(T/delta):end);

% vetor de indices correspondentes aos instantes de amostragem
k=1:round(T/delta):length(t);

% sinal estrelado (apos o amostrador). Ainda eh um sinal continuo.
m_estrela=m_de_t(k);


[th,mzoh]=zoh2(m_estrela,delta,T);

figure(3)
set(gca,'FontSize',18)
plot(t,m_de_t,th(1:length(mzoh)),mzoh)
hold on
stem(t_amos,m_estrela)
hold off
axis([-0.1 10 -1.1 1.1])
xlabel('t')
ylabel('m(t), m*(t), m~(t)')


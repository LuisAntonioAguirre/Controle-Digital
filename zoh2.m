function [t,yzoh]=zoh2(y,delta,T);

% [t,yzoh]=zoh2(y,delta,T);
% y: sequencia discreta (pode ser interpretado como y_estrela
% delta: intervalo de "integracao" usado
% T: intervalo de amostragem
% T/delta deve ser inteiro
% cada valor em y sera mantido constante durante o tempo T
% t: vetor de tempo "continuo" t=0:delta:length(y)*T
% yzoh saida do segurador de ordem zero, com dimensao igual aa de t

% Luis A. Aguirre, BH 23/10/2012

% intervalo de amostragem em termos de delta
Delta=round(T/delta);

yzoh=[];
for k=1:length(y)
    yzoh=[yzoh;ones(Delta,1)*y(k)];
end
t=0:delta:(length(y))*T-delta;

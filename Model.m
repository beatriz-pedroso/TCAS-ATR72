%% Tema 12 - Controlo de velocidade ar e altitude
% TCAS - sistema de deteção e desvio de colisão automático
% Grupo: Beatriz Pedroso, nº95773
%        Simao Goncalves, nº95846
%        Tiago Escalda, nº95851

%%
clc
clear
close all

%% Condicoes de voo 3 - ATR72
%load('const_atr72_3.mat');
const_atr72_3;
deg2rad=pi/180;

%% Modelo Dinamico
disp('%%%Parte 1%%%')

A=[Xu Xw -aa0*U0 -g*cos(tt0);
   Zu/(1-Zwp) Zw/(1-Zwp) (Zq+U0)/(1-Zwp) -g*sin(tt0)/(1-Zwp);
   Mu+Mwp*Zu/(1-Zwp) Mw+Mwp*Zw/(1-Zwp) Mq+Mwp*(Zq+U0)/(1-Zwp) -Mwp*g*sin(tt0)/(1-Zwp); 
   0 0 1 0]; % Matriz da dinamica do sistema

B=[Xde Xdt;
   Zde/(1-Zwp) Zdt/(1-Zwp);
   Mde+Mwp*Zde/(1-Zwp) Mdt+Mwp*Zdt/(1-Zwp);
   0 0]; % Matriz de entrada

C=eye(4); % Matriz de saida
D=zeros(4,2); % Matriz de saida direta
[wn,xi,polos]=damp(A);% Determinacao da frequencia natural, do coeficiente de amortecimento e dos polos do sistema
damp(A);
T=1\((wn).*(xi)); % Constante de tempo


%% Sistema de aumento de estabilidade
%objetivo: xi_fug>0.6; xi_pc>0.3; desacoplamento de modos; nivel 1

disp('%%%Parte 2%%%')
stoptime=500; %tempo de simulação

%alteracoes ao periodo curto
sys_q = ss(A, B(:,1), [0 0 1 0], 0); %realimentacao negativa da razão de picada deltaE = kq*q
% figure()
% rlocus(-sys_q); %usar LGR em malha aberta
%[kq,poles] = rlocfind(sys_q);
kq=2.2890; %ganho escolhido atraves do rlocfind
A_pc=A + B(:,1)*kq*[0 0 1 0];
damp(A_pc);


%alteracoes ao modo fugoide
sys_u = ss(A_pc, B(:,2), [1 0 0 0], 0); %realimentacao negativa razao u com deltaT
%rlocus(sys_u);
%[ku,poles] = rlocfind(sys_u);
ku=0.0654; %ganho escolhido atraves do rlocfind
damp(A_pc - B(:,2)*ku*[1 0 0 0]); %sistema final com aumento de estabilidade (2 realimentacoes)

%Simular inputs e respostas; desenhar gráficos
sim_pre = sim('preSAE');
%figs2;

%% Controlo atitude
%xT=[u w q theta h], introducao do estado h

disp('%%%Parte 3%%%')

%novas matrizes, para o novo vetor de estados
A_lqr = [A zeros(4, 1);
     0 -1 0 U0 0];
B_lqr=[B
       0 0];
C_lqr=eye(5);
D_lqr=zeros(5,2);

%introducao de controlo MIMO - lqr com servomecanismo

%máximos das perturbações desejadas para as variaveis
umax = 0.2;
wmax = 0.2618;
qmax = 2.5*deg2rad;
ttmax = 3*deg2rad;
hmax = 0.2;

emax = 3*deg2rad;
tmax = 0.2;

%definição das matrizes Q e R pelo metodo de Bryson
Q = diag([1/umax^2 1/wmax^2 1/qmax^2  1/ttmax^2  1/hmax^2]);
R = diag([1/emax^2 1/tmax^2]);

%calculo de ganhos
Klqr = lqr(A_lqr, B_lqr, Q, R); %ganho ótimo dado pelo lqr
kuh = [Klqr(:,1),Klqr(:,5)]; %ganho servomecanismo
G0_inv=-([C_lqr(1,:);C_lqr(5,:)]*((A_lqr-B_lqr*Klqr)^(-1))*B_lqr*kuh)^(-1); %inverso do ganho estatico

%determinacao da frequencia natural e do coeficiente de amortecimento com lqr
damp(A_lqr-B_lqr*Klqr);

%Simular inputs e respostas; desenhar graficos
sim_lqr=sim('ponto3.slx');
%figs3_4;

%% Sensores e Atuadores

disp('%%%Parte 4%%%')

%o bloco de simulink em que se implementa a funcao de transferencia com a constante de tempo
%foi transformado num espaco de estados, dado que o ponto de equilibrio definido para o estado da altura nao era nulo
num=[1];
den=[T_h 1];
[A_sensorh,B_sensorh,C_sensorh,D_sensorh] = tf2ss(num,den);

%valores do lqr redifinidos, dadas as consequencias e introducao de sensores e atuadores
umax = 10;
wmax = 0.8;
qmax = 10*deg2rad;
ttmax = 5*deg2rad;
hmax = 4.5;

emax = 1*deg2rad;
tmax = 0.05;

%definição das novas matrizes Q e R, pelo metodo de Bryson
Q = diag([1/umax^2 1/wmax^2 1/qmax^2  1/ttmax^2  1/hmax^2]);
R = diag([1/emax^2 1/tmax^2]);

%calculo de ganhos
Klqr = lqr(A_lqr, B_lqr, Q, R); %ganho ótimo dado pelo lqr
kuh = [Klqr(:,1),Klqr(:,5)]; %ganho servomecanismo
G0_inv=-([C_lqr(1,:);C_lqr(5,:)]*((A_lqr-B_lqr*Klqr)^(-1))*B_lqr*kuh)^(-1);  %inverso do ganho estatico

%determinacao da frequencia natural e do coeficiente de amortecimento com lqr
damp(A_lqr-B_lqr*Klqr);

%Simular inputs e respostas; desenhar graficos
sim4=sim('Act_Sens.slx');
figs3_4;

%% Sistema TCAS

disp('%%%Parte 5%%%')
uW=10; %velocidade vento N-S
u_ref=0; %velocidade u de referencia

%Simular inputs e respostas; desenhar graficos
%Caso 0 - Nenhuma aeronave altera a trajetoria
%Caso 1 - Aeronave A altera a trajetória
%Caso 2 - Ambas as aeronaves alteram a trajetoria

for caso=1:2
    sim5=sim('TCAS');
    figs5;
    figure(100)
    plot(dist.time, dist.signals.values);
    hold on
end

figure(100)
yline(6.5423e+03); %distancia a que o TCAS começa a atuar,a 25s da colisao
legend({'caso 1','caso 2','$dist_{25s}$'});
%Se o caso 0 tambem for impresso, a legenda do grafico da distancia tem de ser alterada
xlabel('time [s]');
ylabel('distancia [m]');
set(findall(gcf,'-property','FontSize'),'FontSize',14)
set(findall(gcf,'-property','interpreter'),'interpreter','latex')
hold off
    
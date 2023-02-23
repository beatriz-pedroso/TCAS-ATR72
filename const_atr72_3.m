%constants
g=9.81; %m/s^2
f_amostr = 40; %Hz

%ATR72-3
h =7620; %metros
M =0.46;
aa0 =2.52*(pi/180); %rad
gg0 =0; %angulo de subida
U0 =275.3*0.514444444; %m/s
flaps =0;

tt0=aa0+gg0; %rad

%inputs : 
th0 =0.92;
de0 =0.00;
da0 =0.00; 
dr0 =0.00; 

%limits
Teng =0.80; %s
demax =+26*(pi/180); %rad
demin = -22*(pi/180); %rad
damax =20*(pi/180); %rad
drmax =28*(pi/180); %rad
flapmax =30*(pi/180); %rad

vmax_de = 60*(pi/180); %rad/s
vmin_de = -60*(pi/180); %rad/s
dtmax = 1;
dtmin = 0;
Tde = 0.1; %s
T_h = 0.1 ; %s
T_TAS = 0.1; %s
T_ang_aero = 0.01; %s


aa_RMS = 5e-3; %V
raz_ang_RMS = 2e-3; %V 
%inertial data :
m =14304; %kg 
Ix =161613; %kg .m ^2
Iy =362601; %kg .m ^2
Iz =385411; %kg .m ^2 
Ixz =1519; %kg .m ^2

%wing data : 
S =61.04; %m ^2 
b =27.026; %m 
c =2.616; %m 
aamax =15.52; %degrees

%derivatives ( no units or SI units ):
Xu = -0.0170;
Xw = 0.0398; 
Zu = -0.1389; 
Zw = -0.9272; 
Zwp = -0.0046; 
Zq = -1.5066; 
Mu = 0.0000; 
Mw = -0.0518; 
Mq = -0.7133; 
Mwp =0.0008; 

Ybb = -0.3471; 
Lbb = -3.1049; 
Nbb = 9.1713; 
Yp = 0.0007; 
Lp = -1.8750; 
Np = 0.0879; 
Yr = 0.0032; 
Lr = -0.4719; 
Nr = -0.0462;

Xde = 0.000; 
Zde = -1.222; 
Mde = -1.682; 
Xdf = -5.686; 
Zdf = -34.536; 
Mdf = 0.046; 
Xdt = 1.184; 
Zdt = 0.000; 
Mdt = 0.028;

Lda = -5.305;
Nda = 2.293; 
Ydr = -0.078;
Ldr = -0.247;
Ndr = -3.806;
NdTL = 0.135;
NdTR = -0.135;


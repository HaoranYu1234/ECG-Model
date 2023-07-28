L=30/72;%frequecy

      a_pwav=0.25;% Amplitude in v
      d_pwav=0.09;% duration of the wave in s
      t_pwav=0.2;  %The initial points of the wave
     
      a_qwav=0.025;
      d_qwav=0.066;
      t_qwav=0.166;
      
      a_qrswav=1.6;
      d_qrswav=0.11;
      
      a_swav=0.45;
      d_swav=0.066;
      t_swav=0.09;
      
      a_twav=0.35;
      d_twav=0.142;
      t_twav=0.3;
      
      a_uwav=0.035;
      d_uwav=0.0476;
      t_uwav=0.433;

%QRS
a=a_qrswav;
QRS_x=0.01:0.01:2;

d=d_qrswav;
n=100;
QRS_a0=(a/(2*d/L))*(2-d/L);
QRS_an=0;
for i = 1:n
    an=0;
    an=(((2*L*a)/(i*i*pi*pi*d))*(1-cos((i*pi*d)/L)))*cos((i*pi*QRS_x)/L);             
    QRS_an=QRS_an+an;
end
QRS=QRS_a0/2+QRS_an;
%p
a=a_pwav;
P_x=0.01:0.01:2;
P_x=P_x+t_pwav;
d=d_pwav/2;
n=100;
P_a0=1/L;
P_an=0;
for i = 1:n
    an=0;
    an=-4*d*L/(pi*(4*d^2*i^2-L^2))*cos(pi*d*i/L)*cos(i*pi*P_x/L); 
  
    P_an=P_an+an;
end
P=a*(1/L+P_a0/2+P_an);
%T
a=a_twav;
T_x=0.01:0.01:2;
T_x=T_x-t_twav-0.045;
d=d_twav/2;
n=100;
T_a0=1/L;
T_an=0;
for i = 1:n
   
    an=-4*d*L/(pi*(4*d^2*i^2-L^2))*cos(pi*d*i/L)*cos(i*pi*T_x/L); 
  
    T_an=T_an+an;
end
T=a*(T_a0/2+T_an);
%U
a=a_uwav;
U_x=0.01:0.01:2;
U_x=U_x-t_uwav;
d=d_uwav/2;
n=100;
U_a0=1/L;
U_an=0;
for i = 1:n
   
    an=-4*d*L/(pi*(4*d^2*i^2-L^2))*cos(pi*d*i/L)*cos(i*pi*U_x/L); 
  
    U_an=U_an+an;
end
U=a*(U_a0/2+U_an);

%Q
a=a_qwav;
Q_x=0.01:0.01:2;
Q_x=Q_x+t_qwav;
d=d_qwav/2;
n=100;
Q_a0=(a/(2*L/d))*(2-L/d);
Q_an=0;
for i = 1:n
   
    an=(((2*L*a)/(i*i*pi*pi*d))*(1-cos((i*pi*d)/L)))*cos((i*pi*Q_x)/L); 
  
    Q_an=Q_an+an;
end
Q=-1*(1/L+Q_a0/2+Q_an);

%S
a=a_swav;
S_x=0.01:0.01:2;
S_x=S_x-t_swav;
d=d_swav/2;
n=100;
S_a0=(a/(2*L/d))*(2-L/d);
S_an=0;
for i = 1:n
   
    an=(((2*L*a)/(i*i*pi*pi*d))*(1-cos((i*pi*d)/L)))*cos((i*pi*S_x)/L); 
  
    S_an=S_an+an;
end
S=-1*(S_a0+S_an);
%ecg=QRS+P+T+U+Q+S;
ecg=P;
figure(1)
plot(ecg);

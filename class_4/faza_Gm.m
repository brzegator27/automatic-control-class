function e = faza_Gm(K)
faza=45;
[licz,mian]=zp2tf([],[-1 -1 -1],K);
[Gm,Pm]=margin(licz,mian);
e=abs(Gm-faza); 
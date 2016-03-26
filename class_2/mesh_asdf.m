t=0:0.05:5;
dl=length(t);
LiczbaWykresow=12;
y=zeros(dl,LiczbaWykresow);
n=1;
while(n<=LiczbaWykresow)
 [licz,mian]=zp2tf([],[-n/4+3*i -n/4-3*i], (n/4)^2+9);
 [y(1:dl,n),x,tt]=step(licz,mian,t);
 n=n+1;
end
mesh(t,1:12,y'); 
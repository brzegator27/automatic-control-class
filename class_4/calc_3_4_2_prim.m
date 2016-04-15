[licz,mian]=zp2tf([],[-1 -1 -1],4);
[Gm,Pm]=margin(licz,mian); 

faza=45; %zadany zapas fazy
krok=0.01; %krok o kt�ry zwi�kszamy wzmocnienie

granica=8; %granica stabilno�ci, powy�ej kt�rej nie ma sensu szuka�
tolerancja=0.1; %dok�adno�� oblicze�
for K=1:krok:granica
 [licz,mian]=zp2tf([],[-1 -1 -1],K); %w ka�dym kroku obliczamy nowa transmitancje
 [Gm,Pm]=margin(licz,mian); %liczymy zapas modu�u Gm i fazy Pm
 if abs(Gm-faza)<=tolerancja %sprawdzamy dopuszczalny b��d
 fprintf(1,'Dla wzmocnienia K = %.3f zapas modu�u wynosi %.3f stopnie\n',K,Gm)
 fprintf(1,'Blad wynosi %f\n',abs(faza-Gm))
 return
 end
end
fprintf(1,'Nie znaleziono rozwiazania.\nZwieksz tolerancje lub/i zmniejsz krok\n') 


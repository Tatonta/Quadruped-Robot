function euler_int(dt,L)
close all;
t=0:dt:20*pi;
%definisco le condizioni inziali
x_p(1:size(L,1)) = rand(1,size(L,1));
y_p(1:size(L,1)) = rand(1,size(L,1));
f = zeros(1,size(L,1));
%calcolo lo stato del sistema ad ogni istante
hold 
for i = 1:length(t)-1 
 for j = 1:2:size(L,1)
 f(j) = eq1(x_p(j:j+1),y_p(j:j+1));
 f(j+1) = eq2(x_p(j:j+1),y_p(j:j+1));
 end
 x_temp(1:size(L,1)) = x_p(:) + dt*(func(f,x_p,L));
 y_p(:) = 0.5*(abs(x_p+1)-abs(x_p-1));
 x_p(:) = x_temp(:);
%eseguo il plot dello stato per il neurone 1
 plot(t(i),x_p(1),'.k');
 plot(t(i),x_p(2),'.k');
end




close all;
clear all;
L = [3,0,1,0,1,0,-1,0; 
         0,3,0,1,0,1,0,-1; 
         1,0,3,0,-1,0,1,0; 
         0,1,0,3,0,-1,0,1; 
         1,0,-1,0,3,0,1,0; 
         0,1,0,-1,0,3,0,1; 
         -1,0,1,0,1,0,3,0; 
         0,-1,0,1,0,1,0,3];
dt=0.1;
t=0:dt:20*pi;
%here are the initial conditions. They can be random, as we are interested 
%on the steady state behavior, but for debugging purposes we set them to
%these values.
x_p=[0.1, 0.3, -0.2, 0.5, -0.1, 0.7, 0.5, 0.4];
%These two parameters can be used for further "manipulation" of the CPG
%slow-fast dynamics. obviously you need to change the eq1 and eq2 functions
%and add another parameter.
i1=2;
i2=32;
for i = 1:length(t)-1 
     y_p_fl = 1.5*(abs(x_p(1:2)+1)-abs(x_p(1:2)-1)); %front left-leg
     y_p_fr = 0.5*(abs(x_p(3:4)+1)-abs(x_p(3:4)-1)); %front right-leg
     y_p_rl = 1.5*(abs(x_p(5:6)+1)-abs(x_p(5:6)-1)); %rear left-leg
     y_p_rr = 0.5*(abs(x_p(7:8)+1)-abs(x_p(7:8)-1)); %rear right-leg
     y_p=[y_p_fl';y_p_fr';y_p_rl';y_p_rr'];
 for j = 1:2:size(L,1)
     if(j==1 || j==5) %We are changing "s" only for the legs where the nonlinearity
         s=2;         %gain is higher
     else
         s=1;
     end
    f(j) = eq1(x_p(j:j+1),y_p(j:j+1),s);
    f(j+1) = eq2(x_p(j:j+1),y_p(j:j+1),s);
 end
 x_temp(1:size(L,1)) = x_p(:) + dt*(func(f,x_p,L));
 y(:,i)=y_p;
 x_p(:) = x_temp(:);
 x_total(:,i)=x_p;
end
t=t(1:end-1);
% plot(y(1,:))
% hold on
% plot(y(3,:))
figure
plot(t,x_total(1,:));
hold on
plot(t,x_total(3,:));
title("Reaction-diffusion equation output")
legend("Front Left-Leg","Front Right-Leg");
xlabel("Time (seconds)");
ylabel("Amplitude");
figure
plot(x_total(1,:),x_total(2,:));
hold on
plot(x_total(3,:),x_total(4,:));
title("Phase space plot")
xlabel("x1");
ylabel("x2");
legend("Front Left-Leg", "Front Right-Leg");
figure
plot(t,y(1,:));
hold on
plot(t,y(3,:));
legend("Front Left-Leg","Front Right-Leg");
xlabel("Time (seconds)");
ylabel("Amplitude");
% fs=1/dt;
% Front_left = y(1,:)';
% xff_fl = fft(Front_left);
% xff_fl = 2*xff_fl(1:ceil((length(y(1,:))+1)/2));
% freq_axis_fl = 0:fs/length(y(1,:)):fs/2;
% xff_fl = xff_fl/(2*length(freq_axis_fl));
% %[c,I]=max(xff);
% Front_right = y(3,:)';
% xff_fr = fft(Front_right);
% xff_fr = 2*xff_fr(1:ceil((length(y(3,:))+1)/2));
% freq_axis_fr = 0:fs/length(y(3,:)):fs/2;
% xff_fr = xff_fr/(2*length(freq_axis_fr));
% figure
% subplot(2,1,1);
% plot(freq_axis_fl,abs(xff_fl));
% title("Front Left-Leg Amplitude Spectrum")
% xlabel("Frequency Axis");
% ylabel("Amplitude Spectrum");
% subplot(2,1,2);
% plot(freq_axis_fr,abs(xff_fr));
% title("Front Right-Leg Amplitude Spectrum")
% xlabel("Frequency Axis");
% ylabel("Amplitude Spectrum");
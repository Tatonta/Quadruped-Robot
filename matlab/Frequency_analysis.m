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
%definisco le condizioni inziali
x_p=[0.1, 0.3, -0.2, 0.5, -0.1, 0.7, 0.5, 0.4];
%calcolo lo stato del sistema ad ogni istante

for i = 1:length(t)-1 
     y_p_fl = 1*(abs(x_p(1:2)+1)-abs(x_p(1:2)-1));
     y_p_fr = 0.5*(abs(x_p(3:4)+1)-abs(x_p(3:4)-1));
     y_p_rl = 1*(abs(x_p(5:6)+1)-abs(x_p(5:6)-1));
     y_p_rr = 0.5*(abs(x_p(7:8)+1)-abs(x_p(7:8)-1));
     y_p=[y_p_fl';y_p_fr';y_p_rl';y_p_rr'];
 for j = 1:2:size(L,1)
     if(j==1 || j==5)
         s=3;
     else
         s=0.71;
     end
    f(j) = eq1(x_p(j:j+1),y_p(j:j+1),s);
    f(j+1) = eq2(x_p(j:j+1),y_p(j:j+1),s);
 end
 x_temp(1:size(L,1)) = x_p(:) + dt*(func(f,x_p,L));
 y(:,i)=y_p;
 x_p(:) = x_temp(:);
 x_total(:,i)=x_p;
%eseguo il plot dello stato per il neurone 1
end

clear x_p x_temp y_p_fl y_p_fr y_p_rl y_p_rr i j 
%definisco le condizioni inziali
x_p=[0.1, 0.3, -0.2, 0.5, -0.1, 0.7, 0.5, 0.4];
%calcolo lo stato del sistema ad ogni istante

for i = 1:length(t)-1 
     y_p_fl = 1*(abs(x_p(1:2)+1)-abs(x_p(1:2)-1));
     y_p_fr = 0.5*(abs(x_p(3:4)+1)-abs(x_p(3:4)-1));
     y_p_rl = 1*(abs(x_p(5:6)+1)-abs(x_p(5:6)-1));
     y_p_rr = 0.5*(abs(x_p(7:8)+1)-abs(x_p(7:8)-1));
     y_p=[y_p_fl';y_p_fr';y_p_rl';y_p_rr'];
 for j = 1:2:size(L,1)
     if(j==1 || j==5)
         s=2;
     else
         s=0.71;
     end
    f(j) = eq1(x_p(j:j+1),y_p(j:j+1),s);
    f(j+1) = eq2(x_p(j:j+1),y_p(j:j+1),s);
 end
 x_temp(1:size(L,1)) = x_p(:) + dt*(func(f,x_p,L));
 y_1(:,i)=y_p;
 x_p(:) = x_temp(:);
 x_total_1(:,i)=x_p;
%eseguo il plot dello stato per il neurone 1
end

clear x_p x_temp y_p_fl y_p_fr y_p_rl y_p_rr i j
%Frequency Analysis
%% Case with s1=3 and s2=0.71
fs=1/dt;
Front_left = y(1,:)';
xff_fl = fft(Front_left);
xff_fl = 2*xff_fl(1:ceil((length(y(1,:))+1)/2));
freq_axis_fl = 0:fs/length(y(1,:)):fs/2;
xff_fl = xff_fl/(2*length(freq_axis_fl));
%[c,I]=max(xff);
Front_right = y(3,:)';
xff_fr = fft(Front_right);
xff_fr = 2*xff_fr(1:ceil((length(y(3,:))+1)/2));
freq_axis_fr = 0:fs/length(y(3,:)):fs/2;
xff_fr = xff_fr/(2*length(freq_axis_fr));
figure
subplot(2,2,1);
plot(freq_axis_fl,abs(xff_fl));
title("Front Left-Leg Amplitude Spectrum with s1=3")
xlabel("Frequency Axis");
ylabel("Amplitude Spectrum");
subplot(2,2,2);
plot(freq_axis_fr,abs(xff_fr));
title("Front Right-Leg Amplitude Spectrum with s2=0.71")
xlabel("Frequency Axis");
ylabel("Amplitude Spectrum");

%% Case with s1=2 and s2=0.6
fs=1/dt;
Front_left_1 = y_1(1,:)';
xff_fl_1 = fft(Front_left_1);
xff_fl_1 = 2*xff_fl_1(1:ceil((length(y_1(1,:))+1)/2));
freq_axis_fl_1 = 0:fs/length(y_1(1,:)):fs/2;
xff_fl_1 = xff_fl_1/(2*length(freq_axis_fl_1));
%[c,I]=max(xff);
Front_right_1 = y_1(3,:)';
xff_fr_1 = fft(Front_right_1);
xff_fr_1 = 2*xff_fr_1(1:ceil((length(y_1(3,:))+1)/2));
freq_axis_fr_1 = 0:fs/length(y_1(3,:)):fs/2;
xff_fr_1 = xff_fr_1/(2*length(freq_axis_fr_1));
% figure
subplot(2,2,3);
plot(freq_axis_fl_1,abs(xff_fl_1));
title("Front Left-Leg Amplitude Spectrum with s1=2")
xlabel("Frequency Axis");
ylabel("Amplitude Spectrum");
subplot(2,2,4);
plot(freq_axis_fr_1,abs(xff_fr_1));
title("Front Right-Leg Amplitude Spectrum with s2=0.71")
xlabel("Frequency Axis");
ylabel("Amplitude Spectrum");
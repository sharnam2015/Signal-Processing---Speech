%Code by 140100024,1401000034,14D110001
%USER INPUTS
clear all;
 A=1;
 B=2;
 w1=0.25*pi;   %Value of frequency 
 w2=0.75*pi;
 sigma=0.1*(abs(A)+abs(B));
M=10; %For filter 
 
% %---------------------------------------
 w=max(w1,w2);
 w=5*w;
 T1=2*pi/w1;
 T2=2*pi/w2;
 u1=sym(T1);
 v1=sym(T2);
 T=lcm(u1,v1);
 Ts=2*pi/(w);
 t=[0:Ts:10*T];
 x=ones(1,length(t));
 for i=1:length(t)
 x(i)=A*cos(w1*t(i))+B*cos(w2*t(i));
 end
 
%Adding Noise--------------------------

%t=0:0.000125:(10-0.000125);
% for i=1:length(x)
% x(i)=x(i)+sigma*(rand-0.5);
% end
 plot(t,x)
% disp("choose the filter \n 1.Rectangle \n 2.Trangle \n 3.Delta");
% flag=input("Enter the filter number");
% flag=int8(flag);
%{
%Convolution-------------------------------- 
 t=0:0.000125:(10-0.000125);
%  if (flag==1)
%      M=10;
%      h=1/M*(ones(1,M)); %Filter function
%  end
%trangular function ------------------------- 
if(flag==2)
M=10; %USE EVEN 
h=zeros(1,M);
if (rem(M,2)==0)
    for i=1:M
        if(i<=(M/2))
        if (i==1)
            h(i)=0;
        else
        h(i)=h(i-1)+1/(2*M);
        end
        end
        if(i>(M/2))
            if(i==(M/2+1))
                h(i)=h(i-1);
            else
            h(i)=h(i-1)-1/(2*M);
            end
        end
    end
    h
end
end
%---------------------------------------
%DELTA FUNCTION
% if(flag==3)
% p=0.5 %USER INPUT
% h(1)=1+p;
% h(2)=-p;
% end
%--------------------------------------
y=zeros(1,length(t));
y=conv(x,h);
% PLOTTING------------------------------
%x=zeros(1,length(y));
% for i=1:length(t)
% x(i)=A*cos(w1*t(i))+B*cos(w2*t(i));
% end
% for i=1:length(x)
% x(i)=x(i)+sigma*(rand-0.5);
% end
%  t=[0:Ts:10*T];

 plot(t,x,'bo');
 hold on;
 %t=Ts*[0:(length(y)-1)];
 t=0.000125*[0:(length(y)-1)];
 plot(t,y,'r-');
 title('Plot for 10 cycles');
 legend('y = No filter','y = With filter')
 xlabel('t ');
 ylabel('Responce');

%filename = 'handel.wav';audiowrite(filename,b,8000)
% a=audiorecorder(8000,8,1);
% record(a,10);
% b=getaudiodata(a);
% sound(b);
%}






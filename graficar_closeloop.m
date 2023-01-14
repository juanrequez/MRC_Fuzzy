%close all

%graficar lazo abierto
%obtener el vector de tiempo
time=closeloop_X2.time;

%extraer los valores de las estructuras
L2=closeloop_L2.signals(1,:).values;
X2=closeloop_X2.signals(1,:).values;
P2=closeloop_P.signals(1,:).values;


figure
plot(time,L2(:,1),'k--',time,L2(:,2),'k-o',time,L2(:,3),'k');
%title('L2');
xlabel('tiempo, min');
ylabel('nivel normalizado');
grid
legend('P','Ajuste del lazo P','salida deseada','location','best');

figure
plot(time,X2(:,1),'k--',time,X2(:,2),'k-o',time,X2(:,3),'k');
%title('X2');
xlabel('tiempo, min');
ylabel('concentración normalizada');
grid
legend('PI','Ajuste del lazo PI','salida deseada','location','best');

figure
plot(time,P2(:,1),'k--',time,P2(:,2),'k-o',time,P2(:,3),'k');
%title('P2');
xlabel('tiempo, min');
ylabel('presion normalizada');
grid
legend('PI','Ajuste del lazo PI','salida deseada','location','best');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
plot(time,L2(:,1),'k--',time,L2(:,3),'k');
%title('L2');
xlabel('tiempo, min');
ylabel('nivel normalizado');
grid
legend('Ajuste del lazo','salida deseada','location','best');

figure
plot(time,X2(:,1),'k--',time,X2(:,3),'k');
%title('X2');
xlabel('tiempo, min');
ylabel('concentración normalizada');
grid
legend('Ajuste del lazo','salida deseada','location','best');

figure
plot(time,P2(:,1),'k--',time,P2(:,3),'k');
%title('P2');
xlabel('tiempo, min');
ylabel('presion normalizada');
grid
legend('Ajuste del lazo','salida deseada','location','best');
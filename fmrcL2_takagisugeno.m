function z=fmrcL2_takagisugeno(x,y)
%esta función usa sugeno
%deben modificarse los tipos de función y las reglas para establecer la
%lógica
%x entrada del universo de discurso
%y entrada del universo de discurso
%z salida, universo de discurso de salida, centro de area
%este programa usa producto como intersección y maximo como union


%% subconjuntos difusos (seccion modificable)
%conjunto A
%compuesto por cinco funciones de pertenencia
A=1;
funcionA={['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG']};
parametrosA={A*[-3 -2 -1] A*[-2 -1 -0] A*[-1 0 1] A*[0 1 2] A*[1 2 3]};
%conjunto B
%compuesto por cinco funciones de pertenencia
B=A;
funcionB={['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG']};
parametrosB={B*[-3 -2 -1] B*[-2 -1 -0] B*[-1 0 1] B*[0 1 2] B*[1 2 3]};


%% reglas (sección modificable
%si x pertenece a subconjuntoA y Y pertenece a subconjuntoB entonces
%Subconjunto C se traduce como
%regla(i)=[numero_subconjuntoA numero_subconjuntoB numero_subconjuntoC]
D=5;%10
MP=2*D;P=1*D;C=0*D;N=-1*D;MN=-2*D;
regla=[];
regla(1,:)=[1 1 C];
regla(2,:)=[1 2 N];
regla(3,:)=[1 3 N];
regla(4,:)=[1 4 MN];
regla(5,:)=[1 5 MN];
regla(6,:)=[2 1 P];
regla(7,:)=[2 2 C];
regla(8,:)=[2 3 N];
regla(9,:)=[2 4 N];
regla(10,:)=[2 5 MN];
regla(11,:)=[3 1 P];
regla(12,:)=[3 2 P];
regla(13,:)=[3 3 C];
regla(14,:)=[3 4 N];
regla(15,:)=[3 5 N];
regla(16,:)=[4 1 MP];
regla(17,:)=[4 2 P];
regla(18,:)=[4 3 P];
regla(19,:)=[4 4 C];
regla(20,:)=[4 5 N];
regla(21,:)=[5 1 MP];
regla(22,:)=[5 2 MP];
regla(23,:)=[5 3 P];
regla(24,:)=[5 4 P];
regla(25,:)=[5 5 C];

%% PARAMETROS A partir de aqui, nada es modificable
na=length(funcionA);%numero de subconjuntos de A
nb=length(funcionB);%numero de subconjuntos de B
nr=size(regla,1); %numero de reglas

%% PASO 1: Calcular las pertenencias de X y Y a A y B (no modificar)

%calcular la pertenencia de X a cada subconjunto de A
for i=1:na
    miuA(i)=pertenencia(x,funcionA{i},parametrosA{i});
end
%calcular la pertenencia de Y a cada subconjunto de B
for i=1:nb
    miuB(i)=pertenencia(y,funcionB{i},parametrosB{i});
end

%% PASO 2 Aplicar las reglas difusas (no modificar)

%prod intersección
for i=1:nr
    subconjA=regla(i,1);
    subconjB=regla(i,2);
    w(i)=(miuA(subconjA)*miuB(subconjB)); %antecedente
    Z(i)=regla(i,3); %consecuente
end

%% calcular la salida (no modificar)
if sum(w)==0
    z=0;
else
    z=(w*Z')/sum(w);
end

    

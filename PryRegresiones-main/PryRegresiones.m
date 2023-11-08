%----------------------------Regresion Lineal Simple---------------------
clc;
%Ingresion de datos
printf("\t\t\tPROGRAMA DE REGRESIONES RECOMENDABLES\n\t\t\t(LINEAL,POLINOMIAL °2, EXPONENCIAL)\n");
printf("\n");
printf("\nIngrese los valores de x, EJEMPLO [1,3,2,3,4]\n");
Val_x = input('');
printf("\nIngrese los valores de y, EJEMPLO [1,3,2,3,4]\n");
Val_y = input('');
X_Y=Val_x.*Val_y;

n=length(Val_x);
s_x= sum(Val_x);
s_y= sum(Val_y);
s_x2=sum(Val_x.^2);
s_xy=sum(X_Y);
promd_y = s_y/n;

%matriz para sacar calculos
A= [n   s_x  s_y
   s_x   s_x2   s_xy];
   
Ar = rref(A);
a0 = Ar(1,3);
a1= Ar(2,3);

%Calculos para calcular el coeficiente de determinacion
printf("\n");
e=Val_y-(a0+a1*Val_x);
sr=sum(e.^2);
st=sum((Val_y-promd_y).^2);
fprintf('\n------------Regresion Lineal Simple------------\n');
r2=((st-sr)/st);
fprintf('\n Coeficientes de determiacion:\n r^2=%.5f',r2);
%coeficiente de correlacion
r= (sqrt(r2));
fprintf('\n Coeficientes de correlacion:\n r=%.5f',r);

%--------------------------------Regresion Polinomica--------------------
%productos y potencias
x_2=Val_x.^2;
x_3=Val_x.^3;
x_4=Val_x.^4;
x2_y=Val_y.*x_2;
X_Y=Val_x.*Val_y;
m=2;
%sumatorias
s_x3=sum(x_3);
s_x4=sum(x_4);
s_x2y=sum(x2_y);

%matriz generada
D= [ n s_x s_x2 s_y
s_x s_x2 s_x3 s_xy
s_x2 s_x3 s_x4 s_x2y];

%coeficientes de la ecuacion

Dr = rref(D);
b0 =Dr(1,4);
b1 =Dr(2,4);
b2 =Dr(3,4);
disp('')
% calculando y-ym
s_ym= sum((Val_y-promd_y).^2);
% calculos para coef.determinacion
sr_1= Val_y-b0-b1*Val_x-b2*x_2;
s_sr=sum(sr_1.^2);
fprintf('\n------------Regresion Polinomica de grado 2------------\n');
r2_1=((s_ym-s_sr)/s_ym);
fprintf('\ncoeficiente de determinacion:\n r^2=%.5f',r2_1 )
disp('')
r_1=(sqrt(r2_1));
fprintf('coeficiente de correlacion:\n r=%.5f',r_1 )
disp('')   

%------------------------------Regresion exponencial---------------------
%productos y potencias
ly=log(Val_y);
xlny=(Val_x.*ly);
%Sumatorias
s_ly=sum(ly);
s_xly=sum(xlny);
%calculando  P 
p= s_ly/n;

%ecuacion generada
E= [n s_x s_ly
s_x s_x2 s_xly];

%coef de la matriz
Er=rref(E);
loga=Er(1,3);
%calculos para lny-p^2
to=(ly-p).^2;
s_to=sum(to);
%coeficientes necesarios para la ecuacion 
b=Er(2,3);
alpha=exp(loga);
%calculos de lny-(lna + bx)^2
da1=((ly-(loga+b*Val_x)).^2);
s_daa =sum(da1);

fprintf('\n------------Regresion Exponencial------------\n');
r2_2=((s_to-s_daa)/s_to);
fprintf('\ncoeficiente de determinacion: \n r^2=%.5f',r2_2')
disp('')
r_2=(sqrt(r2_2));
fprintf('coeficiente de correlacion: \n r=%.5f',r_2')
disp('')

%Desicion para escoger cual regresion es mas recomendable
if(r2>r2_1&&r2>r2_2&&r2<=1)
fprintf('El METODO RECOMENDABLE ES LA REGRESION LINEAL\n');
endif
if(r2_2>r2&&r2_2>r2_1&&r2_2<=1)
fprintf('El METODO RECOMENDABLE ES LA REGRESION EXPONENCIAL\n');
endif
if(r2==r2_1||r2_1==r2)
fprintf('TANTO EL METODO DE REGRESION LINEAL COMO EL POLINOMIAL SON RECOMENDABLE\n')
endif
if(r2_1>r2&&r2_1>r2_2&&r2_1<=1)
fprintf('El METODO RECOMENDABLE ES LA REGRESION POLINOMIAL DE GRADO 2\n');
endif

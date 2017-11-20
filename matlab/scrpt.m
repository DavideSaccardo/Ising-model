%% Project4
%% Task a lattice 2x2

close all
clear all
run 'import_2x2_MC.m'; %%chage _2 to the other
temp2=1;
model_chi_ass=(1./temp2).*(6*exp(8./temp2)+2*exp(-8./temp2)+6)./(19+cosh(16./temp2)+12*cosh(8./temp2));
model_cv=64*(3*cosh(8./temp2)+1)./((6+2*cosh(8./temp2)).^2.*temp2.^2);
model_energy=(16*exp(-8./temp2)-16*exp(8./temp2))./(12+2*exp(-8./temp2)+2*exp(8./temp2))/4;
model_magn=(8*exp(8./temp2)+16)./(12+2*exp(-8./temp2)+2*exp(8./temp2))/4;
model_chi=(4./temp2).*(exp(8./temp2)+1)./(6+2*cosh(8./temp2));

figure();
fig1=plot([0 6035000], [model_energy model_energy], 'color', 'r');%,'Linestyle','none','Marker','.',...
%'color','b', 'markersize',12);
hold on;
plot(cycles2x2,energy2x2, 'color', 'b');%,'Linestyle','none','Marker','.',...
%'color','b', 'markersize',12);

title('Comparison between the energy per spin and the model','Interpreter','LateX','Fontsize',18);
xlabel('MC cycles','Interpreter','LateX','Fontsize',15);
ylabel('$<E>\ [J]$','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Model', 'Data');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);

figure();
fig1=plot([0 6035000], [model_magn model_magn], 'color', 'r');%,'Linestyle','none','Marker','.',...
%'color','b', 'markersize',12);
hold on;
plot(cycles2x2,magn2x2, 'color', 'b');%,'Linestyle','none','Marker','.',...
%'color','b', 'markersize',12);
title('Comparison between the absolute value of magnetization per spin and the model','Interpreter','LateX','Fontsize',18);
xlabel('MC cycles','Interpreter','LateX','Fontsize',15);
ylabel('$<|M|>$','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Model', 'Data');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);

figure();
fig1=plot([0 6035000], [model_cv model_cv], 'color', 'r');%,'Linestyle','none','Marker','.',...
%'color','b', 'markersize',12);
hold on;
plot(cycles2x2,cv2x2, 'color', 'b');%,'Linestyle','none','Marker','.',...
%'color','b', 'markersize',12);
title('Comparison between the specific heat per spin and the model','Interpreter','LateX','Fontsize',18);
xlabel('MC cycles','Interpreter','LateX','Fontsize',15);
ylabel('$C_V [k_{B}]$','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Model', 'Data');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);

figure();
fig1=plot([0 6035000], [model_chi_ass model_chi_ass], 'color', 'r');%,'Linestyle','none','Marker','.',...
%'color','b', 'markersize',12);
hold on;
plot(cycles2x2,chi2x2_abs, 'color', 'b');%,'Linestyle','none','Marker','.',...
%'color','b', 'markersize',12);

title('Comparison between the magnetic susceptibility per spin (with $|M|$) and the model','Interpreter','LateX','Fontsize',18);
xlabel('MC cycles','Interpreter','LateX','Fontsize',15);
ylabel('$\chi_{abs} [J^{-1}]$','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Model', 'Data');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);

figure();
fig1=plot([0 6035000], [model_chi model_chi], 'color', 'r');%,'Linestyle','none','Marker','.',...
%'color','b', 'markersize',12);
hold on;
plot(cycles2x2,chi2x2, 'color', 'b');%,'Linestyle','none','Marker','.',...
%'color','b', 'markersize',12);

title('Comparison between the magnetic susceptibility per spin and the model','Interpreter','LateX','Fontsize',18);
xlabel('MC cycles','Interpreter','LateX','Fontsize',15);
ylabel('$\chi [J^{-1}]$','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Model', 'Data');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);

%% Task 4.C
%% T=1, 2.4 no rand
clear all
close all
run 'import_20x20_1.m';
run 'import_20x20_24.m';

figure();
fig1=plot(cycles1(1:1e5), energy1(1:1e5)); %,'Linestyle','none','Marker','.',...
    %'color','b', 'markersize',12);
hold on
plot([0 1e5], [sum(energy1(1:1e6))/(1e6) sum(energy1(1:1e6))/(1e6)], 'color', 'r');
title('Energy per spin VS MC cycles for  $T=1.0\  k_B\ T\ J^{-1}$ with all spins up','Interpreter','LateX','Fontsize',18);
xlabel('MC cycles','Interpreter','LateX','Fontsize',15);
ylabel('$E [J]$','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Data', '$<E>$');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);

figure();
fig1=plot(cycles1(1:1e5), magn1(1:1e5)); %,'Linestyle','none','Marker','.',...
    %'color','b', 'markersize',12);
hold on
plot([0 1e5], [sum(magn1(1:1e6))/(1e6) sum(magn1(1:1e6))/(1e6)], 'color', 'r');
title('Absolute magnetization per spin VS MC cycles for $T=1.0\  k_B\ T\ J^{-1}$ with all spins up','Interpreter','LateX','Fontsize',18);
xlabel('MC cycles','Interpreter','LateX','Fontsize',15);
ylabel('$|M|$','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Data', '$<|M|>$');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);

figure();
fig1=plot(log10(cycles1), log10(choices1)); %,'Linestyle','none','Marker','.',...
    %'color','b', 'markersize',12);
hold on;
fig1=plot(log10(cycles1), log10(choices24));
title('Comparison between accepted moves VS MC cycles with all spins up in logarithmic scale','Interpreter','LateX','Fontsize',18);
xlabel('$\log10\ $(MC cycles)','Interpreter','LateX','Fontsize',15);
ylabel('$\log10\ $(Accepted moves)','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Data $T=1.0\ k_B\ T\ J^{-1}$', 'Data $T=2.4\ k_B\ T\ J^{-1}$');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);

figure();
fig1=plot(cycles1(1:1e5), energy24(1:1e5)); %,'Linestyle','none','Marker','.',...
    %'color','b', 'markersize',12);
    hold on
plot([0 1e5], [sum(energy24(1:1e6))/(1e6) sum(energy24(1:1e6))/(1e6)], 'color', 'r');
title('Energy per spin VS MC cycles for  $T=2.4\  k_B\ T\ J^{-1}$ with all spins up','Interpreter','LateX','Fontsize',18);
xlabel('MC cycles','Interpreter','LateX','Fontsize',15);
ylabel('$E [J]$','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Data','$<E>$');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);

figure();
fig1=plot(cycles1(1:1e5), magn24(1:1e5)); %,'Linestyle','none','Marker','.',...
    %'color','b', 'markersize',12);
    hold on
plot([0 1e5], [sum(magn24(1:1e6))/(1e6) sum(magn24(1:1e6))/(1e6)], 'color', 'r');
title('Absolute magnetization per spin VS MC cycles for  $T=2.4\  k_B\ T\ J^{-1}$ with all spins up','Interpreter','LateX','Fontsize',18);
xlabel('MC cycles','Interpreter','LateX','Fontsize',15);
ylabel('$|M|$','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Data', '$<|M|>$');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);

%% T=1, 2.4 rand

run 'import_20x20_1_r.m';
run 'import_20x20_24_r.m';


figure();
fig1=plot(cycles1(1:1e5), energy1_r(1:1e5)); %,'Linestyle','none','Marker','.',...
    %'color','b', 'markersize',12);
hold on
plot([0 1e5], [sum(energy1_r(1:1e6))/(1e6) sum(energy1_r(1:1e6))/(1e6)], 'color', 'r');
title('Energy  per spin VS MC cycles for $T=1.0\ k_B\ T\ J^{-1}$ with random spins','Interpreter','LateX','Fontsize',18);
xlabel('MC cycles','Interpreter','LateX','Fontsize',15);
ylabel('$E\ [J]$','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Data', '$<E>$');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);

figure();
fig1=plot(cycles1(1:1e5), magn1_r(1:1e5)); %,'Linestyle','none','Marker','.',...
    %'color','b', 'markersize',12);
hold on
plot([0 1e5], [sum(magn1_r(1:1e6))/(1e6) sum(magn1_r(1:1e6))/(1e6)], 'color', 'r');
title('Absolute magnetization per spin VS MC cycles for $T=1.0\ k_B\ T\ J^{-1}$ with random spins','Interpreter','LateX','Fontsize',18);
xlabel('MC cycles','Interpreter','LateX','Fontsize',15);
ylabel('$|M|$','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Data', '$<|M|>$');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);

figure();
fig1=plot(log10(cycles1), log10(choices1_r)); %,'Linestyle','none','Marker','.',...
    %'color','b', 'markersize',12);
hold on
fig1=plot(log10(cycles1), log10(choices24_r));
title('Comparison between accepted moves VS MC cycles with random spins','Interpreter','LateX','Fontsize',18);
xlabel('$\log10\ $(MC cycles)','Interpreter','LateX','Fontsize',15);
ylabel('$\log10\ $(Accepted moves)','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Data $T=1.0\ k_B\ T\ J^{-1}$', 'Data $T=2.4\ k_B\ T\ J^{-1}$');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);

figure();
fig1=plot(cycles1(1:1e5), energy24_r(1:1e5)); %,'Linestyle','none','Marker','.',...
    %'color','b', 'markersize',12);
    hold on
plot([0 1e5], [sum(energy24_r(1:1e6))/(1e6) sum(energy24_r(1:1e6))/(1e6)], 'color', 'r');
title('Energy per spin VS MC cycles for $T=2.4\ k_B\ T\ J^{-1}$ with random spins','Interpreter','LateX','Fontsize',18);
xlabel('MC cycles','Interpreter','LateX','Fontsize',15);
ylabel('$E [J]$','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Data','$<E>$');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);

figure();
fig1=plot(cycles1(1:1e5), magn24_r(1:1e5)); %,'Linestyle','none','Marker','.',...
    %'color','b', 'markersize',12);
    hold on
plot([0 1e5], [sum(magn24_r(1:1e6))/(1e6) sum(magn24_r(1:1e6))/(1e6)], 'color', 'r');
title('Absolute magnetization per spin VS MC cycles for $T=2.4\ k_B\ T\ J^{-1}$ with random spins','Interpreter','LateX','Fontsize',18);
xlabel('MC cycles','Interpreter','LateX','Fontsize',15);
ylabel('$|M|$','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Data', '$<|M|>$');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);



%% Task d

clear all
close all
run 'prob1';
run 'prob24';
run 'prob1_r';
run 'prob24_r';

figure();
energies = [-800:4:800]'/400;

figure();
energies = [-800:4:800]/400;
counts1_r=counts1_r/(sum(counts1_r));
bar(energies, counts1_r);
hold on
plot([-1.997 -1.997], [0, 1],'color', 'r')
% sigma1_r=sigma1_r/(1e6)
% hold on
% plot([-5 0], [sigma1_r sigma1_r],'color','r')
%xlim([]);
%ylim([]);
xlabel('$E_i\ [J]$','Interpreter','Latex');
ylabel('$P(E_i)$','Interpreter','Latex');
title('Energy per spin distribution for $T=1.0\ k_B\ T\ J^{-1}$','Interpreter','Latex')
grid on
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Data', '$<|E|>$');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);


figure();
energies = [-800:4:800]/400;
counts24_r=counts24_r/(sum(counts24_r));
bar(energies, counts24_r);
hold on
plot([-1.2373871 -1.2373871], [0, 0.03],'color', 'r')
xlabel('$E_i\ [J]$','Interpreter','Latex');
ylabel('$P(E_i)$','Interpreter','Latex');
title('Energy per spin distribution for $T=2.4\ k_B\ T\ J^{-1}$','Interpreter','Latex')
grid on
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Data', '$<|E|>$');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);
%% Task e and f
clear all
close all
run 'import_40x40_1e6.m';
run 'import_60x60_1e6.m';
run 'import_80x80_1e6.m';
run 'import_100x100_1e6.m';

%% Energy
figure();
fig1=plot(temp40, energy40); %,'Linestyle','none','Marker','.',...
    %'color','b', 'markersize',12);
hold on 
plot(temp60, energy60);
plot(temp80, energy80);
plot(temp100, energy100);
title('Energy per spin VS temperature','Interpreter','LateX','Fontsize',18);
xlabel('$T\ [ k_B\ T\ J^{-1}]$','Interpreter','LateX','Fontsize',15);
ylabel('$<E>\ [J]$','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Data $40\times40$','Data $60\times60$','Data $80\times80$','Data $100\times100$');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);



%% Magn

figure();
fig1=plot(temp40, magn40); %,'Linestyle','none','Marker','.',...
    %'color','b', 'markersize',12);
hold on 
plot(temp60, magn60);
plot(temp80, magn80);
plot(temp100, magn100);
title('Absolute magnetization per spin VS temperature','Interpreter','LateX','Fontsize',18);
xlabel('$T\ [ k_B\ T\ J^{-1}]$','Interpreter','LateX','Fontsize',15);
ylabel('$<|M|>$','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Data $40\times40$','Data $60\times60$','Data $80\times80$','Data $100\times100$');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);

%% CV
close all
figure();
fig1=plot(temp40, cv40); %,'Linestyle','none','Marker','.',...
    %'color','b', 'markersize',12);
hold on 
plot(temp60, cv60);
plot(temp80, cv80);
plot(temp100, cv100);
title('Specific heat per spin VS temperature','Interpreter','LateX','Fontsize',18);
xlabel('$T\ [ k_B\ T\ J^{-1}]$','Interpreter','LateX','Fontsize',15);
ylabel('$C_V\ [k_{B}]$','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Data $40\times40$','Data $60\times60$','Data $80\times80$','Data $100\times100$');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);

[f,k]=createFit(temp40,cv40)
x=temp40;
v1=f.a1*sin(f.b1*x+f.c1) + f.a2*sin(f.b2*x+f.c2) + f.a3*sin(f.b3*x+f.c3) + f.a4*sin(f.b4*x+f.c4) + f.a5*sin(f.b5*x+f.c5) + f.a6*sin(f.b6*x+f.c6) + f.a7*sin(f.b7*x+f.c7) + f.a8*sin(f.b8*x+f.c8);
max(v1)

[f,k]=createFit1(temp60,cv60)
x=temp60;
v2=f.a1*sin(f.b1*x+f.c1) + f.a2*sin(f.b2*x+f.c2) + f.a3*sin(f.b3*x+f.c3) + f.a4*sin(f.b4*x+f.c4) + f.a5*sin(f.b5*x+f.c5) + f.a6*sin(f.b6*x+f.c6) + f.a7*sin(f.b7*x+f.c7) + f.a8*sin(f.b8*x+f.c8);
max(v2)

[f,k]=createFit2(temp80,cv80)
x=temp80;
v3=f.a1*sin(f.b1*x+f.c1) + f.a2*sin(f.b2*x+f.c2) + f.a3*sin(f.b3*x+f.c3) + f.a4*sin(f.b4*x+f.c4) + f.a5*sin(f.b5*x+f.c5) + f.a6*sin(f.b6*x+f.c6) + f.a7*sin(f.b7*x+f.c7) + f.a8*sin(f.b8*x+f.c8);
max(v3)

[f,k]=createFit3(temp100,cv100)
x=temp100;
v4=f.a1*sin(f.b1*x+f.c1) + f.a2*sin(f.b2*x+f.c2) + f.a3*sin(f.b3*x+f.c3) + f.a4*sin(f.b4*x+f.c4) + f.a5*sin(f.b5*x+f.c5) + f.a6*sin(f.b6*x+f.c6) + f.a7*sin(f.b7*x+f.c7) + f.a8*sin(f.b8*x+f.c8);
max(v4)

Tc40=temp40(39);
Tc60=temp60(37);
Tc80=temp80(37);
Tc100=temp100(36);
Tc=[Tc40 Tc60 Tc80 Tc100]';
L=[40 60 80 100]';
figure, plot(1./L.^2, Tc,'Linestyle','none','Marker','.',...
    'color','b', 'markersize',12);
[w,e]=fit(1./L.^2,Tc,'poly1')
hold on
Lc=[0:0.0001:0.8e-3]';
model=w.p1*Lc+w.p2;
plot(Lc,model);
xlim([0 0.001]);
title('Critical temperature VS the size of lattice $L$ from $C_V$','Interpreter','LateX','Fontsize',18);
xlabel('$1/L$','Interpreter','LateX','Fontsize',15);
ylabel('$T_C\ [ k_B\ T\ J^{-1}]$','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Data','Fit');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);

min(model)

%% Chi abs
close all
figure();
fig1=plot(temp40, chi40_abs); %,'Linestyle','none','Marker','.',...
    %'color','b', 'markersize',12);
hold on 
plot(temp60, chi60_abs);
plot(temp80, chi80_abs);
plot(temp100, chi100_abs);
title('Magnetic susceptibility per spin VS temperature','Interpreter','LateX','Fontsize',18);
xlabel('$T\ [k_B\ T\ J^{-1}]$','Interpreter','LateX','Fontsize',15);
ylabel('$\chi_{abs}\ [J^{-1}]$','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Data $40\times40$','Data $60\times60$','Data $80\times80$','Data $100\times100$');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);

[f,k]=createFit4(temp40,chi40_abs);
x=temp40;
v4=f.a1*sin(f.b1*x+f.c1) + f.a2*sin(f.b2*x+f.c2) + f.a3*sin(f.b3*x+f.c3) + f.a4*sin(f.b4*x+f.c4);
max(v4)

[f,k]=createFit5(temp60,chi60_abs);
x=temp60;
v5=f.a1*sin(f.b1*x+f.c1) + f.a2*sin(f.b2*x+f.c2) + f.a3*sin(f.b3*x+f.c3) + f.a4*sin(f.b4*x+f.c4) + f.a5*sin(f.b5*x+f.c5);
max(v5)

[f,k]=createFit6(temp80,chi80_abs);
x=temp80;
v6=f.a1*sin(f.b1*x+f.c1) + f.a2*sin(f.b2*x+f.c2) + f.a3*sin(f.b3*x+f.c3) + f.a4*sin(f.b4*x+f.c4) + f.a5*sin(f.b5*x+f.c5) + f.a6*sin(f.b6*x+f.c6) + f.a7*sin(f.b7*x+f.c7) + f.a8*sin(f.b8*x+f.c8);
max(v6)

[f,k]=createFit7(temp100,chi100_abs);
x=temp100;
v7=f.a1*sin(f.b1*x+f.c1) + f.a2*sin(f.b2*x+f.c2) + f.a3*sin(f.b3*x+f.c3) + f.a4*sin(f.b4*x+f.c4) + f.a5*sin(f.b5*x+f.c5) + f.a6*sin(f.b6*x+f.c6) + f.a7*sin(f.b7*x+f.c7) + f.a8*sin(f.b8*x+f.c8);
max(v7)

Tc40=temp40(45);
Tc60=temp60(42);
Tc80=temp80(40);
Tc100=temp100(39);
Tc=[Tc40 Tc60 Tc80 Tc100]';
L=[40 60 80 100]';
figure, plot(1./L.^2, Tc,'Linestyle','none','Marker','.',...
    'color','b', 'markersize',12);
[w,e]=fit(1./L.^2,Tc,'poly1');
hold on
Lc=[0:0.0001:0.0007]';
model=w.p1*Lc+w.p2;
plot(Lc,model)
xlim([0 0.0007]);

title('Critical temperature VS the size of lattice $L$ from $\chi_{abs}$','Interpreter','LateX','Fontsize',18);
xlabel('$1/L$','Interpreter','LateX','Fontsize',15);
ylabel('$T_C\ [ k_B\ T\ J^{-1}]$','Interpreter','LateX','Fontsize',15);
set(gca,'TickLabelInterpreter','latex');
ll=legend(gca,'show','Data','Fit');
set(ll,'interpreter','latex','fontsize',14,'location','northeast');
grid on;
set(gca, 'FontName', 'Times');
set(gca,'FontSize',14);
min(model)



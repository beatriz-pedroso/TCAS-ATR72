figure()
plot(Variaveis.time, Variaveis.signals.values(:,1), u_ref.time, u_ref.signals.values);
hold on
legend({'$u$','$u_{ref}$'});
xlabel('time [s]');
ylabel('u [m/s]');
set(findall(gcf,'-property','FontSize'),'FontSize',14)
set(findall(gcf,'-property','interpreter'),'interpreter','latex')

figure()
plot(Variaveis.time, Variaveis.signals.values(:,2));
xlabel('time [s]');
ylabel('w [m/s]');
set(findall(gcf,'-property','FontSize'),'FontSize',14)
set(findall(gcf,'-property','interpreter'),'interpreter','latex')

figure()
plot(Variaveis.time, Variaveis.signals.values(:,3));
xlabel('time [s]');
ylabel('q [rad/s]');
set(findall(gcf,'-property','FontSize'),'FontSize',14)
set(findall(gcf,'-property','interpreter'),'interpreter','latex')

figure()
plot(Variaveis.time, Variaveis.signals.values(:,4));
xlabel('time [s]');
ylabel('$\theta$ [rad]');
set(findall(gcf,'-property','FontSize'),'FontSize',14)
set(findall(gcf,'-property','interpreter'),'interpreter','latex')

figure()
plot(Variaveis.time, Variaveis.signals.values(:,5), h_ref.time, h_ref.signals.values);
hold on
legend({'$h$','$h_{ref}$'});
xlabel('time [s]');
ylabel('h [m]');
set(findall(gcf,'-property','FontSize'),'FontSize',14)
set(findall(gcf,'-property','interpreter'),'interpreter','latex')

figure()
plot(Inputs.time, Inputs.signals.values);
hold on
legend({'$\delta_E$','$\delta_T$'});
xlabel('time [s]');
ylabel('$\delta_E$ [rad] e $\delta_T$ ');
set(findall(gcf,'-property','FontSize'),'FontSize',14)
set(findall(gcf,'-property','interpreter'),'interpreter','latex')
hold off
figure()
plot(InputsA.time, InputsA.signals.values,InputsB.time, InputsB.signals.values);
hold on
legend({'$\delta_{E_A}$','$\delta_{T_A}$','$\delta_{E_B}$','$\delta_{T_B}$'});
xlabel('time [s]');
ylabel('$\delta_E$ [rad] e $\delta_T$ ');
set(findall(gcf,'-property','FontSize'),'FontSize',14)
set(findall(gcf,'-property','interpreter'),'interpreter','latex')

figure()
plot(VariaveisA.time, VariaveisA.signals.values(:,1), u_refA.time, u_refA.signals.values, VariaveisB.time, VariaveisB.signals.values(:,1), u_refB.time, u_refB.signals.values);
hold on
legend({'$u_A$','$u_{ref_A}$','$u_B$','$u_{ref_B}$'});
xlabel('time [s]');
ylabel('u [m/s]');
set(findall(gcf,'-property','FontSize'),'FontSize',14)
set(findall(gcf,'-property','interpreter'),'interpreter','latex')

figure()
plot(VariaveisA.time, VariaveisA.signals.values(:,2),VariaveisB.time, VariaveisB.signals.values(:,2));
hold on
legend({'$w_A$','$w_B$'});
xlabel('time [s]');
ylabel('$w$ [m/s]', 'interpreter','latex');
set(findall(gcf,'-property','FontSize'),'FontSize',14)
set(findall(gcf,'-property','interpreter'),'interpreter','latex')

figure()
plot(VariaveisA.time, VariaveisA.signals.values(:,3),VariaveisB.time, VariaveisB.signals.values(:,3));
hold on
legend({'$q_A$','$q_B$'});
xlabel('time [s]');
ylabel('$q$ [rad/s]', 'interpreter','latex');
set(findall(gcf,'-property','FontSize'),'FontSize',14)
set(findall(gcf,'-property','interpreter'),'interpreter','latex')    

figure()
plot(VariaveisA.time, VariaveisA.signals.values(:,4),VariaveisB.time, VariaveisB.signals.values(:,4));
hold on
legend({'$\theta_A$','$\theta_B$'});
xlabel('time [s]');
ylabel('$\theta$ [rad]', 'interpreter','latex');
set(findall(gcf,'-property','FontSize'),'FontSize',14)
set(findall(gcf,'-property','interpreter'),'interpreter','latex')

figure()
plot(VariaveisA.time, VariaveisA.signals.values(:,5), h_refA.time, h_refA.signals.values, VariaveisB.time, VariaveisB.signals.values(:,5), h_refB.time, h_refB.signals.values);
hold on
legend({'$h_A$','$h_{ref_A}$','$h_B$','$h_{ref_B}$'});
xlabel('time [s]');
ylabel('h [m]');
set(findall(gcf,'-property','FontSize'),'FontSize',14)
set(findall(gcf,'-property','interpreter'),'interpreter','latex')

figure()
plot(dist.time, dist.signals.values);
hold on
yline(6.5423e+03);
legend({'$dist$','$dist_{ref}$'});
xlabel('time [s]');
ylabel('dist [m]');
set(findall(gcf,'-property','FontSize'),'FontSize',14)
set(findall(gcf,'-property','interpreter'),'interpreter','latex')

hold off

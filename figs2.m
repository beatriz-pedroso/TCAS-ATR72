figure(1)
plot(time, E_pre, time, T_pre);
hold on
legend({'$\delta_E$','$\delta_T$'}, 'FontSize',14, 'interpreter', 'latex');
xlabel('time [s]');
ylabel('$\delta_E$ [rad] e $\delta_T$ ', 'interpreter', 'latex');
hold off

figure(2)
plot(time, u_pre);
hold on

figure (3)
plot(time, w_pre);
hold on

figure (4)
plot(time, q_pre);
hold on

figure (5)
plot(time, theta_pre);
hold on

sim_SAE = sim('SAE');
figure (2)
plot(time, u_SAE);
hold on
legend ('Sem SAE', 'Com SAE');
xlabel('time [s]');
ylabel('u [m/s]');

figure(3)
plot(time, w_SAE);
hold on
legend ('Sem SAE', 'Com SAE');
xlabel('time [s]');
ylabel('w [m/s]');

figure (4)
plot(time, q_SAE);
hold on
legend ('Sem SAE', 'Com SAE');
xlabel('time [s]');
ylabel('q [rad/s]');

figure(5)
plot(time, theta_SAE);
hold on
legend ('Sem SAE', 'Com SAE');
xlabel('time [s]');
ylabel({'$\theta$ [rad]'}, 'interpreter', 'latex');

hold off
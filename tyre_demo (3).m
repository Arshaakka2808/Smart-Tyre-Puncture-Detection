% Tyre Puncture Detection with User Input
clc; clear; close all;

%% User Inputs
P0 = input('Enter initial tyre pressure (psi): ');  % e.g. 32
k  = input('Enter leakage rate constant: ');        % e.g. 0.05
T  = input('Enter temperature (Kelvin): ');         % e.g. 300
Patm = 14.7;                                        % Atmospheric pressure (psi)
P_flat = 20;                                        % Flat tyre threshold (psi)

%% Time Simulation
time = 0:0.5:50;         % Time in minutes
P_t = P0 * exp(-k*time); % Pressure decay equation

%% Pressure Derivative (rate of change)
dPdt = diff(P_t)./diff(time);

%% Status Logic
P_final = P_t(end);
if P_final > 28 && mean(dPdt) > -0.05
    status = '✅ Healthy Tyre';
elseif P_final > P_flat && mean(dPdt) <= -0.05
    status = '⚠️ Puncture Suspected';
else
    status = '❌ Flat Tyre';
end

%% Display Results
disp('--------------------------------------');
disp(' Tyre Puncture Detection Results ');
disp('--------------------------------------');
fprintf('Final Pressure: %.2f psi\n', P_final);
fprintf('Average Rate of Change: %.3f psi/min\n', mean(dPdt));
fprintf('Status: %s\n', status);

%% Plot Pressure vs Time
figure;
plot(time, P_t, 'b-', 'LineWidth', 2); hold on;
yline(P_flat, 'r--', 'LineWidth', 2);
xlabel('Time (minutes)');
ylabel('Tyre Pressure (psi)');
title(['Tyre Pressure vs Time -> ' status]);
legend('Pressure Curve','Flat Threshold');
grid on;


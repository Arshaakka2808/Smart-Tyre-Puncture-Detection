% Smart Tyre Puncture & Flat Detection System
% Clean, neat, and fully working MATLAB code
clc; clear; close all;

%% ---------------------- User Inputs ----------------------
P0 = input('Enter initial tyre pressure (psi): ');     % e.g. 32
k  = input('Enter leakage rate constant: ');           % e.g. 0.05
T  = input('Enter temperature (Kelvin): ');            % e.g. 300

Patm   = 14.7;     % Atmospheric pressure (psi)
P_flat = 20;       % Flat tyre threshold (psi)
P_safe = 28;       % Healthy tyre threshold (psi)

%% -------------------- Time Simulation --------------------
time = 0:0.5:50;      % Time in minutes
P_t  = P0 * exp(-k * time);  % Exponential decay model

%% ------------------- Pressure Derivative -----------------
dPdt = diff(P_t) ./ diff(time);   % Rate of pressure drop
avg_dPdt = mean(dPdt);

%% ---------------------- Status Logic ---------------------
P_final = P_t(end);

if P_final > P_safe && avg_dPdt > -0.05
    status = '✅ Healthy Tyre';
elseif P_final > P_flat && avg_dPdt <= -0.05
    status = '⚠️ Puncture Suspected';
else
    status = '❌ Flat Tyre';
end

%% ------------------- Display Results ---------------------
disp('--------------------------------------');
disp('       Tyre Condition Results');
disp('--------------------------------------');
fprintf('Initial Pressure: %.2f psi\n', P0);
fprintf('Final Pressure:   %.2f psi\n', P_final);
fprintf('Avg Pressure Drop: %.3f psi/min\n', avg_dPdt);
fprintf('Status: %s\n', status);
disp('--------------------------------------');

%% ------------------------ Plotting ------------------------
figure;
plot(time, P_t, 'b-', 'LineWidth', 2); hold on;

% Flat threshold line
yline(P_flat, 'r--', 'LineWidth', 2);

xlabel('Time (minutes)');
ylabel('Tyre Pressure (psi)');
title(['Tyre Pressure vs Time   →   ' status]);

legend('Pressure Curve', 'Flat Tyre Threshold');
grid on;

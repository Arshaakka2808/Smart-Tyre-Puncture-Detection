% Advanced Smart Tyre Condition Detection System
% New version (not repeated)
clc; clear; close all;

%% ---------------------- User Inputs ----------------------
P0 = input('Enter initial tyre pressure (psi): ');     % e.g. 32
k  = input('Enter leakage rate constant (0.01–0.1): ');% e.g. 0.05
TempC = input('Enter temperature (°C): ');             % e.g. 30

TempK = TempC + 273.15;     % Convert to Kelvin
Patm = 14.7;                % Atmospheric pressure (psi)
P_flat = 20;                % Flat tyre threshold (psi)
P_crack = 25;               % Crack condition threshold (psi)

%% -------------------- Time Simulation --------------------
time = 0:0.5:50;            % Time in minutes

% Pressure decay + Temperature correction using Ideal Gas Law (P ∝ T)
P_t = (P0 * exp(-k * time)) .* (TempK / 300);

% Effective pressure (Tyre pressure − Atmospheric pressure)
P_eff = P_t - Patm;

%% ------------------- Pressure Derivative -----------------
dPdt = diff(P_t) ./ diff(time);   % Rate of pressure drop (psi/min)
avg_dPdt = mean(dPdt);

%% ---------------------- Status Logic ---------------------
P_final = P_t(end);

if P_final > 28 && avg_dPdt > -0.05
    status = '✅ Healthy Tyre';
elseif P_final <= P_crack && P_final > P_flat && avg_dPdt <= -0.08
    status = '⚠️ Crack Detected';
elseif P_final > P_flat && avg_dPdt <= -0.05
    status = '⚠️ Puncture Suspected';
else
    status = '❌ Flat Tyre';
end

%% ------------------- Display Results ---------------------
disp('----------------------------------------------');
disp('     Smart Tyre Condition Analysis Results     ');
disp('----------------------------------------------');
fprintf('Final Pressure:        %.2f psi\n', P_final);
fprintf('Effective Pressure:    %.2f psi\n', P_eff(end));
fprintf('Avg Pressure Drop:     %.3f psi/min\n', avg_dPdt);
fprintf('Temperature (°C):      %.1f °C\n', TempC);
fprintf('Status: %s\n', status);
disp('----------------------------------------------');

%% ------------------------ Plotting ------------------------
figure;

subplot(2,1,1);
plot(time, P_t, 'b-', 'LineWidth', 2); hold on;
yline(P_flat, 'r--', 'LineWidth', 2);
yline(P_crack, 'm--', 'LineWidth', 2);
xlabel('Time (minutes)');
ylabel('Pressure (psi)');
title(['Tyre Pressure vs Time   →   ' status]);
legend('Pressure Curve', 'Flat Threshold', 'Crack Threshold');
grid on;

subplot(2,1,2);
plot(time(1:end-1), dPdt, 'k-', 'LineWidth', 2);
xlabel('Time (minutes)');
ylabel('dP/dt (psi/min)');
title('Rate of Pressure Change');
grid on;

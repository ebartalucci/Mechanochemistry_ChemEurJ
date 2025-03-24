%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   CENTRIFUGAL FORCES INDUCED IN THE NMR ROTOR UPON MAS SPINNING     %%%
%%%            @ Ettore Bartalucci & Prof. Dr. Thomas Wiegand           %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Solid-State NMR ROTORS

% We consider only rotors inned diameters R_i in the equation to account for the
% maximal force extruded on the exact inner wall of the rotor.

% ROTOR DIAMETERS % 
% INNER %
% 3mm % 
% 2.6mm % thin wall
% 2.2mm % thick wall
% 0.9mm % 
% 0.5mm % 

% MAX MAS Freq % maximal spinning speed that each rotor can reach
% 4mm: 15kHz
% 3.2mm: 24kHz 
% 1.3mm: 67kHz
% 0.7mm: 111kHz

% MPa = [kg/(m*s^2)]
% rho as average of NBS and sulfoximine densities

rho = 1.758*1000; % density in kg/m3 (from wikipedia)
nu_r = linspace(0,111); % spinning frequency (kHz)
R_i = [0.5/1000,0.9/1000,2.2/1000,2.6/1000,3/1000]./2; % rotor inner diameters mm, divide by 2 since diameters --> radii


sigma_c_07 = ((rho.*((nu_r*1000).^2)*(2*pi).^2).*(R_i(:,1).^2))./3/1000000; % pressure (MPa)
sigma_c_13 = ((rho.*((nu_r(1:67)*1000).^2)*(2*pi).^2).*(R_i(:,2).^2))./3/1000000; % pressure (MPa)
sigma_c_32_thick = ((rho.*((nu_r(1:24)*1000).^2)*(2*pi).^2).*(R_i(:,3).^2))./3/1000000; % pressure (MPa)
sigma_c_32_thin = ((rho.*((nu_r(1:24)*1000).^2)*(2*pi).^2).*(R_i(:,4).^2))./3/1000000; % pressure (MPa)
sigma_c_4 = ((rho.*((nu_r(1:15)*1000).^2)*(2*pi).^2).*(R_i(:,5).^2))./3/1000000; % pressure (MPa)

figure(2); clf; hold on;
plot(nu_r,sigma_c_07,'--',"Color",'#0072BD', LineWidth=2)
plot(nu_r(1:67),sigma_c_13,'--',"Color",'#D95319', LineWidth=2)
plot(nu_r(1:24),sigma_c_32_thick,'--',"Color",'#77AC30', LineWidth=2)
plot(nu_r(1:24),sigma_c_32_thin,"Color",'#7E2F8E', LineWidth=2)
plot(nu_r(1:15),sigma_c_4,'--',"Color",'#A2142F', LineWidth=2)
grid on;
xlabel('Spinning Rate [kHz]')
ylabel('Centrifugal Pressure [MPa]')
ylim([0 30])
xlim([0,111])
title('Spinning-dependent Distribution of Centrifugal Forces')
legend('0.7mm','1.3mm','3.2mm thick wall','3.2mm thin wall','4mm',Location='best')





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   CENTRIFUGAL FORCES INDUCED IN THE NMR ROTOR UPON MAS SPINNING     %%%
%%%            @ Ettore Bartalucci & Prof. Dr. Thomas Wiegand           %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Solid-State NMR ROTORS

% consider what happens to the centrifugal pressure MPa of a 3.2mm thin
% wall rotor when varying the inner radius R_i from the original 1.3mm
% value to 1mm. This serves to build up the future discussion of the
% distribution of centrifugal pressures over the effective volume of the
% sample, which spans a value of y = R_i - x, where x is the radius of the
% amount of sample in the rotor. See DeepNote notebook.

% ROTOR DIAMETERS % 
% INNER %
% 3mm % 
% 2.6mm % thin wall
% 2.2mm % thick wall
% 0.9mm % 
% 0.5mm % 

% MPa = [kg/(m*s^2)]
% rho as average of NBS and sulfoximine densities

rho = 1.758*1000; % density in kg/m3 
nu_r = linspace(0,24); % spinning frequency (kHz)
R_i = [0.0013, 0.001]; % R_i variation for a  3.2mm thin wall rotor

sigma_c_3p2_thin_R_i = ((rho.*((nu_r*1000).^2)*(2*pi).^2).*(R_i(:,1).^2))./3/1000000; % pressure (MPa)
sigma_c_3p2_thin_R_i_x = ((rho.*((nu_r*1000).^2)*(2*pi).^2).*(R_i(:,2).^2))./3/1000000; % pressure (MPa)


figure(1); clf; hold on;
plot(nu_r,sigma_c_3p2_thin_R_i,"Color",'#0072BD', LineWidth=2)
plot(nu_r,sigma_c_3p2_thin_R_i_x,'--',"Color",'#D95319', LineWidth=2)
grid on;
xlabel('Spinning Rate [kHz]')
ylabel('Centrifugal Pressure [MPa]')
title('R_i-dependent Distribution of Centrifugal Forces')
legend('R_i = 1.3mm','R_i = 1mm',Location='best')


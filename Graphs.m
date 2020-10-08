clc
clear
close all
format short eng

FolderName = "Final Test_6";

%Load Profiles
P = readtable('./Profile.csv','HeaderLines',0,'ReadVariableNames',true);
P_IP = unique(table2array(P(:, 2)));
P_PIN = unique(table2array(P(:, 1)));


%Read Files
Devices = readtable('./' + FolderName + '/Devices.csv','HeaderLines',0,'ReadVariableNames',true);
Sensors = readtable('./' + FolderName + '/Sensors.csv','HeaderLines',0,'ReadVariableNames',true);
Temperature = readtable('./' + FolderName + '/Temperature.csv','HeaderLines',0,'ReadVariableNames',true);
State = readtable('./' + FolderName + '/State.csv','HeaderLines',0,'ReadVariableNames',true);
Hub = readtable('./' + FolderName + '/Hub.csv','HeaderLines',0,'ReadVariableNames',true);

%Convert to Array
%--Devices

[D1, D2, D3, D4, D5, D6, D7, D8] = DeviceSeparate(Devices, P_IP);
[S1, S2, S3, S4, S5, S6, S7, S8] = DeviceSeparate(State, P_IP);
[H1, H2, H3, H4, H5, H6, H7, H8] = DeviceSeparate(Hub, P_PIN);

%--Sensors
X_Sens = table2array(Sensors(:, 1));
Y_Sens = table2array(Sensors(:, 3));
CS = [X_Sens, Y_Sens];

%--Temperature
X_Temp = table2array(Temperature(:, 1));
Y_Temp = table2array(Temperature(:, 3));
TS = [X_Temp, Y_Temp];

t = tiledlayout(5,1,'TileSpacing','Compact');
GR = zeros(5, 1);
GR(1) = singlePlot(CS, "Current Draw [A]", "Hub Current Draw [A]", 1, [0, 15], 1);
GR(2) = singlePlot(TS, "Temperature [C]", "Hub's Internal Temperature", 1, [0, 50], 1);
GR(3) = Multiplot(D1, D2, D3, D4, D5, D6, D7, D8, P_PIN, "RPi CPU Usage [%]", "RPi CPU Usage", 1, [0, 110], 1);
GR(4) = Multiplot(S1, S2, S3, S4, S5, S6, S7, S8, P_PIN, "Accessibility State", "RPi Network Accessibility", 1, [0, 1.1], 1);
GR(5) = Multiplot(H1, H2, H3, H4, H5, H6, H7, H8, P_PIN, "Power Control State", "RPi Power State Control", 1, [0, 1.1], 0); 




linkaxes(GR,'x')



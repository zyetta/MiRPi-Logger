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
State = readtable('./' + FolderName + '/State.csv','HeaderLines',0,'ReadVariableNames',true);
Hub = readtable('./' + FolderName + '/Hub.csv','HeaderLines',0,'ReadVariableNames',true);

%Convert to Array
%--Devices

[D1, D2, D3, D4, D5, D6, D7, D8, DNAME] = DeviceSeparate(Devices, P_IP);
[S1, S2, S3, S4, S5, S6, S7, S8, SNAME] = DeviceSeparate(State, P_IP);
[H1, H2, H3, H4, H5, H6, H7, H8, HNAME] = DeviceSeparate(Hub, P_PIN);

%--Sensors
X_Sensors = table2array(Sensors(:, 1));
X_Sensors = unix_conv(X_Sensors);

Y_Sensors = table2array(Sensors(:, 3));
Name_Sensors = unique(table2array(Sensors(:, 2)));
lim_Sensors = [0, 15];



%Plot Graphs
t = tiledlayout(4,1);
tiles = zeros(4,1);





plotFigures(X_Sensors, Y_Sensors, Name_Sensors, "Current Draw [A]", "Hub Current Draw [A]", 1, 2, lim_Sensors, 0);

xlabel(t,'Time')
t.TileSpacing = 'compact';
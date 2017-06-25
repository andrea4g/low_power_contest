clear all; clc;
%% read the csv file
rd = csvread('soft.csv');
sz = size(rd);
n = 29;
%% plot the surface in 3D
percentage = rd(:,1);
leakage = rd(:,4);
time = rd(:,3);
eff = rd(:,2);

percentage = percentage / max(percentage);
leakage = leakage / max(leakage);
time = time / max(time);
eff_norm = eff / max(eff);

% nPoints = sz(1);
% percentage = rand(nPoints, 1);
% leakage = rand(nPoints, 1);
% time = rand(nPoints, 1);
% eff = rand(nPoints, 1);
% to make it compatible with 'CData', replicate columns to give G, B values
eff_norm = repmat(eff_norm, 1, 3);
scatHand = scatter3(percentage, leakage, time);
set(scatHand, 'CData', eff_norm);
xlabel('Percentage')
ylabel('Leakage')
zlabel('Time')
%% find the best result
%weight of the leakage and time
weight_time=1;
weight_leakage=1;

% percentage = percentage / max(percentage);
% leakage = leakage / max(leakage);
% time = time / max(time);

% res=ones(sz(1),1);
z=0;
%combine value of leakage and time
for i=1:99
  
  for j=1:n
    z = z+1;
    res(i) = leakage(z) * weight_leakage + time(z) * weight_time;
  end
  
  %find the maximum value
  [M,I] = min(res);
  fin(i) = eff(I);
end
eff(mode(fin))
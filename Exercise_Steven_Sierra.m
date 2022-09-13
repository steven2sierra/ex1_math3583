% Exercise 1
% Steven Sierra
% 09012022

%{

Build three other models using
different data to estimate k

elongation = kN * mass;

%}

% Stay fresh
close all;
clc

% Mass and Elongation vectors
vecMass = [50 100 150 200 250 300 350 400 450 500 550];
vecElong = [1.000 1.875 2.750 3.250 4.375 4.875 5.765 6.500 7.250 8.000 8.750];

% K-values

% k1
k1 = ( vecElong(2) - vecElong(1) )/( vecMass(2) - vecMass(1) );
% k2 
k2 = ( vecElong(4) - vecElong(3) )/( vecMass(4) - vecMass(3) );
% k3
k3 = ( vecElong(7) - vecElong(5) )/( vecMass(7) - vecMass(5) );
 
% Models
modelOne = k1*vecMass;
modelTwo = k2*vecMass;
modelThree = k3*vecMass;

% cell array to hold models
cell = {modelOne, modelTwo, modelThree};

% figure
cc = hsv(8);
hold on;

%{

(a) Use subplot to plot with all three graphs for mass v.s. elongation
        % subplot(vec_mass,vec_elongation)

(b) Suppose there is an extra measure ( m = 1000, e = 17.5 )
    Which one of your three other models better approx. the 
    elongation for the extra data point ( m = 1000 )

%}
    
% (a) subplots for modelOne, modelTwo, modelThree, and Models 1-3

    % Model Iteration with provided data
    for k = 1:3
       subplot(2,2,k);
       str = string(k); % convert index k to a string ( title purposes )
       hold on;
       plot(vecMass,cell{k},'-o','LineWidth',1,'MarkerSize',5,'color',cc(k,:),'MarkerFaceColor',cc(k,:)); % color code w/ hsv
       plot(vecMass,vecElong,'o','MarkerSize',5,'MarkerFaceColor','b'); % provided data
       title(['Model',str]);
       sgtitle('Mass vs Elongation');
       xlabel('Mass');
       ylabel('Elongation');
       legend(['Model ',num2str(k)],'Data','Location','northwest');
    end
   
    % Models 1 through 3 and the provided data
    for j = 1:3
        str2 = num2str(j);
        loop = sprintf('Creating Model %s',str2);
        disp(loop);
        fprintf('\n');
        subplot(2,2,4);
        hold on;
        plot(vecMass,cell{j},'-o','LineWidth',1,'MarkerSize',5,'color',cc(j,:),'MarkerFaceColor',cc(j,:));
        plot(vecMass,vecElong,'o','MarkerSize',5,'MarkerFaceColor','b'); % provided data
        title('Models 1 Through 3');
        xlabel('Mass');
        ylabel('Elongation');
    end
    
    
% (b) m = 1000 (fixed) and e = 17.5

%{
    e1 = k1*1000
    e2 = k2*1000
    e3 = k3*1000

    calculate absolute error: abs(eN-e)
%}

m = 1000; % provided mass
e = 17.5; % provided elongation

e1 = k1*m; e1Format = 'First elongation value provided that m = 1000: %.2f \n';  absError1 = abs(e1-e);
e2 = k2*m; e2Format = 'Second elongation value provided that m = 1000: %.2f \n'; absError2 = abs(e2-e);
e3 = k3*m; e3Format = 'Third elongation value provided that m = 1000: %.2f \n';  absError3 = abs(e3-e);

% Display elongation values provided m = 1000
fprintf(e1Format,e1);
fprintf(e2Format,e2);
fprintf(e3Format,e3);
fprintf('\n');

% Display absolute error
disp(['Absolute error of e1: ',num2str(absError1,3)]);
disp(['Absolute error of e2: ',num2str(absError2,3)]);
disp(['Absolute error of e3: ',num2str(absError3,3)]);
fprintf('\n');

% Absolute Error - Best Approximation
estimateNum = [e1 e2 e3]; % array of elongation estimates
[val,i] = min(abs(estimateNum-e));
bestApprox = e(i);
formatSpec = 'Best approximation is %.2f \n';
fprintf(formatSpec,bestApprox);
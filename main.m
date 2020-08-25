%% Main Script

% The following sections run different predictive models on
% harmonic CSV data from TBI patients.
% ROC curves and AUC are used to analyze performance

% The first section loads the data into the MATLAB workspace

%% Load and pre-process data

% specify user-specific filepath
filepath = '/Users/nlsschim/Documents/LAB/ML_TBI/DoD012_TPIHarmonicsTable (1).csv';
[feature_data, target_data] = tpi_csv_preprocess(filepath);
    

%% Quadraric Discriminate Analysis (QDA)
 
preds_qda = run_qda(feature_data, target_data);
gen_roc_curves(preds_qda);

%% Shallow Neural Network with leave-one-out cross validation

net = patternnet(4);
net.trainParam.epochs = 5;
preds_l1out = single_fold_cv(net, feature_data, target_data);
%% Shallow Neural Network with leave-two-out cross validation

 net = feedforwardnet(10,'trainscg');
 preds_l2out = leave_two_out(net, feature_data, target_data);
 
 %% testing
 [X,Y,T,AUC] = gen_roc_curves(preds_l1out);



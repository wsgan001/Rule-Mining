# !/bin/bash

# Balance scale dataset
# Creat the directories if not exist
mkdir -p log_ref/balance_scale

# Experience on dummy data (i.e., one-hot encoding)
# Ref scores L2LR, L1LR, SVMlinear, SVMrbf
python2 rule_mining/experiments/main.py --path_test 'test_L2LR_du' --file_name 'balance_scale' --prepro_type 'dummy' --orm_type 'None'  --mod_size_threshold_init {} --size_threshold_init {} --purity_threshold_init {} --z_score_threshold_init {} --mod_size_threshold {} --size_threshold {} --purity_threshold {} --z_score_threshold {} > log_ref/balance_scale/balance_scale_test_L2LR_du.txt 2> log_ref/balance_scale/balance_scale_erreur_test_L2LR_du.txt
python2 rule_mining/experiments/main.py --path_test 'test_L1LR_du' --file_name 'balance_scale' --prepro_type 'dummy' --orm_type 'None'  --mod_size_threshold_init {} --size_threshold_init {} --purity_threshold_init {} --z_score_threshold_init {} --mod_size_threshold {} --size_threshold {} --purity_threshold {} --z_score_threshold {} --classifier_type 'LR' --classifier_params '{"penalty": ["l1"], "C": [1e-3, 1e-2, 1e-1, 1e0, 1e1, 1e2, 1e3], "class_weight": ["balanced"], "random_state": [0], "multi_class": ["ovr"]}' > log_ref/balance_scale/balance_scale_test_L1LR_du.txt 2> log_ref/balance_scale/balance_scale_erreur_test_L1LR_du.txt
python2 rule_mining/experiments/main.py --path_test 'test_SVMlinear_du' --file_name 'balance_scale' --prepro_type 'dummy' --classifier_type 'SVM' --classifier_params '{"C": [1e-3, 1e-2, 1e-1, 1e0, 1e1, 1e2, 1e3], "kernel": ["linear"], "probability": [true], "class_weight": ["balanced"], "decision_function_shape": ["ovr"], "random_state": [0]}' --orm_type 'None'  --mod_size_threshold_init {} --size_threshold_init {} --purity_threshold_init {} --z_score_threshold_init {} --mod_size_threshold {} --size_threshold {} --purity_threshold {} --z_score_threshold {} > log_ref/balance_scale/balance_scale_test_SVMlinear_du.txt 2> log_ref/balance_scale/balance_scale_erreur_test_SVMlinear_du.txt
python2 rule_mining/experiments/main.py --path_test 'test_SVMrbf_du' --file_name 'balance_scale' --prepro_type 'dummy' --classifier_type 'SVM' --classifier_params '{"C": [1e-3, 1e-2, 1e-1, 1e0, 1e1, 1e2, 1e3], "kernel": ["rbf"], "probability": [true], "class_weight": ["balanced"], "decision_function_shape": ["ovr"], "random_state": [0]}' --orm_type 'None'  --mod_size_threshold_init {} --size_threshold_init {} --purity_threshold_init {} --z_score_threshold_init {} --mod_size_threshold {} --size_threshold {} --purity_threshold {} --z_score_threshold {} > log_ref/balance_scale/balance_scale_test_SVMrbf_du.txt 2> log_ref/balance_scale/balance_scale_erreur_test_SVMrbf_du.txt

# Ref scores RF, GBT
python2 rule_mining/experiments/random_forest_main.py --file_name 'balance_scale' --prepro_type 'dummy' > log_ref/balance_scale/balance_scale_test_RF_du.txt 2> log_ref/balance_scale/balance_scale_erreur_test_RF_du.txt
python2 rule_mining/experiments/gradient_boosted_tree_main.py --file_name 'balance_scale' --prepro_type 'dummy' > log_ref/balance_scale/balance_scale_test_GBT_du.txt 2> log_ref/balance_scale/balance_scale_erreur_test_GBT_du.txt

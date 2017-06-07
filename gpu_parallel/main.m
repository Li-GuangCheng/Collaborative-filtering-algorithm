% 使用GPU的并行版本
function [] = main()
item_num = 9125;    % 电影数量
user_num = 671;     % 用户数量
lambda = 10;   % 正则化因子
feat_num = 10;    % feature数
maxiter = 100;   % 最大迭代次数
separate_rate = 0.3;  % 测试数据所占比例


[tx_set, tr_set] = separateFile(separate_rate);

[score_matx, valued_matx, mov_Map] =  load_training_set(tr_set, user_num, item_num);

P = train(score_matx,valued_matx,feat_num,lambda,maxiter,item_num,user_num);

[RMSE] = compute_rmse(P, tx_set, mov_Map);

disp(['****************RMSE is :' , num2str(RMSE), '****************']);
end






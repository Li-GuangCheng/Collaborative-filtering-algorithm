% ʹ��GPU�Ĳ��а汾
function [] = main()
item_num = 9125;    % ��Ӱ����
user_num = 671;     % �û�����
lambda = 10;   % ��������
feat_num = 10;    % feature��
maxiter = 100;   % ����������
separate_rate = 0.3;  % ����������ռ����


[tx_set, tr_set] = separateFile(separate_rate);

[score_matx, valued_matx, mov_Map] =  load_training_set(tr_set, user_num, item_num);

P = train(score_matx,valued_matx,feat_num,lambda,maxiter,item_num,user_num);

[RMSE] = compute_rmse(P, tx_set, mov_Map);

disp(['****************RMSE is :' , num2str(RMSE), '****************']);
end






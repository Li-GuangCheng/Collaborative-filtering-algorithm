function [ P ] = train( Y,R,feat_num,lambda,maxiter,item_num,user_num)

    X = gpuArray.randn(item_num, feat_num);
    Theta = gpuArray.randn(user_num, feat_num);
    init_val = gpuArray(single([X(:); Theta(:)]));


    options = optimset('GradObj', 'on', 'MaxIter', maxiter);
    tic;
    vec_obj = fmincg (@(x)(cost_func(x, Y, R,feat_num,lambda,item_num,user_num)),init_val, options);
    toc;

    X = reshape(vec_obj(1:item_num*feat_num), item_num, feat_num);
    Theta = reshape(vec_obj(item_num*feat_num+1:end),user_num, feat_num);

    P = X * Theta';
end


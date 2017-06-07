function [RMSE] = compute_rmse(P, tx_set, mov_Map)
[r, ~] = size(tx_set);
Eval = zeros(r, 3);
for i = 1: r
    if isKey(mov_Map, num2str(tx_set(i , 2)))
        mv = mov_Map(num2str(tx_set(i , 2)));
        Eval(i,1)=tx_set(i,3);
        Eval(i,2) = P(mv , tx_set(i,1));
    end
end
Eval(:,3)=abs(Eval(:,1)-Eval(:,2));
[m, ~] = size(Eval);
RMSE=sqrt(Eval(:,3)'*Eval(:,3)/m);
end
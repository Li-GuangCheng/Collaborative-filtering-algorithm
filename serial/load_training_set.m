function [score_matx, valued_matx, mov_Map] =  load_training_set(tr_set, num_user, num_movie)
score_matx= zeros(num_user , num_movie, 'single');
mov_Map = containers.Map;
j = 1;
for i = 1 : size(tr_set , 1)
    if isKey(mov_Map, num2str(tr_set(i , 2)))
        movp = mov_Map(num2str(tr_set(i , 2)));
    else
        mov_Map(num2str(tr_set(i , 2))) = j;
        movp = j;
        j = j + 1;
    end
    score_matx(tr_set(i , 1) , movp) = tr_set(i , 3);
end 
ones_matrix = ones(num_user, num_movie, 'single');
valued_matx = (ones_matrix & score_matx)';
score_matx = score_matx';
end
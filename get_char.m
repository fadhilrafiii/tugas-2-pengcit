function result = get_char(img)
    [m, n] = size(img);
    
    score = zeros(36, 1);
    
    filelist = dir('chars');
    count = 1;
    for i=1 : length(filelist)
        filename = filelist(i);
        if ~strcmp(filename.name , '.') && ~strcmp(filename.name , '..')
            char_img = imresize( ...
                otsu_binarize(imread("chars/" + filename.name)), ...
                [m, n]);
            score(count) = compare_char(img, char_img);
            count = count + 1;
        end
    end


    [~, idx] = max(score);
    
    if (idx < 11) 
        result = idx - 1;
    else
        result = char(idx + 54);
    end
    
    
end
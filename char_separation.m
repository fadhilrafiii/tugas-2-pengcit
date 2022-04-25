function result = char_separation(img, segment_idx)
%     disp(size(segment_idx))
    % Get red lines index columns
    i = 1;

    [~, n] = size(segment_idx);
    chars = cell(ceil(n/2),1);
    j = 1;
    while(i < n)
        segment_idx(1, i)
        partial = img(:, segment_idx(1, i):segment_idx(1, i + 1));
        %disp(partial)
        %disp(chars(j))
        chars{j} = partial;
        i = i + 2;
        j = j + 1;
    end
    
    result = chars;
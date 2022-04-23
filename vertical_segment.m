function result = vertical_segment(I)
    hist = count_color(I);
    result = [];

    th = 3;

    zero_mode = hist(1) == 0;
    for i = 2:length(hist)
        v = hist(i);
        if zero_mode && v > th
            zero_mode = 0;
            result = [result, i];
        elseif ~zero_mode && v <= th
            zero_mode = 1;
            result = [result, i];
        end
    end
end

function result = count_color(I)
    [row_size, col_size,] = size(I);
    result = zeros(col_size, 1);

    for col_index = 1:col_size
        count = 0;
        for row_index = 1:row_size
            if I(row_index, col_index, 1) > 0
                count = count + 1;
            end
        end
        result(col_index) = count;
    end
end
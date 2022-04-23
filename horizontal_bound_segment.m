function [upper, lower] = horizontal_bound_segment(I)
    hist = count_color(I);
    mean_value = mean(hist);
    
    upper = 1;
    while upper <= length(hist)
        if hist(upper) >= mean_value
            break
        end
        upper = upper + 1;
    end

    lower = length(hist);
    while lower > 0
        if hist(lower) >= mean_value
            break
        end
        lower = lower - 1;
    end
end

function result = count_color(I)
    [row_size, col_size,] = size(I);
    result = zeros(row_size, 1);

    for row_index = 1:row_size
        count = 0;
        for col_index = 1:col_size
            if I(row_index, col_index, 1) > 0
                count = count + 1;
            end
        end
        result(row_index) = count;
    end
end

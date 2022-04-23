function result = segment_characters(segment_line_indices)
    l = length(segment_line_indices);
    sizes = zeros(floor(l/2), 1);

    % Loop for (i*2, i*2 - 1) pairs.
    i = 1;
    while i*2 <= l
        sizes(i) = segment_line_indices(i*2) - segment_line_indices(i*2 - 1);
        i = i + 1;
    end

    avg_size = mean(sizes);

    i = 1;
    while i <= length(sizes)-1
        size = sizes(i);
        size2 = sizes(i + 1);
        if is_below_threshold(avg_size, size) && is_below_threshold(avg_size, size2)
            merged_size = segment_line_indices((i + 1)*2) - segment_line_indices(i*2 - 1);
            sizes(i) = merged_size;
            sizes(i + 1) = [];

            segment_line_indices(i*2) = [];
            segment_line_indices((i + 1)*2 - 1) = [];

            i = i - 1;
        end
        i = i + 1;
    end

    avg_size = mean(sizes);

    i = 1;
    while i <= length(sizes)
        size = sizes(i);
        if is_above_threshold(avg_size, size)
            half = round(size/2);
            sizes(i) = half;
            sizes = [
                sizes(1:i)
                half
                sizes(i+1:end)
            ];

            mid = segment_line_indices(i*2)-half;
            
            segment_line_indices = [
                segment_line_indices(1:i*2 - 1)
                mid
                mid
                segment_line_indices(i*2:end)
            ];

            i = i + 1;
        end
        i = i + 1;
    end

    result = segment_line_indices;
end

function result = is_below_threshold(avg, size)
    result = size < avg*2/3;
end

function result = is_above_threshold(avg, size)
    result = size > avg*4/3;
end

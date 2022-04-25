function result = compare_char(img1, img2)
    [m, n] = size(img1);
    
    sum = 0;
    for i = 1:m
        for j = 1:n
            if (img1(i,j) == img2(i, j))
                sum = sum + 1;
            end
        end
    end

    result = sum / (m * n);
end
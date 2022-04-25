function result = Sobel(I, type)
    mask =  [-3 0 3;-10 0 10;-3 0 3];
    if (type == "vertical")
        mask = transpose(mask);
    end
    result = convn(double(I), double(mask), 'same');

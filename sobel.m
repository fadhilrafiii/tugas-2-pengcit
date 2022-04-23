function result = sobel(I)
    mask =  [-3 0 3;-10 0 10;-3 0 3];
    result = convn(double(I), double(mask), 'same');

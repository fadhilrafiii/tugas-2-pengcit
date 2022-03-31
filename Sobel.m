function result = Sobel(image)
    Sx = [-1 0 1; -2 0 2; -1 0 1];
    Sy = [1 2 1; 0 0 0; -1 -2 -1];
    Jx = convn(double(image), double(Sx), 'same');
    Jy = convn(double(image), double(Sy), 'same');
    result = uint8(sqrt(Jx.^2 + Jy.^2));

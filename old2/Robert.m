function result = Robert(image)
    image = rgb2gray(image);
    Rx = [1 0; 0 -1];
    Ry = [0 1; -1 0];
    Jx = conv2(double(image), double(Rx), 'same');
    Jy = conv2(double(image), double(Ry), 'same');
    result = uint8(sqrt(Jx.^2 + Jy.^2));

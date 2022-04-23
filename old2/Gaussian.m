function result = Gaussian(image)
    image = rgb2gray(image);
    Gx = [-1; 1];
    Gy = [-1 1];
    Ix = conv2(double(image), double(Gx), 'same');
    Iy = conv2(double(image), double(Gy), 'same');
    result = uint8(sqrt(Ix.^2 + Iy.^2));
    
function result = Prewitt(image)
    image = rgb2gray(image);
    Px = [-1 0 1; -1 0 1; -1 0 1];
    Py = [-1 -1 -1; 0 0 0; 1 1 1];
    Jx = conv2(double(image), double(Px), 'same');
    Jy = conv2(double(image), double(Py), 'same');
    result = uint8(sqrt(Jx.^2 + Jy.^2));
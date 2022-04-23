function result = Laplace(image)
    image = rgb2gray(image);
    H = [1 1 1; 1 -8 1; 1 1 1];
    result = uint8(convn(double(image), double(H)));
    
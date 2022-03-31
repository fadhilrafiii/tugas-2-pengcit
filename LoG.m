function result = LoG(image)
    image = rgb2gray(image);
    h = [0 0 -1 0 0; 0 -1 -2 -1 0; -1 -2 16 -2 -1; 0 -1 -2 -1 0; 0 0 -1 0 0;];
    result = uint8(convn(double(image), double(h)));
    
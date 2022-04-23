function result = Canny(image)
    image = rgb2gray(image);
    result = edge(image, 'canny');
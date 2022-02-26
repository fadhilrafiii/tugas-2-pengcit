image = imread("res2/7.jpg");

res = HighBoost(image, 2, 'Gaussian');
figure,imshow(image);
figure,imshow(res);

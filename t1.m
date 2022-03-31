image = imread("res\1\8.jpg");

%Jedge = Gaussian(image);
%Jedge = Laplace(image);
Jedge = LoG(image);
%Jedge = Sobel(image);
%Jedge = Prewitt(image);
%Jedge = Robert(image);
%Jedge = Canny(image);

Jedge = Hystheresis(Jedge, 200, 100);
figure, imshow(Jedge);
%LowPassFilter(image, 'Butterworth', 0, 2)
%LowPassFilter(image, 'Gaussian');

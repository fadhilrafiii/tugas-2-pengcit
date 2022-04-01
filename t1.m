clc;
image = imread("test5.jpg");
% figure, imshow(image);

% Jedge = Gaussian(image);
% Jedge = Laplace(image);
% Jedge = LoG(image);
% Jedge = rgb2gray(Sobel(image));
Jedge = Prewitt(image);
% Jedge = Robert(image);
% Jedge = Canny(image);
% figure, imshow(Jedge);

HJedge = Jedge;
try
    HJedge = rgb2gray(edge);
    HJedge = imbinarize(HJedge);
catch
end

try
    HJedge = imbinarize(edge);
catch
end

% HJedge = Hystheresis(HJedge, 200, 100);
figure, imshow(HJedge);
segmented = segment(image, HJedge);
disp(size(segmented));
figure, imshow(segmented);

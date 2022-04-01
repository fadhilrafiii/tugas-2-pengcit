image = imread("test1.jpg");
% figure, imshow(image);

% Jedge = Gaussian(image);
% Jedge = Laplace(image);
% Jedge = LoG(image);
% Jedge = Sobel(image);
% Jedge = Prewitt(image);
% Jedge = Robert(image);
Jedge = Canny(image);
% figure, imshow(Jedge);

HJedge = Jedge;
% HJedge = Hystheresis(Jedge, 50, 20);
figure, imshow(HJedge);

f = HJedge;
for i = [0, 45, 90, 135]
    f = imclose(f, strel('line', 3, i));
end
% f = imclose(f, strel('line', 3, 0));
f = imfill(f, 'holes');
f = imopen(f, strel(ones(3, 3)));
f = bwareaopen(f, 1500);
f = imdilate(f, strel('disk', 3));
% f = imfill(f, 'holes');
figure, imshow(f);

red_processed = image(:,:,1).*uint8(f);
green_processed = image(:,:,2).*uint8(f);
blue_processed = image(:,:,3).*uint8(f);
op = cat(3, red_processed, green_processed, blue_processed);
figure, imshow(op);


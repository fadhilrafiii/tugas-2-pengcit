I = imread("image-001.jpg");
I_binarized = otsu_binarize(I);
I_sobel = sobel(I_binarized);

figure; imshow(I_binarized);
figure; imshow(I_sobel);

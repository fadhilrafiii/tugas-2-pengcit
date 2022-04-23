I = imread("image-001.jpg");
I_binarized = otsu_binarize(I);
I_sobel = sobel(I_binarized);

figure; imshow(I_binarized);
figure; imshow(I_sobel);
% TODO: Invert bw if background is not black
[upper_bound, lower_bound] = horizontal_bound_segment(I_sobel);
I_segmented = I_binarized(upper_bound:lower_bound, :, :);
figure; imshow(I_segmented);

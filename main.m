%% Removing upper and lower bounds of license plates

I = imread("dataset/1.jpg");
if should_invert(otsu_binarize(I))
    I = imcomplement(I);
end
I_binarized = otsu_binarize(I);
% figure; imshow(I_binarized);
I_sobel = sobel(I_binarized, "horizontal");
% figure; imshow(I_sobel);
[upper_bound, lower_bound] = horizontal_bound_segment(I_sobel);
I_segmented = I(upper_bound:lower_bound, :, :);
% figure; imshow(I_segmented);

I = I_segmented;


%% Character segmentation

BW = otsu_binarize(I);

% TODO: Check if it's really needed.
BW = bwareaopen(BW, floor(numel(I)/150));

figure; imshow(BW);

I_sobel = sobel(BW, "horizontal");
% figure; imshow(I_sobel);
segment_line_indices = vertical_segment(BW);
segment_line_indices = segment_characters(segment_line_indices);

[row_size, col_size,] = size(I);

% figure; imshow(I);
hold on;
for i = 1:length(segment_line_indices)
    line_index = segment_line_indices(i);
    plot( ...
        [line_index line_index], [0 row_size], ...
        'Color', 'red', ...
        'LineWidth', 1 ...
    );
end
hold off;
plate_char_images = char_separation(BW, segment_line_indices);

[num_char, ~] = size(plate_char_images);

str = '';
for i=1:num_char
    plate_char_images{i} = trim_char(plate_char_images{i});
    str = strcat(str, string(get_char(plate_char_images{i})));
end

disp(str);

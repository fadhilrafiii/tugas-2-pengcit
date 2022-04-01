function result = segment(im, edge)
    f = edge;

    try
        f = rgb2gray(edge);
    catch
    end

    try
        f = imbinarize(edge);
    catch
    end

    figure, imshow(f);
    for i = [0, 45, 90, 135]
        f = imdilate(f, strel('line', 5, i));
    end
%     f = ~bwareaopen(~f, 20);
    % f = imclose(f, strel('line', 3, 0));
    f = imfill(f, 'holes');
    f = imopen(f, strel(ones(3, 3)));
    f = bwareaopen(f, 1500);
    f = imdilate(f, strel('disk', 3));

    red_processed = im(:,:,1).*uint8(f);
    green_processed = im(:,:,2).*uint8(f);
    blue_processed = im(:,:,3).*uint8(f);
    result = cat(3, red_processed, green_processed, blue_processed);

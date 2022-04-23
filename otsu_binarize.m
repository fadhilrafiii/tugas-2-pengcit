function result = otsu_binarize(I)
    threshold = graythresh(I);
    result = im2bw(I, threshold);
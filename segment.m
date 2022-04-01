function result = segment(im, edge)
   f = uint8(edge);
   try
       f = rgb2gray(f);
   catch
   end
   try
       f = imbinarize(f);
   catch
   end

   [m, n] = size(f);
   f = f(25:m-25, 25:n-25);

   for i = [0, 45, 90, 135]
       f = imclose(f, strel('line', 5, i));
   end

   f = imfill(f, 'holes');
   f = imopen(f, strel(ones(3, 3)));

   f = imdilate(f, strel('disk', 3));

   f = padarray(f,[25 25],0,'both');
   f = imcrop(f, centerCropWindow2d(size(f), size(im(:,:,1))));

   im(:,:,1) = im(:,:,1).*uint8(f);
   im(:,:,2) = im(:,:,2).*uint8(f);
   im(:,:,3) = im(:,:,3).*uint8(f);
   result = im;

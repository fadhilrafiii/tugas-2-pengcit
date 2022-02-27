I = imread('res2/11.jpg'); % Baca citra
I = I(:,:,1);
figure, imshow(I);
title('[BEFORE] Image');
% Terapkan Fourier Transform
F = fft2(double(I));
F1 = fftshift(F); % Pusatkan FFT
% Tampilkan magnitute spektrum Fourier
figure, imagesc(100*log(abs(F1)+1)); colormap(gray);
title('[BEFORE] magnitude spectrum');

% Hapus derau periodic
ranges_arr = [
    65 30; 65 100; 65 160; 65 360; 65 420; 65 490;
    135 30; 135 100; 135 160; 135 360; 135 420; 135 490;
    390 30; 390 100; 390 160; 390 360; 390 420; 390 490;
    460 30; 460 100; 460 160; 460 360; 460 420; 460 490;
];
for range_idx = 1:size(ranges_arr, 1)
    ranges = ranges_arr(range_idx,:);
    for j = ranges(1)-10:ranges(1)+10
        for i = ranges(2)-10:ranges(2)+10
            F1(i, j) = 0;
        end
    end
end

% Tampilkan magnitute spektrum Fourier
figure, imagesc(100*log(abs(F1)+1)); colormap(gray);
title('[AFTER] magnitude spectrum');

% Kembalikan ke ranah spasial
J = real(ifft2(ifftshift(F1)));
figure, imshow(J,[]);
title('[AFTER] Image');

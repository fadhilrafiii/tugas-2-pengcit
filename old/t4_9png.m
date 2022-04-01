I = imread('res2/9.png'); % Baca citra
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
    50 60 170 190;
    70 80 200 210;
    175 190 50 60;
    175 190 180 190;
    175 190 295 310;
    195 210 70 80;
    195 210 200 210;
    195 210 325 340;
    305 315 170 190;
    325 335 200 210;
];
for range_idx = 1:size(ranges_arr, 1)
    ranges = ranges_arr(range_idx,:);
    for j = ranges(1):ranges(2)
        for i = ranges(3):ranges(4)
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

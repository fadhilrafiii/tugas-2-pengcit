I = imread('res2/14.jpg'); % Baca citra
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
    45 235;
    60 220;
    75 205;
    90 190;
    105 175;
    125 155;
    155 125;
    175 105;
    190 90;
    205 75;
    220 60;
    235 45;
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

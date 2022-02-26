function HighPassFilter(img, type, n)
    figure, imshow(img);
    img = im2double(img);

    % Mengambil ukuran gambar
    [M, N, K] = size(img);
    
    % Menambahkan padding pada image, secara default k = 2
    P = 2 * M;
    Q = 2 * N;
    padImage = GenerateImagePad(img);
    transformPadImage = fft2(padImage);
    % Membangkitkan fungsi penapis dengan cutoff frequency 0.05 * width
    % Secara default digunakan nilai 0.05
    D0 = 0.05 * P;
    if (~exist('n', 'var') && type ~= "Butterworth") %default value n kalau tipe bukan BLPF
      n = 1;
    end
    H = 1 - GenerateH(type, P, Q, D0, n);

    % Mengalikan nilai gambar dengan nilai penapis dan memotong kembali ke
    % ukuran semula
    lpfImage = ProductHF(H, transformPadImage);
    result = real(ifft2(lpfImage));
    result = result(1:M, 1:N, :);
    
    % Menampilkan gambar hasil tapisan
    figure, imshow(result);
    
    % Menampilkan spektrum Fourier
    % centeredOrgImg = fftshift(transformPadImage); % Menggeser titik asal transform ke tengah frequency rectangle
    % spectrum = log(1 + abs(centeredOrgImg));
    % figure, imshow(spectrum, []);
end
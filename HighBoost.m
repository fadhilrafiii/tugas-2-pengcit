function result = HighBoost(img, a, type, D0, n)
    img = im2double(img);

    % Mengambil ukuran gambar
    [M, N, K] = size(img);
    
    % Menambahkan padding pada image, secara default k = 2
    P = 2 * M;
    Q = 2 * N;
    padImage = GenerateImagePad(img);
    transformPadImage = fft2(padImage);
    
    % Membangkitkan fungsi penapis 
    if (~exist('D0', 'var') || D0 <= 0)
        D0 = 0.05 * P; % Secara default digunakan nilai 0.05 dari lebar img
    end

    if (~exist('n', 'var') && type ~= "Butterworth")
      n = 1;  %default value n kalau tipe bukan BLPF
    end
    Hhp = 1 - GenerateH(type, P, Q, D0, n);

    % Mengalikan nilai gambar dengan nilai penapis dan memotong kembali ke
    % ukuran semula
    lpfImage = ProductHF((a - 1) + Hhp, transformPadImage);
    result = real(ifft2(lpfImage));
    result = result(1:M, 1:N, :);
end

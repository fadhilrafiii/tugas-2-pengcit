function result = GenerateImagePad(image)
    [M, N, K] = size(image);

    P = 2 * M;
    Q = 2 * N;

    temp = zeros(P, Q, K);
    for i = 1:M
        for j = 1:N
            for k = 1:K
                temp(i, j, k) = image(i, j, k);
            end
        end
    end

    result = im2double(temp);
            
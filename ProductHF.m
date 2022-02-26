function result = ProductHF(H, F)
    [~, ~, K] = size(F);

    temp = zeros(size(F));
    if (K > 1) % Untuk RGB
        for k = 1:K
            temp(:, :, k) = [H].*F(:, :, k);
        end

        result = temp;
    else % Untuk Grayscale
        result = H.*F;
    end
end
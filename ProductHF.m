function result = ProductHF(H, F)
    [~, ~, K] = size(F);

    temp = zeros(size(F));
    if (K > 1)
        for k = 1:K
            temp(:, :, k) = [H].*F(:, :, k);
        end

        result = temp;
    else
        result = H.*F;
    end
end
function result = GenerateH(type, P, Q, D0, n)
    u = 0:(P-1);
    v = 0:(Q-1);
    
    % Mengambil index untuk perhitungan meshgrid (D)
    idx = find(u > P/2);
    idy = find(v > Q/2);
    u(idx) = u(idx) - P;
    v(idy) = v(idy) - Q;

    [V, U] = meshgrid(v, u);
    D = sqrt(U.^2 + V.^2);
    
    h = zeros(size(D));
    if (type == "ILPF") % Untuk Ideal Low Pass Filter
        h = D <= D0;
    elseif (type == "BLPF") % Untuk Butterworth Low Pass Filter
        h = (1 + (D/D0).^(2*n)).^-1;
    elseif (type == "GLPF") % Untuk Gaussian Low Pass Filter
        h = exp(-(D.^2)./(2*(D0^2)));
    end
    
    
    result = h;
end
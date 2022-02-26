function h = GenerateH(type, P, Q, D0, n)
    u = 0:(P-1);
    v = 0:(Q-1);

    idx = find(u > P/2);
    idy = find(v > Q/2);
    u(idx) = u(idx) - P;
    v(idy) = v(idy) - Q;

    [V, U] = meshgrid(v, u);
    D = sqrt(U.^2 + V.^2);
    
    if (type == "ILPF")
        h = D <= D0;
    elseif (type == "BLPF")
        h = 1/(1 + (D/D0)^(2*n));
    elseif (type == "GLPF")
        h = exp(-(D.^2)./(2*(D0^2)));
    end
end
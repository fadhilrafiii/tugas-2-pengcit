function result = trim_char(img)
    [m, n] = size(img);

    firstIdx = m;
    i = 1;
    while (i <= m)
        j = 1;
        while(j <= n)
            if (img(i, j) == 1)
                firstIdx = i;
                i = m + 1;
                break;
            end
            j = j + 1;
        end
        i = i + 1;
    end

    lastIdx = m;
    k = m;
    while (k > 0)
        l = n;
        while(l > 0)
            if (img(k, l) == 1)
                lastIdx = k;
                k = 0;
                break;
            end
            l = l - 1;
        end
        k = k - 1;
    end

    result = img(firstIdx + 1:lastIdx, 1:n);
end

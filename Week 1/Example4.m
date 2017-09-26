function Example4
    strMessage = '\nNhap n:';
    n = input(strMessage);
    s = 0;
    i = 1;
    for i=1:n
        s = s + i;
    end
    fprintf('\nTong S = 1 + 2 + 3 + ... + %d la: %d.\n',n,s);
end
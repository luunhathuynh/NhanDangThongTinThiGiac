function TH3_Q4()
    fprintf('\nLoad du lieu test');
    imgTestAll = loadMNISTImages('./t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('./t10k-labels.idx1-ubyte');
    
    a = zeros(1,10);
    for i = 1:size(imgTestAll,2)
        a(1,lblTestAll(i)+1) = a(1,lblTestAll(i)+1) + 1;
    end
end
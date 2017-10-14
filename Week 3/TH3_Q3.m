function TH3_Q3()
    fprintf('\nLoad du lieu train');
    imgTrainAll = loadMNISTImages('./train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('./train-labels.idx1-ubyte');
    
    a = zeros(1,10);
    for i = 1:size(imgTrainAll,2)
        a(1,lblTrainAll(i)+1) = a(1,lblTrainAll(i)+1) + 1;
    end
end
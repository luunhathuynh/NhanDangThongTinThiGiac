function Recognition002_Digits()
    fprintf('\nLoad du lieu train');
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    fprintf('\nLoad du lieu test');
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('train-labels.idx1-ubyte');
    fprintf('\nKet thuc.\n');
    
    nTrainImages = size(imgTrainAll,2);
    nTrainLabels = size(lblTrainAll,1);
    
    nTestImages = size(imgTestAll,2);
    nTestLabels = size(lblTestAll,1);
    
    nSizeOfImage = size(imgTrainAll,1);
    
    fprintf('\nSo luong anh train: [%d].',nTrainImages);
    fprintf('\nSo luong nhan anh train: [%d].',nTrainLabels);
    fprintf('\nSo luong anh test: [%d].',nTestImages);
    fprintf('\nSo luong nhan anh test: [%d].',nTestLabels);
    fprintf('\nKick thuoc cua mot anh: [%d].',nSizeOfImage);
end
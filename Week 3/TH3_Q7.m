function TH3_Q7(k)
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    Mdl = fitcknn(imgTrainAll',lblTrainAll,'NumNeighbors',k);
    
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('t10k-labels.idx1-ubyte');
    lblResult = predict(Mdl,imgTestAll');
    nResult = (lblResult == lblTestAll);
    nCount = sum(nResult);
    fprintf('So luong mau dung: %d\n',nCount);
end
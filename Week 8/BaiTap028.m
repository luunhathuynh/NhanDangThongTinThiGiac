function BaiTap028()
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    nBins = 144;
    nTrainImages = size(imgTrainAll,2);
    imgTrainAll_HOG = zeros(nBins,nTrainImages);
    for i = 1:nTrainImages
        imgI = imgTrainAll(:,i);
        img2D = reshape(imgI,28,28);
        [featureVector,hogVisualization] = extractHOGFeatures(img2D);
        imgTrainAll_HOG(:,i) = featureVector;
    end
    
    Mdl = fitcecoc(imgTrainAll_HOG',lblTrainAll);
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('t10k-labels.idx1-ubyte');
    nTestImages = size(imgTestAll,2);
    imgTestAll_HOG = zeros(nBins,nTestImages);
    for i = 1:nTestImages
        imgI = imgTestAll(:,i);
        img2D = reshape(imgI,28,28);
        [featureVector,hogVisualization] = extractHOGFeatures(img2D);
        imgTestAll_HOG(:,i) = featureVector;
    end
    lblResult = predict(Mdl,imgTestAll_HOG');
    nResult = (lblResult == lblTestAll);
    nCount = sum(nResult);
    fprintf('\nSo luong mau dung: %d\n', nCount);
end
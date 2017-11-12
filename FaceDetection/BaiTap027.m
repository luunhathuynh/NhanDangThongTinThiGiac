function BaiTap027()
    load('imgTrainImagesAll.mat');
    imgTrainAll = imgTrainImagesAll;
    load('lblTrainLabelsAll.mat');
    for i = 1:size(lblTrainLabelsAll,2)
        lblTrainAll(i,1) = lblTrainLabelsAll(1,i);
    end
    load('imgTestImagesAll.mat');
    imgTestAll = imgTestImagesAll;
    load('lblTestLabelsAll.mat');
    for i = 1:size(lblTestLabelsAll,2)
        lblTestAll(i,1) = lblTestLabelsAll(1,i);
    end
    
    nBins = 256;
    nTrainImages = size(imgTrainAll,2);
    imgTrainAll_hist = zeros(nBins,nTrainImages);
    for i = 1:nTrainImages
        imgTrainAll_hist(:,i) = imhist(imgTrainAll(:,i),nBins);
    end
    
    Mdl = fitcecoc(imgTrainAll_hist',lblTrainAll);
    nTestImages = size(imgTestAll,2);
    imgTestAll_hist = zeros(nBins,nTestImages);
    for i = 1:nTestImages
        imgTestAll_hist(:,i) = imhist(imgTestAll(:,i),nBins);
    end
    lblResult = predict(Mdl,imgTestAll_hist');
    nResult = (lblResult == lblTestAll);
    nCount = sum(nResult);
    fprintf('\nSo luong mau dung: %d\n', nCount);
end
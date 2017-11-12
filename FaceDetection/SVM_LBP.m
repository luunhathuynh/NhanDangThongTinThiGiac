function SVM_LBP()
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

    imgI1D = imgTrainAll(:,1);
    imgI2D = reshape(imgI1D,112,92);
    featureVector = extractLBPFeatures(imgI2D);
    nSize = length(featureVector);
    nTrainData = size(imgTrainAll,2);
    
    featuresDataTrain = zeros(nSize,nTrainData);
    for i = 1:nTrainData
        imgI1D = imgTrainAll(:,i);
        imgI2D = reshape(imgI1D,112,92);
        featuresDataTrain(:,i) = extractLBPFeatures(imgI2D);
    end
    
    Mdl = fitcecoc(featuresDataTrain', lblTrainAll);
    
    imgI1D = imgTestAll(:,1);
    imgI2D = reshape(imgI1D,112,92);
    featureVector = extractLBPFeatures(imgI2D);
    nSize = length(featureVector);
    nTestData = size(imgTestAll,2);
    featuresDataTest = zeros(nSize,nTestData);
    for i = 1:nTestData
        imgI1D = imgTestAll(:,i);
        imgI2D = reshape(imgI1D,112,92);
        featuresDataTest(:,i) = extractLBPFeatures(imgI2D);
    end
    lblResult = predict(Mdl,featuresDataTest');
    nResult = (lblResult == lblTestAll);
    nCount = sum(nResult);
    fprintf('\nSo luong mau dung: %d\n',nCount);
end
function SVMPixel()
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

    Mdl = fitcecoc(imgTrainAll',lblTrainAll);

    lblResult = predict(Mdl,imgTestAll');
    nResult = (lblResult == lblTestAll);
    nCount = sum(nResult);
    fprintf('\nSo luong mau dung: %d\n', nCount);
end
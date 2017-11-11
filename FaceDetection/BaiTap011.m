function BaiTap011()
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
	nNumTrainImages = size(imgTrainAll,2);
	imgTrainAll_hist=zeros(nBins,nNumTrainImages);
	for i = 1:nNumTrainImages
        imgTrainAll_hist(:,i) = imhist(imgTrainAll(:,i),nBins);
    end
	Mdl = fitcknn(imgTrainAll_hist',lblTrainAll);
    
    nBins = 256;
	nNumTestImages = size(imgTestAll,2);
	imgTestAll_hist = zeros(nBins,nNumTestImages);
	for i = 1:nNumTestImages
        imgTestAll_hist(:,i) = imhist(imgTestAll(:,i),nBins);
	end
    lblResult = predict(Mdl,imgTestAll_hist');
	nResult = (lblResult == lblTestAll);
	nCount = sum(nResult);
	fprintf('\nSo luong mau dung: %d\n',nCount);
end
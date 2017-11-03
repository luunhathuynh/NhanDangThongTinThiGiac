function [lblResult] = Q5(n)
    load('imgTrainImagesAll.mat');
    load('lblTrainLabelsAll.mat');
    load('imgTestImagesAll.mat');
    load('lblTestLabelsAll.mat');
    
    figure;
    Mdl = fitcknn(imgTrainImagesAll',lblTrainLabelsAll);
    img = imgTestImagesAll(:,n);
    lblResult = predict(Mdl,img');
    imshow(reshape(img,112,92));
end
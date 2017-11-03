function Q1(n)
    load('imgTrainImagesAll.mat');
    load('lblTrainLabelsAll.mat');
    %load('imgTestImagesAll.mat');
    %load('lblTestLabelsAll.mat');
    
    figure;
    img = imgTrainImagesAll(:,n);
    img2D = reshape(img,112,92);
    imshow(img2D);
    title(lblTrainLabelsAll(n));
end
function Q6(n)
    load('imgTrainImagesAll.mat');
    load('lblTrainLabelsAll.mat');
    load('imgTestImagesAll.mat');
    load('lblTestLabelsAll.mat');
    
    figure;
    imshow(reshape(imgTrainImagesAll(:,n),112,92));
    
    if(Q5(n) == lblTestLabelsAll(n))
        fprintf('thanh cong');
    else
        fprintf('that bai');
end
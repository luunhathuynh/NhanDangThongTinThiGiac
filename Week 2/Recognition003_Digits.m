function Recognition003_Digits
    fprintf('\nLoad du lieu train');
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    fprintf('\nLoad du lieu test');
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('train-labels.idx1-ubyte');
     nTrainImages = size(imgTrainAll,2);
    
    figure;
    img = imgTrainAll(:,1);
    img2D = reshape(img,28,28);
    strLabelImage = num2str(lblTrainAll(1));
    imshow(img2D);
    title(strLabelImage);
    
    figure;
    imgLast = imgTrainAll(:,nTrainImages);
    img2DLast = reshape(imgLast,28,28);
    strLabelImage = num2str(lblTrainAll(nTrainImages));
    imshow(img2DLast);
    title(strLabelImage);
end
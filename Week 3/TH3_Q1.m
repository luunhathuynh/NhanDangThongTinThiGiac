function TH3_Q1()
    strMessage = '\nNhap n: ';
    n = input(strMessage);
    fprintf('\nLoad du lieu train');
    imgTrainAll = loadMNISTImages('./train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('./train-labels.idx1-ubyte');
    figure;
    img = imgTrainAll(:,n);
    img2D = reshape(img,28,28);
    strLabelImage = num2str(lblTrainAll(n));
    imshow(img2D);
    title(strLabelImage);
end
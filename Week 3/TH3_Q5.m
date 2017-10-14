function [strLabelImage] = TH3_Q5(n)
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    Mdl = fitcknn(imgTrainAll',lblTrainAll);
    
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    imgTest = imgTestAll(:,n);
    lblPredictTest = predict(Mdl,imgTest');
    
    strLabelImage = num2str(lblPredictTest);
end
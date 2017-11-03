function CreateDataTrain()
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    
    nTrainImage = size(imgTrainAll,2);
    
    
end
function CreateDataset( )
    %listFile = dir(filePath);
    listFile = dir('cam_a');
    lenList = size(listFile,1);
    strName = 'VIPeR';
    aImages = {};    
    for i = 3 : lenList
       nameFile = [listFile(3).folder '\' listFile(i).name];
       aImages{i-2,1} = imread(nameFile); 
    end
    
    listFile = dir('cam_b');
    lenList = size(listFile,1);
    bImages = {};
    for i = 3 : lenList
       nameFile = [listFile(3).folder '\' listFile(i).name];
       bImages{i-2,1} = imread(nameFile); 
    end    
    save([strName '.mat'],'aImages','bImages');    
end
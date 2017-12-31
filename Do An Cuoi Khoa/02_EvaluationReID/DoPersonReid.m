function DoPersonReid()
    name ={'descriptorPRID';'descriptorGRID';'descriptorVIPeR';'descriptorPRID_450s'};    
    %name ={'descriptorAlexNet_PRID_450s'};    
    for i=1:4
        load([name{i} '.mat']);
        Descriptor.ProbeVectors = aVecs;
        Descriptor.GalleryVectors = bVecs;
        nameData = name{i}(11:end);
        EvaluationEachDataset(Descriptor,nameData)
    end
end

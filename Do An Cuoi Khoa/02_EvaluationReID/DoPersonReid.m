function DoPersonReid()
    name ={'descriptor_LBP_GRID';'descriptor_LBP_PRID';'descriptor_LBP_PRID_450s';'descriptor_LBP_VIPeR'};    
    %name ={'descriptorAlexNet_PRID_450s'};    
    for i=1:length(name)
        load([name{i} '.mat']);
        Descriptor.ProbeVectors = aVecs;
        Descriptor.GalleryVectors = bVecs;
        nameData = name{i}(11:end);
        EvaluationEachDataset(Descriptor,nameData)
    end
end

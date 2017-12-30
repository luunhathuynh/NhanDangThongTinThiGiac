function genLBPAll()
name ={'VIPeR';'PRID';'GRID';'PRID_450s'};
%name ={'PRID_450s'};
for i=1:4
    load([name{i} '.mat']);
    aVecs=[];
    bVecs=[]; 
    for j=1:length(aImages(:,1))
        fprintf("\n %d/%d",j,length(aImages(:,1)));
        %descriptorA = extractLBPFeatures(cell2mat(aImages(1,1)));  
        img1 = cell2mat(aImages(j,1));
        img2 = rgb2gray(img1);
        img = imresize(img2,[224 224]);
        descriptorA = extractLBPFeatures(img);     
        aVecs=[aVecs;descriptorA];
    end
    
    for j=1:length(bImages(:,1))
        fprintf("\n %d/%d",j,length(bImages(:,1)));
        img1 = cell2mat(bImages(j,1));
        img2 = rgb2gray(img1);
        img = imresize(img2,[224 224]);
        %descriptorB = extractLBPFeatures(cell2mat(bImages(1,1))); 
        descriptorB = extractLBPFeatures(img);  
        bVecs=[bVecs;descriptorB];
    end
    
    %disp(['Saving ' descriptor name{i} '.mat']);
    save(['descriptorLBP_' name{i} '.mat'],'aVecs', 'bVecs');
    disp('Done');
end
end
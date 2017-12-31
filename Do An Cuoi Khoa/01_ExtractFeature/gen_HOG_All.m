function gen_HOG_All()
name ={'VIPeR';'PRID';'GRID';'PRID_450s'};
%name ={'VIPeR'};
for i=1:4
    load([name{i} '.mat']);
    aVecs=[];
    bVecs=[]; 
    for j=1:length(aImages(:,1))
        fprintf("\n %d/%d",j,length(aImages(:,1)));
        %descriptorA = extractHOGFeatures(cell2mat(aImages(1,1)));  
        img1 = cell2mat(aImages(j,1));
        img2 = rgb2gray(img1);
        img = imresize(img2,[224 224]);
        descriptorA = extractHOGFeatures(img);     
        aVecs=[aVecs;descriptorA];
    end
    
    for j=1:length(bImages(:,1))
        fprintf("\n %d/%d",j,length(bImages(:,1)));
        img1 = cell2mat(bImages(j,1));
        img2 = rgb2gray(img1);
        img = imresize(img2,[224 224]);
        %descriptorB = extractHOGFeatures(cell2mat(bImages(1,1))); 
        descriptorB = extractHOGFeatures(img);  
        bVecs=[bVecs;descriptorB];
    end
    
    %disp(['Saving ' descriptor name{i} '.mat']);
    save(['descriptor_HOG_' name{i} '.mat'],'aVecs', 'bVecs');
    disp('Done');
end
end
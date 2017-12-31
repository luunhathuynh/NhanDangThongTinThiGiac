function gen_VGG16_All()
name ={'VIPeR';'PRID';'GRID';'PRID_450s'};
%name ={'PRID_450s'};
net = vgg16();
featureLayer = 'fc7';
for i=1:4
    load([name{i} '.mat']);
    aVecs=[];
    bVecs=[]; 
    for j=1:length(aImages(:,1))
        fprintf("\n %d/%d",j,length(aImages(:,1)));
        
        img1 = aImages{j};
        img = imresize(img1,[224 224]);
        descriptorA = activations(net, img, featureLayer);     
        aVecs=[aVecs;descriptorA];
    end
    
    for j=1:length(bImages(:,1))
        fprintf("\n %d/%d",j,length(bImages(:,1)));
        img1 = bImages{j};
        img = imresize(img1,[224 224]);
        descriptorB = activations(net, img, featureLayer);
        bVecs=[bVecs;descriptorB];
    end
    
    %disp(['Saving ' descriptor name{i} '.mat']);
    save(['descriptorVGG16_' name{i} '.mat'],'aVecs', 'bVecs');
    disp('Done');
end
end
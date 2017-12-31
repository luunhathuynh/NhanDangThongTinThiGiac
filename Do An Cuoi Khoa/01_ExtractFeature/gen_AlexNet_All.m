function gen_AlexNet_All()
name ={'VIPeR';'PRID';'GRID';'PRID_450s'};
%name ={'VIPeR'};
net = alexnet();
featureLayer = 'fc7';
for i=1:4
    load([name{i} '.mat']);
    aVecs=[];
    bVecs=[]; 
    for j=1:length(aImages(:,1))
        fprintf("\n %d/%d",j,length(aImages(:,1)));

        img1 = aImages{j};
        img = imresize(img1,[227 227]);
        descriptorA = activations(net, img, featureLayer);     
        aVecs=[aVecs;descriptorA];
    end
    
    for j=1:length(bImages(:,1))
        fprintf("\n %d/%d",j,length(aImages(:,1)));
        img1 = bImages{j};
        img = imresize(img1,[227 227]);
        descriptorB = activations(net, img, featureLayer);
        bVecs=[bVecs;descriptorB];
    end
    
    %disp(['Saving ' descriptor name{i} '.mat']);
    save(['descriptor_AlexNet_' name{i} '.mat'],'aVecs', 'bVecs');
    disp('Done');
end
end
function gen_ELF_All()
name ={'VIPeR';'PRID';'GRID';'PRID_450s'};
%name ={'VIPeR'};
for i=1:4
    load([name{i} '.mat']);
    aVecs=[];
    bVecs=[]; 
    for j=1:length(aImages(:,1))
        fprintf("\n %d/%d",j,length(aImages(:,1)));
        
        descriptor = genDescriptor(aImages{j},[1 1 1 1 1],[16 16 16 16 16],6,[]);         
        aVecs=[aVecs;descriptor];
        descriptor = genDescriptor(bImages{j},[1 1 1 1 1],[16 16 16 16 16],6,[]);         
        bVecs=[bVecs;descriptor];
    end
    disp(['Saving ' descriptor name{i} '.mat']);
    save(['descriptorELF' name{i} '.mat'],'aVecs', 'bVecs');
    disp('Done');
end
end
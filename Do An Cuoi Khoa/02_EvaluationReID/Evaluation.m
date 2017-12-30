% Author: ngocntb
% Modified: 01_11_2017
% Input: 
%    + Matching scores.
%    + Groundtruth ID of each images in probe
% Output:
%    + Ranked list of each image in Probe
%    + Matching score of each image in Ranked list (distance)
%    + Expected Rank (ER)
%    + CMC plot
%    + nAUC

function [RankedLists,MatchingScores,ER,CMC,nAUC] = Evaluation(MatchingDistance,GroundTruthID)
      
    nData=size(MatchingDistance,1);       
    RankedLists= zeros(size(MatchingDistance));
    MatchingScores=RankedLists;
         
    ranks = zeros(nData,1);

    for i=1:nData
        [MatchingScores(i,:),RankedLists(i,:)] = sort(MatchingDistance(i,:),'ascend');        
        ranks(i) = find(RankedLists(i,:)==GroundTruthID(i));     
    end

    %Expected rank is a measure of overall REID performance: ER
    ER = mean(ranks);

    CMC = [];
    % Build CMC plot
    for i=1:nData
        CMC(i) = length(find(ranks<=i));
    end
    CMC=CMC./(nData);
    nAUC=trapz(1:nData, CMC)./nData;
end
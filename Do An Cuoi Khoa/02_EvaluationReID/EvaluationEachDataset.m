% Author: ngocntb
% Modified: 08_11_2017
% Input: 
%    + Feature vectors of probe images (ProbeVectors). Each row is a feature vector of an image.
%    + Feature vectors of gallery images (GalleryVectors). Each row is a feature vector of an image.
%    + Groundtruth ID of each images in probe
% Output:
%    + Ranked list of each image in Probe
%    + Matching score of each image in Ranked list (distance)
%    + Expected Rank (ER)
%    + CMC plot
%    + nAUC
%% Feature extraction
function EvaluationEachDataset(Descriptor,DatasetName)
    %%Get feature form Descriptor
     ProbeVectors = Descriptor.ProbeVectors;
     GalleryVectors = Descriptor.GalleryVectors;

    %%Matching using L2 distance.
    [MatchingDistance] = Matching(ProbeVectors,GalleryVectors);

    %% Evaluate
    % Assume correct indices are in order:
    GroundTruthID=1: size(ProbeVectors,1);

    [RankedLists,MatchingScores,ER,CMC,nAUC] = Evaluation(MatchingDistance,GroundTruthID);
    disp(['Saving Evaluate' DatasetName '.mat']);
    save(['Evaluate' DatasetName '.mat'],'RankedLists', 'MatchingScores','ER','CMC','nAUC');
end
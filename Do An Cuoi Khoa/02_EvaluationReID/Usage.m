% Author: ngocntb
% Modified: 01_11_2017
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

%Random feature vector for 4 pedestrians in Probe and 4 pedestrians in 
%Gallery. Feature-vector dimention is 20.
%ProbeVectors = randi([0, 5], [4,20])/5;
%GalleryVectors = randi([0, 5], [4,20])/5;
load('descriptorPRID.mat')
ProbeVectors = aVecs;
GalleryVectors = bVecs;


%%Matching using L2 distance.
[MatchingDistance] = Matching(ProbeVectors,GalleryVectors);

%% Evaluate

% Assume correct indices are in order:           
GroundTruthID=1: size(ProbeVectors,1);

[RankedLists,MatchingScores,ER,CMC,nAUC] = Evaluation(MatchingDistance,GroundTruthID);

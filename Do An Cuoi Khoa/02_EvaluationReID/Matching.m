% Author: ngocntb
% Modified: 01_11_2017
% Input: 
%    + Feature vectors of probe images (ProbeVectors). Each row is a feature vector of an image.
%    + Feature vectors of gallery images (GalleryVectors). Each row is a feature vector of an image.

% Output:
%    + Matching scores of each image in Ranked list (distance)


function [MatchingDistance] = Matching(ProbeVectors,GalleryVectors)
    %Matching using L2 distance.
    MatchingDistance=pdist2(ProbeVectors,GalleryVectors,'euclidean'); 
end
% 2021_03_22 Code for subsampling images and stitching them together 
% This builds off of the Raj Lab colonycounting_v2 code

function [] = stitch_and_subsample(infile)

paths = {infile};

cd(infile)

stitch_and_subsample.downsize_all_scans;

cd downsized_images

paths = {fullfile(infile,'downsized_images')};

stitch_and_subsample.stitch_all_scans;

end

# Stitch_and_subsample

This code was adapted from the Raj Lab colonycounting_v2 software (https://github.com/arjunrajlaboratory/colonycounting_v2). Changes were made to make the code applicable with the output of our images coming off of the scope (snake imaging, channel naming convention, etc.)

## Setting up your data
- This data assumes that all images from a scan are within the same folder. 
- Make sure to do the nd2toTiff code including the 'nDigits' = 4 code argument. I did this to make sure that the number in the file names are always the same length even if you go above 33x33 scans. 

## Running the code
This code utilizes a single input with the format:
```
stitch_and_subsample(<path_to_folder_with_scans_in_quotes>)
```
## Addressing prompts from the code
### Downsizing the images
You will be asked how many pixels you would like to downsample each image by. 

![alt text](https://github.com/dylanschaff/Stitch_and_subsample/blob/main/README_screenshots/downsize.png)

This will result in a folder called "downsized_images" within the original folder. 

### Stitching the scan

Here we will have to insert a couple of scan parameters. You will first be prompted to ask whether all of the scans have the same channel wavelength assignment. If they came off of our scope, they should so select "Yes, all do.".

![alt text](https://github.com/dylanschaff/Stitch_and_subsample/blob/main/README_screenshots/channel_and_wavelength_assignment.png)

You will then be asked what each wavelength is. The code should automatically recognize each channel and place that in the header. Just type the same color as in each header.

![alt text](https://github.com/dylanschaff/Stitch_and_subsample/blob/main/README_screenshots/Enter_channel_for_Each_Wavelength.png)

You will then be asked if all of the scans have the same size, which they should. So select "Yes, all do.".

![alt text](https://github.com/dylanschaff/Stitch_and_subsample/blob/main/README_screenshots/set_scan_size.png)

You will then be asked what the size of the scan is. In the example here, the scan is 40 by 40.

![alt text](https://github.com/dylanschaff/Stitch_and_subsample/blob/main/README_screenshots/enter_tile_dimensions.png)

You will then be asked whether all scans have the same alignment. In our scans, there is only one scan so we will select "Yes, all do."

![alt text](https://github.com/dylanschaff/Stitch_and_subsample/blob/main/README_screenshots/scan_alignment.png)

You will then be asked how we want to align the images. There are a few options:

![alt text](https://github.com/dylanschaff/Stitch_and_subsample/blob/main/README_screenshots/scan_alignment_choice.png)

- "Automatically" will align the images wihtout any input from you. This works well if there are cells in individual images.
- "Manually" will allow the user to align the images using the middle position of the scan. This works very well if there are a lot of cells at the center of your scan.
- "Entering the pixel overlaps" will allow the user to enter the horizontal and vertical pixel overlap between images. This works very well in cases where you dont have a lot of cells. 

#### Manually

![alt text](https://github.com/dylanschaff/Stitch_and_subsample/blob/main/README_screenshots/scan_alignment_manual.png)

You will then be prompted to identify the same cells in the middle image (left) and the image below (right). User the cursor to click on which cells are the same in the two images. Close the window when you are done. The more cells you select, the more accurate the alignment will be, but 3 cells is usually plenty.

![alt text](https://github.com/dylanschaff/Stitch_and_subsample/blob/main/README_screenshots/manual_align_top_bottom.png)

You will then be prompted to identify the same cells in the middle image (left) and the image to the right (right). Use the cursor to click on which cells are the same in the two images. Close the window when you are done.

![alt text](https://github.com/dylanschaff/Stitch_and_subsample/blob/main/README_screenshots/manual_align_left_right.png)

#### Entering the pixel overlaps

![alt text](https://github.com/dylanschaff/Stitch_and_subsample/blob/main/README_screenshots/enter_overlap_numbers.png)

You will then enter the vertical and horizontal pixel overlaps. Our scans were originally 1028x1028 pixels, were downsized by a factor of 4, and had an overlap of 10%. Therefore, our overlap was 26 pixels in each direction. For our files, you should enter the overlaps in the "Column X Overlaps" and "Row Y Overlaps". 

#### Output
The actual stitching will now be done. It may take some time. For each scan, the code will save the:
- "Stitch_Info.tif.mat" file which contains all the parameters set in this step.
- "Stitch_Original_<channel>.mat" file which contains the specific channel of the stitched scan as an image/array.
- "Stitch_Small_<channel>.tif" file which contains the stitched channel downsized to the size of an individual image. This is useful for easy viewing.
- "Stitch_Original_<channel>.tif" file which contains the stitched downsized images.

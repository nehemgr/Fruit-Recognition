%This program is used to identify a given image of a fruit (Apple, Banana,
%Guava or Strawberry), by calculating certain statistical and textural
%properties on the color channels of the image, and then comparing them
%with the mean values from a table.

clear;
clc;

disp('This program will identify a given image of a fruit');
disp(' ');
path = input('Enter the entire filepath: ', 's');
I = imread(path);
disp(' ');

disp('In order to correctly remove the background from the fruit, you must now use the Colour Thresholder App');
disp(' ');
disp('Step 1: The Colour Thresholder App will open with the image loaded. You must first click on the HSV Colour Space.');
disp('Step 2: On the left hand side, under the toolbar, there will be a polygon selector tool. Click on it and move to the image.');
disp('Step 3: The mouse pointer will now be shaped like a + sign. Click and drap the pointer on the fruit to select the region of interest.');
disp('Step 4: Move to the right hand side, where there will be histograms of each of the channels - Hue (H), Saturation (S), Lightness (L). Use the faders given to correctly select only the fruit from the image.');
disp('Step 5: In the toolbar, click on the Export button.');
disp('Step 6: Leave the filenames as they are. Click OK.');
disp('Step 7: Close the Colour Thresholder App. Return to MATLAB command window and press ANY key.');
disp(' ');
prompt = 'Confirm that you have read the above instructions and wish to proceed [Y]: ';
str = input(prompt,'s');
while(str ~= 'Y')
    str = input(prompt,'s');
end
disp(' ');

%Background Removal
colorThresholder(I);
pause; %Wait until the user presses any key
BW = imfill(BW, 'holes'); %Fills up any holes in the mask
BW = bwareafilt(BW, 1); %Get the largest object
figure;
subplot(1,2,1);
imshow(BW);
title('Final Mask', 'FontSize', 10);
BW = cast(BW, 'like', I); %Convert the mask into an image with 3 channels - just like the input image
maskedRGBImage = bsxfun(@times, I, BW); %Multiply our input image and the mask, to get the fruit alone
subplot(1,2,2);
imshow(maskedRGBImage);
title('Masked RGB Image', 'FontSize', 10);

%Calculating the Properties
props = propcalc(maskedRGBImage);

%Identifying the Fruit
frt_name = mindistcalc(props);

fprintf('\nThe given fruit is: %s\n\n', frt_name);


%This program is used to prepare a datasheet with mean values of several
%properties of 4 fruits - Apple, Banana, Guava and Stawberry. This data can
%be used to identify a given fruit.

clear;
clc;

myDir = 'Training Images\Apple'; %gets directory
myFiles = dir(fullfile(myDir,'*.jpg')); %gets all jpg files in struct
for img_index = 1:length(myFiles)
    baseFileName = myFiles(img_index).name;
    fullFileName = fullfile(myDir, baseFileName);
    fprintf('Now reading %s\n', fullFileName);
  
    I = imread(fullFileName);
    
    fprintf('##Background Removal... \nPress any key \n');
    colorThresholder(I);
    pause; %Wait until the user presses any key
    BW = imfill(BW, 'holes'); %Fills up any holes in the mask
    BW = bwareafilt(BW, 1); %Get the largest object
    
    fprintf('##Property Calculation... \n');
    props = propcalc(maskedRGBImage);
    
    prompt = '\nEnter the name of the fruit: ';
    frt_name = input(prompt,'s');
    
    fprintf('\n##Updating File... \n');
    updatefile(frt_name,props);
    
    fprintf('##Process Over... \n');
    clear
    myDir = 'Trial'; %gets directory
    myFiles = dir(fullfile(myDir,'*.jpg')); %gets all jpg files in struct
end
# Fruit-Recognition
This project is an implementation of a fruit recognition system in MATLAB. An input image is given to the program and it is classified as an Apple, Banana, Guava or Strawberry based on the Minimum Distance Criterion of the image with a developed dataset. The HSV colour space was used - the Hue and Saturation channels were used to get the average values of several statistical properties, while the Value channel was used to construct the texture map using GLCM, which then gives several textural properties.

## Running the Project
Make sure you have MATLAB R2019b or later installed. On the Command Line, run the FruitMain.m file. Then, follow these steps:
1. Enter the entire file path to the image that is to be classified.
2. Read the instructions and enter 'Y'.
3. In the Colour Thresholder App, select the HSV Colour Space.
4. Using the polygon selection tool, draw onto the ROI. Refine the selection using the appropriate sliders.
5. Click on Export. Click OK.
6. Close the Colour Thresholder App. Return to the Command Window and press any key to re-activate the program.
7. The binary mask and the foreground image will be displayed. The name of the fruit will be written in the Command Window.

## Project Demo
![alt text](https://github.com/nehemgr/Fruit-Recognition/blob/Report/sample_run.jpg)

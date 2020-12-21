%This script is used to initialize the table used in the recognition of
%fruits, that holds the various properties of color.

S_No = 0;
Fruits = "Empty";
H_Mean = 0;
H_SD = 0;
H_Skewness = 0;
H_Kurtosis = 0;
S_Mean = 0;
S_SD = 0;
S_Skewness = 0;
S_Kurtosis = 0;
V_Contrast = 0;
V_Energy = 0;
V_Shade = 0;
V_Prominence = 0;


t = table(S_No, Fruits, H_Mean, H_SD, H_Skewness, H_Kurtosis, S_Mean, S_SD, S_Skewness, S_Kurtosis, V_Contrast, V_Energy, V_Shade, V_Prominence);
writetable(t, 'PropTable.txt');
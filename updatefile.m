%This function updates the table containing the properties of various
%fruits.

function updatefile(frt_name, props)
t = readtable('PropTable.txt');

index = max(t.S_No) + 1;

x = table();
x.S_No = index;
x.Fruits = frt_name;
x.H_Mean = props(1);
x.H_SD = props(2);
x.H_Skewness = props(3);
x.H_Kurtosis = props(4);
x.S_Mean = props(5);
x.S_SD = props(6);
x.S_Skewness = props(7);
x.S_Kurtosis = props(8);
x.V_Contrast = props(9);
x.V_Energy = props(10);
x.V_Shade = props(11);
x.V_Prominence = props(12);

t = [t; x];
writetable(t, 'PropTable.txt');
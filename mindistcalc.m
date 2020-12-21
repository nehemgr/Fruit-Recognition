function frt_name = mindistcalc(props)
table = readtable('PropTable.txt');
dist = zeros(1,max(table.S_No));

for i = 1:max(table.S_No)
    index = i+1;
    dist(i) = sqrt(((props(1)-table.H_Mean(index))^2) + (props(2)-table.H_SD(index))^2 + (props(3)-table.H_Skewness(index))^2 + (props(4)-table.H_Kurtosis(index))^2 + (props(5)-table.S_Mean(index))^2 + (props(6)-table.S_SD(index))^2 + (props(7)-table.S_Skewness(index))^2 + (props(8)-table.S_Kurtosis(index))^2 + (props(9)-table.V_Contrast(index))^2 + (props(10)-table.V_Energy(index))^2 + (props(11)-table.V_Shade(index))^2 + (props(12)-table.V_Prominence(index))^2);
end

[~,pos] = min(dist);
frt_name = string(table.Fruits(pos+1));
end


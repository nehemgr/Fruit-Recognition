%This function will calculate certain statistical and textural properties
%of an input image, and return them.

function props = propcalc(RGB)
HSV = rgb2hsv(RGB);
props = zeros(1,12);

%H and S Channel:
k = 1;
for i = 1:2
    [~,~,foregnd_pxls] = find(HSV(:,:,i)); %Get the foreground pixels of H or S channel
    props(k) = mean(foregnd_pxls);
    props(k+1) = std(foregnd_pxls);
    props(k+2) = skewness(foregnd_pxls,0);
    props(k+3) = kurtosis(foregnd_pxls,0);
    k = k + 4;
end

%V Channel:
GRAY = rgb2gray(RGB);
glcm = zeros(8,8,4);
glcm(:,:,1) = graycomatrix(GRAY,'Offset',[0 1],'Symmetric',true); %For horizontal 0 degree
glcm(:,:,2) = graycomatrix(GRAY,'Offset',[-1 -1],'Symmetric',true); % For 135 degree left diagonal
glcm(:,:,3) = graycomatrix(GRAY,'Offset',[-1 0],'Symmetric',true); % For vertical 90 degree
glcm(:,:,4) = graycomatrix(GRAY,'Offset',[-1 1],'Symmetric',true); % For 45 degree right diagonal

%Remove all counts from each GLCM, that calculate adjacency with background
%pixels
for k = 1:4
    glcm(1,:,k)=0; 
    glcm(:,1,k)=0;
end

%Get the Contrast, Correlation, Energy and Homogeneity properties. We make
%sure that the GLCM calculations are rotationally invariant.
glcm1_props = graycoprops(glcm(:,:,1));
glcm2_props = graycoprops(glcm(:,:,2));
glcm3_props = graycoprops(glcm(:,:,3));
glcm4_props = graycoprops(glcm(:,:,4));
props(9) = (glcm1_props.Contrast + glcm2_props.Contrast + glcm3_props.Contrast + glcm4_props.Contrast)/4;
props(10) = (glcm1_props.Energy + glcm2_props.Energy + glcm3_props.Energy + glcm4_props.Energy)/4;

%Normalize all the GLCMs
for k = 1:4
    glcm(:,:,k) = glcm(:,:,k)./sum(glcm(:,:,k),'all'); 
end

%Get the Cluster Shade and Cluster Prominence propoerties
glcm_mean = 0;
for k = 1:4
    for i = 1:8
        for j = 1:8
            glcm_mean = glcm_mean + (i)*glcm(i,j,k);
        end
    end
end
glcm_mean = glcm_mean/4;

for k = 1:4
    for i = 1:8
        for j = 1:8
            props(11) = props(11) + (((i + j - 2*glcm_mean)^3).*glcm(i,j,k));
            props(12) = props(12) + (((i + j - 2*glcm_mean)^4).*glcm(i,j,k));
        end
    end
end
props(11) = props(11)/4;
props(12) = props(12)/4;

end
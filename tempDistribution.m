
%% HK
clear
clc

%% Inputs
intervalNumb = 30; % Number of total intervals
edgeTemperatures = [60 220 120 180]; % Edge Temperatures - Constant

%% Adjust Edge Temperatures
initialMatrix = zeros(intervalNumb,intervalNumb);
initialMatrix(1,:) = edgeTemperatures(1,1);
initialMatrix(:,1) = edgeTemperatures(1,2);
initialMatrix(intervalNumb,:) = edgeTemperatures(1,3);
initialMatrix(:,intervalNumb) = edgeTemperatures(1,4);

%% Constructing the System of Linear Equations and Solutions
inSqr = (intervalNumb-2)^2; 
augmentedCoefMatrix = zeros(inSqr,inSqr+1);
unknownValsIdx = zeros(size(initialMatrix));
unknownValsIdx(2:end-1,2:end-1) = ones(size(initialMatrix)-2);
unknownValsIdxVector = reshape(unknownValsIdx',1,intervalNumb^2);
tempUnknownValsIdx = zeros(size(unknownValsIdx));
tempSubMatrix = zeros(3,3,inSqr);
counter = 1;
for i=1:intervalNumb
    for j=1:intervalNumb
        if unknownValsIdx(i,j)==1
            tempUnknownValsIdx = zeros(size(unknownValsIdx));
            tempUnknownValsIdx(i,j)=4;
            if unknownValsIdx(i+1,j)==1
                tempUnknownValsIdx(i+1,j)=-1;
            end
            if unknownValsIdx(i-1,j)==1
                tempUnknownValsIdx(i-1,j)=-1;
            end
            if unknownValsIdx(i,j+1)==1
                tempUnknownValsIdx(i,j+1)=-1;
            end
            if unknownValsIdx(i,j-1)==1
                tempUnknownValsIdx(i,j-1)=-1;
            end
            tempUnknownValsIdx = tempUnknownValsIdx(2:end-1,2:end-1);
            tempRealUnknownIdxVect = reshape(transpose(tempUnknownValsIdx),1,length(tempUnknownValsIdx)^2);
            augmentedCoefMatrix(counter,1:inSqr) = tempRealUnknownIdxVect;
            counter = counter+1;
        end  
    end
end
constantVals = zeros(size(tempUnknownValsIdx));
constantVals(1,:) = constantVals(1,:) + edgeTemperatures(1,1);
constantVals(:,1) = constantVals(:,1) + edgeTemperatures(1,2);
constantVals(size(tempUnknownValsIdx),:) = constantVals(size(tempUnknownValsIdx),:) + edgeTemperatures(1,3);
constantVals(:,size(tempUnknownValsIdx)) = constantVals(:,size(tempUnknownValsIdx)) + edgeTemperatures(1,4);
constantVals = reshape(transpose(constantVals),1,length(constantVals)^2);

%% Gauss-Jordan 
augmentedCoefMatrix(:,inSqr+1) =  transpose(constantVals);
augmentedCoefMatrixEchelon = rref(augmentedCoefMatrix); % Reduced Raw Echelon Form
xVals_1 = reshape(augmentedCoefMatrixEchelon(:,1+inSqr),intervalNumb-2,intervalNumb-2);
imagesc(xVals_1); 
colormap('hot'); colorbar; 
xlabel('Length (mm)'); ylabel('Length (mm)'); title('Temperature Distribution - Gauss-Jordan')

%% Matrix Inversion
coefMatrix = augmentedCoefMatrix(1:inSqr,1:inSqr);
constantVals = transpose(constantVals);
nonzeroDeterminant = any(det(coefMatrix));
if nonzeroDeterminant == 1
    fprintf('Determinant of coefficient matrix is nonzero.\nTherefore, inverse of coeffficient matrix exists.\n')
    xVals_2 = coefMatrix\constantVals;
    xVals_2 = reshape(xVals_2,intervalNumb-2,intervalNumb-2);
    figure
    imagesc(xVals_2); 
    colormap('hot'); colorbar; 
    xlabel('Length (mm)'); ylabel('Length (mm)'); title('Temperature Distribution - Matrix Inversion')
end

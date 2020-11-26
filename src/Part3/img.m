% Compressing the lena image 
% https://www.mathworks.com/help/images/ref/dctmtx.html 

lena = im2double(imread(const.Part3.Step1.ImageFile)); % read img and convert to a double matrix 

fig(); 
imshow(lena);
matrix = dctmtx(size(lena,1));

Lena1 = matrix*lena(1)*matrix';
Lena2 = matrix*lena(2)*matrix';
Lena3 = matrix*lena(3)*matrix';

Lena = matrix.*lena.*matrix';

fig();imshow(Lena1);
fig();imshow(Lena2);
fig();imshow(Lena3);
fig();imshow(Lena(1));

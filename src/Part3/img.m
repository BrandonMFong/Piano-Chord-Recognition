% Compressing the lena image 
% https://www.mathworks.com/help/images/ref/dctmtx.html 

lena = im2double(imread(const.Part3.Step1.ImageFile)); % read img and convert to a double matrix 

% get the dct matrix
D = dctmtx(8);

% process image
dct = @(block_struct) D * block_struct.data * D';
B = blockproc(lena,[8 8], dct); 

% apply mask on dct coefficients
% this is applying compression because we don't need those high freq components 
mask = @(block_struct) csvread(const.Part3.Step1.maskFile) .* block_struct.data;
B2 = blockproc(B,[8 8], mask);

% not sure what this is for 
non_zero_B = length (find(B));
non_zero_B2 = length (find(B2));

invdct = @(block_struct) D' * block_struct.data * D;
lena_compressed = blockproc(B2,[8 8], invdct);

fig();imshow(lena);
fig();imshow(lena_compressed);

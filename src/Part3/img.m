% Compressing the lena image 
% https://www.mathworks.com/help/images/ref/dctmtx.html 

lena_read = imread(const.Part3.Step1.ImageFile); % read img and convert to a double matrix 
lena = im2double(lena_read); % read img and convert to a double matrix 
fig();imshow(lena);

% get the dct matrix
D = dctmtx(8);

% get mask matrix
mtx = csvread(const.Part3.Step1.maskFile); % read the mask, don't want to do this all the time
mask = @(block_struct) mtx .* block_struct.data;

% process original image
dct = @(block_struct) D * block_struct.data * D';

% process compressed image
invdct = @(block_struct) D' * block_struct.data * D;



B = blockproc(lena(:,:,3),[8 8], dct); 

% apply mask on dct coefficients
% this is applying compression because we don't need those high freq components 
B2 = blockproc(B,[8 8], mask);

% not sure what this is for 
non_zero_B = length (find(B));
non_zero_B2 = length (find(B2));

lena_compressed = blockproc(B2,[8 8], invdct);

fig();imshow(lena_compressed);

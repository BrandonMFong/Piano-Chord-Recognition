clear all; close all;
lena_int = imread('lena_gray.bmp');
lena = im2double(lena_int);
%In command window type lena_int and lena and see what the difference is
%Compute the two-dimensional DCT of 8-by-8 blocks in the image. 
%dctmtx Discrete cosine transform matrix.
%D = dctmtx(N) returns the N-by-N DCT transform matrix. If A is square, 
%the two-dimensional DCT of A can be computedas D*A*D'.

D = dctmtx(8);
%blockproc Distinct block processing for image.
%B = blockproc(A,[M N],FUN) processes the image A by applying the
%function FUN to each distinct M-by-N block of A and concatenating the
%results into the output matrix B.

dct = @(block_struct) D * block_struct.data * D';
B = blockproc(lena,[8 8],dct);

%See a few block of B. For example you can type B(1:8,1:8) or B(9:16, 1:8)
%in command window 

%Discard all but 10 of the 64 DCT coefficients in each block.
mask = [1   1   1   1   0   0   0   0
        1   1   1   0   0   0   0   0
        1   1   0   0   0   0   0   0
        1   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0];

B2 = blockproc(B,[8 8],@(block_struct) mask .* block_struct.data);

%See a few block of B2. For example you can type B22(1:8,1:8) or B(9:16, 1:8)
%in command window 

%Also try spy(B) and spy(B2) in command window.

%Reconstruct the image using the two-dimensional inverse DCT of each block.

non_zero_B = length (find(B))
non_zero_B2 = length (find(B2))

%See output in command window, how many non-zero values

invdct = @(block_struct) D' * block_struct.data * D;
lena_comp = blockproc(B2,[8 8],invdct);

figure(1);
imshow(lena);
figure(2);
imshow(lena_comp);






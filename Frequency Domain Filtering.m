% Exercise 1: Edge Detection using Frequency Domain Filtering (50pts)
clear all;
% (1) Download the gray-scale image monument.jpg from the eClass Lab website and read it into MATLAB
% (1) Denote the image as x
x = imread('monument.jpg');
% (1) This will be the first subplot
subplot(4,2,1);
% (1) Determine the size of the image matrix 
[rows columns numberOfColorChannels] = size(x);
% (1) Use this to calculate the uncompressed image size
sizeim = size(x);
s = dir('monument.jpg');
imshow(x);
title ('monument.jpg');
% (1) Denote the size of the image by M x N
N = columns;
M = rows;
% (2) Calculate the 2-D DFT of the matrix using the fft2 function
y = fft2 (x,M,N);
% (2) plot the Fourier amplitude spectrum 
% (2) In order to have better visualization
% (2) shift the origin to the center of the plot using the fftshift MATLAB function
% (2) Also, use logscale2bytes to scale the coefficients before displaying.
g = logscale2bytes(y,1);
h = fftshift (g);
subplot(4,2,2);
imshow (h);
title ('Fourier amplitude spectrum |X(u,v)|');
% (3) Using the maskgen function
% (3) generate a centralized lowpass circular zonal mask (size: M × N) of an appropriate radius r
% (3) Plot the lowpass zonal mask
lowpass_zonal_mask = maskgen(M,N,256,192,25,25);
subplot(4,2,3);
imshow (lowpass_zonal_mask);
title ('Plot the lowpass zonal mask');
% (4) From the lowpass mask, generate a highpass mask using the following equation
highpass_zonal_mask = 1 - lowpass_zonal_mask;
subplot(4,2,4);
imshow (highpass_zonal_mask);
title ('Plot the highpass zonal mask');
% (5) Using the highpass filter mask, mask the low-frequency coeffiecients of x(u,v)
v = fftshift(highpass_zonal_mask) .* y;
subplot(4,2,5);
imshow (fftshift(logscale2bytes(v,1)));
title ('Fourier amplitude spectrum |X_h(u,v)|');
% (6) Calculate the inverse DFT of Xh(u,v) using the ifft2 function
% (6) obtain the filtered image 𝑥̂H
u = ifft2(v);
subplot(4,2,6);
imshow (uint8(15.* abs((u))));
title ('the filtered image X_H');
% (7) If you observe any holes in the edge image 𝑥̂H, 
% (7) apply imclose operator with an appropriate structuring element to close the holes 
% (7) Perform a morphological close operation on the image
se = strel('disk',5);
closeBW = imclose(5 .* abs(u),se);
subplot(4,2,7);
imshow(uint8(closeBW));
title ('imclose operator to close the holes');
% (8) If you observe any isolated noise pixels
% (8) apply imopen operator with an appropriate structuring element 
% (8) to get rid of these isolated pixels
% (8) Plot the final obtained edge image
afterOpening = imopen(5 .* abs(u),se);
subplot(4,2,8);
imshow(uint8(afterOpening),[]);
title ('imopen operator to get rid of these isolated pixels');

                                                                %[END]


                                                                
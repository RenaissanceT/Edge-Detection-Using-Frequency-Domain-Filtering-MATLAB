# Edge-Detection-Using-Frequency-Domain-Filtering-MATLAB
Determine a binary edge image by high pass filtering a gray level image and perform edge detection using frequency domain filtering

# <sub> Original Image (L) and Filtered Image (R)
  <img src="https://user-images.githubusercontent.com/97911922/150264492-2be04782-8f98-4bf5-9bdd-0ecd8770e58b.jpg" width="49%" height="49%"> <img src="https://user-images.githubusercontent.com/97911922/150265666-4ebf074f-c7d5-47e8-962a-4a630896987a.png" width="50%" height="50%">

# <sub> Frequency Domain Filtering Results
  <img src="https://user-images.githubusercontent.com/97911922/150265618-fd57f5b0-f426-4b3e-b74e-f47ab2ee3e2f.png" width="100%" height="100%">

# MATLAB Objectives
* fft2: calculates 2-D DFT
* fftshift: centralizes the DFT spectrum
* ifftshift: inverse of fftshift
* imtool: displays an image in the Image Tool 
* strel: Create morphological structuring element
* imclose: performs morphological closing of an image 
* imopen: performs morphological opening of an image
* maskgen: generates a 2-D mask suitable for frequency domain filtering
* logscale2bytes: scales (in log scale) the intensity of a 2-D function appropriately and generates an 8-bit digital image
* spec_est: estimates the power spectrum of an image by averaging 2-D DFT of smaller image blocks

% %Problem 1
% 
% image = imread("cars.jpeg");
% 
% imageGrey = rgb2gray(image);
% imshow(imageGrey)
% title ('Grey-scaled Cars Image');
% 
% robertMask = edge(imageGrey, 'roberts');
% imshow(robert);
% title('Robert Mask applied to Cars Image');
% 
% prewittMask = edge(imageGrey, 'prewitt');
% imshow(prewitt);
% title('Prewitt Mask applied to Cars Image');
% 
% sobelMask = edge(imageGrey, 'sobel');
% imshow(sobel);
% title('Sobel Mask applied to Cars Image');

% Problem 3

% image = imread("cars.jpeg");
% 
% imageGrey = rgb2gray(image);
% imshow(imageGrey)
% title ('Grey-scaled Cars Image');
% 
% % Unsharp masking (default radius)
% sharpen = imsharpen(imageGrey);
% imshow(sharpen);
% title ('Sharpened Cars Image');
% 
% % High-Boost Filter (k=1)
% % No need to specify 'radius' for k=1
% firstHighBoostFilter = imsharpen(imageGrey, 'amount', 1);
% imshow(firstHighBoostFilter);
% title('High-Boost Filter (k=1) applied to Cars Image');
% 
% % High-Boost Filter (k=5)
% secondHighBoostFilter = imsharpen(imageGrey, 'radius', 5, 'amount', 5);
% imshow(secondHighBoostFilter);
% title('High-Boost Filter (k=5) applied to Cars Image');

% Problem 4

% image = imread("cars.jpeg");
% 
% imageGrey = rgb2gray(image);
% imshow(imageGrey)
% title ('Grey-scaled Cars Image');
% 
% firstGaussianLevel = 0.30;
% secondGaussianLevel = 0.06;
% 
% firstGaussianImage = imnoise(imageGrey, 'gaussian', firstGaussianLevel);
% secondGaussianImage = imnoise(imageGrey, 'gaussian', secondGaussianLevel);
% 
% subplot(2,2,1);
% imshow(firstGaussianImage);
% title ('Noisy Image (Gaussian 1)');
%  
% subplot(2,2,2);
% imshow(secondGaussianImage);
% title ('Noisy Image (Gaussian 2)');
% 
% gaussianImageAverage = filter2(fspecial('average',3), firstGaussianImage)/255;
% subplot(2,2,3);
% imshow(gaussianImageAverage);
% title ('Denoised (Average Filter) - Gaussian 1');
% 
% secondGaussian = imgaussfilt(secondGaussianImage, 0.8);
% subplot(2,2,4);
% imshow(secondGaussian)
% title ('Denoised (Gaussian Smoothing) - Gaussian 2');

% Part 2 

% original = imread('low light.jpeg');
% subplot(2,2,1);
% imshow(original);
% title('Original image');
% 
% originalInverted = imcomplement(original);
% subplot(2,2,2);
% imshow(originalInverted);
% title('Inverted original image');
% 
% hazingInverted = imreducehaze(originalInverted);
% subplot(2,2,3);
% imshow(hazingInverted);
% title('Haze algorithim applied to inverted original image');
% 
% hazing = imcomplement(hazingInverted);
% subplot(2,2,4);
% imshow(hazing);
% title('Inverting haze algorithim applied to inverted original image');

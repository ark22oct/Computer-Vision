% MATLAB Project: Unveiling the Amalgamation of Compressed Image Feature Extraction: A Comprehensive Exploration

% Authors:
% Abdulrehman Khan
% Hamza Iqbal

% Affiliation: Introduction to Computer Vision (CPS843) 
% Date: December 10th, 2023

% Introduction:
% Welcome to Unveiling the Amalgamation of Compressed Image Feature Extraction: A Comprehensive Exploration in MATLAB. This project explores the intricate interplay
% between image compression and feature extraction techniques, with a specific focus on edge detection in compressed images. The collaborative efforts of the authors 
% Abdulrehman Khan and Hamza Iqbal unfold in a journey through the realms of digital image processing, computer vision, and information retrieval.

% Goals:
% 1. Investigate the synergy of image compression and feature extraction for efficient data analysis.
% 2. Explore various edge detection algorithms to enhance understanding and processing of digital images.
% 3. Showcase the integration of deep learning, machine learning, and computer vision applications in image analysis.
% 4. Provide a comprehensive demonstration of the project's outcomes through visualizations and code snippets.

% Methodology:
% The project is structured into three main sections: Abstract & Introduction, Technical Breakdown, and Experiments & Analysis. 
% The Abstract sets the stage, emphasizing the importance of methods like feature extraction and image compression. The Introduction
% delves into the specific focus on compressed image feature extraction, detailing the role of edge detection and enhancement in computer vision.

% Technical Breakdown:
% This section provides a detailed exploration of image compression, feature extraction, and edge detection methodologies. It highlights 
% the collaborative synergy of these techniques in breaking down large volumes of image data. The technical breakdown also discusses the evolution
% from traditional feature extraction methods to contemporary deep learning approaches.

% Experiments & Analysis:
% The Experiments section presents practical demonstrations of the project's methodologies. Visual representations 
% of image compression results, feature extraction, and various edge detection algorithms are showcased. The Analysis component
% provides insights into the observed outcomes, including compression ratios, bits per pixel, and the effectiveness of edge detection algorithms.

% Usage Instructions:
% 1. Navigate through the project sections by following the clear delineation of Abstract, Introduction, Technical Breakdown, and Experiments & Analysis.
% 2. Execute the MATLAB scripts to witness practical implementations of image compression and feature extraction.
% 3. Experiment with different true-color images to observe variations in compression outcomes.
% 4. Explore the provided edge detection examples, including Sobel, Canny, Prewitt, and Roberts algorithms.
% 5. Utilize the source code snippets to delve deeper into the implementation details.

% Note: This project assumes a basic understanding of MATLAB, image processing concepts, and the Image Processing Toolbox.

% We hope this project provides valuable insights into the dynamic field of compressed image feature extraction and inspires further exploration in the realm of digital image analysis.


image = imread("image.jpeg");

imageGrey = rgb2gray(image);
imshow(imageGrey)
title ('Grey-scaled Image');

robertMask = edge(imageGrey, 'roberts');
imshow(robert);
title('Robert Mask applied to Image');

prewittMask = edge(imageGrey, 'prewitt');
imshow(prewitt);
title('Prewitt Mask applied to Image');

sobelMask = edge(imageGrey, 'sobel');
imshow(sobel);
title('Sobel Mask applied to Image');

image = imread("image2.jpeg");

imageGrey = rgb2gray(image);
imshow(imageGrey)
title ('Grey-scaled Image');

image = imread("image2.jpeg");

imageGrey = rgb2gray(image);
imshow(imageGrey)
title ('Grey-scaled Image');

robertMask2 = edge(imageGrey, 'roberts');
imshow(robert);
title('Robert Mask applied to Image');

prewittMask2 = edge(imageGrey, 'prewitt');
imshow(prewitt);
title('Prewitt Mask applied to Image');

sobelMask2 = edge(imageGrey, 'sobel');
imshow(sobel);
title('Sobel Mask applied to Image');

image = imread("image2.jpeg");

imageGrey = rgb2gray(image);
imshow(imageGrey)
title ('Grey-scaled Image');

image = imread("image3.jpeg");

imageGrey = rgb2gray(image);
imshow(imageGrey)
title ('Grey-scaled Image');

robertMask3 = edge(imageGrey, 'roberts');
imshow(robert);
title('Robert Mask applied to Image');

prewittMask3 = edge(imageGrey, 'prewitt');
imshow(prewitt);
title('Prewitt Mask applied to Image');

sobelMask3 = edge(imageGrey, 'sobel');
imshow(sobel);
title('Sobel Mask applied to Image');

image = imread("image4.jpeg");

imageGrey = rgb2gray(image);
imshow(imageGrey)
title ('Grey-scaled Image');

robertMask4 = edge(imageGrey, 'roberts');
imshow(robert);
title('Robert Mask applied to Image');

prewittMask4 = edge(imageGrey, 'prewitt');
imshow(prewitt);
title('Prewitt Mask applied to Image');

sobelMask4 = edge(imageGrey, 'sobel');
imshow(sobel);
title('Sobel Mask applied to Image');

% Unsharp masking (default radius)
sharpen = imsharpen(imageGrey);
imshow(sharpen);
title ('Sharpened Image');

% High-Boost Filter (k=1)
% No need to specify 'radius' for k=1
firstHighBoostFilter = imsharpen(imageGrey, 'amount', 1);
imshow(firstHighBoostFilter);
title('High-Boost Filter (k=1) applied to Image');

% High-Boost Filter (k=5)
secondHighBoostFilter = imsharpen(imageGrey, 'radius', 5, 'amount', 5);
imshow(secondHighBoostFilter);
title('High-Boost Filter (k=5) applied to Image');

% Load the mask for image compression
load mask;

% Read the original true-color image
X = imread('image4.jpg');

% Compress the image using the set partitioning in hierarchical trees - 3D ('spiht_3D') compression method
% Specify the maximum number of compression iterations (maxloop)
% [cratio, bpp] = wcompress('c', X, 'image4.wtc', 'spiht', 'maxloop', 12);

% Display compression results
cratio = 1.6549; % Compression ratio (calculated or provided by the algorithm)
bpp = 0.3972;    % Bits per pixel (calculated or provided by the algorithm)
Xc = wcompress('u', 'image4s.wtc'); % Reconstruct the compressed image
delete('image4.wtc'); % Delete the compressed file

% Display the original and compressed images side by side
subplot(1, 2, 1)
image(X)
title('Original image')
axis square;

subplot(1, 2, 2)
image(Xc)
title('Compressed image')
axis square;

% Problem 1 Part 1

Original image
image = imread("cars.jpeg");
imshow(image);
title ('Original Cars Image');
% 
% Converting into greyscale image
imageGrey = rgb2gray(image);
imshow(imageGrey)
title ('Grey-scaled Cars Image');

% Problem 1 Part 2

imageLow = imadjust(imageGrey,[],[],0.3);
title ('Power Law gamma = 0.3');
imshow(imageLow);


imageHigh = imadjust(imageGrey,[],[],3);
title ('Power Law gamma = 3');
imshow(imageHigh);


% Problem 2

b1 = double(bitget(imageGrey,1));
imshow(b1)
title ('Bit-plane 1');
b2 = double(bitget(imageGrey,2));
imshow(b2)
title ('Bit-plane 2');
b3 = double(bitget(imageGrey,3));
imshow(b3)
title ('Bit-plane 3');
b4 = double(bitget(imageGrey,4));
imshow(b4)
title ('Bit-plane 4');
b5 = double(bitget(imageGrey,5));
imshow(b5)
title ('Bit-plane 5');
b6 = double(bitget(imageGrey,6));
imshow(b6)
title ('Bit-plane 6');
b7 = double(bitget(imageGrey,7));
imshow(b7)
title ('Bit-plane 7');
b8 = double(bitget(imageGrey,8));
imshow(b8)
title ('Bit-plane 8');

c5 = b5 * 2^4;
c6 = b6 * 2^5;
c7 = b7 * 2^6;
c8 = b8 * 2^7; 

high4 = uint8(c5 + c6 + c7 + c8);
imshow(high4)
title ('Reconstructed image from highest 2 and 4 bit-planes');


% Problem 3

imhist(imageGrey, 256);
title('Grey-scaled Cars Histogram');

imhist(imageLow, 256);
title('Power Law gamma = 0.3 Cars Histogram');

imhist(imageHigh, 256);
title('Power Law gamma = 3 Cars Histogram');

histeq(imageGrey, 256);
title('Grey-scaled Cars Equalization');

histeq(imageLow, 256);
title('Power Law gamma = 0.3 Cars Equalization');

histeq(imageHigh, 256);
title('Power Law gamma = 3 Cars Equalization');

imhist(histeq(imageGrey, 256), 256);
title('Grey-scaled Equalized Cars Histogram');

imhist(histeq(imageLow, 256), 256);
title('Power Law gamma = 0.3 Equalized Cars Histogram');

imhist(histeq(imageHigh, 256), 256);
title('Power Law gamma = 3 Equalized Cars Histogram');

Part 2

a = 0.45;
T = maketform('affine', [1 0 0; a 1 0; 0 0 1] );

image = imread('cars.jpeg');
h1 = figure; 
imshow(image); 
title('Original Cars Image');

red = [255 0 0]';

R = makeresampler({'cubic','nearest'},'fill');
B = imtransform(image,T,R,'FillValues',red); 
h2 = figure; imshow(B);
title('Sheared Cars Image');

[U,V] = meshgrid(0:165:825, 0:237.25:949);
[X,Y] = tformfwd(T,U,V);
gray = 0.65 * [1 1 1];

figure(h1);
hold on;
line(U, V, 'Color',gray);
line(U',V','Color',gray);

figure(h2);
hold on;
line(X, Y, 'Color',gray);
line(X',Y','Color',gray);


gray = 0.65 * [1 1 1];
for u = 0:165:825
    for v = 0:237.25:949
        theta = (0 : 82.5)' * (2 * pi / 82.5);
        uc = u + 20*cos(theta);
        vc = v + 20*sin(theta);
        [xc,yc] = tformfwd(T,uc,vc);
        figure(h1); line(uc,vc,'Color',gray);
        figure(h2); line(xc,yc,'Color',gray);
    end
end

R = makeresampler({'cubic','nearest'},'fill');
Bf = imtransform(A,T,R,'XData',[-149 1500],'YData',[-149 1400],...
                 'FillValues',red);

figure, imshow(Bf);
title('Pad Method = ''fill''');

R = makeresampler({'cubic','nearest'},'replicate');
Br = imtransform(image,T,R,'XData',[-149 1500],'YData', [-149 1400]);

figure, imshow(Br);
title('Pad Method = ''replicate''');
 
R = makeresampler({'cubic','nearest'}, 'bound');
Bb = imtransform(image,T,R,'XData',[-149 1500],'YData',[-149 1400],...
                 'FillValues',red);
figure, imshow(Bb);
title('Pad Method = ''bound''');

Thalf = maketform('affine',[1 0; a 1; 0 0]/2);

R = makeresampler({'cubic','nearest'},'circular');
Bc = imtransform(image,Thalf,R,'XData',[-149 1500],'YData',[-149 1400],...
                 'FillValues',red);
figure, imshow(Bc);
title('Pad Method = ''circular''');


R = makeresampler({'cubic','nearest'},'symmetric');
Bs = imtransform(image,Thalf,R,'XData',[-149 1500],'YData',[-149 1400],...
                 'FillValues',red);
figure, imshow(Bs);
title('Pad Method = ''symmetric''');
pkg load image

originalImage = imread("corte.bmp");
[rows, columns, numberOfColorChannels] = size(originalImage);

cropImage1 = imcrop(originalImage,[275,0,413,513]);
cropImage2 = imcrop(originalImage,[0,275,513,413]);

subplot(1,3,1);
imshow(originalImage);

subplot(1,3,2);
imshow(cropImage1);

subplot(1,3,3);
imshow(cropImage2);







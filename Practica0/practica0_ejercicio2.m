RGB = imread('retinaRGB.jpg','jpg');

escalaGrises = rgb2gray(RGB);

hsv = rgb2hsv(RGB);

subplot(2,3,2);
imshow(RGB);
fontSize=20;
title('Imagen Original','FontSize',fontSize)

subplot(2,3,4);
imshow(escalaGrises);
title('Escala de grises','FontSize',fontSize)


subplot(2,3,5);
imshow(hsv);
title('Escala HSV','FontSize',fontSize)

R=RGB(:,:,1); 
G=RGB(:,:,2); 
B=RGB(:,:,3); 
Y = 0.299 * R + 0.587 * G + 0.114 * B;
U = -0.14713 * R - 0.28886 * G + 0.436 * B;
V = 0.615 * R - 0.51499 * G - 0.10001 * B;
YUV = cat(3,Y,U,V);
subplot(2,3,6);
imshow(YUV);
title('Escala YUV','FontSize',fontSize)


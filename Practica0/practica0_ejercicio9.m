RGB = imread('mri.jpg','jpg');


escalaGrises = rgb2gray(RGB);

imwrite(escalaGrises, 'mri.tiff');
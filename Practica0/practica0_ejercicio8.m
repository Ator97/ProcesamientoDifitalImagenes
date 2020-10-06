cta_image = imread("cta_scan_index.bmp") ;
rotate45 = imrotate(cta_image,45)  ; 
rotate90 = imrotate(cta_image,90);
rotate180 = imrotate(cta_image,180);

subplot(2,2,1);
imshow(cta_image);

subplot(2,2,2);
imshow(rotate45);

subplot(2,2,3);
imshow(rotate90);

subplot(2,2,4);
imshow(rotate180);


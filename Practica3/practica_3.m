
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Actividad 1%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% i=im2double(imread('lenaTest1.jpg')); 
% i2= binomialCoef(11) .* binomialCoef(11)';
% i3=conv2(i,i2,'valid');
% figure();
% imshow(i3,[]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Actividad 2%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% I=imread('lenaTest1.jpg');
% I = fft2(I);
% I=fftshift(I);
% figure();
% imshow(I)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Actividad 3%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% i=im2double(imread('lenaTest1.jpg')); 
% i2= binomialCoef(6) .* binomialCoef(6)';
% 
% i3=imfilter(i,i2,'circular','conv');
% 
% I = fft2(i3);
% I=fftshift(I);
% figure();
% imshow(I)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Actividad 4%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=im2double(imread('lenaTest1.png')); 
i2= binomialCoef(11) .* binomialCoef(11)';

i3=imfilter(i,i2,'conv');
I = fft2(i3);
I=fftshift(I);
figure();
imshow(I)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%Codigo de prueba%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % A = imread('mri.tif'); 
% % A = im2double(A);
% % fun = @(x) median(x(:));
% % B = nlfilter(A,[11 11],fun); 
% % length(B)
% % montage({A,B})
% % title('Original Image (Left) and Median Filtered Image (Right)')

% % % % % I=imread('lenaTest1.jpg');
% % % % % 
% % % % % l = binomialCoef(10) .* binomialCoef(10)';
% % % % % 
% % % % % figure();
% % % % % imshow(I);
% % % % % title('Imagen original');
% % % % % 
% % % % % %%l(512,512)=0;
% % % % % %%l=uint8(l);
% % % % % figure();
% % % % % imagesc(l);
% % % % % title('Imagen filtro');
% % % % % c=conv2(l,I, 'full');
% % % % % %%c=l.*I;
% % % % % length(c)
% % % % % figure();
% % % % % imshow(c);
% % % % % title('Imagen final');

%I=imread('lenaTest1.jpg');
%I = rgb2gray(I);
% figure();
% imshow(I);
% title('Imagen');
% I = fft2(I);
% I=fftshift(I);
% figure();
% imshow(I);
% title('Imagen fft2 y fftshift');
% I=log2(I);
% I=abs(I);
% 
% 
% l = binomialCoef(11) .* binomialCoef(11)';
% X = fft2(l);
% 
% X = abs(X);
% figure();
% imagesc(fftshift(X));
% title('Imagen Coef');
% %%imagesc(fftshift(X));
% 
% figure();
% subplot(1,1,1);
% m = conv2(I,X);
% imagesc(m);
% title('Imagen conv2');
% 
% Img=I.*m;
% figure();
% subplot(1,1,1);
% Img(Img);
% title('Imagen conv2');


% % grayImage = imread('lenaTest1.jpg');
% % grayImage = double(grayImage);
% % subplot(2,3,1);
% % imshow(grayImage, []);
% % axis on;
% % title('Original Image', 'FontSize', 15);
% % myfilter = fspecial('gaussian',[3 3], 0.5);
% % subplot(2,3,2);
% % imshow(myfilter, []);
% % axis on;
% % title('myFilter', 'FontSize', 15);
% % a = imfilter(grayImage, myfilter);
% % subplot(2,3,3);
% % imshow(a, []);
% % axis on;
% % title('a', 'FontSize', 15);
% % b = imsharpen(grayImage,'Radius',0.5);
% % subplot(2,3,4);
% % imshow(b, []);
% % axis on;
% % title('b', 'FontSize', 15);
% % c=conv2(a,b, 'full');
% % subplot(2,3,5);
% % imshow(c, []);
% % title('c', 'FontSize', 15);
% % axis on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Coeficiente binomial
function retval=binomialCoef(n)
  l=[];
  for i = 0:n
    l=[l,binomial(n,i)];
  end
  retval = l;
end


% Binomial
function retval=binomial(n,k)
  retval = fact(n) / (fact(n-k) * fact(k));
end

function retval = fact (n)
  if (n > 0)
    retval=n*fact(n-1);
  else
    retval=1;
  end
end







x = [1:3+1];
for i=0 : 3
    x(i+1) = factorial(3)/(factorial(i)*factorial(3-i));
end
f = x;
fil = f'*f;
normalizador = sum(sum(fil));
filtroNormalizado = fil/normalizador;

imgOriginal = imread("lenaTest1.png");
imgOriginal = rgb2gray(imgOriginal);
imgOriginal = im2double(imgOriginal);

imgOriginalF3 = filter2(filtroNormalizado,imgOriginal);
plot


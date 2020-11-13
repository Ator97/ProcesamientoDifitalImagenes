
function retval = fact (n)
  if (n > 0)
    retval = n * fact (n-1);
  else
    retval = 1;
  end
end

% Binomial
function retval = binomial(n,k)
  retval = fact(n) / (fact(n-k) * fact(k));
end

% Coeficiente binomial
function retval = binomialCoef(n)
  l = []
  for i = 0:n
    l =[l,binomial(n,i)];
  end
  retval = l;
end




I=imread('lenaImage.png');
I = rgb2gray(I);
I = fft2(I);
I=fftshift(I);
%I=log2(I);
%I=abs(I);
imshow(I);



l = binomialCoef(10) .* binomialCoef(10)';
X = fft2(l);
X = abs(X);
imagesc(fftshift(X));


subplot(1,1,1);
m = conv2(abs(I),X);
imagesc(m);






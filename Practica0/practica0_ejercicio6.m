magriclonRGB = imread('magriclonRGB.jpg','jpg'  ); % Read image

% Extract color channels.
redChannel = rgbImage(:,:,1); % Red channel
greenChannel = rgbImage(:,:,2); % Green channel
blueChannel = rgbImage(:,:,3); % Blue channel

%Showing red colorbar
figure(1)
image(redChannel)
colorbar

%Showing green colorbar
figure(2)
image(greenChannel)
colorbar

%Showing blue colorbar
figure(3)
image(blueChannel)
colorbar
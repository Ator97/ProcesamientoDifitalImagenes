rgbImage = imread('magriclonRGB.jpg','jpg'  ); % Read image
% Extract color channels.
redChannel = rgbImage(:,:,1); % Red channel
greenChannel = rgbImage(:,:,2); % Green channel
blueChannel = rgbImage(:,:,3); % Blue channel

% Create an all black channel.
allBlack = zeros(size(rgbImage, 1), size(rgbImage, 2), 'uint8');

% Create color versions of the individual color channels.
just_red = cat(3, redChannel, allBlack, allBlack);
just_green = cat(3, allBlack, greenChannel, allBlack);
just_blue = cat(3, allBlack, allBlack, blueChannel);


% Display them all.
subplot(3, 3, 2);
imshow(rgbImage);
fontSize = 20;
title('Imagen Original', 'FontSize', fontSize)

subplot(3, 3, 4);
imshow(just_red);
title('Canal rojo', 'FontSize', fontSize)

subplot(3, 3, 5);
imshow(just_green)
title('Canal verde', 'FontSize', fontSize)

subplot(3, 3, 6);
imshow(just_blue);
title('Canal azul', 'FontSize', fontSize)


% Set up figure properties:
% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0, 1, 1]);
% Get rid of tool bar and pulldown menus that are along top of figure.
% set(gcf, 'Toolbar', 'none', 'Menu', 'none');
% Give a name to the title bar.
set(gcf, 'Name', 'Demo by ImageAnalyst', 'NumberTitle', 'Off')

%----------------------------------------------------------------------------------
%----------------------------------------------------------------------------------
%----------------------------------------------------------------------------------
%----------------------------------------------------------------------------------
%----------------------------------------------------------------------------------
%----------------------------------------------------------------------------------


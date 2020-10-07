%Reading image
abdomen=imread("abdomen.png",'png')

%Colormap jet
figure(1);
image(abdomen);
colormap("jet");

%Colormap autumn
figure(2);
image(abdomen);
colormap("autumn");

%Colormap bone
figure(3);
image(abdomen);
colormap("bone");

%Colormap copper
figure(4);
image(abdomen);
colormap("copper");

%Colormap winter
figure(5);
image(abdomen);
colormap("winter");
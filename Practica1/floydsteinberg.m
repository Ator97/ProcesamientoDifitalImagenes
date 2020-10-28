img = imread ("./lenaTest1.jpg");
img = double(img);
%Tamaño de la imagen
[X,Y,~] = size(img);

for x=1:X
    for y=1:Y
        old = img(x,y);
        %Pasamos a blanco/negro
        if(old >= 128) 
            new = 255;
        else
            new = 0;
        end
        img(x,y) = new;
        error = old - new;
        if(x < X)
            %Primer propagación
            img(x+1,y) = img(x+1,y) + error*(7/16);
            if(y > 1)
                %Segunda propagación
                img(x+1,y-1) = img(x+1,y-1) + error*(1/16);
            end
            if(y < Y)
                %Tercer propagación
                img(x+1,y+1) = img(x+1,y+1) + error*(5/16);
            end
        end
        if(y < Y)
            %Cuarta propagación
            img(x,y+1) = img(x,y+1) + error*(3/16);
        end
    end
end

imgOriginal = imread ("./lenaTest1.jpg");
subplot(1,2,1);imshow(img)
subplot(1,2,2);imshow(imgOriginal)

for i = 1:280
    if (i < 10)
        imagen = dicomread("IM-0001-000"+i+".dcm");
    elseif (i > 9 && i < 99)
         imagen = dicomread("IM-0001-00"+i+".dcm");
    else
         imagen = dicomread("IM-0001-0"+i+".dcm");
    end
    imshow(imagen,'DisplayRange',[])
    pause(0.01)
end

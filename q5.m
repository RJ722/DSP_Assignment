I = imread('Q5b.bmp');
new_I = I - mod(I, 16);
imshow(new_I);
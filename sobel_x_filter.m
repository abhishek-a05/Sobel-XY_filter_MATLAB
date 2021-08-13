a=imread('saturn.png');
imshow('saturn.png');
b=rgb2gray(a);
c=double(b);
for i=1:size(c,1)-2
    for j=1:size(c,2)-2
        %sobel mask for x direction
       gx=((2*c(i+2,j+1)+c(i+2,j)+c(i+2,j+2))-(2*c(i+1,j)+c(i,j)+c(i+2,j)));
       %sobel mask for y direction
       gy=((2*c(i+1,j+2)+c(i,j+2)+c(i+2,j+2))-(2*c(i+1,j)+c(i,j)+c(i+2,j)));
%gradient of the image
b(i,j)=abs(gx)+abs(gy);
       b(i,j)=sqrt(gx.^2+gy.^2);
    end
end
figure,imshow(b);title('sobel gradient');
%defining a threshold value
thresh=100;
b=max(b,thresh);
b(b==round(thresh))=0;
b=uint8(b);
figure,imshow(~b);title('edge detected image');
img=a;
img1=imnoise(img,'gaussian',0.04,0.0003);
figure,imshow(img1); 

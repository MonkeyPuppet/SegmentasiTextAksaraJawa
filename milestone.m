gambar = imread('uji.jpg');
% dideteksi tepi
%real = imresize(gambar,[480 NaN]);
%real_gray= rgb2gray(real);
%citra = edge(real_gray,'Sobel');
%gambar_dilasi= imdilate(citra,strel('line',3,80));

level=graythresh(gambar); 
gambar=im2bw(gambar,level); 
imshow(gambar);  
hold on; 
Ib=gambar; 
gambar=~gambar; 
[bar,kol]=size(gambar);

%proyeksiHorizontal
Y=sum(gambar,2); 
temp=1:bar; 
plot(Y,1:bar); 
hold off

% pemotongan Horizontal
line1=zeros(1,bar);  
k1=length(Y); 
k=1; 
for a=2:k1-1     
    if Y(a)==0         
        if Y(a+1)~=0             
            line1(k)=temp(a+1);         
        elseif Y(a-1)~=0             
            
            line1(k)=temp(a-1);         
        end
        k=k+1;     
    end
end


line1=line1(line1~=0); 
for k=1:2:length(line1)     
    crop=imcrop(Ib,[1 line1(k) kol line1(k+1)-line1(k)]);     
    figure, imshow(crop);
end
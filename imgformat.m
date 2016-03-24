function timg=imgformat(ip)

I=imread(ip);
B = imrotate(I,90);

G=rgb2gray(B);


[m n]=size(G);

for i=1:m
    for j=1:n
        G(i,j)=255-G(i,j);
    end
end

threshold = graythresh(G);
K=im2bw(G,threshold);

BW2 = edge(K,'Canny',0.999);




[R,C]=find(BW2);
x1=[min(C),max(R)];
x2=[max(C),max(R)];
x3=[min(C),min(R)];
x4=[max(C),min(R)];
pos=[x3-100,(x2(1)-x1(1)+200),(x1(2)-x3(2)+200)];
rectangle('Position',pos);
f=imcrop(G,pos);
final=imresize(f,[20 20]);

final = imadjust(final);

timg=final;


end

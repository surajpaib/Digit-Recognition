function X=editim(in)

   G=reshape(in,20,20);
 
  
   threshold = graythresh(G);
K=im2bw(G,threshold);

BW2 = edge(K,'Canny',0.999);



try
[R,C]=find(BW2);
x1=[min(C),max(R)];
x2=[max(C),max(R)];
x3=[min(C),min(R)];
x4=[max(C),min(R)];
pos=[x3-100,(x2(1)-x1(1)+200),(x1(2)-x3(2)+200)];
rectangle('Position',pos);
fi=imcrop(G,pos);
G=imresize(fi,[20 20]);

catch 
    fprintf('Error');
end
final = imadjust(G);

X=reshape(final,1,[]);
end
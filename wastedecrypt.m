function wastedecrypt()
img1=imread('encrypt.bmp');
test=fopen('textdec.txt','w');
[ri,ci,di]=size(img1);
%pixels=fopen('size.txt','r');
%num_pixel=fscanf(pixels,'%d',[1 1]);
k=16;m=ri;n=ci-8;
    bins=(zeros(1,16));
    for j = 1:8
        igdata=img1(m,n,1);
        n=n+1;
        igdata1=dec2bin(igdata,8);
        bins(1,k)=(igdata1(1,8))-48;
        k=k-1;
        bins(1,k)=(igdata1(1,7))-48;
        k=k-1;
    end;
num_pixel=bin2dec(num2str(bins));
m=1;n=1;
for i = 1:num_pixel
    k=8;
    bins=(zeros(1,8));
    for j = 1:4    
        igdata=img1(m,n,1);
        n=n+1;
        igdata1=dec2bin(igdata,8);
        bins(1,k)=(igdata1(1,8))-48;
        k=k-1;
        bins(1,k)=(igdata1(1,7))-48;
        k=k-1;
        if(n==ci)
            m=m+1;
            n=1;
        end;    
    end;
   waste=bin2dec(num2str(bins));
   ch=char(waste);
   fprintf(test,'%d ',ch);
end;
check=visdiff('text.txt','aes_ptext.txt');
ch=fopen('ht.html','w');
fprintf(ch,'%c',check);
fclose(test);
%fclose(pixels);
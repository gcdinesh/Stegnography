function wasteencrypt(imgfile)
orig_img=imread(imgfile);
img=orig_img;
text=fopen('ctext.txt');
a=fscanf(text,'%d');
[ri,ci,di]=size(img);
a=a';
[rt,ct]=size(a);
%img(ri,ci,di)=ct;
k=ri;l=ci-8;
textdata=ct;
    textdata1=dec2bin(textdata,16);
    bitpos=16;
    for count = 1:8
        imgdata=img(k,l,1);
        imgdata1=dec2bin(imgdata,8);
        b1=(textdata1(1,bitpos));
        b2=(textdata1(1,bitpos-1));
        bitpos=bitpos-2;
        imgdata1(1,8)=b1;
        imgdata1(1,7)=b2;
        img(k,l,1)=(bin2dec(imgdata1));
        l=l+1;
    end;
%pixels=fopen('size.txt','w');
%fprintf(pixels,'%d',ct);
k=1;l=1;
for i = 1:ct
    textdata=uint8(a(1,i));
    textdata1=dec2bin(textdata,8);
    bitpos=8;
    for count = 1:4
        imgdata=img(k,l,1);
        imgdata1=dec2bin(imgdata,8);
        b1=(textdata1(1,bitpos));
        b2=(textdata1(1,bitpos-1));
        bitpos=bitpos-2;
        imgdata1(1,8)=b1;
        imgdata1(1,7)=b2;
        img(k,l,1)=(bin2dec(imgdata1));
        l=l+1;
        if l==ci
            l=1;k=k+1;
        end;
    end;
end;
imwrite(img,'encrypt.bmp');
figure
subplot(1,2,1);
imshow(orig_img);
subplot(1,2,2);
imshow(img);
fclose(text);
%fclose(pixels);
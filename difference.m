%function difference(origimg,sheetno)
origimg='133.jpg';
encryptimg='encrypt.bmp';
sheetno=2;
cellno='A1';

ctext=fopen('ctext.txt','r');
orig=imread(origimg);
encrypt=imread('encrypt.bmp');
a = fscanf(ctext,'%d');
[characters,col]=size(a);
[row1,col1,depth1]=size(orig);
[row2,col2,depth2]=size(encrypt);
xl={'original','encrypt','diff',};
xlswrite('test.xlsx',xl,sheetno,'A1');
k=1;i=1;j=1;
diff=ones(characters*4);
e=ones(characters*4);
o=ones(characters*4);
for count= 1:(characters*4)
    diff(k)=abs(orig(i,j,1)-encrypt(i,j,1));
    o(k)=orig(i,j,1);
    e(k)=encrypt(i,j,1);
    j=j+1;
    k=k+1;
    if j==col1
            j=1;i=i+1;
    end;
end;
xl={o,e,diff};
xlswrite('test.xlsx',xl);
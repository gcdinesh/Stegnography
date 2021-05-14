function excel(origimg,sheetno,cellno)
%{
origimg='bill.jpg';
encryptimg='encrypt.bmp';
sheetno=1;
cellno='A8';
%}
ctext=fopen('ctext.txt','r');
orig=imread(origimg);
encrypt=imread('encrypt.bmp');
a = fscanf(ctext,'%d');
[characters,col]=size(a);
[row1,col1,depth1]=size(orig);
[row2,col2,depth2]=size(encrypt);
xl={'Name','row','col','depth','chars(NO.)','mse','psnr'};
xlswrite('test.xlsx',xl,sheetno,'A1');
i=1;j=1;sum=0;
for count= 1:(characters*4)
    sum=double(sum+(double((encrypt(i,j,1))-double(orig(i,j,1)))*(double(encrypt(i,j,1))-double(orig(i,j,1)))));
    j=j+1;
    if j==col1
            j=1;i=i+1;
    end;
end;
mse=double(sum)/double(row1*col1*depth1);
psnr=10*log10((255*255)/mse);
xl={origimg,row1,col1,depth1,characters,mse,psnr};
xlswrite('test.xlsx',xl,sheetno,cellno);
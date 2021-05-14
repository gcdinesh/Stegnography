function context(file)
text=fopen(file);
ctext=fopen('ctext.txt','w');
arr=fscanf(text,'%c');
[~,c]=size(arr);
q=c/16;
rem=mod(c,16);
k=1;
for i = 1:q
    plaintext=ones(16,1);
    for j = 1:16
        plaintext(j,1)=double(arr(k));
        k=k+1;
    end;
    ciphertext=aes_demo(plaintext);
    fprintf(ctext,'%d ',ciphertext);
end;
plaintext=ones(16,1);
for i = 1:rem
    plaintext(i,1)=double(arr(k));
    k=k+1;
end;
if (rem ~= 0)
ciphertext=aes_demo(plaintext);
fprintf(ctext,'%d ',ciphertext);
end;
fclose(ctext);
fclose(text);
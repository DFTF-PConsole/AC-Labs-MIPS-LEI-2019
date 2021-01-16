void bin_img_c(unsigned char *ptr, int w, int h)    {
    int x, y, count = 0;
    unsigned char z=0;
    int k=0;
    unsigned char limiar = 0;
    long int somatorio = 0;

    for (x=0 ; x<h ; x++)   {
        for (y=0; y<w; y++)     {
            k = (x*w+y);
            z = *(ptr+k);
            somatorio = somatorio + (long int) z;
            count++;
        }
    }
    limiar = (unsigned char) (somatorio / count);
    printf("Valor do Limiar Antigo: 127 \nMedia Calculada para o Limiar: %d \n", (int) limiar);
    for (x=0 ; x<h ; x++)   {
        for (y=0; y<w; y++)     {
            k = (x*w+y);
            z = *(ptr+k);

            if(z <= limiar)
                *(ptr+k) = 0;
            else
                *(ptr+k) = 255;
        }
    }
}

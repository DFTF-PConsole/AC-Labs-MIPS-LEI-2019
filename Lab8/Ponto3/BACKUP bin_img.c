void bin_img(unsigned char *ptr, int w, int h, unsigned char limiar)
{
int x=0;
int y=0;
unsigned char z=0;
int k=0;

for (x=0 ; x<h ; x++)
{
	for (y=0; y<w; y++)
	{
	k = (x*w+y);
	z = *(ptr+k);
		
	if(z <= limiar)
	*(ptr+k) = 0;
	else
	*(ptr+k) = 255;

	}
}
}
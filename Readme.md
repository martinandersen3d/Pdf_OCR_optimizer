# Usage:
```
./pdf-optimizer.sh my-book.pdf
```


# Install

Pages:




# 1. Convert PDF to images

sudo apt install poppler-utils

```
pdftoppm -png -r 600 mybook.pdf  page

Output:
page-001.png
page-002.png
page-003.png
page-004.png

```

# 2. Deskew images. Will rotate them correctly
https://github.com/galfar/deskew

This step will rotate and dewarp the images.

https://github.com/galfar/deskew/releases
Copy "deskew" to /bin
Logout/reboot


# 3. img2pdf
sudo apt install img2pdf


# 4. OCRmyPDF
https://github.com/jbarlow83/OCRmyPDF





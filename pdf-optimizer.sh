#!/bin/bash
LANG=en_US.UTF-8

filename=$1
basefilename="$(basename $1)"
#> mypdf.pdf

fullpath="$(readlink -f $1)"
#>  /media/m/DataLinux/Eaaa/Other/Books/Originals/test/Sysint_GOLD_EnterpriseIntegration_BethGold.pdf

dir="$(dirname $fullpath)"
#>  /media/m/DataLinux/Eaaa/Other/Books/Originals/test

mkdir "$dir/1_pdf_to_png"
mkdir "$dir/2_deskew"
mkdir "$dir/3_pdf"

echo "-------------------------------"
echo "1. PDF TO PNG"
echo "-------------------------------"

pdftoppm -png -r 600 $filename "$dir/1_pdf_to_png/page"


echo "-------------------------------"
echo "2. Deskew"
echo "-------------------------------"

cd "$dir/1_pdf_to_png/"
for file in *.png; do
     # o: output
     # b: Background color in hex format RRGGBB|LL|AARRGGBB (default: black)

     deskew -b "e1e2e2" -o "$dir/2_deskew/$file" "$file"
done



echo "-------------------------------"
echo "3. Images to PDF"
echo "-------------------------------"

cd "$dir/2_deskew/"
img2pdf  --output "$dir/3_pdf/out.pdf" page-*.png

echo "-------------------------------"
echo "4. OCR PDF"
echo "-------------------------------"

ocrmypdf --deskew "$dir/3_pdf/out.pdf" "$dir/OCR_$basefilename"


echo "-------------------------------"
echo "5. remove folders"
echo "-------------------------------"


rm -r "$dir/1_pdf_to_png"
rm -r "$dir/2_deskew"
rm -r "$dir/3_pdf"
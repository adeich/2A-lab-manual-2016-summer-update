dir=$(pwd)
file="TeX Files/2017 Spring 2A Manual.tex"
ofile=$(echo $file |  sed -e 's/.tex/.pdf/')
echo "$pdffile"
echo "Using $dir/$file to generate manual"
echo "edit compile.sh" to change

cd "TeX Files"
cp configuration.tex configuration.tex.old
echo "Generating student edition (printed)"
cat Configurations/configuration-common.tex > configuration.tex
cat Configurations/configuration-student-printed.tex >> configuration.tex
/Library/TeX/texbin/pdflatex -interaction nonstopmode "$dir/$file" >/dev/null 2>&1
echo "	recompiling to resolve references"
/Library/TeX/texbin/pdflatex -interaction nonstopmode "$dir/$file" >/dev/null 2>&1
cd ../
cp "$ofile" student-printed.pdf


echo "Generating student edition (digital)"
cd "TeX Files"
cat Configurations/configuration-common.tex > configuration.tex
cat Configurations/configuration-student-digital.tex >> configuration.tex
/Library/TeX/texbin/pdflatex -interaction nonstopmode "$dir/$file" >/dev/null 2>&1
echo "	recompiling to resolve references"
/Library/TeX/texbin/pdflatex -interaction nonstopmode "$dir/$file" >/dev/null 2>&1
cd ../
cp "$ofile" student-digital.pdf


echo "Generating instructor edition (digital)"
cd "TeX Files"
cat Configurations/configuration-common.tex > configuration.tex
cat Configurations/configuration-instructor-digital.tex >> configuration.tex
/Library/TeX/texbin/pdflatex -interaction nonstopmode "$dir/$file" >/dev/null 2>&1
echo "	recompiling to resolve references"
/Library/TeX/texbin/pdflatex -interaction nonstopmode "$dir/$file" >/dev/null 2>&1
cd ../
cp "$ofile" instuctor-digital.pdf


echo "Generating instructor edition odd side pages (print)"
cd "TeX Files"
cat Configurations/configuration-common.tex > configuration.tex
cat Configurations/configuration-instructor-odd.tex >> configuration.tex
/Library/TeX/texbin/pdflatex -interaction nonstopmode "$dir/$file" >/dev/null 2>&1
echo "	recompiling to resolve references"
/Library/TeX/texbin/pdflatex -interaction nonstopmode "$dir/$file" >/dev/null 2>&1
cd ../
cp "$ofile" instuctor-print-side1.pdf


echo "Generating instructor edition even side pages (print)"
cd "TeX Files"
cat Configurations/configuration-common.tex > configuration.tex
cat Configurations/configuration-instructor-even.tex >> configuration.tex
/Library/TeX/texbin/pdflatex -interaction nonstopmode "$dir/$file" >/dev/null 2>&1
echo "	recompiling to resolve references"
/Library/TeX/texbin/pdflatex -interaction nonstopmode "$dir/$file" >/dev/null 2>&1
cd ../
cp "$ofile" instuctor-print-side2.pdf

echo "Interleaving the odd and even side pages"
./helpers/joinPDF.py -s -o instructor-interleaved.pdf instuctor-print-side1.pdf instuctor-print-side2.pdf >/dev/null 2>&1

echo "Removing unnecessary cover page"
./helpers/splitPDF.py instructor-interleaved.pdf 1 >/dev/null 2>&1

echo "cleaning up temp files"
mv instructor-interleaved.part2* instructor-printed.pdf
rm instructor-interleaved.part1*
rm instructor-interleaved.pdf
rm instuctor-print-side*
mv *.pdf pdfs/

echo "Restoring configuration.tex"
cd "TeX Files"
mv configuration.tex.old configuration.tex
cd ../



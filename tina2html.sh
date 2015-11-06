###############################################
#Das Verzeichnis tina wird dupliziert und eine HTML-Version des Dokuments erzeugt

#Voraussetzung: imagemagick, gnused


#Alles kopieren
cd ..
cp -R ./tina/ ./eTina/
cd eTina
#Pdf Bilder in jpg konvertieren
cd ./bilder
mogrify -format jpg *.pdf
mogrify -format jpg ./tinaStat/*.pdf
cd ..
#PDF Einbindung in JPG ändern
sed -i 's/pdf/jpg/g' *.tex
#\chapter* wird nicht verstanden von htlatex
sed -i 's/addcontentsline{toc}{chapter}/chapter/g' *.tex
sed -i '1d' *.tex
#mdframed raus, sonstiges raus
sed -i 's/mdframed/quotation/g' *.tex
sed -i 's/\\hfill {\\color{DeepPink}\\decofourleft}//g' *.tex
#Keine Fraktur
sed -i 's/\\begin{swb}//g' onta.tex
sed -i 's/\\end{swb}//g' onta.tex
sed -i 's/yinipar/lettrine[lines=3]/g' onta.tex
#Kaputten binder zurück
cp ../tina/binder.tex ./
#und los
htlatex binder.tex
htlatex binder.tex



PDFDIR=~/personal/src/ons-website/static/archive
OUTPUTDIR=~/personal/src/ons.github.io/jons/

for file in ${PDFDIR}/*; do 
    if [ -f "$file" ]; then 
        base_name=$(basename ${file})
        extension="${base_name##*.}"
        namepart="${base_name%.*}"
        # echo ${namepart} -- "$file" 
        outputfile=${OUTPUTDIR}/${namepart}.md
        if [ ! -f ${outputfile} ]; then
            pdfmd ${file} --ocr ocrmypdf --lang eng+ara --page-breaks --output ${outputfile}
        fi
    fi 
done

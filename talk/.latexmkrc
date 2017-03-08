$pdf_previewer = 'open -a skim';
$clean_ext = 'bbl rel %R-blx.bib %R.synctex.gz';
$preview_continuous_mode = 1;
@default_files = ('*.tex');
$pdf_mode = 1;
$pdflatex = 'pdflatex --shell-escape -interaction=nonstopmode %O %S
          -file-line-error -synctex=1';
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars';

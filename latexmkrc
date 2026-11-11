# Overleaf compila a partir da raiz do projeto, não da pasta do documento
# principal. Este arquivo diz ao kpathsea onde estão a classe da CUP, as seções
# e o .bib quando o documento principal é paper/main.tex.
#
# Caminhos com `//` são recursivos e caminhos inexistentes são ignorados, então
# o mesmo arquivo serve para qualquer diretório de trabalho usado pelo build:
#   - raiz do projeto (Overleaf)             -> ./paper//
#   - pasta paper/      (make, latexmk -cd)  -> ./template//
#   - pasta de saída    (biber em ./out)     -> ../paper//
$ENV{'TEXINPUTS'} = "./template//:./paper//:./paper/template//:" . ($ENV{'TEXINPUTS'} // "");
$ENV{'BIBINPUTS'}  = "./:./paper//:../:../paper//:" . ($ENV{'BIBINPUTS'} // "");
$ENV{'BSTINPUTS'}  = "./:./paper//:../:../paper//:" . ($ENV{'BSTINPUTS'} // "");

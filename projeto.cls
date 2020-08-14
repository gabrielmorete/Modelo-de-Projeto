%%%%%%%%%%%%%%%% AVISO!
% Altere as configurações do seu projeto no aquivo conf.tex
% Evite fazer alterações nesse arquivo
%%%%%%%%%%%%%%%% CRÉDITOS
% Baseado no projeto de Adriano J. Holanda, DCM/FFCLRP/USP
% https://gitlab.uspdigital.usp.br/sidcm/modelos-ppgca
% https://www.overleaf.com/latex/templates/ppgca-ffclrp-slash-usp-research-proposal-template/pmkrzphywfqp
% Baseado no projeto anbTeX
% https://www.abntex.net.br/
%%%%%%%%%%%%%%%% LICENÇA
%% This software is distributed under MIT License
%% https://opensource.org/licenses/MIT

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{projeto}

%%%%%%%%%%%%%%%% ESTRUTURA DA CLASSE 
% Declaração de opções
% Extensão da classe abntex2

\def\@@ptsize{12pt}
\DeclareOption{10pt}{\def\@@ptsize{10pt}}
\DeclareOption{11pt}{\def\@@ptsize{11pt}}
\DeclareOption{12pt}{\def\@@ptsize{12pt}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abnt2}}
\ProcessOptions\relax
\LoadClass[article,a4paper,\@@ptsize]{abntex2}

%%%%%%%%%%%%%%%% SEÇÕES
\RequirePackage{titlesec}
\titleformat{\section}
  {\normalfont\Large\bfseries}
  {\thesection}{1em}{}  
\titleformat{\subsection}
  {\normalfont\large\bfseries}
  {\thesubsection}{1em}{}
  
%%%%%%%%%%%%%%%% BIBLIOGRAFIA 
\newcommand\mybibname{Refer\^{e}ncias}

\renewcommand\bibsection{%
    \begin{center}
        \section*{\hfil\mybibname\hfil}        
    \end{center}
}

\AtBeginDocument{ % Controle do backref
    \@ifpackageloaded{backref}{ % Checa se carregou o pacote
        \renewcommand{\backrefpagesname}{Citado na(s) página(s):~}
        % Texto padrão antes do número das páginas
        \renewcommand{\backref}{}
        % Define os textos da citação
        \renewcommand*{\backrefalt}[4]{
    	\ifcase #1 %
    		(Nenhuma citação no texto)%
    	\or
    		(Citado na página #2)%
    	\else
    		(Citado #1 vezes nas páginas #2)%
    	\fi}%
    }{% Opção quando não carregou (void)
    }
}
%%%%%%%%%%%%%%%% RESUMO 
\renewenvironment{abstract}{
    \section*{\hfil\abstractname}
    \begin{quotation}
        \small\noindent
}{%
    \end{quotation}
    \bookmarksetup{startatroot} % fix bookmarks
}

%%%%%%%%%%%%%%%% LaTeX
\RequirePackage{iftex} % Checa qual compilador está em uso
\ifXeTeX % XeTeX
    \RequirePackage{fontspec}
    \RequirePackage{polyglossia}
    \setdefaultlanguage{brazil}
    \defaultfontfeatures{Ligatures={TeX}}
\else % LaTeX, pdfLaTeX
    \RequirePackage[utf8]{inputenc}
    \RequirePackage[brazil]{babel}
    \RequirePackage[T1]{fontenc}
\fi

\ifLuaTeX % LuaTeX
    \RequirePackage{fontspec}
    \RequirePackage{polyglossia}
    \setdefaultlanguage{brazil}
    \defaultfontfeatures{Ligatures={TeX}}
\fi

%%%%%%%%%%%%%%%% PACOTES
\RequirePackage{lmodern} % Usa a fonte Latin Modern
\RequirePackage{indentfirst} % Indenta o primeiro parágrafo de cada seção.
\RequirePackage{nomencl} % Lista de símbolos
\RequirePackage{graphicx} % Inclusão de gráficos
\RequirePackage{fullpage} % Conserta formatação estranha 
\RequirePackage{multirow} % Tabelas
\RequirePackage{multicol} % Formatação
\RequirePackage{setspace} % Espaço entre linhas
\RequirePackage{mathtools} % Matemática, evolução do amsmath
\RequirePackage{amsthm} % Digitar teoremas e afins
\RequirePackage{amssymb} % Símbolos de matemática
%\RequirePackage[brazilian,hyperpageref]{backref} % In dev
%%%%%%%%%%%%%%%% TITULO
\def\@tipo{\empty}
\newcommand{\tipo}[1]{\def\@tipo{#1}}

\def\@titulo{\empty}
\renewcommand{\titulo}[1]{\def\@titulo{#1}}

\def\@aluno{\empty}
\newcommand{\aluno}[1]{\def\@aluno{#1}}

\def\@emailaluno{\empty}
\newcommand{\emailaluno}[1]{\def\@emailaluno{#1}}

\def\@orientador{\empty}
\renewcommand{\orientador}[1]{\def\@orientador{#1}}

\def\@emailorientador{\empty}
\newcommand{\emailorientador}[1]{\def\@emailorientador{#1}}

\def\@palavraschave{\empty}
\newcommand{\palavraschave}[1]{\def\@palavraschave{#1}}

\def\@data{\empty}
\renewcommand{\data}[1]{\def\@data{#1}}

\def\commonmaketitle{
    {\LARGE\textbf{\@tipo}}\\\vspace{0.314cm}
    {\LARGE\@titulo}\\\vspace{0.314cm}
    {\large\@aluno}\footnote{\@emailaluno}\\
    {\large{Orientador: \@orientador}}\footnote{\@emailorientador}\\
    {\large\@data}
}

\makeatletter
\def\maketitle{%
\begin{center}
    \commonmaketitle
    \normalfont
    \vspace{.6785cm}
\end{center}
}
\makeatother

%%%%%%%%%%%%%%%% METADADOS E LINKS
\makeatletter
    \AtBeginDocument{ %DEFINIÇÃO DE METADADOS APÓS AS VARIÁVEIS
        \hypersetup{
            pdftitle        = {\@titulo}, 
            pdfauthor       = {\@aluno\ e\ \@orientador},
            pdfsubject      = {\@tipo},
            pdfcreator      = {LaTeX},
            pdfkeywords     = {\@palavraschave},
        }
    }
    \hypersetup{
        %draft,         % Desabilita links
        colorlinks      = true, % false:caixas; true:links coloridos
        linkcolor       = black, % Cor de links internos
        citecolor       = black, % Cor de links da bibliografia
        filecolor       = black, % Cor de links para arquivos
        urlcolor        = black, % Cor de url
        bookmarksdepth  = 4
    }
\makeatother

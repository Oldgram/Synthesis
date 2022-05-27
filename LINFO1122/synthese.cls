\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Synthese}
\LoadClass[a4paper,12pt]{article}

%-------------------------------------------Structure------------------------------------------%

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

%Language
\RequirePackage[french=guillemets]{csquotes}
\RequirePackage[french]{babel}

%silence the annoying warning
\frenchsetup{SuppressWarning}

\RequirePackage[nottoc,numbib]{tocbibind}
\RequirePackage{multicol}
\RequirePackage{tabularx}
\RequirePackage[top=2cm,bottom=2cm,left=2.25cm,right=2.25cm]{geometry}
\RequirePackage{hyperref}
\RequirePackage{enumitem}
\RequirePackage{xkeyval}
\RequirePackage{ifthen}

%--------------------------------------------Forme---------------------------------------------%

\setlength{\parindent}{0pt}
\usepackage{parskip}
\usepackage{listings}
\usepackage{titlesec}
\usepackage{fontspec}
\setmonofont{GoMono}[Scale=MatchLowercase]
\usepackage[french]{babel}
\usepackage{xspace}
%\usepackage[babel,french=guillemets]{csquotes}
\MakeAutoQuote {«}{»}

%Chapter form
\RequirePackage[Bjornstrup]{fncychap}

%Picture package
\RequirePackage{graphicx}
\graphicspath{{./Pictures/}}
\RequirePackage{float}
\RequirePackage{textcomp}
\RequirePackage{eurosym}
\RequirePackage{mwe}
\RequirePackage{listings}
\RequirePackage{etoolbox}
\RequirePackage{setspace}
\RequirePackage{ccaption}
\RequirePackage{colortbl}
\RequirePackage{framed}
\RequirePackage{xcolor}
\RequirePackage{fourier}
\RequirePackage[pages=some]{background}

%Bibliography
%\RequirePackage[backend=biber]{biblatex}
%\addbibresource{biblio.bib}

%--------------------------------------------Math----------------------------------------------%

\RequirePackage{mathtools}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{mathrsfs}
\usetikzlibrary{arrows,matrix,positioning}
\usetikzlibrary{3d,calc}
\RequirePackage[makeroom]{cancel}
\RequirePackage{esint}

%--------------------------------------------Tikz----------------------------------------------%

\newcommand{\norm}[1]{\lvert #1 \rvert}
\RequirePackage{tikz}
\usetikzlibrary{mindmap}
\RequirePackage{chemfig}
\RequirePackage{pgfplots}
\pgfplotsset{compat=newest}

%--------------------------------------------Annexe--------------------------------------------%

\RequirePackage[toc,page]{appendix}
\linespread{1.25}
\renewcommand{\appendixtocname}{Annexes}
\renewcommand{\appendixpagename}{Annexes}
\usepackage[toc,page]{appendix}

%-------------------------------------------Couleurs-------------------------------------------%

\definecolor{apricot}{rgb}{0.98, 0.81, 0.69}
\definecolor{bleu}{rgb}{0.19, 0.55, 0.91}
\definecolor{rouge}{rgb}{0.77, 0.12, 0.23}
\definecolor{vert}{rgb}{0.13, 0.55, 0.13}
\definecolor{antiquefuchsia}{rgb}{0.57, 0.36, 0.51}
\definecolor{gris}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}
\colorlet{shadecolor}{cyan!30!white}
\colorlet{framecolor}{blue!50!black}
\definecolor{lightgray}{rgb}{.9,.9,.9}
\definecolor{darkgray}{rgb}{.4,.4,.4}
\definecolor{purple}{rgb}{0.65, 0.12, 0.82}

%%%%%%%%%%%%%%%%%%%%%%%%%%

\setcounter{secnumdepth}{4}
\titleformat{\paragraph}{\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}
\titlespacing*{\paragraph}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

%%%%%%%%%%%%%%%%%%%%%%%%%%

%-------------------------------------------Commandes------------------------------------------%

\newcommand{\rouge}[1]{\textcolor{rouge}{#1}}
\newcommand{\bleu}[1]{\textcolor{bleu}{#1}}
\newcommand{\verts}[1]{\textcolor{vert}{#1}}
\DeclareRobustCommand{\bigO}{\text{\usefont{OMS}{cmsy}{m}{n}O}}

\makeatletter

%Fix on chapter overful hbox
\renewcommand{\DOCH}{%
    \settowidth{\py}{\CNoV\thechapter}%
    \addtolength{\py}{-10pt}%     % Amount of space by which the number is shifted right
    \fboxsep=0pt
    \colorbox[gray]{.85}{\rule{0pt}{40pt}\parbox[b]{\textwidth}{\hfill}}
    \kern-\myhi
    \kern-\py\raise20pt
    \hbox{\color[gray]{.5}\CNoV\thechapter}
    %\kern-\myhi
    \\
}

\makeatother

%Boxed environement
\newenvironment{frshaded*}{%
	\def\FrameCommand{\fboxrule=\FrameRule\fboxsep=\FrameSep \fcolorbox{framecolor}{shadecolor}}%
	\MakeFramed {\advance\hsize-\width \FrameRestore}}%
{\endMakeFramed}

%Syntax Highlighting
\lstset{ %
  backgroundcolor=\color{white},   % choose the background color
  basicstyle=\footnotesize,        % size of fonts used for the code
  breaklines=true,                 % automatic line breaking only at whitespace
  captionpos=b,                    % sets the caption-position to bottom
  commentstyle=\color{vert},       % comment style
  escapeinside={\%*}{*)},          % if you want to add LaTeX within your code
  keywordstyle=\color{blue},       % keyword style
  stringstyle=\color{mauve},       % string literal style
  xleftmargin=.2\textwidth, xrightmargin=.2\textwidth, % centers code
  numbers=left                     % lines number
}

\lstdefinelanguage{Dafny}{
  keywords={insert, Node},
  keywordstyle=\color{blue}\bfseries,
  ndkeywords={method, datatype, returns, if, else, var, match, case},
  ndkeywordstyle=\color{mauve}\bfseries,
  identifierstyle=\color{black},
  sensitive=false,
  comment=[l]{//}
}

\colorlet{chapbgcolor}{cyan!30}% shaded background color for chapters
\colorlet{chapnumcolor}{bleu}% color for numbers in chapters

\renewcommand\DOCH{%
  \settowidth{\py}{\CNoV\thechapter}
  \addtolength{\py}{-10pt}
  \fboxsep=0pt%
  \colorbox{chapbgcolor}{\rule{0pt}{40pt}\parbox[b]{\textwidth}{\hfill}}%
  \kern-\py\raise20pt%
  \hbox{\color{chapnumcolor}\CNoV\thechapter}\\%
}

\renewcommand\DOTI[1]{%
  \nointerlineskip\raggedright%
  \fboxsep=\myhi%
  \vskip-1ex%
  \colorbox{chapbgcolor}{\parbox[t]{\mylen}{\CTV\FmTi{#1}}}\par\nobreak%
  \vskip 40pt%
}

\renewcommand\DOTIS[1]{%
  \fboxsep=0pt
  \colorbox{chapbgcolor}{\rule{0pt}{40pt}\parbox[b]{\textwidth}{\hfill}}\\%
  \nointerlineskip\raggedright%
  \fboxsep=\myhi%
  \colorbox{chapbgcolor}{\parbox[t]{\mylen}{\CTV\FmTi{#1}}}\par\nobreak%
  \vskip 40pt%
 }
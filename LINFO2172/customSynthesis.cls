\ProvidesClass{customSynthesis}
\LoadClass{report}

%---Structure---%
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{minted} % For syntax highlighting, must be loaded before csquotes
\usemintedstyle{pastie}
%Language
\usepackage[babel,french=guillemets]{csquotes}
%\usepackage[greek,french]{babel} % For French
\usepackage[greek,english]{babel} % For English
%silence the annoying warning
%\frenchsetup{SuppressWarning} % Comment this line if in English package version of babel is used
\usepackage{tabularx}
\usepackage[a4paper,top=2cm,bottom=2cm,left=2.25cm,right=2.25cm]{geometry}
\usepackage{enumitem}
\usepackage{xkeyval}
\usepackage{ifthen}
\usepackage{url}
\usepackage[colorinlistoftodos]{todonotes}
\usepackage{multicol}
\usepackage{titlesec}
\usepackage{hyperref}
\usepackage{lipsum}

%---tikz---%
\usepackage{tikz}
\usetikzlibrary{babel}
\usepackage{chemfig}
\usepackage{pgfplots}
\pgfplotsset{compat=newest}

%---Form---%
\usepackage{parskip}
\setlength{\parindent}{0pt}
\usepackage{listings}
\usepackage{xspace}
\MakeAutoQuote {«}{»}
%\usepackage[Bjornstrup]{fncychap} % Chapter
\usepackage{array}
\usepackage{makecell} % For cell managment in tables
\usepackage{parallel} % For parallel text (multicolumn style)
\usepackage{pdfcolparallel}
\usepackage{stackengine} % For stacked text (text over text)
\usepackage{shorttoc} % For table of content
\usepackage{fancyhdr} % For header and footer customization
\usepackage{lastpage}
\usepackage[strict]{changepage}
\usepackage{framed}

%---Picture---%
\usepackage{graphicx}
\usepackage{textcomp}
\usepackage{eurosym}
\usepackage{mwe}
\usepackage{etoolbox}
\usepackage{setspace}
\usepackage{ccaption}
\usepackage{colortbl}
\usepackage{framed}
\usepackage{xcolor}
%\usepackage{fourier}
%\usepackage[pages=some]{background}
\usepackage{wrapfig}
\graphicspath{ {./pictures/} }

%---Math---%
\usepackage{mathtools}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{mathrsfs}
\usetikzlibrary{arrows,matrix,positioning}
\usetikzlibrary{3d,calc}
\usepackage[makeroom]{cancel}
\usepackage{esint}
\usepackage{float}

%---Custom colors---%
\definecolor{clearBlue}{RGB}{93,180,231}
\definecolor{darkBlue}{rgb}{0.0, 0.0, 1.0}
\definecolor{darkGreen}{rgb}{0.0, 0.4, 0.0}
\definecolor{deepRed}{rgb}{0.68, 0.05, 0.0}
\definecolor{deepBlue}{rgb}{0,0,0.5}
\definecolor{deepRed}{rgb}{0.6,0,0}
\definecolor{deepGreen}{rgb}{0,0.5,0}
\definecolor{lightGray}{gray}{0.9}
\definecolor{pink}{RGB}{232,62,140}
\colorlet{shadecolor}{cyan!30!white}
\colorlet{framecolor}{blue!50!black}

%---Rename output pdf---%
%\ifx\conditionmacro\undefined
%  \immediate\write18{%
%    pdflatex --jobname="\myjobname"
%    "\gdef\string\conditionmacro{1}\string\input\space\jobname"
%  }%
%  \expandafter\stop
%\fi

%---Multicolumn TOC---%
\makeatletter
\patchcmd{\l@section}
  {\hfil}
  {\leaders\hbox{\normalfont$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep     mu$}\hfill}
  {}{}

\renewcommand\tableofcontents{%
    \begin{multicols}{2}[\chapter*{ \contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}]%
    \@starttoc{toc}%
    \end{multicols}%
    }
\makeatother

%---Custom TOC title---%
\addto\captionsenglish{%
  \renewcommand{\contentsname}%
    {\centering Contents\\{\centering \color{clearBlue}\rule{0.6\textwidth}{1pt}}\\}%
}
\addto\captionsfrench{%
  \renewcommand{\contentsname}%
    {\centering Table des matières\\{\centering \color{clearBlue}\rule{0.6\textwidth}{1pt}}\\}
}

%---Section styles---%
\newcommand{\marginchapnumber}[1]{%
  \makebox[-18pt][r]{#1\hspace{1pt}}%
}
\newcommand{\marginsecnumber}[1]{%
  \makebox[0pt][r]{#1\hspace{6pt}}%
}

\titleformat{\chapter}[hang]
  {\normalfont\huge\bfseries}
  {\marginchapnumber\thechapter\hspace{6pt}\textcolor{blue}{|}\hspace{6pt}}
  {0pt}
  {}

\titleformat{\section}
  {\normalfont\Large\bfseries}
  {\marginsecnumber\thesection}
  {0pt}
  {}
\titleformat{\subsection}
  {\normalfont\large\bfseries}
  {\marginsecnumber\thesubsection}
  {0pt}
  {}
\titleformat{\subsubsection}
  {\color{blue}\normalfont\normalsize\bfseries}
  {\color{black}\marginsecnumber\thesubsubsection}
  {0pt}
  {}
\titleformat{\paragraph}[hang]
  {\color{cyan}\normalfont\normalsize\bfseries}
  {\color{black}\marginsecnumber\theparagraph}
  {0pt}
  {}
\titleformat{\subparagraph}[hang]
  {\color{teal}\normalfont\normalsize\bfseries}
  {\color{black}\marginsecnumber\thesubparagraph}
  {0pt}
  {}

\titlespacing*{\subsection}{0pt}{*3.25}{*1.5}%
\titlespacing{\chapter}{0pt}{2pt plus 4pt minus 2pt}{6pt plus 2pt minus 2pt}

%---Page numbering---%
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C]{\thepage \hspace{1pt} \textblue{|} \pageref{LastPage}}
\fancypagestyle{plain}{
	\fancyhf{}
	\fancyfoot[C]{\thepage \hspace{1pt} \textblue{|} \pageref{LastPage}}
	\renewcommand{\headrulewidth}{0pt}
}

%---Boxed environement---%
\newenvironment{frshaded*}{%
	\def\FrameCommand{\fboxrule=\FrameRule\fboxsep=\FrameSep \fcolorbox{framecolor}{shadecolor}}%
	\MakeFramed {\advance\hsize-\width \FrameRestore}}%
{\endMakeFramed}

%---For quotes/definitions---%
% From : https://jevon.org/wiki/Fancy_Quotation_Boxes_in_Latex
\definecolor{formalshade}{rgb}{0.95,0.95,1}

\newenvironment{formal}{%
  \def\FrameCommand{%
    \hspace{1pt}%
    {\color{blue}\vrule width 2pt}%
    {\color{formalshade}\vrule width 4pt}%
    \colorbox{formalshade}%
  }%
  \MakeFramed{\advance\hsize-\width\FrameRestore}%
  \noindent\hspace{-4.55pt}% disable indenting first paragraph
  \begin{adjustwidth}{}{7pt}%
  \vspace{2pt}\vspace{2pt}%
}
{%
  \vspace{2pt}\end{adjustwidth}\endMakeFramed%
}

%---Custom commands---%
\newcommand{\bigO}{\text{\usefont{OMS}{cmsy}{m}{n}O}}
\newcommand{\textred}[1]{\textcolor{deepRed}{#1}}
\newcommand{\textblue}[1]{\textcolor{darkBlue}{#1}}
\newcommand{\textgreen}[1]{\textcolor{darkGreen}{#1}}

%---Outer join symbols--%
% Source: https://tex.stackexchange.com/questions/20740/symbols-for-outer-joins
\def\ojoin{\setbox0=\hbox{$\bowtie$}%
  \rule[-.02ex]{.25em}{.4pt}\llap{\rule[\ht0]{.25em}{.4pt}}}
\def\leftouterjoin{\mathbin{\ojoin\mkern-5.8mu\bowtie}}
\def\rightouterjoin{\mathbin{\bowtie\mkern-5.8mu\ojoin}}
\def\fullouterjoin{\mathbin{\ojoin\mkern-5.8mu\bowtie\mkern-5.8mu\ojoin}}

%---Other---%
\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=black
}

% For debug purposes
\showboxdepth=5
\showboxbreadth=5

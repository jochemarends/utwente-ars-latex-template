\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{paper}[2024/11/19 Academic Research Skills Paper]

\LoadClass[9pt,a4paper]{article}

\RequirePackage{calc}
\RequirePackage{datetime}
\RequirePackage{etoolbox}
\RequirePackage{float}
\usepackage[T1]{fontenc}
\usepackage{fontspec}
\RequirePackage{graphicx}
\RequirePackage{multicol}
\RequirePackage{xparse}
\RequirePackage{titlesec}

\setdefaultdate{\usdate}

% gutter width of 5.5 mm
\setlength\columnsep{5.5mm}
% column width of 89.3 mm
\setlength\columnwidth{89.3mm}

% set margins accordingly
\usepackage[width=2\columnwidth+\columnsep,top=0.5in]{geometry}

\titleformat{\section}[block]{\bfseries}{\thesection.}{1em}{}[]
\titlespacing*{\section}{0pt}{12pt}{3pt}

\titleformat{\subsection}[block]{\itshape}{\thesubsection.}{1em}{}[]
\titlespacing*{\subsection}{0pt}{9pt}{12pt}

% default typeface
\setmainfont[Path=./font/]{Cambria}[
    BoldFont={Cambria-Bold},
    ItalicFont={Cambria-Italic},
    BoldItalicFont={Cambria-BoldItalic},
]

\renewcommand{\title}[1]{\def\@title{{\fontsize{14}{11}\selectfont #1}}}

\NewDocumentCommand{\track}{+m}{
    \newcommand{\@track}{#1}
}

\RenewDocumentCommand{\maketitle}{}{
   \begin{center}
        \makebox[\textwidth]{\includegraphics[width=\paperwidth]{./header.eps}}
    \end{center}
    \@title
    \vskip 2mm
    \noindent
    \@author
    \vskip 2mm
    \noindent
    \ifdefined\@track
        Pre-master track: \@track
        \vskip 2mm
        \noindent
    \fi
    Submission date: \@date
}

% put horizontal lines above and below the abstract
\RenewDocumentEnvironment{abstract}{b}{
    \noindent\rule{\textwidth}{1pt}\par
    \vspace{0.5em}
    \noindent
    #1
}{
    \vspace{0.5em}
    \noindent\rule{\textwidth}{1pt}\par
}

% after the abstract, start the two-column layout
\AfterEndEnvironment{abstract}{
    \begin{multicols*}{2}
}

\AtEndDocument{
    \end{multicols*}
}


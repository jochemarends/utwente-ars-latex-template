\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{paper}[2024/11/19 Academic Research Skills Paper]

% completely sure if the 9pt is set correctly
\LoadClass[a4paper]{article}

\RequirePackage[style=ieee]{biblatex}
\RequirePackage{calc}
\RequirePackage{datetime} 
\RequirePackage{etoolbox}
\RequirePackage{float}
\RequirePackage[T1]{fontenc}
\RequirePackage{fontspec}
\RequirePackage{graphicx}
\RequirePackage{multicol}
\RequirePackage{titlesec}
\RequirePackage{xparse}
\RequirePackage{caption}
\RequirePackage{enumitem}

\setlist[itemize]{leftmargin=0.5cm}

\DeclareCaptionLabelSeparator{semicolon}{.; }
\captionsetup{format=plain,labelfont=bf,labelsep=semicolon,justification=centering}

% proper formatting of dates
\setdefaultdate{\usdate}

% gutter width of 5.5 mm
\setlength\columnsep{5.5mm}
% column width of 89.3 mm
\setlength\columnwidth{89.3mm}

% set margins accordingly
\RequirePackage[width=2\columnwidth+\columnsep,top=0.5in]{geometry}

\newlength{\mainfontsize}
\setlength{\mainfontsize}{9pt}

\newlength{\mainlineskip}
\setlength{\mainlineskip}{11pt}

\setlength\parskip{0pt}

\NewDocumentCommand{\myfont}{}{\fontsize{\mainfontsize}{\mainlineskip}}

\NewDocumentCommand{\mybibfont}{}{\fontsize{7pt}{\mainlineskip}}

\NewDocumentCommand{\mysectionfont}{}{\fontsize{\mainfontsize}{1.5\mainlineskip}}

\NewDocumentCommand{\mysubsectionfont}{}{\fontsize{\mainfontsize}{\mainlineskip}}

\RenewDocumentCommand{\title}{m}{
    \def\@title{{\fontsize{14}{11}\selectfont #1}}
}

\titleformat{\section}[block]{\bfseries}{\thesection.\:}{0pt}{\mysectionfont\selectfont}[\myfont\selectfont]
\titlespacing*{\section}{0pt}{12pt}{3pt}

\titleformat{\subsection}[block]{\itshape}{\thesubsection.\:}{0pt}{\mysubsectionfont\selectfont}[\myfont\selectfont]
% the requirements mention 9 pt below and 12 pt below, however the Word template uses the other way around
\titlespacing*{\subsection}{0pt}{12pt}{9pt}

% indent first paragraph of section
\RequirePackage{indentfirst}
% the requirements mention 0.25 mm, however, I assume 2.5 mm is meant
\setlength{\parindent}{0.25cm}

% default typeface
\setmainfont[Path=./font/]{Cambria}[
    BoldFont={Cambria-Bold},
    ItalicFont={Cambria-Italic},
    BoldItalicFont={Cambria-BoldItalic},
]

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
    {\fontsize{11pt}{11}\selectfont \@author}
    \vskip 2mm
    \noindent
    \ifdefined\@track
        \textit{Pre-master track: \@track}
        \vskip 2mm
        \noindent
    \fi
    \textit{Submission date: \@date}
}

% put horizontal lines above and below the abstract
\RenewDocumentEnvironment{abstract}{+b}{
    \noindent\rule{\textwidth}{1pt}
    \vspace{0.5em}
    #1
}{
    \vspace{0.5em}
    \noindent\rule{\textwidth}{1pt}
}

\AtBeginBibliography{
    \mybibfont\selectfont
}

% after the abstract, start the two-column layout
\AfterEndEnvironment{abstract}{
    \begin{multicols*}{2}
}

\AfterPreamble{
    \myfont\selectfont
}

\AtEndDocument{
    \printbibliography[heading=bibintoc]
    \end{multicols*}
}


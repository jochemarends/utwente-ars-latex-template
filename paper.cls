\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{paper}[2024/11/19 Academic Research Skills Paper]

\LoadClass[9pt,a4paper]{article}

\RequirePackage{etoolbox}
\usepackage[T1]{fontenc}
\usepackage{fontspec}
\RequirePackage{graphicx}
\RequirePackage{multicol}
\RequirePackage{xparse}
\RequirePackage{calc}
\RequirePackage{float}
\RequirePackage{datetime}

\setdefaultdate{\usdate}

% gutter width of 5.5 mm
\setlength\columnsep{5.5mm}
% column width of 89.3 mm
\setlength\columnwidth{89.3mm}

% set margins accordingly
\usepackage[width=2\columnwidth+\columnsep,top=0.5in]{geometry}

% default typeface
\setmainfont[Path=./]{Cambria}

\renewcommand{\title}[1]{\def\@title{{\fontsize{14}{11}\selectfont #1}}}

\NewDocumentCommand{\track}{+m}{
    \newcommand{\@track}{#1}
}

\renewcommand{\maketitle}{
    \begin{center}
        \makebox[\textwidth]{\includegraphics[width=\paperwidth]{./header.eps}}
    \end{center}
    \@title
    \vskip 4mm
    \noindent
    \@author
    \vskip 4mm
    \noindent
    Pre-master track: \@track
    \vskip 4mm
    \noindent
    Submission date: \@date
}

\AfterPreamble{
    \maketitle
    \begin{multicols}{2}
}

\AtEndDocument{
    \end{multicols}
}

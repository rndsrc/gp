% Begin `proposal.cls' --- alpha version
%
% A Simple Scientific Research Proposal Document Class
%
% Written by Chi-kwan Chan (Fall 2017)
%
%==============================================================================
% Identification
%------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[1995/12/01]

\ProvidesClass{proposal}[%
  2017/11/18%
  Black Hole Initiative, Harvard University%
  A Simple Scientific Research Proposal Document Class%
]

%==============================================================================
% Initialize and declare options
%-----------------------------------------------------------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions

%==============================================================================
% Package loading
%------------------------------------------------------------------------------
\LoadClass{article}

\RequirePackage{multicol,multirow,rotating}
\RequirePackage{hyperref}
\RequirePackage{graphicx,eso-pic}

%==============================================================================
% Layout/Format
%------------------------------------------------------------------------------
% Page layout:
% 1 inch = 72 pt
\setlength{\hoffset       }{  0pt}
\setlength{\voffset       }{  0pt}
\setlength{\oddsidemargin }{  0pt}
\setlength{\evensidemargin}{  0pt} % most people don't understand LaTeX!
\setlength{\topmargin     }{  4pt}
\setlength{\headheight    }{ 12pt}
\setlength{\headsep       }{ 20pt} % at least 0.25 inch = 18 pt so we are good
\setlength{\textheight    }{612pt} % = 8.5 inches, giving 1 inch bottom margin
\setlength{\textwidth     }{468pt} % = 6.5 inches, giving 1 inch right margin
\setlength{\marginparsep  }{  4pt}
\setlength{\marginparwidth}{ 32pt}
\setlength{\footskip      }{ 36pt}

%------------------------------------------------------------------------------
% Spacing:
\newcommand\prop@parsep{1.ex}
\newcommand\prop@subsep{.5ex}
\newcommand\prop@tlssep{.5ex}
\newcommand\prop@ilssep{.5ex}

%------------------------------------------------------------------------------
% Page style:
\title{Scientific Research Proposal}
\markboth{\@title}{\@title}
\title{}

\newcommand\prop@srule{\hspace{-\linewidth}\rule[-1.ex]{\linewidth}{0.4pt}}
\newcommand\prop@frule{\hspace{-\linewidth}\rule[-.8ex]{\linewidth}{1.2pt}%
                       \hspace{-\linewidth}\rule[-1.ex]{\linewidth}{0.4pt}}
\newcommand{\ps@fancy}{
  \let\@mkboth\@gobbletwo
  \def\@oddhead {\reset@font\huge\textsc\@title\hfil\textsc\@author\prop@frule}
  \def\@evenhead{\reset@font\huge\textsc\@author\hfil\textsc\@title\prop@frule}
}
\renewcommand{\ps@plain}{
  \let\@mkboth\@gobbletwo
  \def\@oddhead {\reset@font\textsc\rightmark\hfil\textsc\@author\prop@srule}
  \def\@evenhead{\reset@font\textsc\@author\hfil\textsc\leftmark \prop@srule}
}
\pagestyle{plain}

%------------------------------------------------------------------------------
% Redefine subsubsection and paragraphs:
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {\prop@parsep}{1.0ex \@plus 1.0ex}{\normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {\prop@parsep}{-1em}{\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\z@}%
  {\prop@subsep}{-1em}{\normalfont\normalsize\bfseries}}

%------------------------------------------------------------------------------
% Tabbed list
\newenvironment{tlist}{\list{}
               {\parskip\z@\topsep\z@\partopsep\z@
                \itemsep\prop@tlssep\itemindent\z@
                \parsep\z@\listparindent\z@
                \labelsep\z@
                \labelwidth1in
                \leftmargin1in
                \rightmargin\z@
                \let\makelabel\tlistlabel}}
               {\endlist}
\newcommand*\tlistlabel[1]{\normalfont #1\hfill}

% Wide tabbed list
\newenvironment{Tlist}{\list{}
               {\parskip\z@\topsep\z@\partopsep\z@
                \itemsep\prop@tlssep\itemindent\z@
                \parsep\z@\listparindent\z@
                \labelsep\z@
                \labelwidth1.25in
                \leftmargin1.25in
                \rightmargin\z@
                \let\makelabel\Tlistlabel}}
               {\endlist}
\newcommand*\Tlistlabel[1]{\normalfont #1\hfill}

% Inverse enumerate list
\RequirePackage[parskip=0pt,topsep=0pt,partopsep=0pt,
                itemsep=\prop@ilssep,itemindent=0pt,
                parsep=0pt,listparindent=0pt,
                labelsep=.5em,
                labelwidth=2.em,
                leftmargin=2.em,
                rightmargin=0pt]{etaremune}
\newenvironment{ilist}{\etaremune{}{}}{\endetaremune}

%------------------------------------------------------------------------------
% References
\usepackage[square,comma,super]{natbib}
\bibliographystyle{unsrtapj}
\renewcommand\bibfont{\footnotesize}%{\small}
\setlength\bibsep{\z@}
%\renewcommand\bibpreamble{\begin{multicols}{2}}
%\renewcommand\bibpostamble{\end{multicols}}
\renewcommand\bibsection{\section{%
    \refname\@mkboth{\MakeUppercase{\refname}}{\MakeUppercase{\refname}}}}

%==============================================================================
% Main code
%------------------------------------------------------------------------------
% Title page information:
\newcommand\info   [1]{\gdef\prop@info     {#1}}
\newcommand\phone  [1]{\gdef\prop@phone    {#1}}
\newcommand\email  [1]{\gdef\prop@email    {#1}}
\newcommand\website[1]{\gdef\prop@website  {#1}}
\newcommand\repos  [1]{\gdef\prop@repos    {#1}}
\newcommand\address[1]{\gdef\prop@address  {#1}}

% Cover letter
\newcommand\background[1]{\gdef\cl@background{#1}}
\newcommand\sender    [1]{\gdef\cl@address   {#1}}
\newcommand\recipient [1]{\gdef\cl@recipient {#1}}
\newcommand\greetto   [1]{\gdef\cl@greetto   {#1}}
\newcommand\closing   [1]{\gdef\cl@closing   {#1}}

\background{}
\sender{}

%------------------------------------------------------------------------------
% E-mail
\newcommand\mailto[1]{\href{mailto:#1}{\texttt{#1}}}

% Redefine \part[]{}
\def\@part[#1]#2{%
  \thispagestyle{fancy}
  \ifnum \c@secnumdepth >\m@ne
    \refstepcounter{part}%
    \addcontentsline{toc}{part}{\thepart\hspace{1em}#2}%
  \else
    \addcontentsline{toc}{part}{#2}%
  \fi
  \title{#1}
  \markboth{#2}{#2}
  \@afterheading}

% Redefine \part*{}, which takes only one argument
\def\@spart#1{\markboth{#1}{#1}\@afterheading}

%------------------------------------------------------------------------------
% Set Page Title
\newcommand\pagetitle[1]{\markboth{#1}{#1}}

%------------------------------------------------------------------------------
% Make cover letter
\newcommand\makecover[1]{
  \thispagestyle{empty}
  \vspace*{-36pt} % - \topmargin - \headheight - \headsep
  {
    \setlength\parindent{0pt}
    \setlength\parskip{0.7em}
    {\raggedleft\begin{tabular}{l@{}}
      \ignorespaces%
      \ifx\@empty\cl@address\prop@address\else\cl@address\fi\\*[\parskip]
      \@date
      \end{tabular}\par}
    \cl@recipient\par\vspace{\parskip}
    \cl@greetto\par
    \input{#1}\strut\par\nobreak\vspace{\parskip}
    \noindent\hspace*{.67\textwidth}
    \parbox{.33\textwidth}{\strut\raggedright
      \cl@closing\\*[2\medskipamount]
      \includegraphics[scale=0.125]{signature}\\
      \@author}
  }
  \ifx\@empty\cl@background\else % add background
    \AddToShipoutPicture*{\put(0,0){\parbox[b][\paperheight]{\paperwidth}{%
      \vfill\centering%
      \includegraphics[width=\paperwidth,height=\paperheight,%
        keepaspectratio]{\cl@background}%
    }}}%
  \fi
}

%------------------------------------------------------------------------------
% Make Resume
\let\maketitle\undefined % don't need maketitle
\newcommand\makeinfo{
  \thispagestyle{fancy}
  {
    \parindent\z@
    \begin{minipage}{0.50\linewidth}\raggedright
      \prop@address\\
      \prop@info
    \end{minipage}
    \begin{minipage}{0.50\linewidth}\raggedleft
      Phone:~\prop@phone\\
      E-mail:~\mailto{\prop@email}\\
      Website:~\url{\prop@website}\\
      \url{\prop@repos}
    \end{minipage}
  }
  \vspace*{-3.5pt}
}

%==============================================================================
% End `proposal.cls'

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesPackage{gdutarticle} [2022/04/26 v1.0,Template for GDUT,Author: Ljxtt, Github: https://github.com/Ljxtt/gdutarticle]
\RequirePackage{xkeyval}
\RequirePackage{etoolbox}

% 读取 ctexart 样式，a4 大小，默认字号小四，UTF8 编码，没有标题
\LoadClass[a4paper,zihao=-4,UTF8,notitlepage,fontset = none]{ctexart}

%------------------------ 参数设置 ------------------------
% 设置判断
\newif\ifcoverpage
\newif\ifspine
% 设置默认值
\coverpagetrue
\spinetrue
% 添加设置值
\DeclareOptionX{nocoverpage}{\coverpagefalse}
\DeclareOptionX{nospine}{\spinefalse}

\ProcessOptionsX\relax
%------------------------ 引入宏包 ------------------------
\RequirePackage{geometry}  % 设置页边距
\RequirePackage{fancyhdr}  % 设置页眉和页脚
\RequirePackage{amsthm, amsfonts, amsmath, bm}  % 数学环境
\RequirePackage{makecell, multirow, xltabular, tabularx}  % 扩展表格
\RequirePackage{enumitem}  % 定制列表环境
\RequirePackage{graphicx}  % 插入图片
\RequirePackage{titlesec}  % 定制章节格式
\RequirePackage{titletoc}   % 定制目录格式
\RequirePackage{hyperref}   % 使用超链接
\RequirePackage{gbt7714}    % 参考文献
\RequirePackage{caption}    % 图表标题修改
\RequirePackage{listings,color} %代码高亮
\RequirePackage{tikz}     %画图
\RequirePackage{pgfplots} %画函数图
\RequirePackage{tcolorbox} % 彩色盒子
\RequirePackage{rotating} % 旋转盒子
\RequirePackage{subfig}
\RequirePackage{natbib} %参考文献引用时连续序号缩短
\RequirePackage{pgfplots} % 解决 warning
\pgfplotsset{compat=1.18}

\RequirePackage{setspace} % 有人反映缺乏此宏包
% \RequirePackage{cite} % 引用
%----------------------- 定义计数器 -----------------------
\newcounter{GDUT@now@page}
\newcounter{GDUT@appendix}

%------------------------ 设置变量 ------------------------

\define@key{GDUT}{subject}[]{\gdef\GDUT@info@subject{#1}}%
\define@key{GDUT}{title}[]{\gdef\GDUT@info@title{#1}}%
\define@key{GDUT}{subtitle}[]{\gdef\GDUT@info@subtitle{#1}}%
\define@key{GDUT}{college}[]{\gdef\GDUT@info@college{#1}}%
\define@key{GDUT}{major}[]{\gdef\GDUT@info@major{#1}}%
\define@key{GDUT}{submajor}[]{\gdef\GDUT@info@submajor{#1}}%
\define@key{GDUT}{grade}[]{\gdef\GDUT@info@grade{#1}}%
\define@key{GDUT}{stuid}[]{\gdef\GDUT@info@stuid{#1}}%
\define@key{GDUT}{name}[]{\gdef\GDUT@info@name{#1}}%
\define@key{GDUT}{teacher}[]{\gdef\GDUT@info@teacher{#1}}%
\setkeys{GDUT}{%
  subject = 本科毕业设计（论文）,
  title   = 请填写课题名称,
  college = 请填写学院,
  major   = 请填写专业,
  grade   = 请填写年级,
  stuid   = 请填写学号,
  name    = 请填写姓名,
  teacher = 请填写指导老师%
}
\newcommand{\infosetup}[1]{\setkeys{GDUT}{#1}}%


%------------------------ 字体设置 ------------------------
\setCJKfamilyfont{ht}{SimHei}[AutoFakeBold=2]
\setCJKfamilyfont{st}{SimSun}[AutoFakeBold=2]

\setmainfont{Times New Roman}
\setsansfont{Times New Roman}
% \setmonofont{Consolas}

\setCJKmainfont{SimSun}[AutoFakeBold = 2]
\setCJKsansfont{SimHei}[AutoFakeBold = 2]
\setCJKmonofont{SimSun}[AutoFakeBold = 2]

\newcommand{\tnr}{\fontfamily{Times New Roman}}
\newcommand{\cjkht}{\CJKfamily{ht}}
\newcommand{\cjkst}{\CJKfamily{st}}

%------------------------ 页面样式 ------------------------
% 页边距，左3cm，右2cm，上3cm，下2.5cm
\geometry{left=3.00cm,right=2.00cm,top=3.00cm,bottom=2.50cm}
% 行间距，1.5倍行距
\linespread{1.5}
% 页眉，页脚
\pagestyle{fancy}
\fancyhf{}
% 设置页脚页码格式（小五号 Times New Roman 体）
\fancyfoot[R]{\fontfamily{Times New Roman} \zihao{-5}\thepage}
% 设置页眉横线粗细
\renewcommand{\headrulewidth}{0pt}
% 设置页脚横线粗细
\renewcommand{\footrulewidth}{0pt}

%---------------------- 跳转链接样式 -----------------------
\hypersetup{colorlinks = true, linkcolor = black, anchorcolor = blue, citecolor = blue, CJKbookmarks = true}


%------------------------ 标题样式 ------------------------
\let\mysection\section 
\def\section{\clearpage\mysection}

\setcounter{secnumdepth}{4}
\newdimen\GDUT@half@line@space
\GDUT@half@line@space = \dimexpr(\baselineskip / 2)\relax

\renewcommand{\theparagraph}{\arabic{paragraph}}

\titleformat{\section}{\bfseries\cjkht\zihao{3}\centering}{\tnr\thesection}{1em}{}
\titleformat{\subsection}{\bfseries\cjkht\zihao{-4}}{\tnr\thesubsection}{1em}{}
\titleformat{\subsubsection}{\cjkht\zihao{-4}}{\tnr\thesubsubsection}{1em}{}
\titleformat{\paragraph}[hang]{\bfseries}{\theparagraph、}{0em}{}


\titlespacing{\section}{0em}{\GDUT@half@line@space}{\GDUT@half@line@space}
\titlespacing{\subsection}{0em}{\GDUT@half@line@space}{\GDUT@half@line@space}
\titlespacing{\subsubsection}{0em}{\GDUT@half@line@space}{\GDUT@half@line@space}
\titlespacing{\paragraph}{2em}{0pt}{0pt}

%------------------------ 定义封面 ------------------------
\newcommand\GDUT@info@item[2]{ 
    \makebox[64pt][l]{#1}\hspace{1.1667em}\underline{\makebox[7cm][c]{#2}}\medskip\\
}
\renewcommand{\today}{
    \bfseries {\tnr\number\year} {\cjkht 年} {\tnr\number\month} {\cjkht 月}
}
\newcommand\makecover{
    \setcounter{GDUT@now@page}{\value{page}}

    \thispagestyle{empty}\noindent
    \begin{minipage}[c][\textheight][s]{\textwidth}
        % 构建一个 box 存放 logo
        \makebox[\textwidth][l]{
            \includegraphics[scale = 1.15]{image/logo.jpg}
        }
        % 构建一个 box 存放广东工业大学字样
        \makebox[\textwidth][c]{
            \includegraphics[scale = 0.28]{image/brand.jpg}
        }\vspace{2.0cm}
        \makebox[\textwidth][c]{
            \bfseries\zihao{1}{\cjkht\GDUT@info@subject}
        }\vspace{2.2cm}
        \parbox{\textwidth}{
            \centering
            \bfseries\zihao{2}{\cjkht\GDUT@info@title} \\

            \ifdefined\GDUT@info@subtitle
            \bfseries\zihao{-2}{\tnr \GDUT@info@subtitle}
            \fi

        }\vfill
        \begin{center}
            \bfseries\zihao{3}\cjkht
            \GDUT@info@item{学 \hfill 院}{\GDUT@info@college}
            \GDUT@info@item{专 \hfill 业}{\GDUT@info@major}

            \ifdefined\GDUT@info@submajor
            \GDUT@info@item{\hfill}{\GDUT@info@submajor}
            \fi

            \GDUT@info@item{年级班别}{\GDUT@info@grade}
            \GDUT@info@item{学 \hfill 号}{\GDUT@info@stuid}
            \GDUT@info@item{学生姓名}{\GDUT@info@name}
            \GDUT@info@item{指导老师}{\GDUT@info@teacher}
        \end{center}

      \makebox[\textwidth][c]{\zihao{3}\today}
    \end{minipage}
    \clearpage

    \setcounter{page}{\value{GDUT@now@page}}
}
%------------------------ 定义书脊 ------------------------
\setCJKfamilyfont{vertht}{SimHei}[RawFeature={vertical:+vert}]
\newcommand{\cjkvertht}{\CJKfamily{vertht}}


\newcommand*\CJKmovesymbol[1]{\raise.35em\hbox{#1}}
\newcommand*\CJKmove{
    \let\OldCJKsymbol\CJKsymbol
    \let\OldCJKpunctsymbol\CJKpunctsymbol

    \let\CJKsymbol\CJKmovesymbol
    \let\CJKpunctsymbol\CJKsymbol
} %修正baseline

\newcommand*\CJKmovett{
  \let\CJKsymbol\OldCJKsymbol
  \let\CJKpunctsymbol\OldCJKpunctsymbol
}


% 背景色
\definecolor{GDUT@spine@colback}{RGB}{192, 192, 192} 
% 盒子


\newcommand\makespine{
    \CJKmove

    \newbox\GDUT@spine@title@box
    \setbox\GDUT@spine@title@box=\hbox{\ziju{0.5} \cjkvertht \zihao{4} \GDUT@info@title}

    \newbox\GDUT@spine@name@box
    \setbox\GDUT@spine@name@box=\hbox{\ziju{0} \cjkvertht \zihao{4} \GDUT@info@name}

    \newbox\GDUT@spine@college@box
    \setbox\GDUT@spine@college@box=\hbox{\ziju{0}  \cjkvertht\zihao{-4} \GDUT@info@college}
    
    \newdimen\GDUT@spine@title@centerfix
    \GDUT@spine@title@centerfix = \dimexpr(4.7mm - \dp\GDUT@spine@title@box)\relax

    \newdimen\GDUT@spine@name@centerfix
    \GDUT@spine@name@centerfix = \dimexpr(4.7mm - \dp\GDUT@spine@name@box)\relax

    \newdimen\GDUT@spine@college@centerfix
    \GDUT@spine@college@centerfix = 5mm

    \newgeometry{top=2.83cm,bottom=0.68cm}

    \thispagestyle{empty}

    \newdimen\GDUT@spine@height
    \newbox\GDUT@spine@describe@box
    \setbox\GDUT@spine@describe@box=\hbox{\makebox[\textwidth][c]{论文封面书脊}}
    \GDUT@spine@height= \dimexpr(\textheight-(\ht\GDUT@spine@describe@box + \dp\GDUT@spine@describe@box) - 5pt)\relax

    \setcounter{GDUT@now@page}{\value{page}}
    
    \noindent\begin{minipage}[c][\textheight][s]{\textwidth}

    \centering
    
    \box\GDUT@spine@describe@box
    
    \begin{tcolorbox}[colback=GDUT@spine@colback,width=1.27cm,height=\GDUT@spine@height,left = 0mm, right = 0mm, top = 0mm, bottom = 0mm,
        boxsep = 0mm, arc = 0mm, boxrule = 0pt]
        
        \centering
        \begin{minipage}[c][\GDUT@spine@height][c]{1.27cm}
            \vspace{20mm}

            \hspace{\GDUT@spine@title@centerfix}\rotatebox{-90}{\box\GDUT@spine@title@box}
            
            \vspace{\fill}
            \hspace{\GDUT@spine@name@centerfix}\rotatebox{-90}{\box\GDUT@spine@name@box}
                       
            \vspace{20mm}
            \hspace{\GDUT@spine@college@centerfix}\rotatebox{-90}{\box\GDUT@spine@college@box}

            \vspace{20mm}
        \end{minipage}
    \end{tcolorbox}
    \end{minipage}
    \clearpage
    \restoregeometry
    \setcounter{page}{\value{GDUT@now@page}}

    \CJKmovett
}

%------------------------ 定义目录 ------------------------
\titlecontents{section}
              [10pt]
              {\cjkht \zihao{-4}}%
              {\contentslabel{10pt}}%
              {\hspace*{-15pt}  \cjkht \zihao{-4}}%
              {\titlerule*[0.5pc]{.}\contentspage}%
\titlecontents{subsection}
              [\dimexpr(30pt + 1em)\relax]
              {\cjkst \zihao{-4}}%
              {\contentslabel{30pt}}%
              {\hspace*{-35pt}\cjkst \zihao{-4}}%
              {\titlerule*[0.5pc]{.}\contentspage}%
\titlecontents{subsubsection}
              [\dimexpr(45pt + 2em)\relax]
              {\cjkst \zihao{-4}}%
              {\contentslabel{45pt}}%
              {\hspace*{-35pt}\cjkst \zihao{-4}}%
              {\titlerule*[0.5pc]{.}\contentspage}%

\newcommand{\makecontent}{
    \setcounter{GDUT@now@page}{\value{page}}

    \pagestyle{empty}
    \tableofcontents
    \thispagestyle{empty}
    \pagestyle{fancy}
    \clearpage

    \setcounter{page}{\value{GDUT@now@page}}
}

%------------------------ 定义摘要 ------------------------
\newenvironment{ZhAbstract}
{
    \section*{摘要}
    
    \setcounter{GDUT@now@page}{\value{page}}
    \pagestyle{empty}
}
{
    \pagestyle{fancy}
    \thispagestyle{empty}
    \clearpage
    \setcounter{page}{\value{GDUT@now@page}}
}

\newenvironment{EnAbstract}
{
    \section*{Abstract}
    \setcounter{GDUT@now@page}{\value{page}}
    \pagestyle{empty}
}
{
    \pagestyle{fancy}
    \thispagestyle{empty}
    \clearpage
    \setcounter{page}{\value{GDUT@now@page}}
}
% 关键词
\newcommand{\ChineseKeyWord}{\bigskip {\bfseries{\zihao{4}\cjkht 关键词：}}}
\newcommand{\EnglishKeyWord}{\bigskip {\bfseries{\zihao{4}\tnr keywords: }}}


%------------------------ 定义图表 ------------------------
\renewcommand{\thefigure}{{\thesection.\arabic{figure}}} 
\renewcommand{\thetable}{\thesection.\arabic{table}}
\numberwithin{figure}{section}
\numberwithin{table}{section}

\newcolumntype{Y}{>{\centering\arraybackslash}X}


\newcommand*{\fullref}[1]{\hyperref[{#1}]{\autoref*{#1} \nameref{#1}}}
\def\figureautorefname{图}%
\def\tableautorefname{表}%

\newcommand{\tablenotation}[2][注：]{
    \captionsetup{
            justification=raggedright,
            singlelinecheck=false,
            skip=0pt,
            format = plain
    }
    \caption*{\cjkst\zihao{-5}#1#2}
}

\newcommand{\figurenotation}[2][注：]{
    \captionsetup{
        skip = 0pt,
        format = hang,
        justification=centering
    }
    \caption*{\cjkst\zihao{-5}#1#2}
}
\captionsetup[table]{
    font={
        small,
        bf,
        sf,
        stretch=1.5
    },
    labelsep=space,
    justification=raggedright,
    skip=0pt, 
    format=hang
}
\captionsetup[figure]{
    font = {
        small,
        rm,
        stretch = 1.5
    },
    labelsep = space,
    justification = raggedright,
    skip = 0pt,
    format = hang
}


\newenvironment{GDUTtable}[2]{
    \zihao{5}
    \tabularx{#1}{#2}
    \Xhline{1.5pt}
}
{   
    \Xhline{1.5pt}
    \endtabularx
}
%------------------------ 公式相关 ------------------------
\numberwithin{equation}{section}
\def\equationautorefname{式}%

%------------------------ 列表间距 ------------------------
\setlist[enumerate,1]{fullwidth,label=(\arabic*), itemindent=2em, topsep = 0pt, parsep = 0pt}
\setlist[itemize,1]{fullwidth, itemindent=2em, topsep = 0pt, parsep = 0pt}
\setlist[description,1]{fullwidth, itemindent=2em, topsep = 0pt, parsep = 0pt}

%------------------------ 代码高亮 ------------------------
% \AtBeginEnvironment{lstlisting}{\linespread{1.5}\selectfont}

% \let\mylstinputlisting\lstinputlisting 
% \def\lstinputlisting{\linespread{1.5}\selectfont\mylstinputlisting}


\lstset{
    % 等宽字体组
    % basicstyle=\small\ttfamily,
    % 自动断行
    breaklines = true,
    % 设置为非等宽显示
    columns=fullflexible,       
    % 在左侧显示行号
    numbers=none,       
    % 不显示背景边框                                 
    frame=none,                               
    % 设定背景颜色           
    % backgroundcolor=\color[RGB]{245,245,244},
    % 设定关键字颜色            
    keywordstyle=\color[RGB]{40,40,255}, 
    % 设定行号格式                
    numberstyle=\color[RGB]{0,192,192},    
    % 设置代码注释的格式       
    commentstyle=\color[RGB]{0,96,96},  
    % 设置字符串格式              
    stringstyle=\color[RGB]{128,0,0}, 
    % 不显示字符串中的空格  
    showstringspaces=false                        
}
%------------------------ 参考文献 ------------------------
\bibliographystyle{gbt7714-numerical}
\newcommand{\makereference}[1]{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{section}{参考文献}
    \bibliography{#1}
}
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}

%------------------------ 调整附录 ------------------------
\renewcommand{\theGDUT@appendix}{\Alph{GDUT@appendix}}
\newcommand{\makeappendix}[1]{
    \clearpage
    \addtocounter{GDUT@appendix}{1}
    \phantomsection
    \addcontentsline{toc}{section}{附录\theGDUT@appendix\texorpdfstring{\quad}{}#1}
    \setcounter{section}{\value{GDUT@appendix}}
    \setcounter{figure}{0}
    \setcounter{table}{0}
    \setcounter{equation}{0}
    \renewcommand{\thesection}{\Alph{section}}
    \renewcommand{\thefigure}{{\thesection\arabic{figure}}} 
    \renewcommand{\thetable}{\thesection\arabic{table}}
    \renewcommand{\theequation}{\theequation\arabic{equation}}
    \section*{附录\theGDUT@appendix\quad #1}
    
}

\newcommand{\makesection}[1]{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{section}{#1}
    \section*{#1}
}
%------------------------ 底注定义 ------------------------
\newcommand{\notation}[2][注：]{
    \vfill
    \zihao{5}\cjkst
    #1#2
}
%------------------------ 自动加载 ------------------------
\AtBeginDocument{
    \ifcoverpage
        \makecover
    \fi
    \ifspine
        \makespine
    \fi
}
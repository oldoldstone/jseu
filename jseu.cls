%
% jseu.cls  东南大学学报（自然科学版）LyX模版
% 作者 huanglan  2017/08/20
% 版本 v1.0.1
%
% Copyright 2017 huanglan@seu
% 版本：  v0.1  2017年9月1日
% ----------------------------------------------------------------------
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
% MA 02110-1301, USA.
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jseu}
\typeout{Document Class `jseu' v1.0.1 ,  (2017/08/20)}
% --- 载入文档类
\LoadClass[10pt,a4paper,twoside]{article}
%读取LyX文档中的参数
\def \@affiliation {}
\def \@entitle {}
\def \@enauthor {}
\def \@enaffiliation {}
\def \@foundation {}
\def \@authorintro {}
\def \@abstractcn {}
\def \@abstracten {}
\def \@keywordcn {}
\def \@keyworden {}
\def \@catnum {}  %分类号
\def \@papercode{}  %文献标识码
\newcommand{\affiliation}[1]{\def \@affiliation {#1}} 
\newcommand{\enauthor}[1]{\def \@enauthor{#1}}
\newcommand{\enaffiliation}[1]{\def \@enaffiliation {#1}}
\newcommand{\foundation}[1]{\def \@foundation {#1}}
\newcommand{\authorintro}[1]{\def \@authorintro {#1}}
\newcommand{\abstractcn}[1]{\def \@abstractcn {#1}}
\newcommand{\abstracten}[1]{\def \@abstracten {#1}}
\newcommand{\keywordcn}[1]{\def \@keywordcn {#1}}
\newcommand{\keyworden}[1]{\def \@keyworden {#1}}
\newcommand{\catnum}[1]{\def \@catnum {#1}}
\newcommand{\papercode}[1]{\def \@papercode {#1}}
\newcommand{\@titlelen}{\textwidth}
\renewcommand{\title}[2][\textwidth]{
  \renewcommand{\@titlelen}{#1}
  \renewcommand{\@title}{#2}
}
\newcommand{\@entitlelen}{\textwidth}
\newcommand{\entitle}[2][\textwidth]{
  \renewcommand{\@entitlelen}{#1}
  \renewcommand{\@entitle}{#2}
}
% ----------------------------- 其他命令 --------------------------------$
\usepackage{datetime} %英文月份转换
% ----------------------------- 页面基本设置  --------------------------------$
%页面大小与页边距
\RequirePackage{geometry}
\geometry{paperwidth = 186mm, paperheight=278mm, left=10mm,right=10mm,top=19.5mm,bottom=10mm}
%分栏设置
\RequirePackage{multicol}
\premulticols = 20pt %页面分栏最小高度
\setlength\columnsep{20pt}  %分栏间距
%行距，缩进设置
\RequirePackage[nodisplayskipstretch]{setspace}
\renewcommand{\baselinestretch}{1.3} %1.3倍行距
\RequirePackage{indentfirst} %首行缩进
\setlength{\parindent}{2em} %缩进两个中文字符

% ----------------------------- 中文与字体设置  --------------------------------$
\RequirePackage{xeCJK}
\defaultCJKfontfeatures{AutoFakeBold=4,AutoFakeSlant=.4}%粗体字和斜体字设置
\RequirePackage{fontspec} %字体设置宏包
%设置文章中用到的字体，可使用系统字体，字体名称要一致
\setCJKmainfont{宋体}%中文缺省字体,
\setmainfont{Times New Roman} %英文缺省字体
\setCJKfamilyfont{heiti}{黑体}
\newcommand{\heiti}{\CJKfamily{heiti}}
\setCJKfamilyfont{kai}{楷体}
\newcommand{\kai}{\CJKfamily{kai}}
\setCJKfamilyfont{xinwei}{华文新魏}
\newcommand{\xinwei}{\CJKfamily{xinwei}}
\setCJKfamilyfont{fangsong}{仿宋}
\newcommand{\fangsong}{\CJKfamily{fangsong}}
\renewcommand{\CJKglue}{\hskip 0.5pt plus 0.08\baselineskip}  %设置中文字符的间距
%定义字体大小
\newcommand{\seven}{\fontsize{7.5pt}{\baselineskip}\selectfont}
\newcommand{\eight}{\fontsize{8.5pt}{\baselineskip}\selectfont}
\newcommand{\nine}{\fontsize{9pt}{\baselineskip}\selectfont}
\newcommand{\ten}{\fontsize{10.5pt}{\baselineskip}\selectfont}
\newcommand{\eleven}{\fontsize{11.5pt}{\baselineskip}\selectfont}
\newcommand{\twelve}{\fontsize{12pt}{\baselineskip}\selectfont}
\newcommand{\thirty}{\fontsize{13pt}{\baselineskip}\selectfont}
\newcommand{\fourteen}{\fontsize{14.5pt}{\baselineskip}\selectfont}
\newcommand{\nineteen}{\fontsize{19.5pt}{\baselineskip}\selectfont}

% ----------------------------- 定义页眉页脚   --------------------------------$
\RequirePackage{fancyhdr}
%设置页眉样式
\renewcommand{\thefootnote}{} %无页脚
\setlength{\voffset}{-6pt}  %原来页眉高于LaTeX的固有设定，这里利用voffset提升整个页面
%首页页眉，所有的页面通过minipage的高度调整文字与页眉线之间的间距
\newcommand{\headstyle}{
    \fancyhead[C]{\begin{minipage}[b][25pt][t]{260pt}\begin{center}\jseu@journal\\\seven\jseu@journalen\end{center}\end{minipage} }
    \fancyhead[L]{\begin{minipage}[b][28pt][t]{80pt}\begin{center}{\kai\,\,\jseu@cnvol\jseu@cnissue\\\jseu@cndate}\end{center}\end{minipage} }
    \fancyhead[R]{\begin{minipage}[b][23pt][t]{70pt}\begin{center}{\jseu@envol\\\jseu@endate}\end{center}\end{minipage} }
}
%正文页眉，奇偶页不同
\newcommand{\mainstyle}{
  \fancyhf{}
  \fancyhead[CE]{\begin{minipage}[b][10pt][t]{140pt}\begin{center}\kai\jseu@journalcn\end{center}\end{minipage}}
  \fancyhead[CO]{\begin{minipage}[b][10pt][t]{400pt}\begin{center}\kai\jseu@head\end{center}\end{minipage}}
  \fancyhead[RE]{\begin{minipage}[b][10pt][t]{60pt}\begin{flushright}\kai \jseu@cnvol\end{flushright}\end{minipage}}
  \fancyhead[LO]{\begin{minipage}[b][10pt][t]{60pt}\kai\jseu@cnissue\end{minipage}}
  \fancyhead[RO]{\begin{minipage}[b][9pt][t]{20pt}\begin{flushright}\thepage\end{flushright}\end{minipage}}
  \fancyhead[LE]{\begin{minipage}[b][9pt][t]{20pt}\thepage\end{minipage}}
}
\fancyhf{} %清空原有样式
\pagestyle{fancy}
\mainstyle
\let\oldheadrule\headrule
\renewcommand{\headrulewidth}{0.6pt}
\renewcommand{\headrule}{\iffootnote{\hrule\vskip1pt\hrule}{\oldheadrule}}
\setlength{\headsep}{12pt}
%定义首页脚注
\renewcommand\footnoterule{\hrule width 35mm height 0.5pt} %脚注横线的长度
% -----------------------------  标题格式   --------------------------------$
\RequirePackage[indentafter]{titlesec}
\titleformat{\section}{\thirty}{{\bfseries\thesection} \quad }{5pt}{\heiti}%
\titlespacing*{\section}{0pt}{5pt}{2pt}%
\titleformat{\subsection}{\eleven \heiti}{{\bfseries\thesubsection} \quad}{5pt}{}%
\titlespacing*{\subsection}{0pt}{0pt}{0pt}%

% ----------------------------- 浮动项设置  --------------------------------$
%中文图表格式
\RequirePackage{caption}
\DeclareCaptionFont{mycaption}{\eight\heiti} %自定义黑体图表标注
\DeclareCaptionLabelFormat{mylabel}{\eight\heiti{#1} \textbf{#2}}
\captionsetup[figure]{labelformat=mylabel,textfont=mycaption,name=\jseu@figname,labelsep=quad}
\captionsetup[table]{labelformat=mylabel,textfont=mycaption,name=\jseu@tablename,labelsep=quad}
\setlength{\abovecaptionskip}{5pt} %图表与正文间距
\setlength{\belowcaptionskip}{0pt}
\setlength\intextsep{5pt}
\setlength\textfloatsep{0pt}
\setlength\floatsep{5pt}
\setlength{\abovedisplayshortskip}{0pt} %公式间距
\setlength{\belowdisplayshortskip}{0pt} 

% ------------------------- 引用与参考文献设置  -----------------------------$
\RequirePackage[pdfborder={0 0 0},pdfborderstyle={},backref=false,colorlinks=false]{hyperref}
\RequirePackage[super,square,comma,sort&compress]{natbib}
\setlength{\bibsep}{2pt}
\renewcommand*{\bibfont}{\eight}

% ----------------------------- 生成首页  --------------------------------$
\renewcommand{\maketitle}{
  \thispagestyle{fancy}
  \headstyle %首页页眉
  \setcounter{page}{\jseu@startpage}  %设置起始页码
  \hypersetup{ pdfinfo={Title={\jseu@head},Author={\@author},Keywords={\@keywordcn}} }
  \setlength{\footnotesep}{0pt}
  \noindent\parbox[t][15pt][b]{\textwidth} {\ten DOI: \jseu@DOI}\footnote{\jseu@foottext}   
  %--------------------------- 中文文标题区 -----------------------------%   
  \noindent{\centering\parbox[t]{\@titlelen}{\vspace{18pt}\setstretch{1.4}\centering\nineteen\heiti\@title}\par}  
  \noindent\parbox[t]{\textwidth}{
	    \vspace{15pt}
      \centering\thirty\fangsong\@author\par
      \vspace{8pt}
      \setstretch{1.0}\centering\fangsong\nine\@affiliation\par
  }
  \begingroup\flushleft\leftskip=20pt\rightskip=20pt
    \vspace{10pt}\noindent\heiti\jseu@abstractcn\fangsong\@abstractcn\par
    \vspace{2pt}{\heiti\jseu@keywordcn}\@keywordcn\par
    \heiti\jseu@category\hspace{20pt}\jseu@code\hspace{20pt}\jseu@id\par
  \endgroup
  %--------------------------- 英文标题区 -----------------------------%
  \noindent{\centering\parbox[t]{\@entitlelen}{\vspace{10pt}\setstretch{1.2}\centering\fourteen\bfseries\addfontfeature{LetterSpace=2}\@entitle}\par}  
  \noindent\parbox[t]{\textwidth}{
	    \vspace{8pt}
      \centering\eleven\fangsong\@enauthor\par
      \vspace{6pt}\setstretch{1.0}\centering\eight\@enaffiliation\par
  }
  \par\begingroup\flushleft\leftskip=20pt\rightskip=20pt
    \vspace{4pt}\begin{spacing}{1.07}
    \noindent{\bfseries\jseu@abstracten}\ten\addfontfeature{LetterSpace=1}\@abstracten\\
    \noindent{\bfseries\jseu@keyworden}{\parbox[t]{0.8\textwidth}{\@keyworden}}\\
    \end{spacing}
  \endgroup
  \vspace{6pt}
  \begin{multicols}{2}     %分栏命令，对应的结束命令在AtEndDocument中
   %英文关键词结束就开始分栏，如文中有单栏混排，需要手动在LyX中插入LaTeX代码
}
% ----------------------------- 其他设置  --------------------------------%
%正文页眉的设置
\usepackage{everypage}
\newcommand{\checkverypage}{
%在第二页开始执行,startpage是第一页的页码
\ifnum\value{page}>\jseu@startpage \mainstyle \fi  
}%
\AddEverypageHook{\checkverypage}  %每次生成新页面时调用

\AtBeginDocument{\pagenumbering{arabic}}
\AtEndDocument{\end{multicols}}  %结束分栏
\AtEndOfClass{\makeatletter\input{jseu.cfg}\makeatother}
%---------------------------------------------------------------------------
\endinput

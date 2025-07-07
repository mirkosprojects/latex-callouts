---
title: "Github Alerts"
header-includes:
  - \usepackage{xcolor}
  - \usepackage{fontawesome5}
  - \usepackage[framemethod=TikZ]{mdframed}
  - \usepackage{etoolbox}
  - \usepackage{tikz}
  - \definecolor{calloutColorTIP}{HTML}{44cf6e}
  - \newcommand{\calloutIconTIP}{\faLightbulb}
  - \definecolor{calloutColorNOTE}{HTML}{027aff}
  - \newcommand{\calloutIconNOTE}{\faPen}
  - \definecolor{calloutColorINFO}{HTML}{027aff}
  - \newcommand{\calloutIconINFO}{\faInfoCircle}
  - \definecolor{calloutColorWARNING}{HTML}{e9973f}
  - \newcommand{\calloutIconWARNING}{\faExclamationTriangle}
  - \definecolor{calloutColorERROR}{HTML}{fb464c}
  - \newcommand{\calloutIconERROR}{\faTimesCircle}
  - \definecolor{calloutColorCAUTION}{HTML}{fb464c}
  - \newcommand{\calloutIconCAUTION}{\faTimesCircle}
  - \definecolor{calloutColorIMPORTANT}{HTML}{a882ff}
  - \newcommand{\calloutIconIMPORTANT}{\faCommentDots}
  - |
    \newenvironment{callout}[2]{%
      \def\calloutcolor{#1}%
      \def\callouttitle{#2}%
      \begin{mdframed}[linecolor=\calloutcolor,
        roundcorner=3pt,
        linewidth=3pt,
        leftline=true,
        topline=false,
        bottomline=false,
        rightline=false,
        innerleftmargin=1em,
        innerrightmargin=1em,
        innertopmargin=0.5em,
        innerbottommargin=0.5em,
        skipabove=1em,
        skipbelow=1em,
      ]
      \textbf{\textcolor{\calloutcolor}{\callouttitle}}\par\vspace{0.5em}%
    }{%
      \end{mdframed}
    }
...

> [!TIP] Tip
> Callout Content

> [!NOTE] Note
> Callout Content

> [!INFO] Info
> Callout Content

> [!WARNING] Warning
> Callout Content

> [!CAUTION] Caution
> Callout Content

> [!ERROR] Error
> Callout Content

> [!IMPORTANT] Callout
> Callout Content

> [!TIP]- Foldable
> Callout Content

> [!TIP]
> No title

> [!TIP] Nested Callouts
> 
> > [!INFO] First One
> > You can nest callouts...
> > 
> > > [!IMPORTANT] Second One
> > > ...as deep as you want
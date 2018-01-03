# The `sectionbreak` package

This package provides LaTeX support for section breaks, used mainly in fiction
books to signal changes in a story, like changes in time, location, etc.
(Source: [Wikipedia](https://en.wikipedia.org/wiki/Section_(typography))).


## Package options

There are several package options:

`mark`

:  characters printed in the center of the section break. It is space by default, common value might be `***` for example.

`asterism`  

:  request [asterism](https://en.wikipedia.org/wiki/Asterism_(typography)) as a section mark.

`preskip` 

:  Amount of space printed before the section mark. It should be a dimension unit supported by TeX.

`postskip`

:   Similar to `preskip`, but it is a space printed after the section mark.

`style` 

:  LaTeX commands for font style change, like `\bfseries`, for example.

## Commands

`\sectionbreak[<mark>]`

:  print the section break. Optional argument can contain content which should be printed in the break center.

`\sectionbreakmark{<mark>}`

:  set the content printed in the following `\sectionbreak` commands.

`\asterism`

:  print the asterism (\asterism) symbol.

## The `tex4ht` support

The `sectionbreak` package has support for `tex4ht`, so it is possible to use
this package in conversion to `HTML` or other formats supported by this
conversion system. It provides the following configurations:

`\Configure{sectionbreak}{before section break }{after section}`

:  this configuration can be used for insertion of a box around the section break mark, which can be styled using CSS to print the blank space around the content. 

`\Configure{asterism}{code which replaces the asterism symbol}`

:  the asterism symbol is configured to use Unicode for it's rendering by default. This method might be unsupported by some devices like e-Ink readers, so it is possible to set a different code using this configuration.

# Example


    \documentclass[12pt]{article}
    \usepackage[asterism]{sectionbreak}
    \begin{document}
    
    Section separated by three asterisk marks
    \sectionbreak[!!!]
    
    Section separated by asterism section mark requested in \texttt{\textbackslash usepackage}.
    \sectionbreak
    
    Section separated by a rule.
    \sectionbreakmark{\rule{10em}{3pt}}
    \sectionbreak
    
    
    \end{document}

% <img src="https://raw.githubusercontent.com/michal-h21/sectionbreak/master/sectionbreak-example.png" >

% <!--

Section separated by three asterisk marks
\sectionbreak[!!!]

Section separated by asterism section mark requested in \texttt{\textbackslash usepackage}.
\sectionbreak

Section separated by a rule.
\sectionbreakmark{\rule{10em}{3pt}}
\sectionbreak
% -->

# License

This package is copyright 2017--2018 Michal Hoftich.
It may be distributed and/or modified under the
conditions of the [LaTeX Project Public License](http://www.latex-project.org/lppl.txt), either version 1.3
of this license or (at your option) any later version.
This work has the LPPL maintenance status `maintained'.


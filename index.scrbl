#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define bystro-conf   
   (bystro (bystro-connect-to-server (build-path (find-system-path 'home-dir) ".config" "amkhlv" "latex2svg.xml"))
           "index_formulas.sqlite"  ; name for the database
           "index" ; directory where to store image files of formulas
           25  ; formula size
           (list 255 255 255) ; formula background color
           (list 0 0 0) ; formula foreground color
           2   ; automatic alignment adjustment
           0   ; manual alignment adjustment
           ))
@(define singlepage-mode #t)
@(bystro-def-formula "formula-enormula-humongula!")

@bystro-ribbon[]
@title[#:style '(no-toc no-sidebar)]{Notes on BV formalism}



@larger{Andrei Mikhailov}



@short-intro{I recently wrote @hyperlink["https://arxiv.org/abs/1610.02996"]{a paper} with Albert Schwarz about the BV formalism. Many things
were completely new to me. I am writing these personal notes just to keep my head from exploding @larger-2{😃}.
}


@table-of-contents[]

@larger-2{@hyperlink["introduction/index.html"]{Introduction}}

@larger-2{@hyperlink["notations/notations.html"]{Notations}}


@section{Brief reviews}

@hyperlink["supergeometry/index.html"]{Supergeometry}

@hyperlink["BV-formalism/index.html"]{BV formalism}

@hyperlink["BRST-formalism/index.html"]{BRST formalism}

@hyperlink["equivariant-cohomology/index.html"]{Equivariant cohomology}

@hyperlink["worldsheet-complex-structure/worldsheet-complex-structure.html"]{Worldsheet complex structure}

@hyperlink["N2Superconformal/index.html"]{N=2 superconformal symmetry}

@section{Integration over the moduli space of Lagrangian submanifolds}

@hyperlink["omega/index.html"]{Form @f{\Omega} in BV formalism}

@hyperlink["omega-BRST/index.html"]{Form @f{\Omega} in BRST formalism}

@hyperlink["contact-structure/index.html"]{Quantomorphisms}

@hyperlink["transfer/index.html"]{Homotopy transfer}

@section{Applications to string theory}

@hyperlink["bosonic-string/index.html"]{Bosonic string}

@hyperlink["integrated-vertex/index.html"]{Integrated vertex}

@hyperlink["unintegrated-vertex/index.html"]{Unintegrated vertex}

@hyperlink["boundary/index.html"]{Worldsheet with boundary}

@hyperlink["picture-changing/index.html"]{Picture changing}

@hyperlink["Heterotic-RNS/index.html"]{Heterotic string in RNS formalism}

@hyperlink["Type-II-RNS/index.html"]{Type II string in RNS formalism} @hspace[1]@smaller-2{(unfinished)}

@hyperlink["twisting/index.html"]{Topological string}

@hyperlink["pure-spinor/index.html"]{Pure spinor formalism}

@section{Open problems}

@hyperlink["open-problems/index.html"]{Open problems}


@larger-2{@hyperlink["literature/literature.html"]{Literature}}

@bystro-ribbon[]

@hyperlink["server_bv.cpio.lzma"]{download compressed HTML} for reading off-line

@hyperlink["https://github.com/amkhlv/BV"]{source code}

@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection bystro-conf)

@(bystro-close-connection bystro-conf)
@disconnect[formula-database]

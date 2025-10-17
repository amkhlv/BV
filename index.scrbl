#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define singlepage-mode #t)
@(bystro-def-formula "formula-enormula-humongula!")

@bystro-ribbon[]
@title[#:style '(no-toc no-sidebar)]{Notes on BV formalism}



@larger{Andrei Mikhailov}



@short-intro{
My notes on BV formalism
}


@bystro-toc[]

@larger-2{@hyperlink["../introduction/index.html"]{Introduction}}

@larger-2{@hyperlink["../notations/notations.html"]{Notations}}


@section[#:tag "sec-Brief-reviews"]{Brief reviews}

@hyperlink["../supergeometry/index.html"]{Supergeometry}

@hyperlink["../BV-formalism/index.html"]{BV formalism}

@hyperlink["../BRST-formalism/index.html"]{BRST formalism}

@hyperlink["../equivariant-cohomology/index.html"]{Equivariant cohomology}

@hyperlink["../worldsheet-complex-structure/worldsheet-complex-structure.html"]{Worldsheet complex structure}

@hyperlink["../N2Superconformal/index.html"]{N=2 superconformal symmetry}

@section[#:tag "sec-Integration-over-the-moduli-space-of-Lagrangian-submanifolds"]{Integration over the moduli space of Lagrangian submanifolds}

@hyperlink["../omega/index.html"]{Form @f{\Omega} in BV formalism}

@hyperlink["../omega-BRST/index.html"]{Form @f{\Omega} in BRST formalism}

@hyperlink["../contact-structure/index.html"]{Quantomorphisms}

@hyperlink["../transfer/index.html"]{Homotopy transfer}

@section[#:tag "sec-Applications-to-string-theory"]{Applications to string theory}

@hyperlink["../bosonic-string/index.html"]{Bosonic string}

@hyperlink["../integrated-vertex/index.html"]{Integrated vertex}

@hyperlink["../unintegrated-vertex/index.html"]{Unintegrated vertex}

@hyperlink["../boundary/index.html"]{Worldsheet with boundary}

@hyperlink["../picture-changing/index.html"]{Picture changing}

@hyperlink["../Heterotic-RNS/index.html"]{Heterotic string in RNS formalism}

@hyperlink["../Type-II-RNS/index.html"]{Type II string in RNS formalism} @hspace[1]@smaller-2{(unfinished)}

@hyperlink["../twisting/index.html"]{Topological string}

@hyperlink["../pure-spinor/index.html"]{Pure spinor formalism}

@section[#:tag "sec-Open-problems"]{Open problems}

@hyperlink["../open-problems/index.html"]{Open problems}


@larger-2{@hyperlink["literature/literature.html"]{Literature}}

@bystro-ribbon[]



@hyperlink["https://github.com/amkhlv/BV"]{source code}

@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection)

@disconnect[formula-database]

#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define bystro-conf   
   (bystro (bystro-connect-to-server (string->path "/var/www/bystroConf.xml"))
           "BRST-formalism/formulas.sqlite"  ; name for the database
           "BRST-formalism" ; directory where to store .png files of formulas
           25  ; formula size
           (list 255 255 255) ; formula background color
           (list 0 0 0) ; formula foreground color
           2   ; automatic alignment adjustment
           0   ; manual alignment adjustment
           ))
@(set-bystro-extension! bystro-conf "svg")
@; This controls the single page mode:
@(define singlepage-mode #f)
@(bystro-def-formula "formula-enormula-humongula!")

@(bystro-dump-LaTeX #f)

@title[#:style '(no-toc no-sidebar)]{BRST formalism}
@bystro-ribbon[]

@hyperlink["../index.html"]{Return to index}

@table-of-contents[]

@hyperlink["../index.html"]{Return to index}

@bystro-ribbon[]

@slide["Construction" #:tag "Construction" #:showtitle #t]{
@table-of-contents[]
@section{Ghosts}
One starts with the ``classical action'' @f{S_{\rm cl}} which is invariant under some @bold{gauge symmetry}.
Let @f{X} be the ``classical'' space of fields, @italic{e.g.} for Yang-Mills theory the fields are @f{A_{\mu}(x)}.
Suppose the gauge symmetry is @f{H}, with the Lie algebra @f{{\bf h} = \mbox{Lie}(H)}.

Then we should introduce ghost fields, geometrically:
@align[r.l.n @list[
  @elem[#:style 'no-break]{fields and ghosts }
  @f{\in {\Pi TH\times X\over H}}
  ""
]
]
where the action of @f{h_0\in H} is via @bold{right shift} on @f{H}:
@equation{
h_0 (dh,h,x) = (dhh_{0}^{-1}, hh_0^{-1}, h_0.x)
}
@comment{
We use the coordinates @f{dh,h} on @f{\Pi TH} (denoting ``@f{dh}'' the coordinate on the fiber @f{\Pi T_hH}) and @f{x} on @f{X}.
}
Notice that this commutes with @f{Q_{\rm BRST} = dh {\partial\over\partial h}}. 
We can always find a representative with @f{h=1} (@italic{i.e.} choose @f{h_0 = h^{-1}}).
Then, with the standard notation @f{c = dh}:
@equation[#:label "standard-BRST-operator"]{
Q_{\rm BRST} = {1\over 2}f_{AB}{}^Cc^A c^B{\partial\over\partial c^C} + c^A v_A^i{\partial\over\partial x^i}
}
@comment{
Functions on @f{\Pi TH\times X\over H} satisfy:
@align[r.l.n @list[
  @f{f(dhh_0^{-1}, hh_0^{-1}, h_0 x)\;=\;} 
  @f{f(dh,h,x)}
  ""
]@list[
  @f{(Q_{\rm BRST}f)(dh,1,x)\;=\;}
  @f{{\partial\over\partial\epsilon}f(dh,\, 1 + \epsilon dh,\, x) = {\partial\over\partial\epsilon}f(dh + \epsilon dh dh,\, 1,\, (1 + \epsilon dh)x)}
  ""
]
]

}

@section[#:tag "sec:integration-measure"]{Integration measure}
We assume that @f{X} comes with some integration measure:
@align[r.l.n @list[
  @f{\mu \;=\;} @v+[7 @f|{e^{S_{\rm cl}(x)}}|] ""
]
]
This should be understood as an integration measure, @italic{i.e.} a density of weight @f{1} (rather than a function of @f{x}).

Let us choose some measure on @f{T_eH} (the fiber over unit of @f{H}) and translate it to all other fibers by
the @bold{left} translation. Notice that the resulting measure on fibers of @f{TH} is @bold{not} right-invariant,
unless if we require @f{f^A_{AB}=0}. However, let us assume that the measure on @f{X} satisfies:
@equation[#:label "Lie-derivative-of-measure-on-X"]{
{\cal L}_{v_A}\mu = f^B_{BA}\mu
}
Under this condition, the product of @f{\mu} with our left-invariant measure on fibers of @f{\Pi TH} 
provides a well-defined measure on @f{\Pi TH\times X\over H}.

Moreover, the cohomological vector field preserves this measure:
@align[r.l.n @list[
  @f{\mbox{div}\left(v_A^i{\partial\over\partial x^i} + {1\over 2}f^A_{BC}c^Bc^C{\partial\over\partial c^A}\right)\;=\;}
  @f{0}
  ""
]
]
as a consequence of Eq. (@ref{Lie-derivative-of-measure-on-X}). 
@spn[attn]{TODO:} chech signs and coeffecients 1/2.

@section[#:tag "sec:lift-of-symmetry-to-BRST"]{Lift of symmetries to BRST configuration space}
They correspond to the @bold{left shifts} on @f{H}
@align[r.l.n @list[
  @f{h_0.(dh,h,x) \;=\;} @f{(h_0dh,\, h_0h,\, x)} @label{lift-of-symmetry}
]
]
Notice the following properties of left shifts:
@itemlist[#:style 'ordered
@item{They commute with @f{Q_{\rm BRST}}}
@item{Infinitesimal symmetries of the form Eq. (@ref{lift-of-symmetry}) are actually @f{Q_{\rm BRST}}-exact. 
Indeed, they come from infinitesimal left shifts on @f{H}, and @f{Q_{\rm BRST}} comes from the de Rham differential.}
@item{The measure on @f{\Pi TH\times X\over H} is invariant, because @seclink["sec:integration-measure"]{we defined it} by @bold{left} shifts.}
]
}

@slide["BV from BRST" #:tag "BV from BRST" #:showtitle #t]{
@table-of-contents[]

@section{Definition of the BV phase space}
The BV phase space is:
@equation{
M = \Pi T^* \left({\Pi TH\times X\over H}\right)
}
The zero section @f{\Pi TH\times X\over H} is a Lagrangian submanifold. It comes with @seclink["sec:integration-measure"]{the integration measure},
which lifts to a half-density on @f{M} of the form @f{e^{S_{\rm BV}}}, where:
@equation{
S_{\rm BV} = 
S_{\rm cl}(x) + (Q_{\rm BRST}c^A)c^{\star}_A + (Q_{\rm BRST}x^i)x_i^{\star}
} 
where @f{Q_{\rm BRST}} is as defined in Eq. (@ref{standard-BRST-operator}).
@comment{
We can imagine a more general situation when we have a functional @f{S_{\rm cl}} with 
an odd symmetry @f{Q_{\rm BRST}} nilpotent off-shell. 
But, just to describe the ``standard BRST formalism'', we explicitly break the fields 
into @f{c^A} and @f{x^i}.
}


@section{Lifting the symmetries to BV phase space}
We have realized @seclink["sec:lift-of-symmetry-to-BRST"]{the gauge algebra @f{\bf h} as symmetries of the BRST configuration space}
as left shifts on @f{\Pi TH}.
Since the BV phase space is the odd cotangent bundle, we can further lift them to the BV phase space.
The symmetry corresponding to the infinitesimal @bold{left} shift (@ref{lift-of-symmetry}) is generated by the BV Hamiltonian:
@align[r.l.n @list[
  @f{H\langle\xi\rangle\;=\;} @f{\Delta(\xi^{\alpha}c^{\star}_{\alpha})} ""
]
]
Notice that in the BRST case @f{\Delta} coincides with @f{\{S_{\rm BV},\_\}}.

}



@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection bystro-conf)
@disconnect[formula-database]

  

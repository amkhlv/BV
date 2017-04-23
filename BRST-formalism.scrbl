#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define bystro-conf   
   (bystro (bystro-connect-to-server (build-path (find-system-path 'home-dir) ".config" "amkhlv" "latex2svg.xml"))
           "BRST-formalism/formulas.sqlite"  ; name for the database
           "BRST-formalism" ; directory where to store image files of formulas
           25  ; formula size
           (list 255 255 255) ; formula background color
           (list 0 0 0) ; formula foreground color
           2   ; automatic alignment adjustment
           0   ; manual alignment adjustment
           ))
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
We assume that @f{X/H} comes with some integration measure:
@align[r.l.n @list[
  @f{\mu \;=\;} @v+[7 @f|{e^{S_{\rm cl}(x)}}|] ""
]
]
This should be understood as an integration measure, @italic{i.e.} a density of weight @f{1} (rather than a function of @f{x}).
The product of this measure with the canonical measure on @f{\Pi TH} gives us a measure on @f{\Pi TH\times X\over H}
which we will call @f{\mu_{\rm BRST}}. Notice that @f{Q_{\rm BRST}} preserves this measure.
This can be proven as follows. For any function @f{f\in\mbox{Fun}\left({\Pi TH\times X\over H}\right)}:
@equation{
\int_{\Pi TH\times X\over H}\mu_{\rm BRST}\; Q_{\rm BRST}f \;=\;0
}
because @f{Q_{\rm BRST}} comes from the canonical odd vector field on @f{\Pi TH}.



@section[#:tag "sec:lift-of-symmetry-to-BRST"]{Lift of symmetries to BRST configuration space}
Original gauge symmetries can be lifted to the BRST field space as @bold{left shifts} on @f{H}:
@align[r.l.n @list[
  @f{h_0.(dh,h,x) \;=\;} @f{(h_0dh,\, h_0h,\, x)} @label{lift-of-symmetry}
]
]
Notice the following properties of left shifts:
@itemlist[#:style 'ordered
@item{They commute with @f{Q_{\rm BRST}}}
@item{Infinitesimal symmetries of the form Eq. (@ref{lift-of-symmetry}) are actually @f{Q_{\rm BRST}}-exact. 
Indeed, they come from infinitesimal left shifts on @f{H}, and @f{Q_{\rm BRST}} comes from the de Rham differential.}
@item{The measure on @f{\Pi TH\times X\over H} is invariant.}
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


@slide["Family of Lagrangian submanifolds" #:tag "Family of Lagrangian submanifolds" #:showtitle #t]{
@short-intro{
Here we will describe a family of Lagrangian submanifolds which is a generalization of
the construction used in @hyperlink["../bosonic-string/index.html"]{bosonic string theory}
}
Let @f{\cal Y} be some family of submanifolds @f{Y\subset X} closed under the action of the gauge symmetry
@comment{
``closed under the action'' means that if @f{Y_1\in {\cal Y}} then for any gauge 
transformation @f{h}, @f{hY_1\in {\cal Y}} 
}
For each @f{Y \in {\cal Y}}, the @bold{odd conormal bundle} of @f{Y} is a subbundle 
of the odd cotangent bundle @f{\Pi T^* X|_Y} which consists of those covectors which evaluate to zero 
on vectors tangent to @f{Y}. For each @f{Y\subset X}, the corresponding odd conormal bundle is a  
Lagrangian submanifold. Given such a family @f{\cal Y}, let us define a family of Lagrangian 
submanifolds in the BV phase space in the following way: for every @f{Y}, the corresponding 
Lagrangian submanifold is the odd conormal bundle of @f{Y}, times the space of @f{c}-ghosts:
@equation{
L(Y\,) \;=\; \Pi(TY\,)^{\perp}\times \mbox{[$c$-ghosts]}\;=\; \Pi(TY\,)^{\perp}\times \Pi {\bf h}
}
Let us ask the following question: under what conditions 
the restriction of @f{S_{\rm BV}} to each @f{L(Y\,)} is non-degenerate? 
Or, in case if it is degenerate, how can we characterize the degeneracy? We have:
@equation{
\left. S_{\rm BV} \right|_{L(Y\,)} \;=\; \left.S_{\rm cl}(\varphi)\;\right|_{\varphi\in Y} \;+\; T_A^ic^A\varphi^{\star}_i\;|_{\varphi^{\star}\in \Pi(TY\,)^{\perp}}
}
@comment{
The second term @f{T_A^ic^A\varphi^{\star}_i} is the evaluation of the covector @f{\varphi^{\star}} on the tangent vector 
@f{Q\varphi\in TX}.
}
Let us assume that the restriction of @f{S_{\rm BV}} to any @f{L(Y\,)}  has a critical 
point, and study the @bold{quadratic terms} in the expansion of @f{\left. S_{\rm BV} \right|_L} around a critical point.
@comment{
To define the perturbation theory,
we need already the quadratic terms to be non-degenerate.
}
Assuming that the critical point is at @f{\varphi=0}: 
@equation{
S_{\rm cl}(\varphi) = k_{ij}\varphi^i\varphi^j + o(\varphi^2)
}
Suppose that all degeneracies of @f{S_{\rm cl}} and of @f{k} are due to symmetries. In other words:
@align[r.l @list[
@f{\mbox{ker}\;k\;=\;}@f{\mbox{im}\;\tau}
]@list[
@f{\mbox{\tt\small where } \tau}@f{\;:\; {\bf h} \rightarrow TX}
]@list[
@f{\tau^i(\xi)}@f{\;= \; T^i_A\xi^A}
]]
Let @f{s} be the quadratic part of @f{\left. S_{\rm BV} \right|_L}: 
@equation{
s\;=\; \left. k_{ij}\varphi^i\varphi^j \right|_{\varphi\in TY} \;+\; 
\left. \tau^i(c)\varphi^{\star}_i\;\right|_{\varphi^{\star}\in T^{\perp}Y}
}
The degeneracy is characterized by the isotropic subspace of @f{s} which we denote @f{\mbox{ker}\;s}: 
@equation{
\mbox{ker}\;s\;=\; 
(\mbox{im}\,\tau \;\cap TY\,)\oplus \Pi\left((\mbox{im}\,\tau \cap TY\,)\oplus \mbox{ker}\,\tau\;\;\;
\oplus \;\;(\mbox{im}\,\tau\;+TY\,)^{\perp}\right)
}
Let us make the following assumptions:
@itemlist[#:style 'ordered 
@item{The term @f{(\mbox{im}\,\tau \;\cap TY\,)\oplus \Pi\left(\mbox{im}\,\tau \cap TY\right)} is zero.
In cases when it is nonzero, it should be removed by a small deformation of Lagrangian submanifolds}
@item{The next term, @f{\mbox{ker}\,\tau}, is also zero. This kernel being nonzero corresponds to ``reducible'' gauge
symmetries.}
]
But the last term @f{\Pi \left(\mbox{im}\,\tau\;+T\,Y\,\right)^{\perp}} is essentially nonzero. 
It can be identified with the cotangent space
to our family:
@equation{
\left(\mbox{im}\,\tau\;+T\,Y\,\right)^{\perp} \;=\; T^*_Y\left({\cal Y}/H\right) 
}
where @f{\cal Y} is the moduli space of submanifolds @f{Y\subset X}. Therefore the quadratic part of @f{S_{\rm BV}}
@bold{is} degenerate. However this degeneration is removed by 
@hyperlink["../omega/Definition.html"]{the factor @f{e^{d\widehat{g}\widehat{g}^{-1}}}} 
Indeed, in this case:
@equation{
d\widehat{g}\widehat{g}^{-1} \;=\; \varphi^{\star}_i dy^i
}
When we integrate over @f{{\cal Y}/H}, the differentials @f{dy^i} span the complement of @f{\mbox{im}\tau} in 
@f{TX/TY}. 
@comment{In 
@hyperlink["../bosonic-string/IntegrationOverFamily.html"]{the case of bosonic string} @f{e^{d\widehat{g}\widehat{g}^{-1}}} contributes
@f{\prod_{i=1}^{3g-3} b^{\alpha\beta}\delta g_{\alpha\beta}^{(0)}}
}  
To perturbatively define the path integral, we want @f{\left(\mbox{im}\,\tau\;+TY\right)^{\perp}} to be @bold{finite-dimensional}. 
This requirement can be reformulated as follows. Since we require that the family @f{\cal Y} be closed under the gauge 
transformations, @f{\tau} defines a map @f{{\bf h} \rightarrow TX/TY} which  we denote @f{[\tau]}.  With this notation, 
we must require 
that the cokernel of @f{[\tau]} is finite-dimensional. Indeed, @f{\left(\mbox{im}\,\tau\;+TY\right)^{\perp} = (\mbox{coker}\,[\tau])^*}. 
In the case of bosonic string at genus @f{g} the requirement of finite-dimensionality is satisfied:
@equation{
\mbox{dim} \;\mbox{coker}\,[\tau] \;=\; 3g-3
}



}


@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection bystro-conf)

@(bystro-close-connection bystro-conf)
@disconnect[formula-database]

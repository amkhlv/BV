#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define singlepage-mode #f)
@(bystro-def-formula "formula-enormula-humongula!")


@title[#:style '(no-toc no-sidebar)]{Tangent space of double coset}



@bystro-ribbon[]

@hyperlink["../index.html"]{Return to index}

@bystro-toc[]

@hyperlink["../index.html"]{Return to index}

@bystro-ribbon[]


@page["Expansion around Lagrangian submanifold" #:tag "Expansion in antifields" #:showtitle #t]

For a given Lagrangian submanifold @f{L}, let us choose the Darboux coordinates so that
@f{L} is given by the equations @f{x^{\star}_a=0}. We use the ansatz for @f{\rho_{1\over 2}}:
@e{
   \rho_{1\over 2} = \exp\left( {1\over \hbar} S_{\rm BV}\right)
}
The constructio of @f{S_{\rm BV}} involves @f{x^{\star}}-expansion and @f{\hbar}-expansion:
@align[r.l @list[
@f{S_{\rm BV} =\;}@f{S^{(0)}_{\rm BV} + \hbar S^{(1)}_{\rm BV} + \ldots}
]@list[
@f{S^{(0)}_{\rm BV}(x,x^{\star}) =\;}@f{S_{\rm cl}(x) + x^{\star}_AQ^A(x) + \ldots}
]]




@page["Double coset" #:tag "Double Coset" #:showtitle #t]

Let @f{SG\subset G} be the subgroup  preserving a fixed @f{\rho_{1\over 2}}.
Given a fixed Lagrangian submanifold @f{L\subset M}, we can also consider
its stabilizer @f{\mbox{St}(L)\subset M}. We expect the moduli space of BRST structures
to be given by the double coset:
@e[#:label "MBRSTisDoubleCoset"]{
   {\cal M}_{\rm BRST} = SG\backslash G/\mbox{St}(L)
}
A point of @f{{\cal M}_{\rm BRST}} could be denoted @f{[L]} 

@comment{this notation is very natural: @f{L} denotes the
lagrangian submanifold, {\it i.e.} a point of @f{G/{\rm St}(L)}, and @f{[\ldots]}  means
taking the equivalence class modulo @f{SG}}


@page["Tangent space to the double coset" #:tag "Tangent Space To BRST" #:showtitle #t]

@bystro-local-toc[]
@subpage[1 @elem{Identification of the tangent space} #:tag "sec-Identification-of-the-tangent-space"]
The tangent space to @f{T_{[L]}{\cal M}_{\rm BRST}} at the point @f{[L]\in {\cal M}_{\rm BRST}} can be 
identified as the space of all functions @f{h_{\rm cl}} on @f{L} modulo those functions 
which can be extended to the first infinitesimal  neighborhood of @f{L} 
as a function @f{h} satisfying:
@e[#:label "ExtensionOfH"]{
   \rho_{1\over 2}^{-1}\Delta_{\rm can}\left(\rho_{1\over 2} h\right) = 0
}
It turns out that this space very much depends on @f{[L]} and on @f{\rho_{1\over 2}}. Let us 
even just restrict ourselves to those @f{L} which can be obtained from the 
``standard'' Lagrangian submanifold @f{x^{\star}=0} by canonical transformations.
Then, without loss of generality, we can say that the @f{[L]} is @f{x^{\star}=0} and
the problem is parametrized just by @f{\rho_{1\over 2}}. 

@subpage[1 @elem{Quantum limit} #:tag "sec-Quantum-limit"]
Let us choose the half-density: 
@e[#:label "RhoIsOne"]{
\rho_{1\over 2} = 1
}
Let us choose @f{L} to be @f{x^{\star}=0}. In this case the problem (@ref{ExtensionOfH}) has solution 
for any @f{h_{\rm cl}(x)}. Indeed, we can simply choose @f{\hat{h}} to be independent of @f{x^{\star}}:
@e{
   h(x,x^{\star}) = h_{\rm cl}(x)
}

@subpage[1 @elem{Classical limit} #:tag "sec-Classical-limit"]
In the classical limit we have:
@e{
   \rho_{1\over 2} = \exp\left({1\over \hbar}S_{\rm BV}\right),\quad\hbar\to 0
}
(notice that the @f{\rho_{1\over 2}} of Eq. (@ref{RhoIsOne}) can be considered the opposite limit). 
In this case, the equation (@ref{ExtensionOfH}) reads:
@e[#:label "ShZero"]{
   \{S_{\rm BV}\,,\,h\} = 0
}
At the zeroth order in the @f{x^{\star}}-expansion, Eq. (@ref{ShZero}) implies:
@e{
   Qh_{\rm cl}(x) = \chi^a\partial_a S_{\rm cl}
}
Therefore, the necessary condition for the continuation to exist is that @f{h_{\rm cl}} 
is BRST-closed on-shell. 
@comment{
Notice that @f{h} @bold{can not} be interpreted as a deformation of the BV action, because 
it has ghost number @f{-1}; the action should have ghost number zero.
}
@subpage[1 @elem{Conclusion} #:tag "sec-Conclusion"]
@itemlist[
@item{In the quantum theory the BRST structure is locally rigid. However, as the quantum BV
theory is poorly defined anyway, we probably need the expansion around the classical
limit.} 
@item{In the classical limit the tangent space to @f{{\cal M}_{\rm BRST}} is parametrized by
BRST-exact expressions modulo those BRST-exact expressions which are zero on-shell.}
]




@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection)

@disconnect[formula-database]

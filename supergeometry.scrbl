#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define bystro-conf   
   (bystro (bystro-connect-to-server (build-path (find-system-path 'home-dir) ".config" "amkhlv" "latex2svg.xml"))
           "supergeometry/formulas.sqlite"  ; name for the database
           "supergeometry" ; directory where to store image files of formulas
           25  ; formula size
           (list 255 255 255) ; formula background color
           (list 0 0 0) ; formula foreground color
           2   ; automatic alignment adjustment
           0   ; manual alignment adjustment
           ))
@(define singlepage-mode #f)
@(bystro-def-formula "formula-enormula-humongula!")


@title[#:style '(no-toc no-sidebar)]{Supergeometry}

@bystro-ribbon[]
@table-of-contents[]

@bystro-ribbon[]



@slide["Superdomain" #:tag "Superdomain" #:showtitle #t]{
See @hyperlink["https://www.math.ias.edu/QFT/fall/bernstein2.ps"]{lectures of J. Bernstein}

@section{Definition of superdomain}
A @bold{superdomain} @f{\cal U} of dimension @f{m|n} is a pair @f{(U, A)} where @f{U\subset {\bf R}^m} is an open set and
@f{A = C^{\infty}(U)\otimes \Lambda(\theta_1,\ldots,\theta_n)} a supercommutative algebra. 

We will call @f{U} the @bold{body} of @f{\cal U}. We will also abbreviate:
@equation{
C^{\infty}({\cal U}) = C^{\infty}(U)\otimes \Lambda(\theta_1,\ldots,\theta_n)
}
For any @f{x\in U} and @f{F = F^0 + F^1_A \theta^A + F^2_{AB}\theta^A\theta^B + \ldots \;\in\; C^{\infty}({\cal U})} we define:
@equation{
\mbox{ev}_x F = F^0(x)
}

@section{Morphisms of superdomains}
A @bold{morphism} of superdomains @f{\phi\;:\; {\cal U}\rightarrow {\cal V}} is a pair @f{(\phi^0, \phi^*)} where @f{\phi^0} is
a smooth map from the body of @f{\cal U} to the body of @f{\cal V} such that:
@equation{\mbox{ev}_{\phi^0(x)} F = \mbox{ev}_x \phi^*F}

@section{Sub-superdomain}
Let @f{{\cal U} = (U, C^{\infty}(U)\otimes \Lambda(\theta_1,\ldots))} be a superdomain and @f{\tilde{U}\subset U} an open
subset of @f{\cal U}.

For any open subset @f{\tilde{U}\subset U} we consider a sub-superdomain
@f{{\cal U}|_{\tilde{U}} = (\tilde{U}, C^{\infty}(\tilde{U})\otimes \Lambda(\theta_1,\ldots))}. Any  @f{F\in C^{\infty}({\cal U})} has a restriction
to @f{{\cal U}_{\tilde{U}}}: just restrict @f{F^0}, @f{F^1}, @f{F^2}, ... to @f{\tilde{U}}. We will call the restriction @f{r^U_{\tilde{U}}}:
@equation{
r^U_{\tilde{U}}\;:\; C^{\infty}({\cal U}) \rightarrow C^{\infty}({\cal U}|_{\tilde{U}})
}

Let @f{\phi\;:\; {\cal U}_1\rightarrow {\cal U}_2} be a morphism of superdomains. 
Suppose that @f{\tilde{U}_1\subset U_1} is an open subset of @f{U_1}. Every morphism @f{\phi\;:\;{\cal U}_1\rightarrow {\cal U}_2}
can be restricted to @f{{\cal U}_1|_{\tilde{U}_1}}:
@equation{
\left.\left(\phi^0\,,\, \phi^* \right)\right|_{{\cal U}_1|_{\tilde{U}_1}} \;=\; \left(\phi^0|_{\tilde{U}_1}\,,\; r^{U_1}_{\tilde{U}_1}\circ\phi^*\right)
}

}


@slide["Supermanifold" #:tag "Supermanifold" #:showtitle #t]{

@table-of-contents[]

@section{Classical manifold}
Ordinary manifold @f{M} of dimension @f{m} is a topological space with a sheaf of commutative algebras called @f{C^{\infty}}, satisfying the following
property. Every point has a neighborhood @f{U} such that @f{C^{\infty}(U)} is the algebra of functions
on some open subset @f{V\subset {\bf R}^m}.

This can be also said in another way:

@tbl[@list[@list[@nested{@bold{A manifold structure} on a topological space @f{M} is a rule which to every @bold{small enough} open set @f{U\subset M} associates:
@tbl[@list[@list[@nested{an equivalence class of pairs @f{(V, \phi)} where @f{V} is an open subset of @f{{\bf R}^m} and @f{\phi\;:\;V\rightarrow U} is a homeomorphism
@tbl[@list[@list[@nested{with the following equivalence relations: @f{(V_1,\phi_1)\simeq (V_2,\phi_2)} if exists a diffeomorphism @f{\sigma\;:\; V_1\rightarrow V_2}
such that @f{\phi_1 = \phi_2\circ \sigma}}]]]}]]]
Moreover, it is required that, every time when @f{U_1\subset U_2} are two open subsets of @f{M}, and @f{(V_2,\phi_2)} is in the class
associated to @f{U_2}, then @f{(\phi_2^{-1}(U_1)\,,\, \phi_2|_{\phi_2^{-1}(U_1)})} is in the class associated to @f{U_1}.
}]]]


@section[#:tag "sec:SuperManifold"]{Supermanifold}
@tbl[@list[@list[@nested{@bold{A supermanifold structure} on a topological space @f{M_{\rm rd}} is a rule which to every @bold{small enough} open set @f{U\subset M_{\rm rd}} associates:
@tbl[@list[@list[@nested{an equivalence class of pairs @f{({\cal V}, \phi^0)} where @f{\cal V} is a
@seclink["Superdomain"]{superdomain} of dimension @f{m|n} and @f{\phi^0} is a homeomorphism
from the body of @f{\cal V} to @f{U}
@tbl[@list[@list[@nested{with the following equivalence relations: @f{({\cal V}_1,\phi^0_1)\simeq ({\cal V}_2,\phi^0_2)}
iff exists an isomorphism of superdomains @f{\sigma\;:\; {\cal V}_1\rightarrow {\cal V}_2}
such that @f{\phi^0_1 = \phi^0_2\circ \sigma^0}}]]]}]]]
Moreover, it is required that, every time when @f{\tilde{U}\subset U} are two open subsets of @f{M}, and @f{({\cal V},\phi^0)} is in the class
associated to @f{U}, then @f{({\cal V}|_{(\phi^0)^{-1}(\tilde{U})}\,,\, \phi^0|_{(\phi^0)^{-1}(\tilde{U})})} belongs to the class associated to @f{\tilde{U}}.
}]]]
In other words:
@div[redbox]{
Supermanifold @f{M} of dimension @f{m|n} is a topological space (called @f{M_{\rm rd}}) with a sheaf
of @bold{super}-commutative algebras called @f{C^{\infty}}, satisfying the following property. Each point
of @f{M_{\rm rd}} has a neighborhood @f{U} such that @f{C^{\infty}(U)} is an algebra of functions
on a superdomain @f{\cal V} of dimension @f{m|n}.
}

}


@; @slide["Atlas" #:tag "Atlas" #:showtitle #t]{
@; Given a structure sheaf, we can construct @bold{atlases}.

@; Pick a fine enough open cover @f{\{U_i|i\in{\cal I}\}} of @f{M_{\rm rd}}.  @f{C^{\infty}(U_i) = C^{\infty}({\cal V}_i)}.
@; Moreover, for each intersection @f{U_{ij} = U_i\cap U_j} we are provided with a morphism @f{((i_{ij\to i})_0, i^*_{ij\to i})}:
@; @align[r.l.n @list[
@;  @f{(i_{ij\to i})_0\;:\;} @f{V_{ij} \stackrel{\simeq}{\rightarrow} V_{ij\subset i}} ""
@; ]@list[
@;  @f{i^*_{ij\to i}\;:\;} @f{C^{\infty}({\cal V}_{ij})\rightarrow C^{\infty}({\cal V}_{i})} ""
@; ]@list[
@;  @f{(i_{ij\to j})_0\;:\;} @f{V_{ij} \stackrel{\simeq}{\rightarrow} V_{ij\subset j}} ""
@; ]@list[
@;  @f{i^*_{ij\to j}\;:\;} @f{C^{\infty}({\cal V}_{ij})\rightarrow C^{\infty}({\cal V}_{j})} ""
@; ]
@; ]
@; We can define a transition function @f{{\cal V}_{ij\subset i} \rightarrow {\cal V}_{ij\subset j}}
@; as follows:

@; @image[#:scale 0.75]{supergeometry/graphics/atlas-from-sheaf.svg}


@; }



@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection bystro-conf)
@disconnect[formula-database]

  

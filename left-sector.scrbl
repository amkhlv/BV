#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define singlepage-mode #f)
@(bystro-def-formula "formula-enormula-humongula!")



@title[#:style '(no-toc no-sidebar)]{Left sector}



@bystro-ribbon[]

@hyperlink["../index.html"]{Return to index}

@bystro-toc[]

@hyperlink["../index.html"]{Return to index}

@bystro-ribbon[]

@page["Complexification of the worldsheet" #:tag "Worldsheet complexification" #:showtitle #t]

@short-intro{
We want to define some class of BRST-exact deformations of the theory, which may be
considered ``purely left''. We will show that this class is preserved by a subalgebra
in the algebra of vector fields which we call @seclink["sec:left-deforming-vector-fields"]{``left-deforming''}.
We will also consider some naturally defined subalgebras:
@e{
\mbox{\tt\small conformal}\;\subset \mbox{\tt\small left}\; \subset \mbox{\tt\small left-deforming}\; \subset \mbox{Vect}(\Sigma)
}
}

@bystro-local-toc[]

@subpage[1 @elem{Complexification} #:tag "sec-Complexification"]
In order to consider the left sector from separately from the right sector, we have to
relax the requirement that @f{\bar{z}} be complex conjugate to @f{z}.

Once we do that, we would actually prefer to consider @f{z} and @f{\bar{z}} both @bold{real}, 
and call them @f{\tau^+} and @f{\tau^-}.
This does not change formulas, but at the same time allows us to use some geometrical intuition.

In other words, we will consider the worldsheet to be @bold{Lorentzial}, with the intent to do 
the Wick rotation at the end.

@subpage[1 @elem{Geometry of Lorentzian worldsheet} #:tag "sec-Geometry-of-Lorentzian-worldsheet"]

Null-curves on the Lorentzian worldsheet are called @bold{characteristics}. 

Suppose that the metric on the worldsheet is @f{2\,d\tau^+ d\tau^-}. 

@bold{Definition @defn-num{Characteristics}:}
@itemlist[
@item{lines @f{\tau^- = \mbox{const}} are called @bold{left-moving characteristics}}
@item{lines @f{\tau^+ = \mbox{const}} are called @bold{right-moving characteristics}}
]

@subpage[1 @elem{Deforming the Lorentzian metric} #:tag "sec-Deforming-the-Lorentzian-metric"]
Let us consider some deformed metric. 

@bold{Definition @defn-num{LeftDeformations}:}
a deformation of the metric is called @bold{``left deformation''} if it has the same left-moving characteristics
as the original metric. In coordinates, left deformations of @f{2\,d\tau^+d\tau^-} are of the form:
@e{
2\,d\tau^+ d\tau^- + g_{--}(\tau^+,\tau^-) (d\tau^-)^2
}
The left-moving characteristics remain undeformed; they are tangent to @f{\partial\over\partial \tau^+}.
The corresponding deformed action for the bosonic string would be:
@e[#:label "BosonicStringLeftDeformation"]{
\int d\tau^+ d\tau^- \; \left[
{\partial x\over\partial \tau^+}{\partial x\over\partial \tau^-} -
{1\over 2}g_{--}(\tau^+,\tau^-) \left({\partial x\over \partial \tau^+}\right)^2
\right]
}

@subpage[1 @elem{Left-deforming vector fields} #:tag "sec:left-deforming-vector-fields"]

@subpage[2 @elem{Definition} #:tag "sec-Definition"]

@bold{Definition @defn-num{LeftDeformingVectorField}:} A vector field on the worldsheet is called @bold{``left-deforming vector field''}
if its flux preserves the class of left deformations of the metric. In other words, the difference
between the metric and its pullback by the flux is its left deformation plus maybe its Weyl rescaling. 
In other words: 
@itemlist[
@item{left-deforming vector fields preserve the distribution @f{\partial\over\partial \tau^+}}
]
In coordinates they are of the form:
@e{
\xi = \xi^+(\tau^+,\tau^-) {\partial\over\partial\tau^+} + \xi^-(\tau^-){\partial\over\partial\tau^-}
}
@comment{
of course, the condition for @f{\xi} to be left-deforming does not depend on @f{g_{--}}
}
Left-deforming vector fields form a subalgebra in the algebra of all vector fields.

The Lie derivative of the metric w.r.to such vector field is:
@align[r.l.n @list[
 ""
 @f{{\cal L}_{\xi} \left( 2\,d\tau^+ d\tau^- + g_{--}(\tau^+,\tau^-) (d\tau^-)^2 \right)\;=\;}
 @label{LieDerivative}
]@list[
 @f{\;=\;}
 @f{2(\partial_+\xi^+ + \partial_-\xi^-) d\tau^+ d\tau^- + (2 \partial_-\xi^+ + \xi^+\partial_+g_{--} + \xi^-\partial_- g_{--} + 2(\partial_-\xi^-)g_{--}) (d\tau^-)^2}
 ""
]
]
Modulo the Weyl rescaling:
@align[r.l.n @list[
 ""
 @f{{\cal L}_{\xi} \left( 2\,d\tau^+ d\tau^- + g_{--}(\tau^+,\tau^-) (d\tau^-)^2 \right)\mbox{ \tt\small mod Weyl }\;=\;}
 @label{LieDerivativeModWeyl}
]@list[
 @f{\;=\;}
 @f{\left[2 \partial_-\xi^+ - g_{--}(\partial_+\xi^+ - \partial_-\xi^-) + (\xi^+\partial_+ + \xi^-\partial_-)g_{--}\right] (d\tau^-)^2}
 ""
]
]
@comment{
on the RHS, the expression in front of @f{(d\tau^-)^2} defines the variation of @f{g_{--}} under @f{\xi}
}

@subpage[2 @elem{When left-deforming is conformal?} #:tag "sec:when-left-deforming-is-conformal"]
Eq. (@ref{LieDerivativeModWeyl}) implies the following condition for a left-deforming vector field @f{\xi} to be conformal:
@e{
\xi \mbox{ \small\tt is conformal: }
2\partial_-\xi^+ \;=\; g_{--}(\partial_+\xi^+ - \partial_-\xi^-) - (\xi^+\partial_+ + \xi^-\partial_-)g_{--}
}
which can be also understood as follows:
@align[r.l.l @list[
 @f{\left[\xi^+\partial_+ + \xi^-\partial_-\;,\;\partial_- - {1\over 2} g_{--}\partial_+\right]}
 ""
 ""
]@list[
 @elem[#:style 'no-break]{is proportional to @hspace[2]}
 @v-[2 @f{\partial_- - {1\over 2} g_{--}\partial_+}]
 @elem[#:style 'no-break]{@hspace[1]⇒ @hspace[1]@f{\xi} is conformal}
]
]

@subpage[1 @elem{Left vector fields} #:tag "sec:left-vector-fields"]
There is a smaller subalgebra, consisting of those vector fields which are parallel to @f{\partial\over\partial\tau^+} (@italic{i.e.} to  the left-moving characteristic).
We will call them @bold{``left vector fields''}.

@bold{Definition @defn-num{LeftVectorField}:} the vector field is called @bold{``left vector field''} if it is 
parallel to the left-moving characteristic. In coordinates they are of the form:
@e{
\xi^+(\tau^+,\tau^-){\partial\over\partial\tau^+}
}
Left vector fields are automatically left-deforming. They are conformal when @f{\xi^+} only depends on @f{\tau^+} (and not on @f{\tau^-}).




@page["Left BV formalism" #:tag "Left BV" #:showtitle #t]

@bystro-local-toc[]

@subpage[1 @elem{Problem} #:tag "sec-Problem"]
Let us consider the left deformation of the pure spinor action, analogous to Eq. (@ref{BosonicStringLeftDeformation}):
@e[#:label "left-deformation-of-pure-spinor-string"]{
S_{\rm cl} \;\mapsto\; S_{\rm cl} + \int d^2 \tau \; g_{--}(\tau^+,\tau^-)Q b_{++}
}
The problem is:
@itemlist[#:style 'ordered
@item{Construct the @f{\Delta}-exact BV Hamiltonian @f{\Delta \Phi\langle\xi\rangle} generating the action of 
@seclink["sec:left-deforming-vector-fields"]{left-deforming vector fields}}
@item{Construct the closed form @f{\Omega^{\tt base}} base with respect to this action}
]

@subpage[1 @elem{The case of conformal vector fields} #:tag "sec-The-case-of-conformal-vector-fields"]
Suppose that our left-deforming vector field @f{\xi} is actually @seclink["sec:when-left-deforming-is-conformal"]{conformal}.
In this case it is a symmetry of @f{S_{\rm cl}}. We can describe @f{\Phi\langle\xi\rangle} as the BV
Hamiltonian corresponding to the holomorphic symmetry of @f{S_{\rm cl}}, generated by the
Noether charge @f{\int d\tau^+ \xi^+(\tau^+)b_{++}}. It satisfies @f{\{\Phi,\Phi\} = 0} as a consequence
of the nilpotence of the @f{b}-ghost.

@subpage[1 @elem{The case of left vector fields} #:tag "sec-The-case-of-left-vector-fields"]
Let us now suppose that @f{\xi} is a  @seclink["sec:left-vector-fields"]{left vector field} @f{\xi^+(\tau^+,\tau^-){\partial\over\partial\tau^+}}.


@spn[attn]{TODO}, maybe this will be as easy as conformal.

@subpage[1 @elem{The case of left-deforming vector fields} #:tag "sec-The-case-of-left-deforming-vector-fields"]
Now suppose that  @f{\xi} is a  @seclink["sec:left-deforming-vector-fields"]{left-deforming vector field} 
@f{\xi^+(\tau^+,\tau^-){\partial\over\partial\tau^+} + \xi^-(\tau^-){\partial\over\partial\tau^-}}.

@spn[attn]{TODO}, this could be harder.




@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection)

@disconnect[formula-database]

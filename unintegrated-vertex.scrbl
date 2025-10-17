#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define singlepage-mode #f)
@(bystro-def-formula "formula-enormula-humongula!")


@title[#:style '(no-toc no-sidebar)]{Unintegrated vertex}



@bystro-ribbon[]

@hyperlink["../index.html"]{Return to index}

While reading this part, it is useful to keep in mind that
for bosonic string @f{\Phi\langle \xi\rangle = \int dz d\bar{z} \; \xi^{\alpha}c^{\star}_{\alpha}}.

@bystro-toc[]

@hyperlink["../index.html"]{Return to index}

@bystro-ribbon[]

@page["Definition of unintegrated vertex" #:tag "Definition Of Unintegrated" #:showtitle #t]

We will use the notations:
@align[r.l @list[
@f{{\bf h} =} @f{\Pi\Delta{\cal F}} 
]@list[
@f{{\bf h} = }@f{\mbox{Lie}\;H} 
]
]

Let us try to relax the 
@hyperlink["../integrated-vertex/Deformation_Of_F.html#(elem._.Uis.Diff.Inv)"]{condition of the @f{\bf h}-invariance for the vertex},
@italic{i.e.} do @bold{not} require that @f{\{\Delta\Phi,U\} = 0}.
In this case the deformed action will not be @f{\bf h}-invariant. It does not seem to be possible
to modify the @hyperlink["../omega/Subalgebra_F.html"]{definition of @f{{\cal F}}} 
so that the deformed action @f{S + \varepsilon U} be invariant. 

@comment{
Notice however that it @bold{is} invariant up to BRST-exact terms, because @f{\{\Delta\Phi,U\} = \Delta \{\Phi, U\}}
}

We will deal with this complication in the following way. Let us assume that, instead of being
an integral over the worldsheet, @f{U} is actually a sum of insertions of some operators into
fixed points on the worldsheet.

We can then @bold{restrict the group of diffeomorphisms} to a subgroup which preserves those points.

Let @f{{\bf h}_U} be the subalgebra of @f{\bf h} which preserves the points of insertions; then:
@e{
\forall \Phi\in {\cal F}_U\;:\;\{\Delta \Phi, U\} = 0
}
We will also impose on @f{U} all the @hyperlink["../integrated-vertex/Deformation_Of_F.html"]{same restrictions as on the integrated vertex}
but only for @f{\Phi_{\xi}} with @f{\xi} limited to belong to @f{{\cal F}_U}. 

Remember that we have to integrate @f{\Omega} over some cycle in the moduli space of Lagrangian submanifolds.
We postulate that, in case of unintegrated vertex: 
@centered{
@spn[redbox]{
the integration cycle should include the variations of the positions of the insertion points
}}
On the @seclink["Integration Over Positions"]{next page} we will start the investigation of the
procedure of integration over those insertion points.



@page["Integration over the location of insertion points" #:tag "Integration Over Positions" #:showtitle #t]

@bystro-local-toc[]

@subpage[1 @elem{Fixing the Lagrangian submanifold} #:tag "sec-Fixing-the-Lagrangian-submanifold"]
Therefore we have to study the restriction of @f{\Omega} to 
@hyperlink["../omega/Subalgebra_F.html"]{the subgroup} @f{H\subset G}.
We will for now assume that elements of @f{\cal F} are in involution 
(@hyperlink["../omega/Subalgebra_F.html#(elem._.Def.Q)"]{in our notations} @f{q = 0}).

We will make use of the fact that @f{H} (as opposed to full @f{G}) preserves @f{\rho_{1\over 2}}.
This implies that the integration measure can be transformed to a @bold{fixed} Lagrangian submanifold:
@align[r.l.n @list[
 ""
 @f{\int_{hL}\rho_{1\over 2}\exp\left(dh h^{-1}\right) U\;=}
 ""
]@list[
 @f{=}
 @f{\int_{L}\rho_{1\over 2}\;\exp\left((dh h^{-1})\circ h\right) \; U\circ h}
 @label{IntegratedOverFixedL}
]]

@subpage[1 @elem{Modified de Rham complex of @f{H}} #:tag "TwistedDeRham"]
@subpage[2 @elem{Definition} #:tag "sec-Definition-4"]
We define the ``modified de Rham complex'' of @f{H} as the space of @f{H}-invariants:
@e{
\left(\mbox{Fun}(M \times \Pi T H)\right)^{H}
}
where the action of @f{h_0\in H} is induced by the right shift on @f{H} and the action of @f{H\subset G} on @f{M};
in particular, any function of the form @f{h,x\,\mapsto F(hx)} is @f{H}-invariant. The differential
comes from the canonical odd vector field on @f{\Pi TH}; we will denote it @f{d_{(h)}}.


@bold{The integrand} in Eq. (@ref{IntegratedOverFixedL}) @bold{belongs to this space}:
@e{
\exp\left((dh h^{-1})\circ h\right) \; U\circ h \;\; \in\;\; \left(\mbox{Fun}(M \times \Pi T H)\right)^{H}
}


On the @hyperlink["Lie_Algebra_Cohomology.html"]{next page}
we will demonstrate that this is the same as the Lie algebra cohomology complex of @f{\bf h} with coefficients in @f{\mbox{Fun}(M)}.
This is a version of the well-known theorem saying that Serre-Hochschild complex of the Lie algebra with trivial coefficients
is the same as right-invariant differential forms on the Lie group. This is a general statement, true for any Lie group (not only @f{H})
acting on any manifold @f{M}.

@subpage[2 @elem{Notations and useful identities} #:tag "NotationsAndUsefulIdentities"]
@align[r.l.n @list[
  @elem[#:style 'no-break]{define @f{\Psi}}
  @elem[#:style 'no-break]{@hspace[1] so that @f{\Delta\Psi = dh h^{-1}= (dhh^{-1})^A{\cal H}_A} 
         --- the @hyperlink["../BV-formalism/MomentMap.html#(elem._moment-map-type)"]{moment map}}
  @label{ExpandDHHInverse}
]@list[
  @elem[#:style 'no-break]{and @f{\widetilde{\Psi}}} 
  @v-[3 @f{= \Psi\circ h}] 
  @label{def-tilde-psi}
]@list[
  @elem[#:style 'no-break]{notice that @f{\Delta\widetilde{\Psi}}}
  @v-[4 @f{ = \widetilde{\Delta\Psi} = (dhh^{-1})\circ h}]
  @label{delta-psi-tilde}
]
]
Generally speaking, in this section the tilde over a letter will denote the composition with @f{h}:
@align[r.c.l.l.n @list[
 @f{\widetilde{f} = f\circ h} 
 @v-[2 @elem[#:style 'no-break]{@hspace[2] (a function @hspace[1]}]
 @v-[3 @f{x\mapsto f(hx)}]
 @v-[2 @elem{)}]
 @label{Tilde}
]
]
Here are some identities that we will need:
@align[r.l.n @list[
  @v-[3 @f{d_{(h)} \Delta\Psi =}] @f{-{1\over 2}\{\Delta\Psi,\Delta\Psi\}} @label{DHDeltaPsi}
]@list[
  @v-[3 @f{d_{(h)} \Psi = }] @f{{1\over 2}\{\Psi,\Delta\Psi\}} @label{DHPsi}
]@list[
  @f{d_{(h)} \widetilde{\Psi} = } @f{-{1\over 2}\{\widetilde{\Psi},\Delta\widetilde{\Psi}\}} @label{DHtildePsi}
]@list[
  @f{d_{(h)} \Delta\widetilde{\Psi} = } @f{{1\over 2}\{\Delta\widetilde{\Psi},\Delta\widetilde{\Psi}\}} @label{DHDeltatildePsi}
]@list[
  @f{d_{(h)} \widetilde{f} =} 
  @f{\{\Delta\widetilde{\Psi}\,,\,\widetilde{f}\} = 
     \{\widetilde{\Delta\Psi}\,,\,\widetilde{f}\} = 
     \widetilde{\{\Delta\Psi\,,\,f\}}
    } 
  @label{d-h-on-f-tilde}
]
]
Elements of the space @f{\left(\mbox{Fun}(M \times \Pi TH)\right)^{H}} can be obtained
from letters @f{\widetilde{\Psi}} and @f{\widetilde{U}} by operations of multiplication and computing the odd Poisson
bracket, or applying @f{\Delta}.


@subpage[1 @elem{Intertwiner between @f{-d_{(h)} + \Delta} and @f{\Delta}} #:tag "sec-Intertwiner-between-f-d-h-Delta-and-f-Delta"]
Consider any function  @f{f\in \mbox{Fun}\left(M\times \Pi TH\right)} (not necesserily @f{H}-invariant). We have:
@e{
(\Delta - d_{(h)})\left(e^{\Delta \Psi\circ h} f\circ h\right) = e^{\Delta \Psi\circ h} \left((\Delta - d_{(h)})f\right)\circ h
}
@comment{@f{e^{\Delta \Psi\circ h} f\circ h} is just the product of two functions, @f{e^{\Delta \Psi\circ h}}
and @f{f\circ h}}
In particular, when @f{f(x,h)} only depends on @f{x} and does not depend neither on @f{h} nor on @f{dh}.
(@italic{i.e.} when @f{f\in \mbox{Fun}(M)}):
@e[#:label "DeltaPsiIsIntertwiner"]{
(\Delta - d_{(h)})e^{\Delta \widetilde{\Psi}}\widetilde{f} = 
e^{\Delta \widetilde{\Psi}} \Delta \tilde{f} 
}
In other words, the operator of multiplication by @f{e^{\Delta\widetilde{\Psi}}} intertwines between 
@f{\Delta} and @f{\Delta - d_{(h)}}. 
After we integrate over the Lagrangian submanifold, @f{\Delta - d_{(h)}} becomes just @f{-d_{(h)}}.


@subpage[1 @elem{Integration} #:tag "sec:Integration"]
@subpage[2 @elem{The one-form component} #:tag "sec-The-one-form-component"]
@e{
\int_L\rho_{1\over 2}\;\Delta\widetilde{\Psi}\; \widetilde{U}\;=\;
\int_L\rho_{1\over 2}\;\{\widetilde{\Psi}\,,\,\widetilde{U}\}\;=\;\int_L\rho_{1\over 2}\;\{\Psi,U\}\circ h
}

@subpage[2 @elem{The two-form component} #:tag "sec-The-two-form-component"]
@align[r.l.n @list[
 "" 
 @f{\int_L\rho_{1\over 2}\;\Delta\widetilde{\Psi}\;\Delta\widetilde{\Psi}\; \widetilde{U}\;=\;}
 ""
]@list[
 @f{=}
 @f{\int_L\rho_{1\over 2}\;\left(\{\widetilde{\Psi}\,,\,(\Delta\widetilde{\Psi})\widetilde{U}\} + 
    \widetilde{\Psi} \Delta ((\Delta\widetilde{\Psi})\widetilde{U})\right)\;=}
 ""
]@list[
 @f{=}
 @f{\int_L\rho_{1\over 2}\;\left(
     \{\widetilde{\Psi}\,,\,\Delta(\widetilde{\Psi}\widetilde{U})\} + 
     \{\widetilde{\Psi}\,,\,\{\widetilde{\Psi}\,,\,\widetilde{U}\}\} +
     \widetilde{\Psi} \Delta((\Delta\widetilde{\Psi})\widetilde{U})
    \right)\;=}
 ""
]@list[
 @f{=}
 @f{\int_L\rho_{1\over 2}\;\left(
     -\{\Delta\widetilde{\Psi}\,,\,\widetilde{\Psi}\widetilde{U}\} + 
     \{\widetilde{\Psi}\,,\,\{\widetilde{\Psi}\,,\,\widetilde{U}\}\} +
     \widetilde{\Psi} \Delta((\Delta\widetilde{\Psi})\widetilde{U})
    \right)\;=}
 ""
]@list[
 @f{=}
 @f{\int_L\rho_{1\over 2}\;\left(
     -\{\Delta\widetilde{\Psi}\,,\,\widetilde{\Psi}\widetilde{U}\} + 
     \{\widetilde{\Psi}\,,\,\{\widetilde{\Psi}\,,\,\widetilde{U}\}\} +
     \widetilde{\Psi} \{\Delta\widetilde{\Psi}\,,\,\widetilde{U}\}
    \right)\;=}
 ""
]@list[
 @f{=}
 @f{\int_L\rho_{1\over 2}\;\left(
     \{\widetilde{\Psi}\,,\,\{\widetilde{\Psi}\,,\,\widetilde{U}\}\} \;\;\;+\;\;\;
     2\widetilde{\Psi}\{\Delta\widetilde{\Psi}\,,\,\widetilde{U}\} + 
     \{\widetilde{\Psi},\Delta\widetilde{\Psi}\}\widetilde{U}
    \right)\;=}
 ""
]@list[
 @f{=}
 @f{\int_L\rho_{1\over 2}\;\{\widetilde{\Psi}\,,\,\{\widetilde{\Psi}\,,\,\widetilde{U}\}\} \;\; - \;\;
    2 d_{(h)}\int_L\rho_{1\over 2} \widetilde{\Psi}\widetilde{U}}
 ""
]
]
@spn[attn]{TODO:} continue to higher powers of @f{\Psi}.


@page[@elem{Cohomology of @f{\Delta} vs Lie algebra cohomology} #:tag "Lie Algebra Cohomology" #:showtitle #t]

@short-intro{
In this Section we will show that the @seclink{TwistedDeRham}
is the same as the Lie algebra cohomology complex of @f{\bf h} with coefficients in @f{\mbox{Fun}(M)}.
}

@bystro-local-toc[]


@subpage[1 @elem{Definition of the Lie algebra cohomology @f{H^{\bullet}({\bf h}, \mbox{Fun}(M))}} #:tag "sec-Definition-of-the-Lie-algebra-cohomology-f-H-bullet-bf-h-mbox-Fun-M"]
The space @f{\mbox{Fun}(M)} is a representation of @f{\bf h}; the action of @f{\bf h} is slightly easier 
to write down at the level of the corresponding action of the Lie group @f{H};
@f{h\in H} acts on @f{f\in\mbox{Fun}(M)} as follows:
@e{
(h.f)(x) = f(h^{-1}x)\,,\;\mbox{\tt\small in other words: }\; h.f = f\circ h^{-1}
}
Therefore:
@e[#:label "DLieOnFunctions"]{
d_{\rm Lie} f = - \{d h h^{-1}\,,\,f\} = - \{\Delta\Psi\,,\, f\}
}
where @f{\Psi} is defined as in Eq. (@ref{ExpandDHHInverse}). We define @f{d_{\rm Lie}\Psi} to coincide with 
@f{-d_{(h)}\Psi} of Eq. (@ref{DHDeltaPsi}):
@align[r.l.n @list[
 @v-[3 @f{d_{\rm Lie} \Delta\Psi =}] @f{ {1\over 2}\{\Delta\Psi,\Delta\Psi\}}  ""
]@list[
 @v-[3 @f{d_{\rm Lie} \Psi = }] @f{- {1\over 2}\{\Psi,\Delta\Psi\}} @label{dPsiAgain}
]]
To follow the Faddeev-Popov notations, we introduce
@align[r.l.n @list[
  @v+[3 @elem[#:style 'no-break]{the Faddeev-Popov ghost: @f{{\bf c}^A =}} ]
  @f{(dh h^{-1})^A}
  @label{DLiePsi}
]@list[
  @elem[#:style 'no-break]{then @f-1{\Psi =} }
  @elem[#:style 'no-break]{@f{(-)^{\bar{A}+1}{\bf c}^A (\Delta^{-1} {\cal H}_A)} @hspace[1] (@italic{cp.} Eq. (@ref{ExpandDHHInverse}))}
  @label{DLieDeltaPsi}
]@list[
  "" @f{{\cal H}_A\in \mbox{Fun(M)}} ""
]]
@comment{Beware that @f{\Psi} is @bold{not} just the Faddeev-Popov ghost; 
it is the product of the Faddeev-Popov ghost @f{{\bf c}^A} with  @f{\Delta^{-1}{\cal H}\in \mbox{Fun}(M)}.}
Eqs. (@ref{DLiePsi}) and (@ref{DLieDeltaPsi}) are equivalent to saying:
@e{
d_{\rm Lie} {\bf c}^C = {1\over 2} (-)^{\bar{A}(\bar{B}+1)}{\bf c}^A {\bf c}^B\;f_{AB}{}^C
}
where @f{f_{AB}{}^C} is the structure constants of @f{\bf h}: 
@align[r.l.n @list[
  @f{\{{\cal H}_A\,,\,{\cal H}_B\} =} 
  @f{f_{AB}{}^C{\cal H}_C}
  ""
]@list[
  @f{f_{AB}{}^C =}
  @f{(-)^{\bar{A}\bar{B} + 1} f_{BA}{}^C}
  ""
]
]
It is straightforward to verify using Eqs. (@ref{DLieOnFunctions}) and (@ref{dPsiAgain}) that:
@e{d_{\rm Lie}^2 f = 0}
The subgroup @f{H\subset G} preserves @f{\rho_{1\over 2}} and therefore @f{\Delta}:
@e{
\Delta (h.f) = h.\Delta f
}
This implies:
@e{\Delta d_{\rm Lie} + d_{\rm Lie}\Delta = 0}


@subpage[1 @elem{Proof that @f{d_{(h)}} is the same as @f{d_{\rm Lie}}} #:tag "sec-Proof-that-f-d-h-is-the-same-as-f-d-rm-Lie"]
This is similar to the statement that for any Lie group @f{G}, the de Rham subcomplex of right-invariant forms on @f{G}
is the same as the Lie cohomology complex of @f{\bf g} with coefficients in the trivial representation:
@e{
\left(\mbox{Fun}(\Pi TG) \right)^G = C^{\bullet}({\bf g},{\bf C})
}
Our case is a variation on this theme:
@e{
\left(\mbox{Fun}(M\times \Pi TH)\right)^H = C^{\bullet}({\bf h},\mbox{Fun}(M))
}
As @seclink["NotationsAndUsefulIdentities"]{we explained}, @f{\left(\mbox{Fun}(M\times \Pi TH)\right)^H} 
consists of functions of @f{\widetilde{\Psi}} and @f{\widetilde{U}}. To obtain the corresponding element
of @f{C^{\bullet}({\bf h},\mbox{Fun}(M))}, we replace @f{\widetilde{\Psi}} with @f{\Psi} 
with @f{(dgg^{-1})^A\mapsto {\bf c}^A} (as in Eq. (@ref{DLieDeltaPsi})), and @f{\widetilde{U}} with @f{U}.
Under this identification @f{d_{(h)}} becomes @f{-d_{\rm Lie}}.


@page[@elem{Another intertwiner between @f{d_{\rm Lie} + \Delta} and @f{\Delta}} #:tag "Local Intertwiner" #:showtitle #t]

@short-intro{
One intertwiner between @f{d_{\rm Lie} + \Delta} and @f{\Delta} is already provided by Eq. (@ref{DeltaPsiIsIntertwiner}), but
it is nonlocal (because each @f{\Delta \Psi} contains one integration).
Motivated by the results of @secref{sec:Integration}, we will now construct another intertwiner, a local one.
}

@spn[attn]{Let us assume} that elements of @hyperlink["../omega/Subalgebra_F.html"]{subspace @f{\cal F}} are all in involution,
@italic{i.e.} @f{q(x,y)=0}. In this case:
@e[#:label "PsiPsiDeltaPsi"]{
\{\Psi, \{\Psi,\Delta\Psi\}\} = 0
}
We denote @f{e^{\{\Psi,\_\}}} the following operation:
@align[r.l.n @list[
 @f{e^{\{\Psi,\_\}}\;:\;\;\mbox{Fun}(M) \quad\longrightarrow\quad} 
 @f{\mbox{\tt\small(polynomials of $\bf c$)}\otimes \mbox{Fun}(M)} 
 @label{TypeOfTheIntertwiner}
]@list[
 @f{U \quad\mapsto\quad} @f{U + \{\Psi,U\} + {1\over 2}\{\Psi,\{\Psi,U\}\} + {1\over 6} \{\Psi,\{\Psi,\{\Psi,U\}\}\} + \ldots} ""
]]
This operation has the following property:
@e[#:label "ConjugationWithPsi"]{
(d_{\rm Lie} + \Delta) e^{\{\Psi,\_\}} = e^{\{\Psi,\_\}} \Delta
}
The action of @f{\Delta} on the left hand side is only on @f{\mbox{Fun}(M)} (it does not touch the @f{\bf c}-ghosts)


@page["Descent Procedure" #:tag "Descent Procedure" #:showtitle #t]

@short-intro{
Here we will show that the intertwining operator of Eq. (@ref{ConjugationWithPsi}) can be interpreted as
the generalization of the string theory descent procedure, which relates unintegrated and integrated vertex operators.
}

@bystro-local-toc[]
@subpage[1 @elem{Interpretation as a descent procedure} #:tag "sec-Interpretation-as-a-descent-procedure"]
Consider an unintegrated vertex opearator @f{U}.
We interpret it as an element of the cohomology of @f{\Delta} with some ghost number @f{n}:
@e{
U\in H^n(\Delta)
}
@comment{usually @f{n=2} in closed string theory and @f{n=1} in open string theory}
Eq. (@ref{ConjugationWithPsi}) allows us to construct from @f{U} a cohomology class of @f{\Delta + d_{\rm Lie}},
where @f{d_{\rm Lie}} is the Lie algebra cohomology differential of our Lie algebra @f{\Pi\Delta{\cal F}} with coefficients
in @f{\mbox{Fun}(M)}, as follows:
@e{
e^{\{\Psi,\_\}} U\;\in\;H(\Delta + d_{\rm Lie})
}
This expression is ``inhomogeneous'', in the sense that different components have different ghost
numbers. Each application of @f{\{\Psi,\_\}} decreases the ghost number by one, but at the
same time rises the degree of the Lie algebra cochain. In the context of closed string,
the top component coincides with @f{U}, then goes @f{\{\Psi,U\}}, then @f{\{\Psi,\{\Psi,U\}\}}
and so on. In particular, @f{\{\Psi,\{\Psi,U\}\}} is our interpretation of the @bold{integrated vertex operator}.

We could have used @f{e^{\Delta \Psi}} instead of @f{e^{\{\Psi,\_\}}}. We prefer 
to use @f{e^{\{\Psi,\_\}}} because it leads to the @bold{local} result. 
@comment{
Although @f{\Psi} contains
integration, the odd Poisson bracket is local (@italic{i.e.} involves a delta-function) and therefore
removes the integral.
}
In string theory the use of such an inhomogeneous expression is often referred to as the ``descent procedure''.

@subpage[1 @elem{Integrated vertex and Lie algebra cohomology} #:tag "sectionCohomologyOfDiffeomorphisms"]
We have shown that the cohomology of @f{\Delta} is the same as the cohomology of @f{\Delta + d_{\rm Lie}}.
The cohomology of @f{\Delta + d_{\rm Lie}} can be computed using the spectral sequence, corresponding
to the filtration by the ghost number. Let @f{F^p \subset \mbox{Fun}(M)} consist of the functions with
the ghost number @f{\geq p}. At the first page, we have:
@e{
E_1^{p,q} = {\mbox{ker } d_{\rm Lie}\;:\; F^pC^q \to F^p C^{q+1}\over \mbox{im } d_{\rm Lie}\;:\; F^p C^{q-1} \to F^p C^q}
}
Therefore, if @f{E_1=E_{\infty}}, then the cohomology of @f{\Delta} is equivalent to the
cohomology of @f{\Pi \Delta{\cal F}} with values in @f{\mbox{Fun}(M)}.

@subpage[1 @elem{Comparison of @f{e^{\{\Psi,\_\}}} and @f{e^{\Delta\Psi}}} #:tag "sec-Comparison-of-f-e-Psi-and-f-e-Delta-Psi"]
We have two operators satisfying the identical intertwining relations:
@align[l.n @list[
 @f{d_{\rm Lie} e^{\Delta\Psi} + [\Delta, e^{\Delta\Psi}] = 0} ""
]@list[
 @f{d_{\rm Lie} e^{\{\Psi,\_\}} + [\Delta, e^{\{\Psi,\_\}}] = 0} ""
]
]
This suggests the existence of some operator @f{A} such that:
@e{
e^{\Delta\Psi} = e^{\{\Psi,\_\}} + d_{\rm Lie} A + [\Delta, A]
}
This @f{A} is an inhomogeneous operator-form:
@e{
AU = \Psi U \;+\; {1\over 2} \Psi\Delta\Psi U + {1\over 2}\Psi\{\Psi,U\} \;+\; \ldots
}
@spn[attn]{TODO}: write the full formula.


@subpage[1 @elem{Relation between integrated and unintegrated vertices} #:tag "sectionIndegratedVsUnintegrated"]

Consider the special case of @bold{flat worldsheet}. There is a subalgebra @f{{\bf R}^2\subset \Pi\Delta{\cal F}}
consisting of translations (@f{\partial\over\partial z} and @f{\partial\over\partial \overline{z}}).
Let us restrict @f{h} to this subalgebra. This simplifies the computation because:
@f{H^{n>2}({\bf R}^2,\mbox{Fun}(M))=0}. This is true even at the level of cochains. Therefore we have:
@e{
e^{\{\Psi,\_\}} U = U + \{\Psi,U\} + {1\over 2} \{\Psi,\{\Psi,U\}\}
}
Going back from the Faddeev-Popov notations to the form notations: @f{{\bf c}^A\mapsto (dh h^{-1})^A}
we obtain:
@e[#:label "UsualIntegrated"]{
\{\Psi,\{\Psi,U\}\} = dz\wedge d\overline{z}\; b_{-1}\overline{b}_{-1} U
}
(here @f{dz} and @f{d\overline{z}} is what remains of @f{dh h^{-1}}).
This is the usual @bold{integrated vertex operator} of the bosonic string theory.

@subpage[1 @elem{Various types of Lie algebra cohomology} #:tag "sec-Various-types-of-Lie-algebra-cohomology"]
We can consider three different cohomologies:
@itemlist[
@item{@seclink["sectionCohomologyOfDiffeomorphisms"]{Cohomology of the Lie algebra of diffeomorphisms} with coefficients in @f{\mbox{Fun}(M)}}
@item{@bold{Cohomology of the Virasoro algebra with zero central charge} with coefficients in functions on a Lagrangian submanifold. 
If we restrict the cocycle of the Lie algebra of diffeomorphisms to the subalgebra preserving the Lagrangian submanifold, 
we get a cocycle of the Virasoro algebra. Again, we should go on-shell and take into account @f{Q_{\rm BRST}}. }
@item{Cohomology of @f{{\bf R}^2} which @seclink["sectionIndegratedVsUnintegrated"]{computes} the integrated vertex operators}
]
@spn[attn]{TODO}: work out the @bold{precise} relation between these objects. 



  

@page["Craps-Skenderis trick" #:tag "Craps-Skenderis trick" #:showtitle #t]

@bystro-local-toc[]

@subpage[1 @elem{Dynamical punctures} #:tag "sec-Dynamical-punctures"]
The idea of @cite{Craps:2005wk} 
was to promote the points of insertion into dynamical degrees of freedom @f{\xi_i}.
The corresponding antifields will be denoted @f{\xi^{\star i}}. 
This procedure extends the BV phase space by a finite-dimensional (or ``discrete'') piece. 
Let us define the half-density @f{\rho_{{1\over 2}\rm CS}} on this extended BV phase space as follows:
@align[r.l.n @list[
 @f{\rho_{{1\over 2}\rm CS} \;=\;}
 @f{\left(\prod_i \sqrt{g(\xi_i)} V_i(\xi_i)\right)\;\exp\left(S_{\rm BV} - \sum_i c^{\alpha}(\xi_i)\xi^{\star i}\right)}
 @label{RhoCS}
]
]


@subpage[1 @elem{Partially quantum Master Equation} #:tag "sec-Partially-quantum-Master-Equation"]
@bold{Theorem @th-num{th:rho-cs-satisfies-master-equation}:}
@align[r.l.n @list[
@elem[#:style 'no-break]{if@hspace[1]}
@f{
\{S_{\rm BV}\;,\;V_i(\xi_i)\} \;=\; c^{\alpha}(\xi_i){\partial\over\partial\xi_i^{\alpha}} V_i(\xi_i) 
}
@label{condition-on-vertex-with-xi}
]@list[
@elem[#:style 'no-break]{then@hspace[1]}
@f{
- {\partial\over\partial \xi^{\star i}}{\partial\over\partial\xi^i} \left( - \sum_i c^{\alpha}(\xi_i)\xi^{\star i}\right)
+ {1\over 2} \left\{\,\log \rho_{{1\over 2}\rm CS} \,,\, \log \rho_{{1\over 2}\rm CS}\,\right\} \;=\; 0
}
@label{partially-quantum-master-equation}
]
]
@comment{
Eq. (@ref{condition-on-vertex-with-xi}) 
is equivalent to satisfying the following two requirements:
@itemlist[#:style 'ordered
@item{ @f{V_i(\xi_i)} is diffeomorphism-invariant in the following sense:
@e{
{\cal L}_c V_i(\xi_i) = c^{\alpha}(\xi_i){\partial\over\partial\xi_i^{\alpha}} V_i(\xi_i)
}}
@item{ @f{\sqrt{g(\xi_i)} V_i(\xi_i)} is Weyl-invariant}
]
}
@comment{
Eq. (@ref{partially-quantum-master-equation}) can be called ``partially quantum Master Equation''; it is essentially
classical Master Equation, but takes into account the ``finite-dimensional'' @f{\xi\xi^{\star}}-part of the odd Laplace operator
}

@bold{Proof} The terms in @f{S_{\rm BV}} relevant for computing @f{\{S_{\rm BV}\,,\,\_\}} in this context are:
@e[#:label "relevant-terms-in-sbv"]{
S_{\rm BV} = (c^{\alpha}\partial_{\alpha} x)x^{\star} + 
{1\over 2} [c,c]c^{\star} + ({\cal L}_c g_{\alpha\beta})g^{\star\alpha\beta} + \zeta g_{\alpha\beta}g^{\star\alpha\beta} + \ldots
}
This implies:
@align[r.l.n @list[
 @f{\{S_{\rm BV}\;,\;\sqrt{g}\} \;=\;}
 @f{\Big( ({\cal L}_c g)_{\alpha\beta} + \zeta g_{\alpha\beta}\Big) {\partial\over\partial g_{\alpha\beta}}\sqrt{g} \;=\;
    \partial_{\alpha}(\sqrt{g}c^{\alpha}) + {\zeta\over 2}\sqrt{g}}
 ""
]@list[
 @f{\left\{-\sum_i c^{\alpha}(\xi_i)\xi^{\star i}\;,\;\sqrt{g}\right\}\;=\;}
 @f{-c^{\alpha}\partial_{\alpha}\sqrt{g}}
 ""
]@list[
 @f{- {\partial\over\partial \xi^{\star i}}{\partial\over\partial\xi^i} \left(-\sum_i c^{\alpha}(\xi_i)\xi^{\star i}\right)\;=\;}
 @f{ - \partial_{\alpha}c^{\alpha} }
 ""
]
]

@subpage[1 @elem{Geometrical interpretation} #:tag "sec-Geometrical-interpretation"]
@subpage[2 @elem{Cartan formula for de Rham differential} #:tag "sec-Cartan-formula-for-de-Rham-differential"]
The nilpotent operator:
@e[#:label "algebroid-cohomology"]{
(Q\psi)(\xi,c(\xi)) \;=\; 
\left\{ \left(\int_{\Sigma} \left(c^{\beta}(\eta){\partial\over\partial \eta^{\beta}} c^{\alpha}(\eta)\right)c_{\alpha}^{\star}(\eta)\right) 
\;-\; c^{\alpha}(\xi)\xi_{\alpha}^{\star} \;\;,\;\;\psi(\xi,c(\xi))\right\}
}
acting on @f{\psi(\xi,c(\xi))} is the cohomological operator of the algebroid @f{T\,\Sigma}; its cohomology coincides with 
the de Rham cohomology of @f{\Sigma}. This is true for any manifold @f{\Sigma}, in our case @f{\Sigma} is the two-dimensional string worldsheet.
The first term on the RHS of Eq. (@ref{algebroid-cohomology}) is the term @f{{1\over 2}[c,c]c^{\star}} in  @f{S_{\rm BV}} (see Eq. (@ref{relevant-terms-in-sbv})).
For the other terms in @f{S_{\rm BV}} we do not see a clear geometrical meaning.

@subpage[2 @elem{Volume element} #:tag "sec-Volume-element"]
To have a minimal geometrical example similar to @f{\rho_{{1\over 2}\rm CS}} we imagine that rather than a
function on @f{\Sigma}, our @f{\psi(\xi,c(\xi))} be a volume element. We then define @f{Q\psi} by the formula
@align[r.l.n @list[
@f{Q\psi(\xi,c(\xi)) \;=\;} 
@f{\rho^{-1}\Delta (\rho \psi(\xi,c(\xi)))}
""
]@list[
@elem[#:style 'no-break]{where @hspace[1]}
@v-[2 @f{\rho \;=\; \exp\left(\int_{\Sigma} 
\left(c^{\beta}(\eta){\partial\over\partial \eta^{\beta}} c^{\alpha}(\eta)\right)c_{\alpha}^{\star}(\eta)\;\;-\;\;c^{\alpha}(\xi)\xi_{\alpha}^{\star}\right) }]
""
]
]
(we should discard the continuous part of @f{\Delta}, but keep the ``discrete'' part).
In other words, instead of acting on functions we consider vector fields acting on volume densities.

@spn[attn]{TODO:} Is this a generalization of the de Rham cohomology? 

@subpage[1 @elem{String amplitudes} #:tag "sec-String-amplitudes"]
We consider a family of Lagrangian submanifolds parameterized by @f{ g_{\alpha\beta}^{(0)} \;,\xi^{(0)}_i\;} taking
@e{
 g_{\alpha\beta}\;=\;  g_{\alpha\beta}^{(0)} \;,\xi_i=\xi^{(0)}_i\; , x^{\star} = c^{\star}=\zeta^{\star} = 0
}
The form @f{\Omega} looks as follows: 
@align[r.l.n @list[
@f{}
@f{\Omega (g_{\alpha\beta}^{(0)} \;,\xi^{(0)}_i\;dg_{\alpha\beta}^{(0)} \;,d\xi^{(0)}_i\;)=}""
]@list[
@f{\;=\;}@f{\int [dx\, dg^{\star}\, d\xi^{*i}\,dc\,d\zeta] \;
\sqrt{g(\xi^{(0)}_1)}V_1(\xi^{(0)}_1)\cdots\sqrt{g(\xi^{(0)}_n)}V_n(\xi^{(0)}_n) 
\;\times}
""
]@list[
@f{}
@f{\times \exp\Big(
S_{\rm BV} + \int g^{\star\alpha\beta}dg^{(0)}_{\alpha\beta}+\xi^{*i}(c + d\xi^{(0)}_i)
\Big)\;=}
""
]@list[
@f{\;=\;}
@f{\int [dx\, db\, d\xi^{*i}\,dc] 
\sqrt{g(\xi^{(0)}_1)}V_1(\xi^{(0)}_1)\cdots\sqrt{g(\xi^{(0)}_n)}V_n(\xi^{(0)}_n) \;\times}
@label{sca}
]@list[
@f{}
@f{\times
   \exp\Big( S_{\rm mat} + 
   \int b^{\alpha \beta}(\nabla_{\alpha}c_{\beta} + \nabla_{\beta}c_{\alpha})\; +}
""
]@list[
@f{}
@f{\phantom{\times\exp\Big( S_{\rm mat}} +\int b^{\alpha\beta}dg^{(0)}_{\alpha\beta}+\xi^{*i}(c(\xi^i) + d\xi^{(0)}_i)\Big)}
""
]
]
After integration over @f{d\xi^{\star}} (and omitting indices @f{{}^{(0)}} for brevity) we get: 
@align[r.l.n @list[
@f{}
@f{\int [dx\, db\, dc] 
\prod_i\left(\sqrt{g(\xi_i)}(d\xi_i^1 + c^1(\xi_i))(d\xi_i^2 + c^2(\xi_i))V_i(\xi_i)\right)\;\times}
""
]@list[
@f{}
@f{\times
   \exp\Big( 
   S_{\rm mat} + \int b^{\alpha \beta}(\nabla_{\alpha}c_{\beta} + \nabla_{\beta}c_{\alpha}) + b^{\alpha\beta}dg_{\alpha\beta}
   \Big)}
@label{StandardAmplitude}
]
]
where @f{b^{\alpha\beta}} stands for the traceless part of @f{g^{\star\alpha\beta}}.
This result is the standard expression for the string amplitude. 




@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection)

@disconnect[formula-database]

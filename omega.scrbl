#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define bystro-conf   
   (bystro (bystro-connect-to-server (build-path (find-system-path 'home-dir) ".config" "amkhlv" "latex2svg.xml"))
           "omega/formulas.sqlite"  ; name for the database
           "omega" ; directory where to store .png files of formulas
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

@;(define (bxd x) (string-append "{［\\!" x "\\!\\!］}"))
@(define (bxd x) (string-append "{〔" x "\\!〕}"))


@title[#:style '(no-toc no-sidebar)]{Form @f{\Omega}}

@bystro-ribbon[]

@hyperlink["../index.html"]{Return to index}

@table-of-contents[]

@hyperlink["../index.html"]{Return to index}

@bystro-ribbon[]

@slide["Summary" #:tag "Summary" #:showtitle #t]{
We want to define some pseudo-differential form @f{\Omega} which can serve as @bold{string measure}.

There are several closely related definitions:

@table-of-contents[]

@section{PDF on the group of canonical transformations}
Let @f{\widehat{\bf g}} denote the 
@hyperlink["../BV-formalism/MomentMap.html"]{central extension}
of the algebra of Hamiltonian vector fields by constant Hamiltonians,
and @f{\widehat{G}} the corresponding central extension of the group of canonical transformations.

@comment{
@spn[attn]{Possible subtlety:} it is not clear to us if this central extension exists globally; 
for now let us assume that we are working in the vicinity of the unit element of @f{G}
}

We will @seclink["Definition"]{start by constructing this version of @f{\Omega}}. The definition actually
@bold{depends on the choice} of a fixed Lagrangian submanifold @f{L\subset M}. Strictly speaking, we
can characterize @f{\Omega} as a map of the following type:
@equation[#:label "TypeOfOmegaOnGHat"]{
\Omega\;:\;{\rm LAG} \rightarrow \mbox{Fun}(\Pi T\widehat{G})
}
(which associates a PDF on @f{\widehat{G}} to every Lagrangian submanifold).


@section{PDF on the space of Lagrangian submanifolds}
There is a natural map:
@equation{
\widehat{G}\times {\rm LAG}\;\rightarrow\;{\rm LAG}
}
coming from the action of @f{G} on @f{M}. A natural question is, does @f{\Omega} descend to a PDF on @f{\rm LAG}?
The answer is essentially ``yes'', although @seclink["Descent To LAGs"]{some minor modifications are needed}. 
Essentially:
@centered[
@spn[redbox]{@f{\Omega} is a PDF on the space of Lagrangian submanifolds}
]
However, @f{\rm LAG} does not have interesting integration cycles. In order to get interesting
integration cycles, we have to also descend to 
@seclink["Descent To Double Coset"]{the factorspace of @f{\rm LAG} over some symmetries}.

@section{PDF on an equivalence class of actions}
In BV formalism the choice of a Lagrangian submanifold @f{L\subset M} is closely related to the
choice of a quantization scheme. In other words, it is essentially the choice of a representative in
a @hyperlink["../introduction/Equivalence_Classes_of_Theories.html"]{class of physically equivalent theories}.
Given @f{S_{\rm BV}} and @f{L\in {\rm LAG}}, the restriction @f{\left.(S_{\rm BV})\right|_L}
gives a physical action functional which we  use in the path integral. A different choice of @f{L}
gives a BRST equivalent action functional. 

Therefore it would be natural to try to interpret @f{\Omega} as a PDF on such an equivalence class.
This, however, is not straightforward. The space of Lagrangian submanifolds is actually larger than the
space of action functionals; to descend to the space of action functionals one has to take
the factorspace over the symmetries of @f{S_{\rm BV}}. Generally speaking, @f{\Omega} 
@seclink["Descent To Double Coset"]{does not descend} to this factorspace.

}

@slide[@elem{Definition and main property of @f{\Omega}} #:tag "Definition" #:showtitle #t]{
@table-of-contents[]

@section{Definition of @f{\Omega}}
For any function @f{E\;:\;{\bf C}\to {\bf C}}, consider the following pseudo-differential form on @f{\widehat{G}}:
@align[r.l.n @list[
 @f{\Omega^{\{E\}} \in\;}
 @v-[5 @f{C^{\infty}\left(
           (\Pi T\widehat{G})\times {\rm LAG}
         \right)}]
 ""
]@list[
 @f{\Omega^{\{E\}} =\;}
 @v-[6 @f{\int_{\widehat{g}L} E({d\widehat{g}\widehat{g}^{-1}})\;\;\rho_{1\over 2}}]
 @label{OmegaM}
]]
where @f{d\widehat{g}\widehat{g}^{-1}} is the @hyperlink["../BV-formalism/MomentMap.html#(elem._moment-map-type)"]{moment map};
its main property is that for any function @f{F\in \mbox{Fun}(M)}: 
@equation{
d_{(g)}(F\circ g) = \{d\widehat{g}\widehat{g}^{-1},F\,\}\circ  g
}
@centered{@spn[redbox]{we will actually use just @f{E(z) = e^z}}}

@section{@f{\Omega} is closed}
Under the assumption that @f{\Delta_{\rm can}\rho_{1\over 2}=0} the form @f{\Omega} is closed.

@subsection{Preparation for the proof of closedness}
Notice that for any @bold{even} @f{{\cal H}\in C^{\infty}(M)}:
@align[r.l.n @list[
  @f{{\cal H} \Delta_{\rm can}(E({\cal H})\rho_{1\over 2}) - 
     \Delta_{\rm can}({\cal H}E({\cal H})\rho_{1\over 2}) +
     {1\over 2} \{{\cal H},{\cal H}\}E'({\cal H})\rho_{1\over 2} \;+\;}
  ""
  @label{BeforeIntegration}
]@list[
  @f{+\;\Delta_{\rm can}\left(\left(\int d{\cal H}\,E({\cal H})\right)\rho_{1\over 2}\right) -
     \left(\int d{\cal H}\,E({\cal H})\right)\Delta_{\rm can}\rho_{1\over 2}
    } 
  @f{\;=\;0} 
  ""
]
]
We can interpret this formula using the notion of 
@hyperlink["../BV-formalism/OddLaplace.html#(elem._.Via.Lie.Derivative)"]{Lie derivative of half-density} as follows:
@equation[#:label "InterpretationUsingLieDerivative"]{
{\cal L}_{\{f({\cal H}),\,\_\}} \rho_{1\over 2} = 
{\cal L}_{\{{\cal H},\,\_\}} \left(f'({\cal H})\rho_{1\over 2}\right) - {1\over 2} \{{\cal H},{\cal H}\}f''({\cal H})\rho_{1\over 2}
}
where @f{f({\cal H}) = \int d{\cal H} E({\cal H})} 
@comment{
but we prefer to work with @f{E({\cal H})} instead of @f{f({\cal H})},
because it is @f{E({\cal H})} that enters in Eq. (@ref{OmegaM})
}

@subsection{Proof of closedness}
Taking @f{\cal H} to be the @hyperlink["../BV-formalism/MomentMap.html#(elem._moment-map-type)"]{moment map} 
@f{{\cal H} = d\widehat{g}\widehat{g}^{-1}}, we get:
@align[r.l.l.n @list[
@f{}@f{d\int_{gL}} @f{E(d\widehat{g}\widehat{g}^{-1})\;\rho_{1\over 2} \; = \;} ""
]@list[
 @f{\;=\;}
 @f{\phantom{d}\int_{gL}\;}
 @f{  d(E(d\widehat{g}\widehat{g}^{-1}))\,\rho_{1\over 2} \;-\;
      d\widehat{g}\widehat{g}^{-1}\;\Delta_{\rm can}\left(E( d\widehat{g}\widehat{g}^{-1})\;\rho_{1\over 2}\right)\;+\;
      \Delta_{\rm can}\left(d\widehat{g}\widehat{g}^{-1}\;E( d\widehat{g}\widehat{g}^{-1})\;\rho_{1\over 2}\right)
    \; =}
   ""
]@list[
 @f{=\;}
 @elem{@fsize+[20] @f{\int_{gL}\;} @fsize=[]} 
 @align[r.l @list[
  @f{d(d\widehat{g}\widehat{g}^{-1})\;E'(d\widehat{g}\widehat{g}^{-1})\,\rho_{1\over 2} \;+\;
      {1\over 2}\{d\widehat{g}\widehat{g}^{-1},d\widehat{g}\widehat{g}^{-1}\}E'(d\widehat{g}\widehat{g}^{-1})\rho_{1\over 2}\;+\;}
  ""
 ]@list[
  @f{   \; + \;
       \Delta_{\rm can}\left(
         \int d{\cal H}E({\cal H})\;\rho_{1\over 2}
       \right) - 
       \int d{\cal H}\,E({\cal H})\;\Delta_{\rm can}\rho_{1\over 2}
       \;
       }
  @f{\quad =}
 ]
 ]
 ""
]@list[
@v-[3 @f{=\;}]
@elem[@fsize+[10]@f{0}@fsize=[]]
""
@label{GenericM}
]
]
where we have taken into account the 
@hyperlink["../BV-formalism/OddLaplace.html#(elem._.Delta.Canonical)"]{definition of the canonical odd Laplace operator}
and the fact that @f{\int_{gL}\Delta_{\rm can}(\ldots)=0}.

@subsection{Maurer-Cartan equation}

We used the equation:
@equation[#:label "MaurerCartanEquation"]{d(d\widehat{g}\widehat{g}^{-1}) = - {1\over 2}\{d\widehat{g}\widehat{g}^{-1},d\widehat{g}\widehat{g}^{-1}\}}
The strange minus sign can be explained as follows. The Lie algebra of the group @f{G} of canonical transformations
is actually the opposite with the Lie algebra of Hamiltonian vector fields.


@section{Infinite-dimensional case}
Our proof is rigorous for finite-dimensional odd supermanifolds. But in field theory models there is a complication:
@centered[
@spn[redbox]{@f{\Delta_{\rm can}} is ill-defined}
]
Indeed, @f{\Delta_{\rm can}} implicitly contains @f{\Delta^{(0)}} which is ill-defined on local functionals
(what is @f{\Delta^{(0)}\int \phi\phi^{\star}} ?).

We will resolve this difficulty as follows. First of all, let us @bold{define} @f{\Delta_{\rm can}} so that
@f{\Delta^{(0)}} just vanishes on local functionals --- see
@hyperlink["../BV-formalism/Classical_BV.html"]{the definition of} @f{\Delta_{\rm classical}}.
This also affects the definition of the Lie derivative @f{{\cal L}_{{\cal H}}} which we used in the proof of
closedness of @f{\Omega}. The question is, does the proof of closedness of @f{\Delta_{\rm can}}
work with such ``regularized'' definition of @f{\Delta_{\rm can}}?

First of all, we @spn[attn]{must assume} that we still have @f{\Delta \rho_{1\over 2} = 0}.
This means the absence of anomaly in BRST current, an absolutely essential requirement. This is usually
encoded in the formula:
@align[r.l.n @list[
  @f{\Delta^{(0)} S_{\rm BV} = 0}
  ""
  @label{delta-zero-vanishes-on-master-action}
]@list[
  @elem[#:style 'no-break]{besides@hspace[1]} 
  @f{\{S_{\rm BV},S_{\rm BV}\} = 0}
  ""
]
]
With such assumptions:
@centered[
@spn[redbox]{it is OK to act with @f{\Delta} on @f{e^{S_{\rm BV}}}}
]
But this is not enough, because in our derivation we also act by @f{\Delta} on functions of @f{\cal H}. Therefore we also need:
@equation[#:label "delta-zero-vanishes-on-moment-map"]{
\Delta^{(0)} (d\widehat{g}\widehat{g}^{-1}) = 0
}
We will now argue that we can always choose @f{\widehat{g}}, at least locally, so that Eq. (@ref{delta-zero-vanishes-on-moment-map})
is satisfied. Indeed, let us consider a finite-dimensional family @f{\Lambda} of Lagrangian submanifolds
in the vicinity of some fixed @f{L_0}. For every @f{\lambda\in \Lambda}, there is a corresponding Lagrangian
submanifold @f{L_{\lambda}}, and some canonical transformation @f{g_{\lambda}} such that @f{L_{\lambda} = g_{\lambda}L_0}. 
Obviously, there is an ambiguity in the choice of @f{g_{\lambda}}, because they are defined up to the stabilizer of @f{L_0}.
Let us choose Darboux coordinates @f{\phi,\phi^{\star}} so that @f{L_0} is given by @f{\phi^{\star} = 0}.
Consider a subgroup @f{{\bf S}\subset G} generated by the flows of those Hamiltonians which depend only on @f{\phi},
but do not depend on @f{\phi^{\star}}.
@centered[
@spn[redbox]{In the vicinity of @f{L_0} it is possible to choose @f{g_{\lambda}} so that @f{g_{\lambda}\in {\bf S}}}
]
In this case Eq. (@ref{delta-zero-vanishes-on-moment-map}) is automatically satisfied. We also have:
@equation[#:label "momentum-maps-in-involution"]{
\{\,d\widehat{g}\widehat{g}^{-1}\,,\,d\widehat{g}\widehat{g}^{-1}\,\}\;=\;0
}
This equation substantially simplifies many formulas. However, we will @bold{not} assume Eq. (@ref{momentum-maps-in-involution})
for the following reasons:
@itemlist[
@item{such a choice of @f{\widehat{g}} definitely exists locally, but there could be global obstacles}
@item{keeping @f{\{d\widehat{g}\widehat{g}^{-1}\,,\,d\widehat{g}\widehat{g}^{-1}\}\neq 0} in the formulas is a good consistency check on computations}
]
With such a choice of @f{\widehat{g}} the proof does go through --- see 
@seclink["Unsafe operations"]{the proof of closedness for a 1-form component} of @f{\Omega}, the 
closedness of the higher components is proven analogously.
}

@slide[@elem{Case when @f{E} is exponent}  #:tag "When E is exponent" #:showtitle #t]{
In particular, let us take @f{E({\cal H})={\rm exp}({\cal H})}. Let us denote:
@align[r.l.n @list[
 @f{\Omega\langle F\,\rangle = } 
 @f{\int_{\widehat{g}L} \exp\left({d\widehat{g}\widehat{g}^{-1}}\right)\rho_{1\over 2} F}
 @label{GeneralOmega}
]@list[
 @f{\Omega = }
 @f{\Omega\langle 1 \rangle}
 ""
]
]
Then Eq. (@ref{GenericM}) implies:
@align[r.n @list[
@f{d\Omega\langle F\,\rangle = 
   - \Omega\left\langle \rho_{1\over 2}^{-1}\Delta_{\rm can}(\rho_{1\over 2} F\,)\right\rangle}
   @label{Intertwiner}
]]
Using @hyperlink["../BV-formalism/OddLaplace.html#(elem._.Operator.Delta)"]{the definition of @f{\Delta}},  
Eq. (@ref{Intertwiner}) can be rewritten in the following way:
@equation[#:label "OmegaIsIntertwiner"]{
   d\Omega\langle F\,\rangle = - \Omega\langle \Delta F\,\rangle  
}
Also note the following equation for @f{H\in \widehat{\bf g}}:
@equation[#:label "IotaOnOmega"]{
   \iota_{\{H,\_\}}\Omega\langle F\,\rangle = \Omega\langle  HF\,\rangle
}
}


@slide["Algebraic Interpretation" #:tag "As Intertwiner" #:showtitle #t]{
@table-of-contents[]
@section{Wavy superalgebra and BV algebra}
Let us consider a BV algebra @f{\cal G} with the generator @f{\Delta}. Let @f{{\bf g}} be the Lie
superalgebra which is obtained from @f{\cal G} by forgetting the associative
algebra structure and flipping parity, and @f{\widetilde{\bf g}'} the corresponding
@hyperlink["../equivariant-cohomology/Equivariant_Cohomology.html#(part._.Equivariant_cohomology_as_a_relative_.Lie_algebra_cohomology)"]{wavy Lie superalgebra}.

@comment{We need to flip parity in order to turn @f{\{\_,\_\}} into a Lie superalgebra operation. 
If the parity of @f{b} as an element of @f{\cal G}, is @f{|b|}, 
then the parities of the corresponding elements of @f{\widetilde{\bf g}'} are:
@f{|(b,0)| = |b| + \bar{1}} and @f{|(0,b)| = |b|}
}
@bold{Theorem @th-num{th:RepresentationOfWavyAlgebra}}
The following formulas define the representation of @f{\widetilde{\bf g}'} on @f{\cal G}:
@align[r.l @list[
@f{\rho(d) a =}@f{\;  - \Delta a}
]@list[
@f{\rho((0, b)) a =}@f{\; ba}
]@list[
@f{\rho((b,0)) a  =}@f{\; [\rho((0,b)),\rho(d)] a\;=}
]@list[
@f{=}@f{\;(-)^{|b|}\Delta(ba) - b\Delta a}
]]
@comment{
We have to check that:
@equation{
[\rho((b,0)),\rho((0,c))]a  = \rho((b,0))\rho((0,c))a - (-)^{|c|(|b|+1)}\rho((0,c))\rho((b,0))a = \rho((0,\{b,c\}))a
}
Indeed, we have:
@fsize+[(- 3)]
@align[r.l @list[
 @f{\rho((b,0))\rho((0,c))a \;=\;} 
 @f{(-)^{|b|}\Delta(bca) - b\Delta(ca) = (-)^{|b|}(\Delta b)ca + \{b,ca\} = \{b,c\}a + (-)^{|b|}(\Delta b)ca + (-)^{|c|(|b|+1)}c\{b,a\}}
]@list[
 @f{\rho((0,c))\rho((b,0))a \;=\;}
 @f{(-)^{|b|} c \Delta(ba) - cb \Delta a = (-)^{|b| + |c|(|b|+1)}(\Delta b)ca + c\{b,a\}}
]]
@fsize=[]
}

@section{Form @f{\Omega\langle\ldots\rangle} as an intertwiner}
Let us consider the particular case when @f{\cal G} is the algebra of functions
on the odd symplectic manifold @f{M}. 

In this case, @f{\widetilde{\bf g}'} naturally acts on the differential forms on @f{G}. Indeed, every 
element @f{\alpha\in {\bf g}=\mbox{Lie}(G)} determines the corresponding right-invariant vector 
field on @f{G}. Then @f{(\alpha,0)} would act as a Lie derivative along this vector field, 
and @f{(0,\alpha)} acts as a contraction. 

We can 
consider @f{\Omega\langle\_\,\rangle} as a linear map from @f{{\cal G}} to the space of differential forms on @f{G};
for each @f{a\in{\cal G}}, this map computes @f{\Omega\langle a\rangle} --- the corresponding differential 
form. Eqs. (@ref{OmegaIsIntertwiner}) and (@ref{IotaOnOmega}) can be interpreted as saying that @f{\Omega\langle\_\,\rangle} is an 
intertwiner: 
@bystro-bg[255 255 230]
@equation{
   x\Omega\langle a\rangle = \Omega\langle \rho(x)a \rangle
}
@bystro-bg[255 255 255]

}

@slide["Descent to the moduli space of Lagrangian submanifolds" #:tag "Descent To LAGs" #:showtitle #t]{

@short-intro{
Here we will explain how to push  @f{\Omega} from @f{\widehat{G}} down to @f{\rm LAG}
}

Let us interpret @f{\Omega} as a PDF on @f{\rm LAG} using the formula:
@equation{
   \Pi T{\rm LAG} = (\Pi T \widehat{G})\times_{\widehat{G}}{\rm LAG}
}
where @f{\times_{\widehat{G}}} means factor over the symmetry:
@equation[#:label "GtimesLAGSymmetry"]{
   (\widehat{g},L)\mapsto (\widehat{g}\widehat{f},\widehat{f}^{-1}L)
}
For the descend to work, @f{\Omega} should be base, @italic{i.e.} both invariant and 
horizonthal, with respect to (@ref{GtimesLAGSymmetry}). Actually, it is invariant and 
@bold{almost} horizonthal. The invariance is straightforward. Let us study 
the question of horizonthality, and understand why it is ``almost horizonthal'' 
instead of ``horizonthal''. Let @f{\xi \in \widehat{\bf g}} denote a Hamiltonian
whose flux preserves the Lagrangian submanifold @f{L}. The horizonthality would
be equivalent to the statement that @f{\iota_{{\rm Ad}(\widehat{g})\xi}\Omega} is zero. But in fact, 
Eq. (@ref{IotaOnOmega}) implies:
@equation{
   \iota_{{\rm Ad}(\widehat{g})\xi}\Omega = \int_{\widehat{g}L}({\rm Ad}(\widehat{g})\xi)
   e^{d\widehat{g}\widehat{g}^{-1}}\rho_{1\over 2}
}
Notice that @f{\xi\in \mbox{St}(L)} implies @f{{\rm Ad}(\widehat{g})\xi\in \mbox{St}(\widehat{g}L)}.
@italic{Apriori} this only 
implies that @f{({\rm Ad}(\widehat{g})\xi)|_{\widehat{g}L}} is a constant (but not necessarily zero). 


This is potentially a problem (we certainly @bold{do} want @f{\Omega} to descend on @f{\rm LAG}).
We will now outline some possible ways of resolving this problem:

@table-of-contents[]

@section[#:tag "GhostNumberInvariance"]{Use ghost number symmetry}
There is usually a @f{U(1)} symmetry called @italic{ghost number}. Let us do the following:
@itemlist[#:style 'ordered
@item{Restrict ourselves to only considering those Lagrangian submanifolds which are invariant
under this @f{U(1)} (@italic{i.e.} the orbits of the @f{U(1)} being tangent to the Lagrangian submanifold)}
@item{Request that @f{d\widehat{g}\widehat{g}^{-1}} have ghost number @f{-1}}
]
This eliminates the possibility of adding a constant to @f{d\widehat{g}\widehat{g}^{-1}} and therefore
renders @f{(d\widehat{g}\widehat{g}^{-1})_L} unambigously defined from the variation of @f{L}. Our form
@f{\Omega} is now horizonthal, and descends from @f{G} to @f{\rm LAG}.


@section[#:tag "TransverseLagrangian"]{Use transverse Lagrangian submanifold}
Suppose that we can find  a Lagrangian submanifold @f{L^{\vee}\subset M} which is transverse to all
Lagrangian submanifolds from our family:
@align[r.c.n @list[
 @f{(\widehat{g}L )\cap L^{\vee} \;\;\;=\;} 
 @f{p(\widehat{g}L)}  
 @label{intersection-is-one-point}
]@list[
 ""
 @larger{↑}
 ""
]@list[
 ""
 @elem[#:style 'no-break]{one point}
 ""
]
]
where @f{p(\widehat{g}L)} is a @bold{marked point} on every @f{\widehat{g}L}. 
@tabular[@list[@list[
@elem{
Let @f{{\cal Z}_{L^{\vee}}\subset \mbox{Fun}(M)} denote
the subspace  of those Hamiltonians which vanish on @f{L^{\vee}}. Since @f{L^{\vee}} is chosen to be Lagrangian,
@f{\Pi {\cal Z}_{L^{\vee}}} is a Lie subalgebra of @f{{\bf g}=\Pi \mbox{Fun}(M)}. (Slightly smaller than
the stabilizer of @f{L^{\vee}}.)
It is intuitively clear (from counting the ``degrees of freedom'') that we can impose the following
@bold{gauge condition}:
@f{
\widehat{g}\in \exp(\Pi{\cal Z}_{L^{\vee}})\subset \mbox{St}(L^{\vee})\subset \widehat{G}
}
This implies that @f{d\widehat{g}\widehat{g}^{-1}} vanishes at the marked point:
@f{
(d\widehat{g}\widehat{g}^{-1})(p(\widehat{g}L)) = 0
}
}
@image{graphics/L-vee.svg}
]]]
This eliminates the ambiguity of a constant in @f{d\widehat{g}\widehat{g}^{-1}}. 

What happens if we change @f{L^{\vee}} to another transversal Lagrangian submanifold @f{\tilde{L}^{\vee}}? 
Let us assume that we can choose:
@align[r.r.l.n @list[
 ""
 @f{\widehat{f}\;\in\;} 
 @f{\mbox{St}(L)\subset \widehat{G}}
 ""
]@list[
 @v-[4 @f{\mbox{\tt\small such that }}]
 @v-[1 @f{\widehat{f} \tilde{L}^{\vee} \;=\;}]
 @f{L^{\vee}}
 ""
]
]
Then we just have to change:
@equation{
\widehat{g} \mapsto \widehat{g} \widehat{f}
}
As @f{\Omega} is invariant, this would not change the result of the integration.

@section{Upgrade @f{\rm LAG} to @f{{\rm LAG}_+}}
The most elegant solution is to use, instead of the space of Lagrangian submanifolds @f{\rm LAG},
the space @f{{\rm LAG}_+} of Lagrangian submanifolds with marked point. A point of @f{\rm LAG_+} 
is a pair @f{(L,p)} where @f{L\in \rm LAG} and @f{p\in L}. This defines the double fibration:
@equation{
   M \stackrel{p}{\longleftarrow} {\rm LAG}_+ \stackrel{\pi}{\longrightarrow} {\rm LAG}
}
Given  @f{v\in \Pi T_{(L,p)}{\rm LAG}_+}, we can consider two projections @f{\pi_*v\in \Pi T_L{\rm LAG}}
and @f{p_*v\in \Pi T_pM}. Our @f{\Omega} is a pseudo-differential form, @italic{i.e.} a function of
@f{L,p,v}. We will define it so that it will depend on @f{v} only through @f{\pi_*v}. 
We can characterize @f{\pi_* v} as a section of @f{\Pi TM|_L} modulo @f{\Pi TL}. We then define @f{\sigma} as
follows:
@align[r.l.n @list[
@f{\sigma \;\in\;}@f{\mbox{Fun}(L)}""
]@list[
@f{d\sigma \;=\;}@f{- \left.\left(\iota_{\pi_*v} \omega\right)\right|_L}@label{DefDSigma}
]@list[
@f{\sigma(p) \;=\;}@f{0}@label{SigmaVanishiesAtMarkedPoint}
]]
In order to make sense of @f{\iota_{\pi_*v}\omega} we must think of @f{\pi_*v} as a section of @f{\Pi TM}; the fact 
that it is only defined up to tangent to @f{TL} does not matter because @f{L} is isotropic. Eq. (@ref{SigmaVanishiesAtMarkedPoint}) 
eliminates the ambiguity, and we can now @bold{safely define} @f{\Omega}:
@equation{
\Omega \;=\; \int_L e^{S_{\rm BV} + \sigma}
}
For every function @f{F} on @f{M} and for any PDF @f{\nu} on @f{M}, consider
the product @f{(p^*\nu)\Omega\langle F\,\rangle} where:
@equation{
   \Omega\langle F\,\rangle(L,\sigma)\;=\;\int_L F\,e^{S_{\rm BV}+\sigma}
}
We will now prove the following formula:
@equation[#:label "SeveraDifferential"]{
d\left(p^*\nu\;\Omega \langle F\,\rangle\right) \;=\; 
(-)^{|\nu|+1} p^*\nu\;\Omega \langle \Delta  F\,\rangle 
\;+\;p^*\left(d\nu + \omega\nu\right)\;\Omega\left\langle F\,\right\rangle
}
For small deformations of @f{L_0} we can always find canonical transformations @f{g} such that:
@align[r.l @list[
@f{L \;=\;}@f{gL_0}
]@list[
@f{p \;=\;}@f{gp_0}
]]
The introduction of such @f{g} is essentially a trick. It does not participate in any way
in the @bold{definition} of @f{\Omega}; we will use it just to compute @f{d\Omega}.
We can now use the 
@hyperlink["../BV-formalism/MomentMap.html#(elem._moment-map-type)"]{moment map} 
@f{{\cal H} = d\hat{g}\hat{g}^{-1}}.
We observe that: 
@equation{
\sigma(gp) \;=\; {\cal H}(gp) - {\cal H}(gp_0)
}
--- the subtruction of @f{{\cal H}(gp_0)} is needed to satisfy Eq. (@ref{SigmaVanishiesAtMarkedPoint}).
Therefore:
@align[l @list[
@f{\Omega\langle F\,\rangle  \;=\;
   e^{-{\cal H}(gp_0)}\int_{gL_0} F\,e^{S_{\rm BV} + {\cal H}}}
]]
Using Eq. (@ref{BeforeIntegration}) with @f{E =\exp} :
@align[r.n @list[
@f{{\cal H} \Delta(F\, e^{\cal H}) - 
     \Delta\left(F\,{\cal H}e^{\cal H}\right) +
     \Delta(F e^{\cal H}) +
     {1\over 2} \{{\cal H},{\cal H}\}F\,e^{\cal H} 
\;=\;  (\Delta F\,)e^{\cal H}}@label{IdentityForDelta}
]]
and the fact that @f{\int e^{S_{\rm BV}}\Delta(\ldots)=0} we get: 
@align[r.l @list[
@f{d \int_{gL_0} F\,e^{S_{\rm BV} + {\cal H}} \;=\;}@f{\int_{gL_0} e^{S_{\rm BV}}\left( 
      -{\cal H}\Delta (F\,e^{\cal H}) \;+\; (d{\cal H})F\,e^{\cal H}
   \right)\;=\;}
]@list[
@f{\;=\;}@f{- \int_{gL_0} (\Delta F\,) e^{S_{\rm BV} + {\cal H}}}
]]
But we also have to evaluate the exterior derivative of the prefactor:
@align[r.l @list[
@f{}@f{d e^{-{\cal H}(gp_0)}\;=\;}
]@list[
@f{\;=\;}@f{e^{-{\cal H}(gp_0)}\left(
      - (d {\cal H}) (gp_0) 
      - \{{\cal H}\,,\,{\cal H}\}(gp_0)
   \right)\;=\;}
]@list[
@f{\;=\;}@f{- {1\over 2}e^{-{\cal H}(gp_0)}
       \{{\cal H}\,,\,{\cal H}\}(gp_0)\;=\;}
]@list[
@f{\;=\;}@f{{1\over 2} e^{-{\cal H}(gp_0)}
       ((\iota_{\{{\cal H}\,,\,\_\}})^2\omega )(gp_0) \;=\;}
]@list[
@f{\;=\;}@f{{1\over 2} e^{-{\cal H}(gp_0)} \iota_{dp}^2\omega = 
       e^{-{\cal H}(gp_0)}p^*\omega}
]]
This concludes the proof of Eq. (@ref{SeveraDifferential}).

@section{Classifying the possible ambiguities}

Constant @bold{local or multilocal} functionals are somewhat rare. As an example of such a functional,  
consider @f{\int \mbox{tr}(F\wedge F)} in the Yang-Mills theory on a compact four-manifold.
In the context of string theory, there are no local constant functionals if the target space
has sufficiently trivial topology.

@section{Conclusion}
@div[redbox]{
Possible anomalies which could  prevent the descent of @f{\Omega} from 
@f{(\Pi T \widehat{G})\times_{\widehat{G}}{\rm LAG}} to @f{\Pi T{\rm LAG}}
should be analized on the case-by-case basis.
}
}


@slide["Descent to double coset" #:tag "Descent To Double Coset" #:showtitle #t]{
@short-intro{The form @f{\Omega} does @bold{not} descend from @f{\rm LAG} to 
@f{S\widehat{G}\backslash {\rm LAG}};
but we will prove that for some subgroups @f{H\subset S\widehat{G}}, 
it can be modified in a natural way, so that the modified form 
@bold{does descend} to @f{H\backslash {\rm LAG}}}

@table-of-contents[]

@section{Straightforward descent does not work}
We are identifying @f{{\cal M}_{\rm BRST}} with the 
@hyperlink["../tangent-space-of-double-coset/index.html"]{double coset} @f{SG\backslash G/{\rm St}(L)}.
Let @f{\hat{h}} be a special
canonical transformation, @italic{i.e.} @f{\hat{h}\in S\widehat{G}}. It follows immediately
that @f{\Omega = \int_{gL} e^{d\widehat{g} \widehat{g}^{-1}}} is @bold{invariant} under 
the left shift @f{\widehat{g}\mapsto \widehat{h}\widehat{g}}. But
@f{\Omega} is @bold{not horizonthal}; for @f{\xi\in {\bf s\widehat{g}}} we have:
@equation{
 \iota_{\xi}\Omega = \int_{gL} \;\xi   \;e^{ d\widehat{g}\widehat{g}^{-1}}\rho_{1\over 2} \neq 0
}
Therefore:
@centered{
@spn[redbox]{
@f{\Omega} does @bold{not} descend from @f{\rm LAG} to @f{SG\backslash {\rm LAG}}
}}

@section{Modified PDF}
However, we identify a class of subalgebras @f{{\bf h}\subset {\bf sg}} for which we can construct
the base form @f{\Omega_{\bf h}^{\tt base}}. Being a base form, it descends to @f{H\backslash {\rm LAG}},
where @f{H} is the Lie group generated by the flows of elements of @f{\bf h}.
}


@slide["Equivariant half-densities" #:tag "Equivariant half-densities" #:showtitle #t]{

@table-of-contents[]

@section{Definitions}
Suppose that we have the following data:
@itemlist[
@item{A subgroup @f{H} of the group of canonical transformations of an odd symplectic manifold @f{M}; 
the Lie algebra @f{\bf h} of @f{H} consists of vector fields of the form @f{\{F,\_\}} where @f{F} runs over 
Hamiltonians of elements of @f{\bf h}.}
@item{A map
@align[r.l @list[
@f{{\bf h} \to}@f{\mbox{ \tt\small half-densities on }M}
]@list[
@f{\xi \mapsto}@f{\; \rho^{\tt C}_{1\over 2}(\xi)}
]]
such that:
@align[r.l.n @list[
@f{{\cal L}_{\xi}\rho^{\tt C}_{1\over 2}(\eta) \;=\;}@f{\left.{d\over dt}\right|_{t=0} \rho^{\tt C}_{1\over 2}(e^{t\,{\rm ad}_{\xi}}\eta)}@label{RhoEquivariant}
]@list[
@f{\Delta_{\rm can} \left(\rho^{\tt C}_{1\over 2}(\{F,\_\})\right)\;=\;}@f{F \rho^{\tt C}_{1\over 2}(\{F,\_\})}@label{RhoEquivariantlyClosed}
]]}
]
Then the following equation is a cocycle of the @f{H}-equivariant Cartan complex on @f{\rm LAG}:
@equation{
\Omega(L,dL,\xi)  = \int_L e^{d\widehat{g}\widehat{g}^{-1}} \rho^{\tt C}_{1\over 2}(\xi)
}
This is proven using 
@seclink["As Intertwiner"]{the interpretation of @f{\Omega} as an intertwining operator}. 

Notice the compatibility of Eqs. (@ref{RhoEquivariant}) and (@ref{RhoEquivariantlyClosed}):
@align[r.l @list[
@f{{\cal L}_{\{F,\_\}} \rho^{\tt C}_{1\over 2}(\{F,\_\}) \;=\;}
@f{-\Delta_{\rm can}\left( F\rho_{1\over 2}(\{F,\_\}) \right) - F \Delta_{\rm can}\rho_{1\over 2}(\{F,\_\})\;=\;}
]@list[
@f{\;=\;}@f{- \Delta_{\rm can}^2\left(\rho^{\tt C}_{1\over 2}(\{F,\_\})\right)  - F^2\rho_{1\over 2}(\{F,\_\}) \;=\;0}
]]
Here we used @hyperlink["../BV-formalism/OddLaplace.html"]{the relation between @f{\Delta_{\rm can}} and Lie derivative}.
also, since @f{\{F,\_\}} is even, @f{F} is odd and therefore @f{F^2=0}.

It seems that the main ingredient in this approach is the choice of a group @f{H}. 
(In the case of bosonic string this is the group of diffeomorphisms.) 
The rest of the formalism is built around @f{H}. We suspect that @f{\rho_{1\over 2}^{\tt C}(\xi)} is
more or less unambiguously determined by the choice of @f{H}; even @f{\rho_{1\over 2}^{\tt C}(0)} is
already unambigously determined. Indeed, we will now see that the constraints arizing from
Eqs. (@ref{RhoEquivariant}) and (@ref{RhoEquivariantlyClosed}) are very tight.

@section[#:tag "sec:expansion-of-omega"]{Expansion of @f{\Omega(L,dL,\xi)} in powers of @f{\xi}}

Let us expand @f{\rho^{\tt C}_{1\over 2}(\xi)} in powers of @f{\xi}:
@align[l @list[
@f{\rho^{\tt C}_{1\over 2}(\xi) = \rho^{(0)}_{1\over 2}\left( 1 + \Phi\langle\xi\rangle + \ldots\right)}
]]

@comment{
we use angular brackets to emphasize linear depnendence: @f{\Phi\langle\xi\rangle} is some 
linear function of @f{\xi \in {\bf h}}
}

Eq. (@ref{RhoEquivariantlyClosed}) implies that @f{\rho^{(0)}_{1\over 2}} satisfies the Master Equation. 
In this Section we will use @f{\rho^{(0)}_{1\over 2}} to define the odd Laplace operator on functions:
@equation{
\Delta = \Delta_{\rho^{(0)}_{1\over 2}}
}
Eq. (@ref{RhoEquivariant}) implies that @f{\rho^{(0)}_{1\over 2}} is @f{H}-invariant; 
using @hyperlink["../BV-formalism/OddLaplace.html"]{the relation between @f{\Delta_{\rm can}} and Lie derivative} we derive:
@equation{
{\cal L}_{\{F,\_\}}\rho^{(0)}_{1\over 2}\;=\; 
(-)^{\overline{F}}\Delta_{\rm can}\left(F\rho_{1\over 2}\right)\;=\;0
}
Therefore the Hamiltonians generating @f{\bf h} should be all @f{\Delta}-closed. Moreover, Eq. (@ref{RhoEquivariantlyClosed}) implies:
@equation{
\Delta \Phi\langle\xi\rangle = \xi
}
so they are actually all @f{\Delta}-exact. Eq. (@ref{RhoEquivariant}) implies:
@equation[#:label "EquivarianceOfPhi"]{
\{\Delta\Phi\langle\xi\rangle \,,\,\Phi\langle\eta\rangle\}\;=\; \Phi\langle[\xi,\eta]\rangle
}
The image of @f{\Phi}, as a linear statistics-reversing map @f{{\bf h}\to \mbox{Fun}(M)}, will be called @f{\cal F}.
Notice that the inverse map to @f{\Phi\;:\;{\bf h}\rightarrow {\cal F}} is @f{\Delta\;:\;{\cal F}\rightarrow {\bf h}}. To summarize:
@equation{ 
{\bf h} \;=\; \Pi\Delta{\cal F} 
}

}

@slide[@elem{Subspace @f{{\cal F}\subset \mbox{Fun}(M)}} #:tag "Subalgebra F" #:showtitle #t]{

We will now study the necessary properties of the @seclink["sec:expansion-of-omega"]{previously defined} space @f{\cal F}.

Let us define the bracket:
@equation[#:label "DefLieAlgeraOfDiffeomorphisms"]{
   [x,y] = \{x,\Delta y\}
}
which satisfies @f{\Delta [x,y] = \{\Delta x,\Delta y\}}. 
Because of Eq. (@ref{EquivarianceOfPhi}), we will impose the following additional
requirement:
@align[r.c.l.c.n @list[
@f{} "" @f{\forall x\in F:\forall y\in {\cal F}:} "" ""
]@list[
@f{}
@bystro-bg[255 255 230]
@f{[x,y]\in {\cal F}}
@bystro-bg[255 255 255]
@label{Closedness}
]]


Moreover, Eq. (@ref{RhoEquivariantlyClosed}) implies the existence of a map
@equation{
   q\;:\;{\cal F}\otimes {\cal F}\to \mbox{Fun}(M)
}
such that:
@bystro-bg[255 255 230]
@equation[#:label "DefQ"]{
   \{x,y\} = \Delta q(x,y)
}
@bystro-bg[255 255 255]

We can prove that:
@centered[
@spn[redbox]{
Under the conditions (@ref{DefQ}) and (@ref{Closedness}) the space @f{\cal F} is a Lie superalgebra 
under  @f{[\_\,,\_]}
}]
(@italic{i.e.} @f{[\_\,,\_]} satisfies the Jacobi identity).

@comment{There is a possibility to impose a slightly weaker condition. Instead of
requiring (@ref{DefQ}) we can just ask for @f{\Delta \{x,y\} = 0}. And continue to
require (@ref{Closedness}). This is the same as to say that:
@itemlist[#:style 'ordered
@item{@f{\cal F} is closed under @f{[\_\,,\_]} and }
@item{@f{[\_\,,\_]} is antisymmetric}
]
(Because @f{[\_\,,\_]} is constructed from @f{\{\_\,,\_\}} (which already satisfies
the Jacobi identity), the antisymmetry of @f{[\_\,,\_]} already implies that
@f{[\_\,,\_]} satisfies the Jacobi identity.)
}

Therefore @f{\cal F} is a  Lie algebra.  There is a map @f{\Delta\;:\;{\cal F}\to \Pi \mbox{Fun}(M)}.
The image of this map, with flipped Grassmann parity, 
naturally denoted @f{\Pi\Delta {\cal F}}, is a Lie subalgebra of @f{{\bf s\widehat{g}} = \Pi \mbox{Fun}(M)}:
@equation{
{\bf h}  \;=\; \Pi\Delta{\cal F}
}
We will also request that:
@centered[@spn[redbox]{
the map @f{\Delta\;:\;{\cal F}\to \mbox{Fun}(M)} is @bold{injective}
}]
In other words:
@equation{
{\cal F} \simeq \Pi\Delta{\cal F}
}

}


@slide["Construction of equivariant form" #:tag "Equivariant Form" #:showtitle #t]{

@short-intro{@centered{We will now describe an @f{\bf h}-equivariant analogue of @f{\Omega}}}

@table-of-contents[]
@section{Construction of @f{\Gamma(\Phi)}}
Remember that we required @f{\mbox{ker}\,\Delta|_{\cal F} = 0}. This means that
for every @f{\xi\in {\bf h}} we can unambiguously find the corresponding
element of @f{\cal F}, which we will denote @f{\Phi\langle \xi\rangle} such that:
@equation[#:label "PhiXi"]{
\xi = \Delta \Phi\langle \xi \rangle
}
We can always write, without any further assumptions:
@align[r.l.n @list[
@f{\rho^{\tt C}_{1\over 2}(\xi)\;=\;}@f{e^{a(\xi)}\rho^0_{1\over 2}}@label{OmegaCartanDensity}
]]
So defined @f{a(\xi)} should satisfy (we abbreviate @f{\Phi\langle\xi\rangle} to just @f{\Phi}):
@align[r.l.n @list[
@f{\Delta a + {1\over 2} \{a,a\} \;=\;}@f{\Delta\Phi}@label{EquationForLogForEquivariant}
]@list[
@f{\{\Delta \Phi\langle\eta\rangle \,,\,a(\xi)\}\;=\;}@f{\left.{d\over dt}\right|_{t=0} a(e^{t\,{\rm ad}_{\eta}}\xi)}@label{EquivarianceOfA}
]]
The first two terms in the @f{\xi}-expansion (which is the same as @f{\Phi}-expansion) are:
@equation{ 
a = \Phi - {1\over 2} q(\Phi,\Phi) + \ldots 
}




The @bold{consistency} of Eq. (@ref{EquationForLogForEquivariant}) requires that  @f{\Delta \{a,a\} =0} at
every order in @f{\Phi}. This can be proven in the following way:
@equation{
\Delta \{a,a\} = 2\{\Delta a,a\} = -\{\{a,a\},a\} + 2\{\Delta\Phi,a\}
}
The first term @f{-\{\{a,a\},a\}} is automatically zero because of the Jacobi identity.
The vanishing of @f{2\{\Delta\Phi,a\}} follows from Eq. (@ref{EquivarianceOfA}):
@equation{
\{\Delta \Phi, a(\Phi)\} = a(\{\Delta\Phi,\Phi\}) = a (0) = 0
}
Now we have @f{\{a,a\}} is @f{\Delta}-closed order by order in @f{\Phi}. Let us @spn[attn]{assume} that
it is actually @f{\Delta}-exact order by order in @f{\Phi}:
@equation{
\{a,a\} = -2\Delta a'
}
and, moreover, exact in a way compatible with Eq. (@ref{EquivarianceOfA}), @italic{i.e.}:
@equation{
\{\Delta\Phi\langle\xi\rangle, a'(\eta)\}\;=\;\left.{d\over dt}\right|_{t=0}a'\left(e^{t\,{\rm ad}_{\xi}}\eta\right)
}
Then we define @f{a'} to be the next term of the @f{\Phi}-expansion of @f{a}.
For example, up to the fourth order in @f{\Phi}:
@align[r.c.c.c.l.n @list[
 @f|{a\;=\;\Phi - {1\over 2}\Delta^{-1}\{}|
 @f+0-2|{\Phi - {1\over 2}\Delta^{-1}\{}|
 @f+0-4|{\Phi - {1\over 2}\Delta^{-1}\{\Phi,\Phi\}}|
 @v-[7 @f+0-2|{,}|]
 ""
 ""
]@list[
 ""
 ""
 @f+0-4|{\Phi - {1\over 2}\Delta^{-1}\{\Phi,\Phi\}}|
 @f+0-2|{\}}|
 @v-[7 @f|{,}|]
 ""
]@list[
 ""
 @f+0-2|{\Phi - {1\over 2}\Delta^{-1}\{}|
 @f+0-4|{\Phi - {1\over 2}\Delta^{-1}\{\Phi,\Phi\}}|
 @v-[7 @f+0-2|{,}|]
 ""
 ""
]@list[
 ""
 ""
 @f+0-4|{\Phi - {1\over 2}\Delta^{-1}\{\Phi,\Phi\}}|
 @f+0-2|{\}}|
 @f|{\} \;+\; o(\Phi^4)}|
 ""
]
]
@comment{
@fsize+[(- 3)]
The terms of the order @f{\Phi^3} are:
@equation|{
{1\over 2}\Delta^{-1}\{\Phi,\Delta^{-1}\{\Phi,\Phi\}\} \;=\;
{1\over 2}\Delta^{-1}\{\Phi,q(\Phi,\Phi)\}
}|
The terms of the order @f{\Phi^4} are:
@align[r.l.n @list[
 ""
 @f{-{1\over 2}\Delta^{-1}\left(\{\Phi,\Delta^{-1}\{\Phi,\Delta^{-1}\{\Phi,\Phi\}\}\} 
    \,+\,{1\over 4}\{\Delta^{-1}\{\Phi,\Phi\},\Delta^{-1}\{\Phi,\Phi\}\}\right)}
 ""
]
]
Notice that:
@align[r.l.n @list[
 ""
 @f{\Delta\left(\{\Phi,\Delta^{-1}\{\Phi,\Delta^{-1}\{\Phi,\Phi\}\}\} +
                {1\over 4}\{\Delta^{-1}\{\Phi,\Phi\},\Delta^{-1}\{\Phi,\Phi\}\}\right)\;=}
 ""
]@list[
 @f{=}
 @f{\{\Delta\Phi,\Delta^{-1}\{\Phi,\Delta^{-1}\{\Phi,\Phi\}\}\}}
 ""
]
]
This is zero by our assumption that the function @f{\Phi\mapsto \Delta^{-1}\{\Phi,\Delta^{-1}\{\Phi,\Phi\}\}}
is @f{\bf h}-invariant.
@fsize=[]
}
@section{The equivariant version of @f{\Omega}}
@align[r.l.n @list[
@f{\Omega_{\bf h}^{\tt C}\;\in \;}
@f{S^{\bullet}({\bf h}^*) \otimes \Omega^{\bullet}({\rm LAG})}
@label{OmegaCartanCalF}
]@list[
@f{\Omega_{\bf h}^{\tt C} (\xi=\Delta\Phi) =\;}
@f{\Omega\langle e^a\rangle}
@label{summary-of-equivariant-omega}
]@list[
  @elem[#:style 'no-break]{where @f{a}} 
  @elem[#:style 'no-break]{@hspace[1]solves Eq. (@ref{EquationForLogForEquivariant})}
  ""
]
]
is a cocycle of the Cartan model of the @f{\bf h}-equivariant cohomology of @f{G}. 

@section[#:tag "sectionDeformationsOfEquivariantOmega"]{Deformations of equivariant @f{\Omega}}
@short-intro{
@centered{
Now let us study the moduli space of solutions @f{a} of Eq. (@ref{EquationForLogForEquivariant})
}
}
The tangent space at the point @f{a} is parametrized by @f{a'} satisfying:
@align[r.l.n @list[
 @f{\{\Delta\Phi,a'\} \;=\;} @f{0} @label{DeltaPhiWithAprime}
]@list[
 @f{\Delta a' + \{a,a'\} \;=\;} @f{0} @label{APrimeCovClosed}
]
]
Remember that we understand @f{a} (and therefore @f{a'}) as a series in @f{\Phi}.
In particular, as we already assumed that the map @f{\Phi \mapsto a} is @f{\bf h}-invariant, we 
should assume the same about @f{a'}. (Just because @f{a'} is a deformation of @f{a}.) 
This imlies Eq. (@ref{DeltaPhiWithAprime}), because @f{\{\Delta\Phi,\Phi\}=0}.

The term of the zeroth order in @f{\Phi} in  @f{a'} can be interpreted as the deformation of the solution of Master Equation:
@equation{
\rho_{1\over 2}\mapsto e^{\varepsilon a'}\rho_{1\over 2}
}
(where @f{\varepsilon} is the infinitesimal deformation parameter).

Suppose that @f{a'} @bold{starts with the term linear} in @f{\Phi}, or, equivalently, with the term linear in @f{\xi}.
Let @f{a'\langle\xi\rangle} denote this leading linear term.
The @f{\bf h}-invariance of the map @f{\xi \mapsto a'_{\xi}} implies for the linear term:
@equation[#:label "EquivarianceOfLinearTermInDeformation"]{
\{\Delta\Phi\langle\xi\rangle\,,\,a'\langle \eta\rangle\} = a'\langle [\xi,\eta] \rangle
}
Moreover, since @f{a} starts with the term linear in @f{\Phi}, Eq. (@ref{APrimeCovClosed}) implies:
@equation{
\Delta a'\langle \xi\rangle = 0
}
Therefore:
@div[redbox]{
We can caracterize the linear term in the deformations of the equivariant form as 
an integrated vertex operator @f{a'\langle\xi\rangle} of ghost number @f{-2} parametrically dependent on a diffeomorphism @f{\xi}
satisfying the equivariance property described by Eq. (@ref{EquivarianceOfLinearTermInDeformation}). 
}
In principle it is possible that the linear term is also zero and @f{a'} actually starts with quadratic or higher order
term in @f{\Phi}. In this case a similar integrated vertex of ghost number @f{-2} can be defined, but depending parametrically
on an element @f{\xi\otimes\cdots\otimes\xi}.

We do not know nonzero examples of such vertices in actual string theories; we suspect that our construction
of equivariant form is rigid against small deformations.

@section{Possible anomaly}
We used a @hyperlink["../BV-formalism/Infinite_dimensional_case.html#(part._.How_to_be_safe)"]{potentially ill-defined}
expression @f{\Delta e^a}. One obvious way to make it well-defined is to assume that @f{a} depends either only on fields,
or only on antifields. That would also imply @f{\{a,a\}=0}.
The assumption that @f{a} only depends on the antifields is valid for 
@hyperlink["../bosonic-string/IntegrationOverFamily.html#(part._.Choice.Of.F)"]{bosonic} and NSR strings. But for the
case of @hyperlink["../pure-spinor/Diffeomorphism_Hamiltonian.html"]{pure spinor string} @f{a} depends on both fields 
and antifields, so our assumption is @bold{not valid}. We feel that the validity of our
conclusions 
in such cases depends on additional physical assumption. Roughly speaking:
@centered[
@spn[redbox]{the symmetry generated by the @f{b}-ghost should be nonanomalous}
]
The validity of this assumption is model-dependent; it is probably stronger than the vanishing of the BRST anomaly.

}


@slide["Construction of base form" #:tag "Base Form" #:showtitle #t]{

Let @f{\Omega_{\bf h}^{\tt C}} denote the @bold{equivariant} form, given
by Eq. (@ref{OmegaCartanCalF}). We will denote the
corresponding base form @f{\Omega^{\tt base}_{\bf h}}:
@equation{
   \Omega^{\tt base}_{\bf h} \in \Omega^{\bullet}({\rm LAG})\quad\mbox{ \tt\small base for } 
   \begin{array}{c}{\rm LAG}\cr \cr \downarrow\cr \cr H \backslash {\rm LAG}\end{array}
}
We will work under the @spn[attn]{assumption} that:
@itemlist[
@item{the action of @f{\bf h} on @f{\rm LAG} does not have fixed points}
]
Therefore @f{{\rm LAG}\rightarrow H\backslash{\rm LAG}} can be considered 
a principal @f{H}-bundle.
In order to construct the base form @f{\Omega^{\tt base}_{\bf h}} from the Cartan's @f{\Omega^{\tt C}_{\bf h}}, we first choose on 
this principal bundle
@bold{some} connection @f{{\cal A}}. (We understand the connection as a @f{\cal F}-valued 1-form
on @f{\rm LAG} computing the ``vertical component'' of a vector.) Then we apply
@hyperlink["../equivariant-cohomology/Base_is_Cartan_plus_exact.html"]{the horizonthal projection}
@italic{i.e.} replace 
@align[r.l @list[
@f{d\widehat{g} \widehat{g}^{-1}  \;}@f{\mapsto d\widehat{g} \widehat{g}^{-1} - {\cal A}}
]@list[
@f{\mbox{\tt\small in } \Omega^{\tt C}_{\bf h} \;}@f{= 
   \int_{gL} e^{d\widehat{g} \widehat{g}^{-1}}\Gamma(\Phi)\rho_{1\over 2}}
]]

Finally, we replace @f{\Phi} with
the curvature @f{d{\cal A} + {\cal A}^2} of the connection @f{\cal A}; we get:
@equation{
   \Omega_{\bf h} = 
   \int_{gL} e^{d\widehat{g} \widehat{g}^{-1} - {\cal A}}
   \Gamma( d{\cal A} + {\cal A}^2 )\rho_{1\over 2}
}

@bold{To conclude:}
@div[redbox]{
Generally speaking, it is @bold{not true} that @f{\Omega} descends from @f{\rm LAG} to 
@f{SG\backslash {\rm LAG}}. But we found a class of subalgebras of @f{{\bf sg}}, of the form @f{\bf h}, 
such that for any subalgebra from this class we can construct an equivariant form 
@f{\Omega^{\tt C}_{\bf h}}. Then the standard procedure can be used to construct
the corresponding base form @f{\Omega^{\tt base}_{\bf h}} which descends to 
@f{H\backslash G}.
The result, generally speaking, does depend on the choice of @f{\cal F}.
}

}





@slide[@elem{Algorithm for constructing @f{F}} #:tag "Algorithm For F" #:showtitle #t]{

We can construct such subalgebras in the following way. 
@itemlist[#:style 'ordered
@item{Start with some  subspace @f{F_1\subset {\cal G}} satisfying the property:
@equation{
   \forall x\in F_1:\;\forall y \in F_1:\;\{x,y\} = \Delta q_1(x,y)
}
with some @f{q_1\;:\; F_1\otimes F_1\to \mbox{Fun}(M)}; this implies that @f{[x,y]=-[y,x]}.
}
@item{Verify the existence of @f{q_2\;:\;F_1\otimes (F_1\wedge F_1)\to \mbox{Fun}(M)} such that:
   @equation[#:label "XwithYZ"]{
      \forall x\in F_1:\;\forall y \in F_1:\;\forall z\in F_1:\; \{x,[y,z]\} = \Delta q_2(x\otimes y\wedge z)
   }
   If this is not the case, then we must declare failure (the original space @f{F_1} 
   was a bad choice). But if Eq. (@ref{XwithYZ}) is satisfied, then we define:
   @equation{
      F_2 = F_1 + [F_1,F_1]
   }
It is useful to identify the subspace in the tensor algebra of @f{F_1} consisting of tensors with the symmetries of the free Lie algebra. 
For example, we may interpret @f{F_1\wedge F_1} as degree two elements of the free Lie algebra generated by @f{F_1}, because
at the degree two the only relation in the free Lie algebra is antisymmetry:
@align[r.l @list[
@f{\mbox{ \small instead of } F_1\wedge F_1 \mbox{ \small we write }\;}@f{{\tt FreeLie}^2 F_1}
]@list[
@f{\mbox{ \small instead of } x\wedge y \mbox{ \small we write }\;}@f{{1\over 2} [x,y]^{\rm F}}
]]
   (where @f{[\_\,,\_]^{\rm F}} stands for ``the commutator in the free Lie algebra'').
   We observe that under the condition (@ref{XwithYZ}) the ``nested commutator'' @f{[[x,y],z]} 
   (with @f{x}, @f{y} and @f{z} being any three elements of @f{F_1}) satisfies the Jacobi
   identity:
   @equation{
      [[x,y],z] + [[y,z],x] + [[z,x],y]  = 0
   }
}
@item{Verify the existence of @f{q_3\;:\; F_1\otimes {\tt FreeLie}^3F_1\to \mbox{Fun}(M)} such that:
   @align[r.l.n @list[
@f{}@f{\forall x\in F_1:\;\forall y \in F_1:\;\forall z\in F_1:\;\forall w\in F_1:\;}""
]@list[
@f{}@f{\{x,[[y,z],w]\} = \Delta q_3(x\otimes [[y,z]^{\rm F},w]^{\rm F})}@label{XwithYZW}
]]
   where @f{[\_\,,\_]^{\rm F}} is the commutator in the free Lie algebra.
   If this is true, define:
   @equation{
      F_3 = F_2 + [F_1,F_2]
   }
   Otherwize, say that the original space @f{F_1} was a bad choice.
}
@item{Continue recursively. For any Lie algebra, let us denote the ``nested commutator'' 
   @f{[x_1,\ldots,x_N]} as follows:
   @equation[#:label "DefNestedCommutator"]{
      [x_1,\ldots,x_N] = [[x_1,\ldots,x_{N-1}],x_N]
   }
   At each step, the only thing that we have to verify the existence of
   @f{q_N\;:\;F_1\otimes \mbox{\tt\small FreeLie}^NF_1\to \mbox{Fun}(M)} such that:
   @equation[#:label "XwithNested"]{
      \{x,[x_1,\ldots,x_N]\} = \Delta q_N(x,[x_1,\ldots,x_N]^{\rm F})
   }
   This automatically implies, that any expression composed of @f{N+1} letters @f{x} 
   (elements of @f{F_1}) using the operation @f{[\_\,,\_]} (@italic{e.g.} the nested commutator 
   (@ref{DefNestedCommutator})) automatically satisfies all the relations of the free Lie algebra. 
   In order to prove this, we notice that the
   nested commutator @f{[x_1,\ldots,x_{M+1}]}, provided that the condition (@ref{XwithNested}) holds 
   for any @f{N\leq M}, is obtained from @f{\{\ldots\{\{x_1,x_2\},x_3\},\ldots,x_{M+1}\}}
   by putting @f{\Delta} in front of @f{M} out of @f{M+1} @f{x}es, does not matter which ones.
   We only need to verify (@ref{XwithNested}), because other Poisson brackets will be @f{\Delta}-exact
   automatically; for example:
   @align[r.l @list[
@f{}@f{\{[x_1,x_2,x_3],[x_4,x_5,x_6]\} =}
]@list[
@f{=}@f{\{ \{\{x_1,\Delta x_2\}, \Delta x_3\} \;,\; [x_4,x_5,x_6]\} =}
]@list[
@f{=}@f{\{ \{\{\Delta x_1,\Delta x_2\}, x_3\} \;,\; [x_4,x_5,x_6]\} =}
]@list[
@f{=}@f{- \{ [x_4,x_5,x_6,x_1,x_2] , x_3\} - (1\leftrightarrow 2) -}
]@list[
@f{}@f{- \{\{\Delta x_1,\Delta x_2\}, \{x_3, [x_4,x_5,x_6]\}\} =}
]@list[
@f{=\;}@f{\Delta \Big(q_5(x_3,[x_4,x_5,x_6,x_1,x_2]^{\rm F}) - (1\leftrightarrow 2) -}
]@list[
@f{}@f{\;\;- (\{\{\Delta x_1,\Delta x_2\}, q_3(x_3, [x_4,x_5,x_6]^{\rm F})\})\Big)}
]]
}
@item{We define @f{F_{N+1}} as the space of expressions composed from @f{N+1} elements 
   of @f{F_1} using @f{[\_\,,\_]}.}
@item{Finally:
   @equation{
      F = F_{\infty}
   }
}
]
If this construction works (@italic{i.e.} if we are able to verify the existence 
of @f{q_N} satisfying Eq. (@ref{XwithNested}) at every step), then the resulting 
@f{F=F_{\infty}} can be understood as the space generated by the expressions obtained 
from generators of @f{F_1} by using operations @f{\Delta} and @f{\{\_\,,\_\}}, so that 
all but one generators @f{x_j} enter as @f{\Delta x_j} (and one remaining without 
@f{\Delta}). Notice that all the expressions where the number of @f{\Delta}'s is less than
the number of @f{x} minus one are automatically @f{\Delta}-exact, therefore Eq. (@ref{DefQ}).

Another interpretation (or rather consequence) of Eq. (@ref{XwithNested}) is that those expressions
constructed of from @f{x_j} and commutators, satisfy all the relations of the free Lie 
algebra, for example:
@align[r.l @list[
@f{}@f{[\,\,[x_1,[x_2,x_3]]\,,\,[x_4,x_5]\,\,] =}
]@list[
@f{=\;\;}@f{[\,\,[\,[x_1,[x_2,x_3]],x_4\,]\,,\,x_5\,\,]  \;+\;
   [\,\,x_4\,,\,[\,[x_1,[x_2,x_3]],x_5\,]\,\,]}
]]
There are generally speaking other relations between them, and therefore they are 
not a free Lie algebra. But they are @bold{a Lie algebra}. We will denote this Lie algebra @f{\cal F}.

@comment{Let us look at our nested commutators:
@equation{
   \{\Delta x_1,\{\Delta x_2,\ldots,\{\Delta x_N ,y\}\ldots\}\}
}
We are simpy acting on @f{y} by all the possible symmetries 
@f{\Delta x_1},...,@f{\Delta x_N} and thus ``filling the multiplet''. }

}

@slide[@elem{Canonical choice of @f{\cal F} in standard BRST formalism} #:tag "Case Of Standard BRST" #:showtitle #t]{
@short-intro{
A special case of the BV formalism is the ``standard'' BRST formalism. It works for such theories as
Yang-Mills/QCD, and also for the @hyperlink["../bosonic-string/index.html"]{bosonic string worldsheet theory}
and the @hyperlink["../Heterotic-RNS/index.html"]{RNS superstring}.
The most important property of such theories is the existence of a fermionic ``BRST symmetry''
which is nilpotent @bold{off-shell} (@italic{i.e.} nilpotent without using the equations of motion).

Here we will briefly review these standard BRST theories, and show that in this case exists a natural
choice for @f{\cal F}.
}

@table-of-contents[]



@section[#:tag "BriefReviewOfStandardBRST"]{Brief review of the ``standard'' BRST formalism}

@hyperlink["../BRST-formalism/index.html"]{The usual translation of the BRST formalism into the BV language} leads to the following Master Action:
@equation{
S_{\rm BV} = S_{\rm cl}(\phi) + (Q_{\rm BRST}c^A)c_A^{\star} + (Q_{\rm BRST}\phi^i)\phi_i^{\star}
} 
where @f{\phi^i} are collective notation for the ``classical fields'' (in the case
of Yang-Mills theory they would be the gauge fields @f{A_{\mu}(x)}).


@section{Standard choice of @f{\cal F}}
In this case we can choose @f{\cal F} to be the space of expressions:
@equation[#:label "StandardChoiceOfF"]{
\int  \xi^A \, c^{\star}_A
}
where @f{\xi^A} is the parameter of the gauge symmetry.

The resulting algebra @f{\Pi\Delta{\cal F}} is the algebra of gauge symmetries of the original
which we started with. Indeed, @f{\{\,S_{\rm BV}\,,\,\int  \xi^Ac^{\star}_A\,\}} is just the odd Hamiltonian of
the gauge symmetries:
@equation{
\{\,S_{\rm BV}\,,\,\int  \xi^Ac^{\star}_A\,\} = (\delta_{\xi}\phi^i) \phi_i^{\star} + [\xi,c]c^{\star}
}

@section[#:tag "sec:equivariant-omega-in-brst-case"]{Equivariant @f{\Omega} in BRST case}
@subsection{General formula}
@align[r.l.n @list[
  @f{\Omega\left(L\,,\,\sigma=d\Psi\,,\,\xi\right)\;=\;}
  @f{\int [dx \, dc\, db]\;\exp\left(\; S_0 + Q_{\rm BRST}\Psi \quad + \quad d\Psi \quad + 
     \quad \xi^{\alpha}{\partial\Psi\over\partial c^{\alpha}}\right)}
  ""
]
]

@subsection{Special case of bosonic string}
@align[r.l.n @list[
  @f{S_0+Q_{\rm BRST}\Psi\;=\;}
  @f{\int \left({1\over 2}\partial x \overline{\partial} x + b\overline{\partial}c \right) + Q_{\rm BRST}\Psi}
  ""
]@list[
  @elem[#:style 'no-break]{where @f{\Psi\;=\;}}
  @v-[4 @elem[#:style 'no-break]{@f{\Psi(x,b,c\,;\,\mu_1,\ldots,\mu_{3g-3})} where @f{\mu}'s parametrize the family @f{\Lambda} of LAGs}]
  ""
]
]
Usually @f{\Psi = \int b\mu}.

}

@slide["Expansion in antifields" #:tag "Expansion In Antifields" #:showtitle #t]{
On this page we will investigate the structure of @f{\cal F} from the point of view of the
antifield expansion. Suppose that we have the solution of the Master Equation in the form of the
series in the antifields:
@equation{
S_{\rm BV} = S_{\rm cl}(\phi) + (Q_{\rm BRST} \phi^i)\phi_i^{\star} + \ldots
}

@table-of-contents[]

@section[#:tag "SymmetryModuloBRST"]{Symmetry modulo BRST-exact expression}

Suppose that the leading term is invariant under some Lie algebra @f{\bf h} of infinitesimal transformations,
parametrized by @f{\xi}:
@equation[#:label "DefV"]{
\delta_{\xi} S_{\rm cl} \;=\; Q_{\rm BRST} \, v_{\xi}
}
Moreover, we assume:
@equation{
[\delta_{\xi},\delta_{\eta}] = \delta_{[\xi,\eta]}
}
Eq. (@ref{DefV}) implies:
@equation{
\delta_{\xi}v_{\eta} - \delta_{\eta}v_{\xi} - v_{[\xi,\eta]} \;\in\; \mbox{ker}(Q_{\rm BRST})
}
This defines the cohomology class:
@equation[#:label "ClassH2Lie"]{
[\xi,\eta\;\mapsto\;\delta_{\xi}v_{\eta} - \delta_{\eta}v_{\xi} - v_{[\xi,\eta]}] \;\in\; H^2_{\rm Lie}({\bf h},H^{-1}_{\rm BRST})
}
Let us @spn[attn]{assume} that we can construct the full expansion for a ghost number @f{-1} object:
@align[r.l.n @list[
 ""
 @f{{\cal V}_{\xi} \;=\;v_{\xi}(\phi) + (\delta_{\xi} \phi^i)\phi^{\star}_i + \ldots} 
 @label{GhostNumberMinusOneExpression}
]@list[
 @f{\mbox{\small\tt satisfying }} 
 @f{\{S_{\rm BV}\,,\,{\cal V}_{\xi}\} \;=\;0}
 "" 
]
]
The class (@ref{ClassH2Lie}) is an obstacle to choosing @f{{\cal V}_{\xi}} in such a way that:
@equation{
\{{\cal V}_{\xi}\,,\,{\cal V}_{\eta}\} \;=\; {\cal V}_{[\xi,\eta]}
}

@section[#:tag "EntersF"]{Enters @f{\cal F}}
For our applications, we need a special case when @f{{\cal V}_{\xi}} is BRST-exact:
@equation{
{\cal V}_{\xi} = \{S_{\rm BV},\Phi_{\xi}\}
}
Moreover, there is a @bold{special case} when the expansion of @f{\Phi_{\xi}} starts at the linear
order in antifields:
@align[r.l.n @list[
 @f{\Phi_{\xi} \;=\;} 
 @f{\alpha(\phi)^i\phi^{\star}_i + \alpha(\phi)^{ij}\phi^{\star}_i\phi^{\star}_j + \ldots}
 ""
]]
In this case @f{v_{\xi}(\phi)} is @bold{zero on-shell}. 

Generally speaking, the expansion of @f{\Phi_{\xi}} starts with the term constant in antifields.
In this case, all we can say about @f{v_{\xi}} is:
@centered[
@spn[greenbox]{@f{\Phi_{\xi}} exists ⇒ @f{v_{\xi}} on-shell is @f{Q_{\rm BRST}} of something}
]



@section{Particular cases}
@subsection{Standard BRST, standard polarization, off-shell symmetry}
@equation{
{\cal V}_{\xi} = \delta_{\xi}\phi^i \phi^{\star}_i
}
@italic{Apriori} @f{\bf h} may be unrelated to the gauge group. However, if @f{\bf h} is the gauge group,
then we have:
@equation{
{\cal V}_{\xi} = \{S_{\rm BV},\Phi_{\xi}\}
}
--- see Eq. (@ref{StandardChoiceOfF}).

@subsection{Bosonic string, @f{h} being diffeomorphisms}
This is @seclink["BriefReviewOfStandardBRST"]{standard BRST}, but with 
@hyperlink["../bosonic-string/LagrangianSubmanifold.html"]{rotated polarization}:
@equation{
{\cal V}_{\xi} = \int b^{\alpha\beta} (\nabla_{\alpha}\xi_{\beta})\;+\; (\delta_{\xi}\phi^i)\phi^{\star}_i
}
Notice that the term @f{\int b^{\alpha\beta} (\nabla_{\alpha}\xi_{\beta})} (constant in the antifields)
is the effect of rotated (with respect to standard) polarization. (In the standard approach @f{b^{\alpha\beta}} would
be counted as an antifield.)
Moreover, we have:
@equation{
{\cal V}_{\xi} = \{S_{\rm BV},\Phi_{\xi}\}
}
where @f{\Phi_{\xi} = \int \xi c^{\star}}.

@subsection{RNS}
@spn[attn]{TODO}, but conjectured to be of the same type as bosonic.

@subsection{Pure spinor string}
@spn[attn]{TODO}:
@itemlist[
@item{still @f{{\cal V}_{\xi} = \{S_{\rm BV},\Phi_{\xi}\}}, althought the expression for @f{\Phi_{\xi}} is rather complicated}
@item{the expansion (@ref{GhostNumberMinusOneExpression}) probably does not terminate on the term linear in the antifields}
@item{the possible obstacle (@ref{ClassH2Lie}) is potentially non-zero and should be computed}
]

}

@slide["Unsafe operations" #:tag "Unsafe operations" #:showtitle #t]{
As we @hyperlink["../BV-formalism/Infinite_dimensional_case.html"]{have previously explained}, the
operation @f{\Delta} is ill-defined in infinite-dimensional BV formalism.

Now we will show how this can lead to @f{\Omega} not being actually closed due to anomalies.

We have to prove that @f{d\omega_1 = 0} where @f{\omega_1(\widehat{V}\,) = \int {\cal H}e^S} where @f{{\cal H} = d\widehat{g}\widehat{g}^{-1}}.
The computation goes as follows. Consider the evaluation of @f{\cal H} on a vector @f{V}; the antifield expansion in the vicinity of @f{L_0} is:
@equation{
   {\cal H}(\phi)\langle V\,\rangle = b(\phi)\langle V\,\rangle + v^i(\phi)\langle V\,\rangle\phi_i^{\star} + \ldots
}
Terms @f{\ldots} of the higher order in @f{\phi^{\star}} do not matter.
@align[r.l.n @list[
@f{}@f{(d\omega_1)(V_1,V_2) \;=\;}""
]@list[
@f{\;=\;} @f{V_1(\omega_1(V_2)) - V_2(\omega_1(V_1)) - \omega([V_1,V_2])\;=\;} ""
]@list[
@f{\;=\;} @f{\int \left( \{{\cal H}\langle V_1\rangle, {\cal H}\langle V_2\rangle e^S\} 
                         - \{{\cal H}\langle V_2\rangle , {\cal H}\langle V_1\rangle e^S\} 
                         - {\cal H}\langle [V_1,V_2]\rangle e^S \right)\;=\;}""
]@list[
@f{\;=\;} @f{\int \left( \{{\cal H}\langle V_1\rangle ,{\cal H}\langle V_2\rangle\} e^S 
                        - \{S, {\cal H}\langle V_1\rangle {\cal H}\langle V_2\rangle\}e^S \right) \;=}""
]@list[
@f{\;=\;} @f{\int  \left(\{{\cal H}\langle V_1\rangle ,{\cal H}\langle V_2\rangle\}  
                  - Q(b\langle V_1\rangle b\langle V_2\rangle ) 
                  + \left(v^i\langle V_1\rangle {\partial S\over\partial \phi^i}b\langle V_2\rangle  
                          - (1\leftrightarrow 2)\right)\right)e^S \;=}@label{LineA}
]@list[
@f{\;=\;} @f{\int \left(\{{\cal H}\langle V_1\rangle ,{\cal H}\langle V_2\rangle\} 
                + \left(v^i\langle V_1\rangle {\partial S\over\partial \phi^i}b\langle V_2\rangle 
                       - (1\leftrightarrow 2)\right)\right)e^S \;=}@label{LineB}
]@list[
@f{\;=\;} @f{\int \left(\{{\cal H}\langle V_1\rangle ,{\cal H}\langle V_2\rangle\} 
                 - \left(v^i\langle V_1\rangle {\partial\over\partial\phi^i}b\langle V_2 \rangle 
                            - (1\leftrightarrow 2)\right)\right)e^S \;=}@label{LineC}
]@list[
@f{\;=\;} @f{0}""
]]
In passing from Line (@ref{LineA}) to Line (@ref{LineB}) we used the fact that @f{Q} is non-anomalous, in other words
@f{\int Q(\ldots)e^S=0}. In passing from Line  (@ref{LineB}) to Line (@ref{LineC}) we used that @f{v^i} is non-anomalous
in the sense that @f{{\partial v^i\over\partial \phi^i} = 0}. The assumption that @f{Q} is non-anomalous is quite reasonable, in fact
necessary for the consistency of the theory. But @spn[attn]{the ground for assuming} @f{{\partial v^i\over\partial \phi^i} = 0}
@spn[attn]{is much less solid}. One possibility is to require:
@equation{
  v^i = 0
}
which is more or less equivalent to:
@equation[#:label "BsCommute"]{
   \{B(V_1),B(V_2)\}=0
}
It is quite possible that there are other possible ways to make calculations 
meaningful, without imposing the ugly constraint (@ref{BsCommute}).


}


@slide["Reduction to integration over single Lagrangian submanifold" #:tag "As integration over single L" #:showtitle #t]{
@short-intro{
Here we will explain that integration over a family of Lagrangian submanifolds can be reduced to 
integration over a single Lagrangian submanifold in a larger phase space.
}
A family of Lagrangian submanifolds @f{\{L(\lambda)\subset M|\lambda\in\Lambda\}} defines a single
Lagrangian submanifold in @f{L_{\Lambda} \;\subset\; M\times \Pi T^*(\Pi T\Lambda)}. We will 
describe the construction of @f{L_{\Lambda}} in two steps: first locally in a vicinity of some point
of @f{\Lambda}, and then globally.

@table-of-contents[]

@section{Local construction}
Let us pick some fixed Lagrangian submanifold @f{L_0} from our family @f{\Lambda}:
@equation{
L_0 = L(\lambda_0)
}
Let us define a ``first try'' Lagrangial submanifold @f{\widetilde{L}\subset M\times \Pi T^*(\Pi T\Lambda)} as follows:
@equation{
\widetilde{L} = L_0\times \Pi T\Lambda
}
@comment{
this is a direct product of two Lagrangian submanifolds, @f{L(\lambda_0)\subset M} and the zero section @f{\Pi T\Lambda\subset \Pi T^*(\Pi T\Lambda)}
}
Locally, in the vicinity of @f{L_0}, we can present @f{\Lambda} as a family of gauge fermions @f{\Psi_{\lambda}\in\mbox{Fun}(L(\lambda_0))}
(for each @f{\lambda\in \Lambda}, sufficiently close to @f{\lambda_0}, the @f{L(\lambda)} is obtained from @f{L(\lambda_0)} as a deformation
corresponding to the gauge fermion @f{\Psi_{\lambda}}). Let us  consider the following function:
@align[r.l.n @list[
 @f{\phantom{\int}\widetilde{\Psi}\;\in\;} @f{\mbox{Fun}(\widetilde{L})\phantom{\int}} ""
]@list[
 @f{\phantom{\int}\widetilde{\Psi}(\phi,\lambda,\! @bxd{d\lambda}) \;=\;} @f{\Psi_{\lambda}(\phi)\phantom{\int}} ""
]
]
We consider it as a gauge fermion deforming @f{\widetilde{L}} to some new Lagrangian submanifold.
@bold{This new Lagrangian submanifold} is what we need; we call it @f{L_{\Lambda}}.

@section{Global definition of  @f{L_{\Lambda}} }

As a first step, let us consider a submanifold @f{L''\subset M\times \Lambda} which is defined as follows:
@equation[#:label "l-prime-prime"]{
L'' = \{ (m,\lambda) \;|\; \lambda\in\Lambda\;,\;m\in L(\lambda) \}
}
This can be promoted to a subspace @f{L'\subset M\times \Pi T\Lambda} quite trivially:
@equation[#:label "l-prime"]{
L' = \{ (m,\lambda,@bxd{d\lambda}) \;|\; (\lambda,@bxd{d\lambda})\in \Pi T\Lambda\;,\;m\in L(\lambda) \}
}
Finally, we will construct @f{L_{\Lambda}} as some section of the vector bundle
@f{M\times \Pi T^*(\Pi T\Lambda) \longrightarrow M\times \Pi T\Lambda}
restricted to @f{L'\subset M\times \Pi T\Lambda}. Which section?

The simplest guess would be the zero section. However 
@bold{that} would @bold{not} be a Lagrangian submanifold, so zero section is a wrong guess.
There @bold{is}, however, a natural @bold{nonzero section}. It is constructed as follows:
@align[l.l.n @list[
 @f{s\;:\;L' \rightarrow M\times \Pi T^*(\Pi T\Lambda)}
 ""
 ""
]@list[
 @f{s\,(m,\lambda,@bxd{d\lambda})\;=\;(m,\lambda,@bxd{d\lambda}\;,\;\;} 
 @f{\sigma(m) \;,\; 0)}
 @label{nonzero-section}
]@list[
 ""
 @f{\;\;∥\quad\quad ∥}
 ""
]@list[
 ""
 @f{\;\lambda^{\star} \;\;\;\; @bxd{d\lambda}^{\star}}
 ""
]
]
where @f{\sigma(m)} computes for every tangent vector to @f{\Lambda} the value of its corresponding generating function on @f{m\in L(\lambda)}.
This section defines our big Lagrangian submanifold:
@equation{
L_{\Lambda} = s(L')
}

@section{Integration}
There is a natural BV Hamiltonian @f{\widehat{d}} on @f{\Pi T^*(\Pi T\Lambda)}. It descirbes
the lift to @f{\Pi T^*} of the natural nilpotent vector field @f{d} on @f{\Pi T \Lambda}.
We have:
@align[l.n @list[
 @f{\int_{\Lambda}\Omega \;=\;\int_{L_{\Lambda}} \exp\left(S_{\rm BV} + \widehat{d}\right)} 
 ""
]@list[
 @elem[#:style 'no-break]{where @hspace[1] @f{\widehat{d} = @bxd{d\lambda}\lambda^{\star}}}
 ""
]
]
@hyperlink["../BRST-formalism/Yang-Mills.html"]{In the case of Yang-Mills theory}, the commonly accepted notations for fields are:
@tbl[#:orient 'vert @list[
 @list[
  @f{\lambda} @f{@bxd{d\lambda}} @f{\lambda^{\star}} @f{@bxd{d\lambda}^{\star}}
]@list[
  @f{\bar{c}} @f{\pi}            @f{\bar{c}^{\star}} @f{\pi^{\star}}
]
]]

@section{Proof that @f{L_Λ} is Lagrangian}
First of all, we have to eliminate the ambiguity in the definition of @f{\sigma}. We do this by lifting
@f{\Lambda} to a subset of @f{\widehat{G}}. Now to every point @f{\lambda\in\Lambda} corresponds @f{\widehat{g}(\lambda)\in\widehat{G}}, and:
@equation{
\sigma(m) = (d\widehat{g}\widehat{g}^{-1})(m)
}
@comment{
The way we defined @hyperlink["../BV-formalism/MomentMap.html#%28part._.Moment_map%29"]{the moment map}, 
@f{(d\widehat{g}\widehat{g}^{-1})(m)} is a function on @f{\Pi T\widehat{G}}. But since we lifted @f{\Lambda} to @f{\widehat{G}}, it defines
for us a function on @f{\Pi T\Lambda}, which is the same as a section of @f{\Pi T^{\star}\Lambda \rightarrow \Lambda}.
On the other hand, from any section: 
 @equation{s_0\;:\;\Lambda\rightarrow \Pi T^{\star}\Lambda} 
we can  naturally construct a section @f{s}
of @f{\Pi T^{\star}(\Pi T\Lambda) \rightarrow \Lambda} in the following way: first construct
@align[l.n @list[
 @f{\hat{s}_0\;:\;\Pi T\Lambda \rightarrow (\Pi T^* \otimes \Pi T)\Lambda} ""
]@list[
 @elem[#:style 'no-break]{
   @f{\hat{s}_0\;=\;(s_0\circ\pi)\otimes \mbox{id}} 
   where 
   @f{\pi\,:\,\Pi T\Lambda\rightarrow\Lambda} 
   and
   @f{\mbox{id}\,:\,\Pi T\Lambda\rightarrow\Pi T\Lambda} 
  } ""
]
]
and then compose it with the natural embedding @f{(\Pi T^* \otimes \Pi T)\Lambda\subset \Pi T^{\star}(\Pi T\Lambda)}.
This is what Eq. (@ref{nonzero-section}) does.
}
We have to prove that the restriction of the symplectic form of @f{M\times \Pi T^*(\Pi T\Lambda)} to @f{L_{\Lambda}} is zero.
We notice that it is equal to the pullback under the natural projection @f{L_{\Lambda}\;\rightarrow\; L''}
(see Eq. (@ref{l-prime-prime})) of the following 2-form on @f{L''}:
@align[l.n @list[
 @f{\omega + d(d_{\Lambda}\widehat{g}\widehat{g}^{-1})}
 @label{restriction-of-symplectic-form}
]@list[
 @elem[#:style 'no-break]{ where  @f{d = d_M + d_{\Lambda}} and @f{\omega} is the odd symplectic form on @f{M} } 
 ""
]
]
Therefore we need to prove that @f{\omega + d(d_{\Lambda}\widehat{g}\widehat{g}^{-1})} is zero.

Let @f{\ell} be a vector field on @f{\Lambda}. By @hyperlink["../BV-formalism/MomentMap.html"]{our definition of the moment map}, 
it generates the vector field @f{\{(\ell.\widehat{g})\widehat{g}^{-1}\,,\,\_\}} on @f{\widehat{G}}. 
Let @f{v} be a vector in @f{T_mM} tangent to @f{L(\lambda)}. Then, using @hyperlink["../BV-formalism/Odd_symplectic_manifolds.html"]{general formulas}:
@align[r.l.n @list[
 @f{\phantom{(-)^{\bar{\ell}}}
    \iota_v\iota_{\ell}\omega \;=\;} 
 @f{(-)^{\bar{\ell}}{\cal L}_v\left((\ell.\widehat{g})\widehat{g}^{-1}\right)}
 ""
]@list[
 @f{\phantom{(-)^{\bar{\ell}}}
    \iota_v\iota_{\ell} d(d_{\Lambda}\widehat{g}\widehat{g}^{-1})\;=\;}
 @f{(-)^{\bar{\ell}+1}{\cal L}_v\left((\ell.\widehat{g})\widehat{g}^{-1}\right)}
 ""
]
]
Therefore @f{\omega + d(d_{\Lambda}\widehat{g}\widehat{g}^{-1})} vanishes on any pair of vectors
when one of them is tangent to @f{L}.

Now let us consider a pair of vector fields @f{\ell_1} and @f{\ell_2} on @f{\Lambda}. 
Using the @hyperlink["../omega/Definition.html#(elem._.Maurer.Cartan.Equation)"]{Maurer-Cartan equation}:
@align[r.l.n @list[
 @f{\phantom{(-)^{\bar{\ell}}}
    \iota_{\{(\ell_1 .\widehat{g})\widehat{g}^{-1}\,,\,\_\}}
    \iota_{\{(\ell_2 .\widehat{g})\widehat{g}^{-1}\,,\,\_\}}
    \omega\;=\;}
 @f{(-)^{\bar{\ell}_2}\{(\ell_1  .\widehat{g})\widehat{g}^{-1}\,,\,(\ell_2  .\widehat{g})\widehat{g}^{-1}\}}
 @label{iota-m-iota-m-omega}
]@list[
 @f{\iota_{\ell_1 + \{(\ell_1 .\widehat{g})\widehat{g}^{-1}\,,\,\_\}}
    \iota_{\ell_2 + \{(\ell_2 .\widehat{g})\widehat{g}^{-1}\,,\,\_\}}
    d(d_{\Lambda}\widehat{g}\widehat{g}^{-1})\;=\;}
 @f{-{1\over 2}\iota_{\ell_1}\iota_{\ell_2}\{d_{\Lambda}\widehat{g}\widehat{g}^{-1}\,,\,d_{\Lambda}\widehat{g}\widehat{g}^{-1}\} \;+}
 ""
]@list[
 ""
 @f{+ \Big( \iota_{\ell_1}\iota_{\{(\ell_2 .\widehat{g})\widehat{g}^{-1}\,,\,\_\}} - (1\leftrightarrow 2) \Big)d_M(d_{\Lambda}\widehat{g}\widehat{g}^{-1})\;=}
 ""
]@list[
 @f{=}
 @f{(-)^{\bar{\ell}_2}\{(\ell_1  .\widehat{g})\widehat{g}^{-1}\,,\,(\ell_2  .\widehat{g})\widehat{g}^{-1}\} \;+}
 @label{iota-iota-dgg}
]@list[
 ""
 @f{+ \Big((-)^{(\bar{\ell}_1+1)(\bar{\ell}_2+1) + \bar{\ell}_1+1} \{(\ell_2  .\widehat{g})\widehat{g}^{-1}\,,\,(\ell_1  .\widehat{g})\widehat{g}^{-1}\} - (1\leftrightarrow 2)\Big)}
 ""
]
]
The sum of Eq. (@ref{iota-m-iota-m-omega}) and (@ref{iota-iota-dgg}) is zero, showing that @f{\omega + d(d_{\Lambda}\widehat{g}\widehat{g}^{-1})}
vanishes when both vectors are transverse to @f{L}.

Since @f{L(\lambda)} is a Lagrangian submanifold, this completes the proof that @f{\omega + d(d_{\Lambda}\widehat{g}\widehat{g}^{-1})} is zero.



}


@; ---------------------------------------------------------------------------------------------------


@(bystro-close-connection bystro-conf)
@disconnect[formula-database]

  

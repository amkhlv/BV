#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define bystro-conf   
   (bystro (bystro-connect-to-server (build-path (find-system-path 'home-dir) ".config" "amkhlv" "latex2svg.xml"))
           "integrated-vertex/formulas.sqlite"  ; name for the database
           "integrated-vertex" ; directory where to store image files of formulas
           25  ; formula size
           (list 255 255 255) ; formula background color
           (list 0 0 0) ; formula foreground color
           2   ; automatic alignment adjustment
           0   ; manual alignment adjustment
           ))
@(define singlepage-mode #f)
@(bystro-def-formula "formula-enormula-humongula!")

@(bystro-dump-LaTeX #f)

@title[#:style '(no-toc no-sidebar)]{Integrated vertex operator}



@bystro-ribbon[]

@hyperlink["../index.html"]{Return to index}

@table-of-contents[]

@hyperlink["../index.html"]{Return to index}

@bystro-ribbon[]


@slide["Integrated vertex = deformation of the action" #:tag "Deformations Of Action" #:showtitle #t]{

Suppose that we infinitesimally deformed the solution of the Master Equation by adding to it
some integrated vertex operator @f{U}:
@equation[#:label "DeformationOfSBV"]{
S_{\rm BV}(\varepsilon)  = S_{\rm BV} +  \varepsilon U
}
In order for this to satisfy the Master Equation to the first order in @f{\varepsilon} we require:
@equation[#:label "ClMEforU"]{
\{S_{\rm BV}\,,\,U\, \} = 0
}
@centered[@spn[redbox]{as we deform @f{S_{\rm BV}}, what should we do with @f{\cal F}?}]
The answer is simple if @f{U} satisfies the @bold{Siegel gauge}:
@equation[#:label "Siegel-gauge"]{
\forall \Phi \in {\cal F}\;:\;\{\Phi,U\} = 0 
}
In this case @f{\cal F} remains undeformed. 

On the @seclink["Deformation Of F"]{next page} we will explain what happens 
when Eq. (@ref{Siegel-gauge}) is not satisfied.
}


@slide[@elem{What happens to @f{\cal F}?} #:tag "Deformation Of F" #:showtitle #t]{
In this section, we assume  that the integrated vertex @f{U} satisfies the full
Master Equation:
@equation[#:label "MEforU"]{
\Delta U = 0
}
(rather than Eq. (@ref{ClMEforU})).
Here @f{\Delta U = \rho^{-1}_{1\over 2}\Delta_{\rm can} \left(\rho_{1\over 2} U\right)}
with @f{\rho_{1\over 2} = e^{S_{\rm BV}}}. We will also @spn[attn]{postulate} that @f{U} is diffeomorphism
invariant, which means @hyperlink["../omega/Subalgebra_F.html"]{in our formalism} that:
@equation[#:label "UisDiffInv"]{
\{\Delta \Phi,\,U\} =0
}
Eqs. (@ref{MEforU}) and (@ref{UisDiffInv}) imply that @f{\{U,\Phi\}} is @f{\Delta}-closed:
@equation[#:label "UFIsClosed"]{\Delta\{U,\Phi\}=0}
but we will also @spn[attn]{assume} (or just postulate) that it is @f{\Delta}-exact:
@align[r.l.l.n @list[
 @f{\exists\; a_U\;:\;{\cal F}\to \mbox{Fun}(M)} @f{:} "" ""
]@list[
 @f{\{U,\Phi\} }
 @f{\;=\;- \Delta a_U(\Phi)}
 ""
 @label["DefAPhi"]
]@list[
 @f{\mbox{\tt\small and } [\Delta\Phi\langle \xi\rangle\,,\,a_U(\Phi\langle\eta\rangle)]} 
 @f{\;=\;a_U(\Phi\langle[\xi,\eta]\rangle)}
 @elem[#:style 'no-break]{@hspace[1]@larger{←} @f{\Pi\Delta{\cal F}}-invariance of @f{a_U}}
 @label{ActionOfDiffeomorphismsOnFIsUndeformed}
]]
Under these assumptions we can deform:
@align[r.l.n @list[
 @f{\Phi\;\mapsto\;}
 @f{\Phi + \varepsilon a_U(\Phi)}
 @label{DiffeomorphismsAraUndeformed}
]@list[
 @f{\mbox{\tt\small so that } }
 @f{(\Delta + \varepsilon\{U\,,\,\_\})(\Phi + \varepsilon a_U(\Phi)) = \Delta \Phi}
 ""
]]
In other words:
@itemlist[
@item{the space @f{\cal F} does deform, according to Eq. (@ref{DiffeomorphismsAraUndeformed}), but
the action of diffeomorphisms on this space remains the same (Eq. (@ref{ActionOfDiffeomorphismsOnFIsUndeformed}))}
@item{the BV Hamiltonian of diffeomorphisms @f{\Delta \Phi} stays undeformed}
]
Is it true that the deformed @f{\Phi} remain @hyperlink["../omega/Subalgebra_F.html#(elem._.Def.Q)"]{in involution modulo @f{\Delta}-exact}?
Notice that the deformed @f{\{\Phi,\Phi\}} is automatically @f{\Delta + \varepsilon\{U\,,\,\_\}}-closed 
under already taken assumptions:
@equation{
(\Delta + \varepsilon\{U\,,\,\_\})\{\Phi + \varepsilon a_U(\Phi)\,,\,\Phi + \varepsilon a_U(\Phi)\}
\;=\;
2\{\Delta\Phi\,,\, \Phi + \varepsilon a_U(\Phi)\} = 0
}
Opening the parentheses, we derive that the expression @f{2 \{\Phi\,,\,a_U(\Phi)\} - \{U\,,\,q(\Phi)\}} is @f{\Delta}-closed:
@equation{
\Delta\left(2 \{\Phi\,,\,a_U(\Phi)\} - \{U\,,\,q(\Phi)\}\right) = 0
}
Let us @spn[attn]{assume} that it is also @f{\Delta}-exact:
@equation{
2 \{\Phi\,,\,a_U(\Phi)\} - \{U\,,\,q(\Phi)\}\;=\;\Delta q'(\Phi)
}
(the validity of this assumption depends on the cohomology of @f{\Delta}). 
Therefore, to the first order in the bosonic infinitesimal parameter @f{\varepsilon}:
@equation{
\{\Phi + \varepsilon a(\Phi) \;,\; \Phi + \varepsilon a(\Phi) \} = 
(\Delta + \varepsilon\{U,\_\})(q(\Phi) + \varepsilon q'(\Phi))
}
Therefore the @hyperlink["../omega/Subalgebra_F.html#(elem._.Def.Q)"]{condition of being in involution} persists, but
with deformed @f{q}:
@equation{
q \mapsto q + \varepsilon q'
}

}

@slide["Physical interpretation" #:tag "Physical Interpretation" #:showtitle #t]{
The BRST-nontrivial deformations of the action are called @bold{integrated vertices}
because they are integrals over the worldsheet of a dimension-(1,1) operator:
@equation{
U = \int_{\Sigma} d^2z \;u(z,\bar{z})
}

We interpret Eq. (@ref{DefAPhi}) as a requirement that the OPE of the integrated
vertex operator with the @f{b}-ghost be BRST-exact up to a total derivative.

@comment{
This is a vague statement, which requires proof. For bosonic string:
@equation{
\Phi_{\xi} = \int_{\Sigma} d^2z \; c^{\star}_{\alpha}\xi^{\alpha}(z,\bar{z})
}
Let us consder a special case when @f{\xi} is holomorphic  (only depends on @f{z}).
In this case @f{\Phi_{\xi}} generates a symmetry of the classical action (shift
of the @f{c}-ghost @f{c \mapsto c + \xi}). The Noether charge of this symmetry 
is @f{\int dz \xi(z) b_{++}}. Therefore, @f{\{\Phi,\_\}} corresponds to 
the OPE with @f{b_{++}}.
}

It was pointed out by @hyperlink["http://inspirehep.net/record/266677"]{Nelson} that 
@f{\oint_{z⥀0} dz\, z\, b_{++}(z) u(0)} and @f{\oint_{z⥀0} d\overline{z}\,\overline{z}\,b_{--}(\overline{z}) u(0)}
could be non-zero. Only their @bold{difference} (denoted @f{(b_0 -\bar{b}_0)u}) should be zero.
This is because, in order to define the integration over the moduli space, we do not
actually need the integration form to be completely horizonthal. 
There is some partial canonical gauge fixing.

}


@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection bystro-conf)

@(bystro-close-connection bystro-conf)
@disconnect[formula-database]

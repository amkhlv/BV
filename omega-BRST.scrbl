#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define bystro-conf   
   (bystro (bystro-connect-to-server (build-path (find-system-path 'home-dir) ".config" "amkhlv" "latex2svg.xml"))
           "omega-BRST/formulas.sqlite"  ; name for the database
           "omega-BRST" ; directory where to store .png files of formulas
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

@title[#:style '(no-toc no-sidebar)]{Form @f{\Omega} in BRST formalism}


@bystro-ribbon[]

@hyperlink["../index.html"]{Return to index}

@table-of-contents[]

@hyperlink["../index.html"]{Return to index}

@bystro-ribbon[]

@slide[@elem{Ordinary @f{\Omega}} #:tag "Form Ω" #:showtitle #t]{
@section{Definition of @f{\Omega}}
Remember that the set of fields @f{\phi} consists of the ``classical'' fields @f{\varphi},
plus ghosts @f{c}, plus BRST quartets.
@align[r.l.n @list[
  @f{\Omega\;=\;}
  @f{\int [d\phi] \exp\left(\; S_{\rm cl}(\varphi) + Q_{\rm BRST}\Psi \quad + \quad d\Psi\;\right)}
  @label{def-omega}
]@list[
  @f{d\Omega\;=\;}
  @f{0}
  ""
]
]

@section{Symmetries}
Symmetries correspond to those @f{\Psi} which are BRST exact plus equations of motion.
In other words, for any vector field @f{\zeta} on the field space and any functional
@f{F} the following @f{\delta\Psi} should correspond to a symmetry:
@equation[#:label "symmetries"]{
\delta_{F,\zeta}\Psi \quad = \quad Q_{\rm BRST}F \quad +\quad {\cal L}_{\zeta}S_{\rm cl} + [{\cal L}_{\zeta},Q_{\rm BRST}]\Psi
}
@comment{
The second term on the RHS, @f{{\cal L}_{\zeta}S_{\rm cl} + [{\cal L}_{\zeta},Q_{\rm BRST}]\Psi}, can be interpreted as
the term @f{{\cal L}_{\zeta}(S_{\rm cl} + Q_{\rm BRST}\Psi)} which vanish on-shell, plus @f{Q_{\rm BRST}({\cal L}_{\zeta}\Psi)} which
combines with the first term @f{Q_{\rm BRST}F}.
}

@section{No horizontality}
The form @f{\Omega} given by Eq. (@ref{def-omega}) is not horizontal, but the contraction is an exact form:
@align[r.l.n @list[
  @f{\iota_{\delta_{\zeta,F}}\Omega\;=\;}
  @f{\int [d\phi]\left(Q_{\rm BRST}F \;+\; {\cal L}_{\zeta}S_{\rm cl} + [Q_{\rm BRST},{\cal L}_{\zeta}]\Psi\right) 
     \exp\left(S_{\rm cl}(\varphi) + Q_{\rm BRST}\Psi + d\Psi\right) \;=\;}
  ""
]@list[
  @f{\;=\;}
  @f{d\int [d\phi] \;\left(F + {\cal L}_{\zeta}\Psi\right)\exp\left(S_{\rm cl}(\varphi) + Q_{\rm BRST}\Psi + d\Psi\right)}
  @label{iota}
]
]
On the @seclink["Equivariant Ω"]{next page} we will discuss the equivariant form.
}

@slide[@elem{Equivariant @f{\Omega}} #:tag "Equivariant Ω" #:showtitle #t]{
Let us @spn[attn]{assume} that the symmetries defined in Eq. (@ref{symmetries}) form a closed algebra. 
It is parametrized by @f{F} and @f{\zeta}.

We have the following Cartan form:
@equation[#:label "equivariant-omega-in-BRST-formalism"]{
\Omega^{\tt C}(\Psi,d\Psi,F,\zeta)\;=\;
\int [d\phi] \exp\left(\; S_{\rm cl}(\varphi) \;+\; (Q_{\rm BRST} + d + {\cal L}_{\zeta})\Psi \; + \; F \;\right)
}
This is always true to the first order in @f{F} and @f{\zeta}. For this to be true to all orders in @f{F} and @f{\zeta}, we need:
@align[r.l.n @list[
  @f{{\cal L}_{\zeta}^2 \;=\;} @f{0} @label{zeta-is-nilpotent}
]@list[
  @v-[2 @f{{\cal L}_{\zeta}F\;=\;}] @f{0} @label{phi-is-zeta-invariant}
]
]
@comment{
Let us summarize the derivation. We have:
@equation{
(Q_{\rm BRST} + d + {\cal L}_{\zeta})^2 \;=\; [Q_{\rm BRST}\,,\,{\cal L}_{\zeta}]
}
Therefore:
@align[r.l.n @list[
  ""
  @f{d\;\int [d\phi] \exp\left(\; S_{\rm cl}(\varphi) \;+\; (Q_{\rm BRST} + d + {\cal L}_{\zeta})\Psi \; + \; F \;\right)\;=\;}
  @label{differential-of-equivariant-form}
]@list[
  @f{\;=\;}
  @f{\int [d\phi] (Q_{\rm BRST} + d + {\cal L}_{\zeta}) 
     \exp\left(\; S_{\rm cl}(\varphi) \;+\; (Q_{\rm BRST} + d + {\cal L}_{\zeta})\Psi \; + \; F \;\right)\;=\;}
  @label{differential-equals-to}
]@list[
  @f{\;=\;}
  @f{\int [d\phi] \;
     \left(Q_{\rm BRST} F + {\cal L}_{\zeta}S_{\rm cl} + [Q_{\rm BRST},{\cal L}_{\zeta}]\Psi \right) \;
     \exp\left(\; S_{\rm cl}(\varphi) \;+\; (Q_{\rm BRST} + d + {\cal L}_{\zeta})\Psi \; + \; F \;\right)}
  ""
]
]
In passing from (@ref{differential-of-equivariant-form}) to (@ref{differential-equals-to}) we assumed that both 
@f{Q_{\rm BRST}} and @f{\zeta} preserve the measure of integration @f{[d\phi]}. 

The last line coincides with Eq. (@ref{iota}).
}

}

@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection bystro-conf)
@disconnect[formula-database]

  

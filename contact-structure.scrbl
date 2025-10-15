#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define bystro-conf   
   (bystro (bystro-connect-to-server (build-path (find-system-path 'home-dir) ".config" "amkhlv" "latex2svg.xml"))
           "contact-structure/formulas.sqlite"  ; name for the database
           "contact-structure" ; directory where to store image files of formulas
           25  ; formula size
           (list 255 255 255) ; formula background color
           (list 0 0 0) ; formula foreground color
           2   ; automatic alignment adjustment
           0   ; manual alignment adjustment
           ))
@(define singlepage-mode #f)
@(bystro-def-formula "formula-enormula-humongula!")


@title[#:style '(no-toc no-sidebar)]{Odd contact manifolds}

@bystro-ribbon[]

@hyperlink["../index.html"]{Return to index}

@bystro-toc[]

@hyperlink["../index.html"]{Return to index}

@bystro-ribbon[]


@slide["Quantomorphisms" #:tag "Quantomorphisms" #:showtitle #t]{

Suppose that exists an  @f{{\bf R}^{0|1}}-bundle over @f{M}:
@e{
\widehat{M} \stackrel{\widehat{\pi}}{\longrightarrow} M
}
with a connection such that the curvature is equal to @f{\omega}. Then we can realize the 
@hyperlink["../BV-formalism/MomentMap.html"]{central extension @f{\widehat{G}}} as the group of automorphisms of this bundle.

We have the exact sequence: 
@e{
0\rightarrow \mbox{Inv}_{{\bf R}^{0|1}}(\Gamma(T\widehat{M}/M\,)) \rightarrow \mbox{Inv}_{{\bf R}^{0|1}}(\mbox{Vect}(\widehat{M}\,)) \xrightarrow{\widehat{\pi}_*} \mbox{Vect}(M\,)\rightarrow 0
}
which can be thought of as an exact sequence of algebroids over @f{M}, or just of Lie superalgebras. It 
involves the Atiyah algebroid @f{\mbox{Inv}_{{\bf R}^{0|1}}(\mbox{Vect}(\widehat{M}))} whose anchor is @f{\widehat{\pi}_*}. The kernel of @f{\widehat{\pi}_*} is the 
@f{0|1}-dimensional space @f{\mbox{Inv}_{{\bf R}^{0|1}}(\Gamma(T\widehat{M}/M\,))}. A connection is a split:
@e{
\underline{\rm lift}\;:\; \mbox{Vect}(M)\rightarrow \mbox{Inv}_{{\bf R}^{0|1}}(\mbox{Vect}(\widehat{M}))
}
Suppose that we can find a ``symplectic potential'' @f{\alpha} such that @f{\omega = d\alpha}. Then we can use it to 
construct the connection satisfying:
@e{
[\underline{\rm lift}(v_1),\underline{\rm lift}(v_2)]\;=\; \underline{\rm lift}([v_1,v_2]) + \omega(v_1,v_2) \partial_{\vartheta}
}
where @f{\partial_{\vartheta}} is the vector field arizing from the action of @f{{\bf R}^{0|1}} on @f{\widehat{M}}. (We can think of @f{\vartheta} as a coordinate 
                                                                                                                        in the fiber;
                                                                                                                        it is only defined locally, but @f{\partial_{\vartheta}} is globally well-defined.) Explicitly:
@e[#:label "ConnectionAsLift"]{
\underline{\rm lift}(v) = v + (\iota_v\alpha)\partial_{\vartheta}
}
Let us consider the subalgebra @f{{\bf g}\subset \mbox{Vect}(M)} consisting of Hamiltonian vector fields. For every even (we will restrict to even vector fields for simplicity) @f{\{H,\_\}\in {\bf g}} consider the following vector field on @f{\widehat{M}}:
@e[#:label "DefHHat"]{
\hat{\xi}_H \;=\; \{H,\_\} + (\iota_{\{H,\_\}}\alpha + H) \partial_{\vartheta}
}
It is defined to preserve the connection. An explicit calculation shows that the Lie derivative vanishes:
@e{
{\cal L}_{\hat{\xi}_H} (d\theta - \alpha) = 0
}
Notice that the vertical component of @f{\hat{\xi}_H} (with respect to the connection defined in Eq. (@ref{ConnectionAsLift})) is @f{H\partial_{\vartheta}}.
By construction, the space of vector fields of this form is closed under commutator. We can check it 
directly, using the formula: 
@align[r.l @list[
@f{}@f{\left[\; \{H,\_\} + (\iota_{\{H,\_\}}\alpha + H)\partial_{\vartheta}\;,\; \{F,\_\} + (\iota_{\{F,\_\}}\alpha + F)\partial_{\vartheta} \;\right]\;=\;}
]@list[
@f{\;=\;}@f{\{\{H,F\},\_\}\;+\; \left( {\cal L}_{\{H,\_\}}(\iota_{\{F,\_\}}\alpha) - {\cal L}_{\{F,\_\}}(\iota_{\{H,\_\}}\alpha) + 2\{H,F\} \right)\partial_{\vartheta}\;=\;}
]@list[
@f{\;=\;}@f{\{\{H,F\}\,,\,\_\}\;+\; \left(\iota_{\{\{H,F\},\_\}}\alpha + \{H,F\}\right)\partial_{\theta}}
]]
As a Lie algebra this is @f{\Pi\mbox{Fun}(M)}. It integrates to the group of automorphisms of the 
fiber bundle @f{\hat{M}\to M} which preserve the connection defined in Eq. (@ref{ConnectionAsLift}).
}

@slide[@elem{Form @f{\Omega} as a form on the space of Legendrian submanifolds @f{\rm LEG}} #:tag "Form on LEG" #:showtitle #t]{
A Legendrian submanifold in @f{\widehat{M}} projects to a Lagrangian submanifold in @f{M}: 
@e{
\pi(\widehat{L}) = L
}
This projection is typically @bold{not} one-to-one; it is a cover. We can define @f{\Omega}
as a PDF on the space of Legendrian submanifolds by interpreting
@hyperlink["../omega/Definition.html#%28part._.Definition_of_%29"]{the definition}
as integration over the projection:
@e{
\Omega(\widehat{g},d\widehat{g}) \;=\;\int_{\pi(\widehat{g}\widehat{L})}\exp\left(d\widehat{g}\widehat{g}^{-1}\right)\rho_{1\over 2} 
}
This descends to a closed PDF on the space of Legendrian submanifolds @f{\rm LEG}.


}


@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection bystro-conf)
@disconnect[formula-database]

  

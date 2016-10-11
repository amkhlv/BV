#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define bystro-conf   
   (bystro (bystro-connect-to-server (string->path "/var/www/bystroConf.xml"))
           "pure-spinor/formulas.sqlite"  ; name for the database
           "pure-spinor" ; directory where to store .png files of formulas
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
@title[#:style '(no-toc no-sidebar)]{Pure spinor superstring}

@bystro-ribbon[]

@hyperlink["../index.html"]{Return to index}

@table-of-contents[]

@hyperlink["../index.html"]{Return to index}

@bystro-ribbon[]

@use-LaTeX-preamble{
  \newcommand{\dg}[2]{
    \mathrel{\mathop{dg}\limits_{\tiny ╰───╯}\!}_{#1}^{#2} 
  }
}

@slide["Action of diffeomorphisms" #:tag "Diffeomorphisms" #:showtitle #t]{
The worldsheet theory of the pure spinor superstring does not contain the
worldsheet metric. This means that the action of the sigma-model is @bold{not invariant}
under diffeomorphisms. However, it is 
@hyperlink["../omega/Expansion_In_Antifields.html#(part._.Symmetry.Modulo.B.R.S.T)"]{invariant up to a BRST exact expression}:
@equation{
\delta_{\xi} S_{\rm cl} = Q_{\rm BRST} \int \xi^{\alpha}\nabla^{\beta}b_{\alpha\beta}
}
To set up the basic BV machinery, we have to answer the following questions:
@itemlist[
@item{Is it possible to construct the 
@hyperlink["../omega/Expansion_In_Antifields.html#(elem._.Ghost.Number.Minus.One.Expression)"]{symmetry generator} 
@f{{\cal V}_{\xi}}?}
@item{Is it true that exists @f{\Phi_{\xi}} such that @f{{\cal V}_{\xi} = \{S_{\rm BV},\Phi_{\xi}\}}?}
@item{If @f{\Phi_{\xi}} exist, is  it true that  satisfy 
@hyperlink["../omega/Subalgebra_F.html#(elem._.Def.Q)"]{our constraint} @f{\{\Phi_{\xi},\Phi_{\xi}\} = \{S_{\rm BV},q\}}?}
]
According to @cite{Berkovits:2014ama} the @f{b}-ghost in a general curved background is only holomorphic (on-shell)
up to @f{Q_{\rm BRST}} of something. 
@hyperlink["../omega/Expansion_In_Antifields.html#(part._.Enters.F)"]{This implies} that @f{\Phi_{\xi}} must
start with the term constant in antifields 
(unlike @hyperlink["../bosonic-string/IntegrationOverFamily.html#(part._.Choice.Of.F)"]{bosonic string}).

}

@slide["Structure of the action" #:tag "Action" #:showtitle #t]{
The action consists of the matter term (a generic sigma-model) and some ghost terms.
The ghost terms are of the form:
@equation{
\int \langle w_L,\wedge\bar{\partial}\lambda^L \rangle + \langle w_R,\wedge \partial\lambda^R\rangle
}
with the following notations:
@itemlist[
@item{@f{\lambda^L} and @f{\lambda^R} are scalars on the worldsheet taking values in the spin bundle
over the target space; they satisfy the pure spinor constraints}
@item{@f{w_L} and @f{w_R} are 1-forms on the worldsheet taking values in the dual to the spin
bundle over the target space; there is some gauge symmetry because @f{\lambda_L} and @f{\lambda_R}
satisfy the pure spinor constraints}
@item{@f{\langle\, ,\rangle} is the pairing between the conjugate to the spin bundle and the spin bundle}
@item{the Dolbeault operators @f{\partial} and @f{\bar{\partial}} are 
@hyperlink["../worldsheet-complex-structure/worldsheet-complex-structure.html"]{explained here}}
]
Strictly speaking, instead of @f{\partial} and @f{\bar{\partial}} one has to use the target space-covariant
derivatives:
@equation{
\partial + A(\partial Z)
}
where @f{A} is some connection in the target space spin bundle.

There is also some quartic term  @f{w^L w^R\lambda_L\lambda_R}.
}

@slide["Master Action in flat space" #:tag "Master Action in flat space" #:showtitle #t]{
The case of flat space in pure spinor formalism is actually a somewhat singular limit of the general
curved background. The coefficient in front of @f{\bar{\partial}\theta_L\partial\theta_R} goes to
infinity; one needs to pass to the first order formalism @f{p_L\bar{\partial}\theta_L + p_R\partial\theta_R}.
(Explicit formulas can be found @hyperlink["http://arxiv.org/abs/1203.0677"]{here}.)

The main formulas are @hyperlink["http://andreimikhailov.com/math/pure-spinor-formalism/flat-space/ActionAndBRST.html"]{listed here}.
The fundamental fields are 
@f{x^m,\theta_L^{\alpha},\theta_R^{\hat{\alpha}}, p^L_{\alpha +}, p^R_{\hat{\alpha} -}, \lambda_L^{\alpha}, \lambda_R^{\hat{\alpha}}, w^{\alpha}_{L+}, w^{\hat{\alpha}}_{R-}}.
It is useful to introduce in addition the following composite fields @f{d_{\pm}}, 
which are defined in terms of those fundamental:
(@spn[attn]{TODO:} verify coefficients):
@align[r.l.n @list[
 @f{d_+\;=\;}
 @f{p_+ + {1\over 2}\partial_+x^m\Gamma_m\theta_L + {1\over 6}(\theta_L\Gamma^m\partial_+\theta_L)\Gamma_m\theta_L}
 @label{DLeft}
]@list[
 @f{d_-\;=\;}
 @f{p_- + {1\over 2}\partial_-x^m\Gamma_m\theta_R + {1\over 6}(\theta_R\Gamma^m\partial_-\theta_R)\Gamma_m\theta_R}
 @label{DRight}
]
]
The BV Master Action is:
@align[r.l.n @list[
 @f{S_{\rm BV} \;=\;\int d\tau^+ d\tau^- \;} 
 @f{{1\over 2}\partial_+x^m\partial_-x^m + p_+\partial_-\theta_L + p_-\partial_+\theta_R + 
    w_{+}\partial_-\lambda_L + w_{-}\partial_+\lambda_R\;+\;}
 ""
]@list[
 ""
 @f{\;+\; \lambda^{\alpha}_L \left( {\theta^{\star}_{L\alpha}} - {\partial d_{\beta +}\over\partial \theta^{\alpha}_L} p^{\star\beta +} \right)
        + \lambda^{\hat{\alpha}}_R 
          \left( 
                \theta^{\star}_{R\hat{\alpha}} - {\partial d_{\hat{\beta}-}\over\partial \theta^{\hat{\alpha}}_R} p^{\star\hat{\beta}-} 
          \right)\;+}
 ""
]@list[
 ""
 @f{\;+\; {1\over 2} \left( 
                       (\lambda_L\Gamma^m\theta_L) + (\lambda_R\Gamma^m\theta_R)
                     \right) \left( 
                                   x^{\star}_m - {\partial d_{\alpha +}\over\partial x^m} p^{\star\alpha +} -  {\partial d_{\hat{\alpha}-}\over\partial x^m} p^{\star\hat{\alpha} -}
                             \right) +}
 ""
]@list[
 ""
 @f{\;+\; d_{+} w^{\star +} 
        + d_{-} w^{\star -}
        + (\Pi^m_+\Gamma_m\epsilon\lambda_L)_{\hat{\alpha}}p^{\star \hat{\alpha} +}
        + (\Pi^m_-\Gamma_m\epsilon\lambda_R)_{\alpha}p^{\star\alpha -}}
 ""
]
]
Notice that both @f{w^{\star +}} and @f{w^{\star -}} are constrained:
@equation[#:label "anti-w-is-pure"]{
(\lambda_L\Gamma^m w^{\star +}) = (\lambda_R\Gamma^m w^{\star -}) = 0
}
The Hamiltonian generating the action of @bold{left conformal} transformations on the @bold{left} fields is easy to write:
@align[r.l.l.n @list[
 @f{{\cal H}\langle\xi\rangle \;=\;}
 @f{\int d\tau^+d\tau^-}
 @f{(\xi^z\partial_z x^m) x^{\star}_m + (\xi^z\partial_z\lambda_L)\lambda_L^{\star} + ({\cal L}_{\xi} w_+) w^{\star +} + ({\cal L}_{\xi} p_+)p^{\star +}}
 @label{left-conformal-generator}
]
]
It must be true that it is BV-exact:
@equation[#:label "left-conformal-generator-via-phi"]{
{\cal H}\langle\xi\rangle \;=\; \{S_{\rm BV},\Phi\langle\xi\rangle\}
}
where @f{\Phi\langle\xi\rangle} is the BV Hamiltonian generating the holomorphic symmetry corresponding to
the Noether charge @f{\int \xi^zb_{zz} dz}. 
Notice that  @f{\{\Phi\langle\xi\rangle\,,\,\Phi\langle\eta\rangle\} \;=\;0} as a consequence of the nilpotence
of the @f{b}-ghost. 

In any case, in order to construct the base @f{\Omega}, we need to solve 
@hyperlink["../omega/Equivariant_Form.html#(elem._.Equation.For.Log.For.Equivariant)"]{the equation for} @f{a(\xi)}: 
@equation[#:label "EquationForAInLeftSector"]{
\Delta e^{a(\xi)} = {\cal H}\langle\xi\rangle e^{a(\xi)}
}
}

@slide[@elem{Structure of the @f{b}-ghost in flat space} #:tag "B Ghost Flat Space" #:showtitle #t]{
It depends on the worldsheet complex structure, in the following way. The worldsheet complex structure
defines operators @f{\partial} and @f{\overline{\partial}} which act from @f{(p,q)}-forms to
@f{(p+1,q)}- and @f{(p,q+1)}-forms, respectively. 

The action is:
@align[r.l.n @list[
 @f{S_{\rm cl}=} 
 @f{\int \Big( \partial x\wedge \overline{\partial}x + p\wedge \partial \theta_R + p \wedge \overline{\partial}\theta_L +
               w\wedge\partial\lambda_R + w\wedge\overline{\partial}\lambda_L
         \Big)}
 ""
]
]

The leading term of the @f{b}-ghost is:
@align[r.l.n @list[
 @f{b_{++}=} @f{{(CP_+d_+)\over (C\lambda)}} ""
]@list[
 @f{b_{--}=} @f{{(CP_-d_-)\over (C\lambda)}} ""
]
]

}

@slide[@elem{Structure of the @f{b}-ghost in @f{AdS_5\times S^5}} #:tag "B Ghost AdS" #:showtitle #t]{
From @cite{Berkovits:2010zz}:
@equation{
b_{++} = {\mbox{Str}\left(\lambda_R [J_2(\partial_+),J_1(\partial_+)]\right)\over 2\,\mbox{Str}(\lambda_R\lambda_L)} - 
\mbox{Str}(w_1(\partial_+)(1-K)J_3(\partial_+))
}
The notations @f{\omega(\partial_+)} are @hyperlink["../worldsheet-complex-structure/worldsheet-complex-structure.html"]{explained here},
and @f{K} is some projector. 
}

@slide[@elem{BV Hamiltonian Of Diffeomorphisms} #:tag "Diffeomorphism Hamiltonian" #:showtitle #t]{
@short-intro{
Here we will discuss the 
@hyperlink["../omega/Expansion_In_Antifields.html#(elem._.Ghost.Number.Minus.One.Expression)"]{BV Hamiltonian}
@f{{\cal V}_{\xi}} corresponding to diffeomorphisms.
}

@table-of-contents[]
@section{BRST analysis}
It was shown in @cite{Berkovits:2010zz} that this composite @f{b}-ghost is holomorphic on-shell modulo
BRST exact terms; in other words:
@equation[#:label "HolomorphicityOfBGhost"]{
\int \partial^{\alpha}\xi^{\beta} b_{\alpha\beta} = {\cal X}_{\xi} S_{\rm cl} + Q_{\rm BRST} A_{\xi}
}
where @f{A_{\xi}} is some functional and @f{{\cal X}_{\xi}} is some field transformation. 
Eq. (@ref{HolomorphicityOfBGhost}) defines @f{{\cal X}_{\xi}} up to:
@equation[#:label "AmbiguityInX"]{
{\cal X}_{\xi} \;\mapsto\; {\cal X}_{\xi} + {\partial S\over\partial \phi^i}\sigma^{ij}(\phi){\partial\over\partial \phi^i}
} 
with some antisymmetric @f{\sigma^{ij}}. 
@comment{
We are tempted to say that @f{{\cal X}_{\xi}} is well-defined on-shell. However,
in our situation @f{{\cal X}_{\xi}} does @bold{not} preserve the equations of motion. Therefore, we would @bold{not} be able 
to type it as a vector field on the classical phase space. The best thing we can say about @f{{\cal X}_{\xi}} is that
it is a vector field on the space of fields defined up to an ambiguity of the form (@ref{AmbiguityInX}).
}

In some sense, @f{{\cal X}_{\xi}} is the analogue of @f{\xi^{\alpha}{\partial\over\partial c^{\alpha}}} in bosonic string.

@bold{Tentative Definition @defn-num{IdentificationOfFieldTransformation}:} we will tentatively define 
@spn[attn]{the action of diffeomorphisms} on the worldsheet sigma-model as follows:
@equation[#:label "NaiveDefinitionOfDiff"]{
{\bf Diff}_{\xi} = [Q_{\rm BRST}, {\cal X}_{\xi}]
}
--- the anticommutators of two field transformations. 
This definition automatically implies:
@equation[#:label "DiffScl"]{
{\bf Diff}_{\xi}S_{\rm cl} = \int \partial^{\alpha}\xi^{\beta} Qb_{\alpha\beta}
}
There are @spn[attn]{two problems} here:
@itemlist[
@item{in the pure spinor formalism, @f{T = Qb} only on-shell; therefore the validity of (@ref{DiffScl}) as a motivation
for (@ref{NaiveDefinitionOfDiff}) is dubious}
@item{the ambiguity (@ref{AmbiguityInX}) translates into some ambiguity in @f{{\bf Diff}_{\xi}} and in
particular precludes us from even asking ``@f{[{\bf Diff}_{\xi}\,,\,{\bf Diff}_{\eta}] = ?}''}
]

@comment{
A possible @spn[attn]{naive} argument: ``the energy-momentum @f{T_{\alpha\beta}} generates diffeomorphisms; 
but @f{Qb_{\alpha\beta}=T_{\alpha\beta}} therefore @f{b_{\alpha\beta}} generates @f{{\cal X}} satisfying
(@ref{NaiveDefinitionOfDiff})''. However it is not clear to us in which sense the energy-momentum tensor
generates diffeomorphisms.
}

@section{BV analysis}
We are tempted to define the
@hyperlink["../omega/Expansion_In_Antifields.html#(elem._.Ghost.Number.Minus.One.Expression)"]{BV Hamiltonian of a diffeomorphism}
as follows:
@align[r.l.n @list[
 @f{{\cal V}_{\xi} \;=\;} 
 @f{\{S_{\rm BV} \,,\, \Phi_{\xi}\}}
 @label{VisExact}
]@list[
 @f{\mbox{\tt\small where } \Phi_{\xi} \;=\; }
 @f{A_{\xi} + {\cal X}^i_{\xi} \phi^{\star}_i + \ldots}
 ""
]
]
Here @f{\ldots} stands for the terms quadratic and higher order in the antifields. 
We can change:
@equation{
\Phi_{\xi} \mapsto \Phi_{\xi} + \{S_{\rm BV}\,,\,\Psi_{\xi}\}
}
(If @f{\Psi_{\xi}} starts with the terms quadratic in the antifields, this corresponds to Eq. (@ref{AmbiguityInX})). 
We @spn[attn]{should be able} to fix this ambiguity so that the resulting @f{{\cal V_{\xi}}} satisfy
the algebra of vector fields on the worldsheet:
@equation{
\{{\cal V}_{\xi}\,,\,{\cal V}_{\eta}\} = {\cal V}_{[\xi,\eta]}
}
@spn[attn]{Open problem:} how do we see that such a choice of @f{{\cal V}_{\xi}} exists?

Eqs. (@ref{VisExact})  and (@ref{NaiveDefinitionOfDiff}) suggest that the first two terms in the antifield expansion of @f{{\cal V}_{\xi}} are:
@align[r.l.n @list[
 @f{{\cal V}_{\xi} \;=\;}
 @f{\int b_{++}\partial_-\xi^+ + b_{--}\partial_+\xi^- \;+}
 ""
]@list[
 ""
 @f{+ \; Z^{\star}_I \xi^{\alpha}\partial_{\alpha} Z^I  + 
         \left(\lambda^{L\star}\xi^{\alpha}\partial_{\alpha}\lambda_L\right) + 
         \left(\lambda^{R\star}\xi^{\alpha}\partial_{\alpha}\lambda_R\right) + (w^{\star}\delta_{\xi}w) \; + \;\ldots
   }
 @label{SchematicGeneratorOfDiffeomorphismsForPS}
]
]
(we did not explicitly compute @f{\delta w}). This would be analogous to the 
@hyperlink["../twisting/B_Model.html#(elem._.Generator.Of.Diffeomorphisms)"]{generator of diffeomorphisms for 
topologically twisted @f{N=2} theories}.

}


@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection bystro-conf)
@disconnect[formula-database]

  

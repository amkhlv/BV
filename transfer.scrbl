#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define bystro-conf   
   (bystro (bystro-connect-to-server (build-path (find-system-path 'home-dir) ".config" "amkhlv" "latex2svg.xml"))
           "transfer/formulas.sqlite"  ; name for the database
           "transfer" ; directory where to store image files of formulas
           25  ; formula size
           (list 255 255 255) ; formula background color
           (list 0 0 0) ; formula foreground color
           2   ; automatic alignment adjustment
           0   ; manual alignment adjustment
           ))
@(define singlepage-mode #f)
@(bystro-def-formula "formula-enormula-humongula!")

@(bystro-dump-LaTeX #f)
@title[#:style '(no-toc no-sidebar)]{Equivariant effective action}

@bystro-ribbon[]
@bystro-toc[]

@bystro-ribbon[]

@slide["Partial integration of half-density" #:tag "Partial Integration" #:showtitle #t]{
@short-intro{
When some fields are integrated out, we get an ``effective action'' for the remaining fields.
}
Let @f{(M,\omega)} be an odd symplectic supermanifold, and @f{\rho_{1\over 2}} be a half-density.

Suppose that we are given a submanifold @f{E\subset M} which happens to be a fiber bundle
with fibers isotropic submanifolds over some base  @f{B}. This can be thought of as a family
of isotropic submanifolds. For every @f{b\in B} we have the corresponding fiber, an isotropic
submanifold which we denote @f{I(b)}. Moreover, we require:
@e{
\mbox{ker} \,\omega|_{E} = TI
}
(@italic{i.e.} the degenerate subspace of the restriction of @f{\omega} to @f{E} is the tangent space of the 
        fiber).
Since @f{d\omega = 0}, this condition implies that the Lie derivative of @f{\omega|_E} along the fiber vanishes,
and therefore @f{\omega} defines an odd symplectic form on the base which we will denote @f{\omega_B}.


Finally, we require certain @bold{maximality} property: 
@align[l.n @list[
@elem[#:style 'no-break]{@f{E} cannot be embedded in any larger submanifold of @f{M} where @f{TI} would still be isotropic}
@label{maximality-requirement}
]
]
Let @f{L\subset B} be a Lagrangian submanifold of @f{B}. Under the above conditions, it can be lifted 
to a Lagrangian submanifold in @f{M} as @f{\pi^{-1} L}, where @f{\pi} is a natural projection:
@e{
\pi\;:\; E\to B
}
We then @bold{define} a half-density @f{\pi_*\rho_{1\over 2}} on @f{B} so that for every Lagrangian submanifold @f{L\subset B}
and every function @f{f\in \mbox{Fun}(B)}:
@e{
\int_Lf\pi_*\rho_{1\over 2} = \int_{\pi^{-1}(L)} (f\circ \pi)\rho_{1\over 2}
}
Suppose that we are given a function @f{\Psi} on @f{M} whose restriction on @f{E} is constant along @f{I}.
Then it @bold{defines} a function on @f{B} which we denote @f{\pi_*\Psi}:
@e{
(\pi_*\Psi)\circ \pi = \Psi|_E
}
Notice that in this case the flux @f{\{\Psi,\_\}} is tangent to @f{E}. 
@comment{
It is enough to prove that for any  @f{\phi\in \mbox{Fun}(M)} constant on @f{E}: @f{\{\Psi,\,\phi\,\} = 0}. 
From the maximality of @f{B}, as defined in Eq. (@ref{maximality-requirement}), follows that @f{\{\phi,\,\_\,\}} is
tangent to @f{I}. Since @f{\Psi} is constant along @f{I}, it follows that indeed @f{\{\Psi,\,\phi\,\} = 0}.
}
We have:
@e[#:label "flow-commutes-with-projection"]{
\forall m\in E\;:\; \pi(m)_* \left(\{\Psi,\,\_\,\}(m)\right) \;=\;
\{\pi_*\Psi,\,\_\,\}(\pi(m))
}
Equivalently, for two functions @f{\Psi_1} and @f{\Psi_2} on @f{M} both constant along @f{I}:
@e{
\{\Psi_1,\Psi_2\}  = \{\pi_*\Psi_1,\pi_*\Psi_2\}\circ\pi
}
@comment{
In order to prove Eq. (@ref{flow-commutes-with-projection}), notice that any vector field tangent to @f{I} can be written as
@f{\sum_a f_a \{\phi_a,\_\}} where @f{f_a} are some functions on @f{M} and @f{\phi_a} are some functions on @f{M} constant on @f{E}.
The commutator with @f{\{\Psi,\,\_\,\}} of such a vector field is @f{\sum_a \{\Psi,f_a\} \{\phi_a,\_\}} ---
again tangent to @f{I}. 
This means that the flow of @f{\Psi} brings fibers to fibers, which is equivalent to Eq. (@ref{flow-commutes-with-projection}).
}
We will now prove that for any @f{\Psi\in \mbox{Fun}(M)} whose restriction on @f{E} is constant along @f{I}:
@e[#:label "push-forward-of-Lie-derivative"]{
\pi_*\left({\cal L}_{\{\Psi,\_\}}\rho_{1\over 2}\right) \;=\;
{\cal L}_{\{\pi_*\Psi,\_\}}\pi_*\rho_{1\over 2}
}
Indeed, for any ``test function'' @f{f\in \mbox{Fun}(B)}:
@align[l.n @list[
 @f{\phantom{=\;}\delta_{\{\pi_*\Psi,\_\}}\int_L f\pi_*\rho_{1\over 2} 
    \;=\;\int_L \left(
                      \{\pi_*\Psi,f\} \pi_*\rho_{1\over 2} 
                      + (-)^{(\bar{\Psi}+1)\bar{f}}f{\cal L}_{\{\pi_*\Psi,\_\}}\pi_*\rho_{1\over 2}
                \right)\;=\;}  
 @label{first-line}
]@list[
 @f{\;=\;\delta_{\{\Psi,\_\}}\int_{\pi^{-1}L} (f\circ \pi)\rho_{1\over 2} 
    \;=\; \int_{\pi^{-1}L}\left(
                                \{\Psi,f\circ\pi\}\rho_{1\over 2} 
                                + (-)^{(\bar{\Psi}+1)\bar{f}}f{\cal L}_{\{\Psi,\_\}}\rho_{1\over 2}
                          \right)\;=\;}  
 ""
]@list[
 @f{\;=\;\int_L \left(\{\pi_*\Psi,f\} \pi_*\rho_{1\over 2} + (-)^{(\bar{\Psi}+1)\bar{f}}f\pi_*\left({\cal L}_{\{\Psi,\_\}}\rho_{1\over 2}\right)\right)}
 @label{third-line}
]
]
Equality of Lines (@ref{first-line}) and (@ref{third-line}) implies Eq. (@ref{push-forward-of-Lie-derivative}).
In particular:
@div[redbox]{
if @f{\rho_{1\over 2}} satisfies the Quantum Master Equation on @f{M}, then @f{\pi_*\rho_{1\over 2}}
satisfies the Quantum Master Equation on @f{B}
} 
Indeed,  @f{\rho_{1\over 2}} satisfying the Quantum Master Equation is 
@hyperlink["../BV-formalism/OddLaplace.html#(elem._.Via.Lie.Derivative)"]{equivalent to the statement} that for any functions  @f{\Psi} and @f{F}:
@e[#:label "QME-via-Lie-derivative"]{
\delta_{\{\Psi,\_\}}\int_L F\rho_{1\over 2} = (-)^{\bar{F}+1} \int_L \Psi {\cal L}_{\{F,\_\}}\rho_{1\over 2}
}
When @f{\rho_{1\over 2}} satisfies the QME on @f{M}, considering Eq. (@ref{QME-via-Lie-derivative}) with both
@f{\Psi} and @f{F} constant along the fiber of @f{E\rightarrow B} and using Eq. (@ref{push-forward-of-Lie-derivative})
proves that @f{\pi_*\rho_{1\over 2}} also satisfies the QME.

}

@slide["Partial integration of equivariant half-density" #:tag "Equivariant transfer" #:showtitle #t]{
@short-intro{
Now we will consider partial integration when the half-density satisfies the 
@hyperlink["../omega/Equivariant_half-densities.html#%28part._.Definitions%29"]{equivariant Master Equation}. 
We show that the resulting effective theory still satisfies the equivariant Master Equation.
}
Suppose that a Lie group @f{H} acts on @f{M} by canonical transformations, and moreover
that every Hamiltonian @f{\xi\in {\bf h}} is constant on the fibers of @f{E\stackrel{\pi}\rightarrow B}:
@e{
\forall \xi\in{\bf h} \; \exists \,\pi_*\xi\in \mbox{Fun}(B)\;:\; \xi|_E = 
(\pi_*\xi)\circ\pi
}
Suppose that we are given an 
@hyperlink["../omega/Equivariant_half-densities.html#%28part._.Definitions%29"]{equivariant half-density}
@f{\xi\mapsto \rho^{\tt C}_{1\over 2}(\xi)} on @f{M}, @italic{i.e.}:
@align[r.l.n @list[
 @f{{\cal L}_{\eta}\rho^{\tt C}_{1\over 2}(\xi) \;=\;}
 @f{\left.{d\over dt}\right|_{t=0} \rho^{\tt C}_{1\over 2}(e^{t\{\eta,\_\}}\xi)}
 ""
]@list[
 @f{\Delta \rho^{\tt C}_{1\over 2}(\xi) \;=\;}
 @f{\xi \rho^{\tt C}_{1\over 2}(\xi)}
 @label{equivariant-QME}
]
]
Then the result of the partial integration is an equivariant half-density on @f{B}:
@align[r.l.n @list[
 @f{{\cal L}_{\eta}\pi_*\rho^{\tt C}_{1\over 2}(\xi) \;=\;}
 @f{\left.{d\over dt}\right|_{t=0} \pi_*\rho^{\tt C}_{1\over 2}(e^{t\{\eta,\_\}}\xi)}
 ""
]@list[
 @f{\Delta \pi_*\rho^{\tt C}_{1\over 2}(\xi) \;=\;}
 @f{(\pi_*\xi) \pi_*\rho^{\tt C}_{1\over 2}(\xi)}
 @label{equivariant-QME-on-base}
]
]
Indeed, Eq. (@ref{equivariant-QME}) is equivalent to the statement that for any two functions  @f{\Psi} and @f{F}:
@e[#:label "equivariant-QME-via-Lie-derivative"]{
\delta_{\{\Psi,\_\}}\int_L F\rho_{1\over 2}(\xi) = (-)^{\bar{F}+1} \int_L \left( \Psi {\cal L}_{\{F,\_\}}\rho_{1\over 2}(\xi)  + \Psi F \xi \rho_{1\over 2}(\xi)\right)
}
Eq. (@ref{equivariant-QME-on-base}) follows from  Eqs. (@ref{push-forward-of-Lie-derivative}) 
and (@ref{equivariant-QME-via-Lie-derivative}) considering the case when both @f{\Psi} 
and @f{F} are constant along the fiber of @f{E\rightarrow B}.
}

@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection bystro-conf)
@disconnect[formula-database]

  

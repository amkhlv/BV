#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define bystro-conf   
   (bystro (bystro-connect-to-server (build-path (find-system-path 'home-dir) ".config" "amkhlv" "latex2svg.xml"))
           "twisting/formulas.sqlite"  ; name for the database
           "twisting" ; directory where to store image files of formulas
           25  ; formula size
           (list 255 255 255) ; formula background color
           (list 0 0 0) ; formula foreground color
           2   ; automatic alignment adjustment
           0   ; manual alignment adjustment
           ))
@(define singlepage-mode #f)
@(bystro-def-formula "formula-enormula-humongula!")


@(define (L) "{\\scriptsize\\rm L}")
@(define (R) "{\\scriptsize\\rm R}")
@(define (ch) "{\\rm ch}")
@(define (ach) "{\\rm ach}")
@(define zLc (string-append "z^" (L) "_" (ch)))
@(define zRc (string-append "z^" (R) "_" (ch)))
@(define zLa (string-append "z^" (L) "_" (ach)))
@(define zRa (string-append "z^" (R) "_" (ach)))
@(define tL+ (string-append "\\theta^{" (L) "+}"))
@(define tR+ (string-append "\\theta^{" (R) "+}"))
@(define tL- (string-append "\\theta^{" (L) "-}"))
@(define tR- (string-append "\\theta^{" (R) "-}"))

@title[#:style '(no-toc no-sidebar)]{Twisting}

@(bystro-dump-LaTeX #f)


@bystro-ribbon[]

@short-intro{
Here we will construct @hyperlink["../omega/Subalgebra_F.html"]{the subspace @f{\cal F}} for the topologically
twisted @hyperlink["../N2Superconformal/index.html"]{@f{N=2} superconformal} theory.
}

@hyperlink["../index.html"]{Return to index}

@table-of-contents[]

@hyperlink["../index.html"]{Return to index}

@bystro-ribbon[]

@slide["Left and right sectors" #:tag "Left and right sectors" #:showtitle #t]{
In order to discuss twisting, we have to consider the full sigma-model, with left and right sectors.

@align[r.l @list[
@f{X^a( @zLc , @tL+ , @zRc , @tR+ ) =\;}
@f{x^a( @zLc , @zRc ) + @tL+ \psi_@(L)^a( @zLc , @zRc ) + @tR+ \psi_@(R)^a( @zLc , @zRc ) + @tL+ @tR+ F^a( @zLc , @zRc )}
]@list[
@f{\overline{X^a}( @zLa , @tL- , @zRa , @tR- ) =\;}
@f{\overline{x^a}( @zLa , @zRa ) + 
   @tL- \overline{\psi_@(L)^a}( @zLa , @zRa ) +
   @tR- \overline{\psi_@(R)^a}( @zLa , @zRa ) +
   @tL- @tR- \overline{F^a}( @zLa , @zRa )
}
]
]
The action @bold{in flat space} is:
@e{
S = \int_{\Sigma_{N=2}^{2|4}} \pi_@(ach)^* \overline{X^a}\;\; \pi_@(ch)^* X^a
}
In components, after excluding the auxiliary fields @f{F} and @f{\overline{F}}:
@e{
S \;=\; \int d z^@(L) dz^@(R)\left(
  \partial_@(L) \overline{x^a} \partial_@(R) x^a 
- \overline{\psi_@(L)^a} \partial_@(R) \psi_@(L)^a
- \overline{\psi_@(R)^a} \partial_@(L) \psi_@(R)^a
\right)
}
@spn[attn]{TODO:} signs and coefficients could be wrong.
}

@slide[@elem{@f{N=2} superconformal symmetries} #:tag "N=2 superconformal symmetries" #:showtitle #t]{
Equations for  @hyperlink["../N2Superconformal/Duality_In_Coordinates.html#(elem._.Chiral.N2)"]{@f{N=2} superconformal vector field}
and  @hyperlink["../N2Superconformal/Duality_In_Coordinates.html#(elem._.Anti.Chiral.N2)"]{its dual} define the
following symmetries:
@align[r.l.n @list[
 @f{
    \left(
    \begin{array}{r} 
    @tL+ \xi_@(L)^-( @zLc ) {\partial\over\partial @zLc }
    \cr 
    \mbox{\tt\small and its dual } \xi_@(L)^-( @zLa ) {\partial\over\partial @tL- }
    \end{array}
    \right)
   }
 @f{
    \begin{array}{cccc}
    \mbox{\tt\small acting on} & \psi_@(L)^a & \mbox{\tt\small gives} & \xi_@(L)^- \partial_@(L) x^a 
    \cr
    \mbox{\tt\small acting on} & \overline{x^a} & \mbox{\tt\small gives} & \xi_@(L)^- \overline{\psi_@(L)^a}
    \end{array}
   }
   
 ""
]@list[
 @f{
    \left(
    \begin{array}{r}
    \xi_@(L)^+( @zLc ) {\partial\over\partial @tL+ } 
    \cr
    \mbox{\tt\small and its dual } @tL- \xi_@(L)^+( @zLa ) {\partial\over\partial @zLa }
    \end{array}
    \right)
   }
 @f{
    \begin{array}{cccc}
    \mbox{\tt\small acting on} & x^a & \mbox{\tt\small gives} & \xi_@(L)^+\psi_@(L)^a
    \cr
    \mbox{\tt\small acting on} & \overline{\psi_@(L)^a} & \mbox{\tt\small gives} & \xi_@(L)^+\partial_@(L)\overline{x^a}
    \end{array}
   }
   
 ""
]
]
and the same formulas with L replaced with R. The variations of those fields which are omitted from
these formulas are zero.

}

@slide["B model" #:tag "B Model" #:showtitle #t]{
@table-of-contents[]

@section{Definitions}
We declare that @f{\overline{\psi_@(L)^a}} and @f{\overline{\psi_@(R)^a}} be scalars:
@e{
\overline{\psi_@(L)^a} + \overline{\psi_@(R)^a} = \overline{\eta^{a}}\;,\quad
\overline{\psi_@(L)^a} - \overline{\psi_@(R)^a} = \vartheta_a
}
while @f{\psi_@(L)^a} and @f{\psi_@(R)^a} be components of a 1-form:
@e{
\rho^a = \psi_@(L)^a dz^@(L) + \psi_@(R)^a dz^@(R)
}
The action is:
@e[#:label "ActionBModel"]{
 S_{\rm cl} \;=\; \int_{\Sigma}-{1\over 2} \,
  d\overline{x^a}\wedge *d x^a 
-\rho^a\wedge (*d\overline{\eta^a} + d\vartheta_a)
}
The BV action is:
@e[#:label "BVActionBModel"]{
S_{\rm BV} \;=\; S_{\rm cl} \,+\,\int_{\Sigma}\; \overline{\eta^a}\overline{x}_{\overline{a}}^{\star} \,-\,{1\over 2} \langle dx^a,\rho^{\star}_a\rangle
}

@section{Action of diffeomorphisms}

Let us consider the infinitesimal diffeomorphism (= vector field) of the worldsheet:
@e{
v^@(L)(z^@(L),z^@(R)){\partial\over\partial z^@(L)} + v^@(R)(z^@(L),z^@(R)){\partial\over\partial z^@(R)}
}
The corresponding BV generation function is @f{{\cal V}\langle v\rangle\;=\;\{S_{\rm BV}\,,\,\Phi\langle v\rangle\}} where:
@align[r.l.n @list[
 @f{\Phi\langle v\rangle \;=\;}
 @f{\int_{\Sigma}
   ({\cal L}_v\overline{x^a})\overline{\eta}^{\star}_{\bar{a}}
   - ({\cal L}_{(v_L - v_R)}\overline{x^a}) \vartheta^{\star a}
   - 2 (\iota_v\rho^a)x^{\star}_a
   + \iota_{\rho^{\star}_a}\iota_v\vartheta^{\star a}}
 @label{Phi}
]
]
@comment{
The last term @f{\iota_{\rho^{\star}_a}\iota_v\vartheta^{\star a}} requires explanation. As @f{\vartheta} is a scalar
field, its antifield @f{\vartheta^{\star}} is a 2-form. The expression @f{\iota_v\vartheta^{\star}} is the usual contraction
of a vector field @f{v} with the 2-form @f{\vartheta^{\star}}. Finally, @f{\iota_{\rho^{\star}_a}\iota_v\vartheta^{\star}}
should be understood in the following way. We interpret @f{\rho^{\star}} as a vector-valued two-form, @italic{i.e.}
a section of @f{(T\otimes \Omega^2)\Sigma}. We contract its vector index with the single remaining covector index
of @f{\iota_v\vartheta^{\star}}. What remains is a two-form, which is just integrated over @f{\Sigma}.
}
Explicitly:
@align[r.l.n @list[
 @f{{\cal V}\langle v\rangle = \{S_{\rm BV}\,,\,\Phi\langle v\rangle\} \;=\;}
 @f{
    \int_{\Sigma} ({\cal L}_v x^a)x^{\star}_a 
    + ({\cal L}_v \overline{x^a})\overline{x}^{\star}_{\overline{a}} 
    + \langle({\cal L}_v\rho^a),\rho^{\star}_a\rangle
    + ({\cal L}_v\overline{\eta^a})\overline{\eta}^{\star}_{\overline{a}}
    + ({\cal L}_v\vartheta_a)\vartheta^{a\star} -
   }
  @label{GeneratorOfDiffeomorphisms}
]@list[
 ""
 @f{\;\;\;
    + \; d\overline{x^a}\wedge *d(\iota_v\rho^a)
    - ({\cal L}_v\overline{x^a})d*\rho^a
    - ({\cal L}_{(v_L-v_R)}\overline{x^a})d\rho^a
   }
 ""
]@list[
 @f{\;=\;}
 @f{    \int_{\Sigma} ({\cal L}_v x^a)x^{\star}_a 
    + ({\cal L}_v \overline{x^a})\overline{x}^{\star}_{\overline{a}} 
    + \langle({\cal L}_v\rho^a),\rho^{\star}_a\rangle
    + ({\cal L}_v\overline{\eta^a})\overline{\eta}^{\star}_{\overline{a}}
    + ({\cal L}_v\vartheta_a)\vartheta^{a\star} -
   }
 ""
]@list[
 ""
 @f{\;\;\;
    - *d\overline{x^a} \wedge {\cal L}_v\rho^a - ({\cal L}_v \overline{x^a}) d*\rho^a
   }
 ""
]
]
@(fsize+ (- 5))
@smaller{Identities useful in proving this:}
@align[r.l.n @list[
 @f{\left\{\; \int_{\Sigma}\langle dx^a,\rho^{\star}_a\rangle \;,\; \int_{\Sigma}(\iota_v\rho^b)x_b^{\star}\;\right\}\;=\;}
 @f{\int_{\Sigma}({\cal L}_v x^a) x_a^{\star}\;+\; \langle (d\iota_v \rho^a),\rho_a^{\star} \rangle }
 ""
]@list[
 @f{\left\{\; 
           \int_{\Sigma} \overline{\eta^a}\overline{x}^{\star}_{\bar{a}} \;,\; 
           \int_{\Sigma} ({\cal L}_v\overline{x^a})\overline{\eta}^{\star}_{\overline{a}} 
           - ({\cal L}_{(v_L - v_R)} \overline{x^a})g_{\bar{a}b}\vartheta^{\star b}
    \;\right\}\;=\;
   }
 @f{\int_{\Sigma}\;({\cal L}_v\overline{\eta^a})\overline{\eta}^{\star}_{\bar{a}}
                 \,+\,({\cal L}_v\overline{x^a})\overline{x}^{\star}_{\bar{a}}
                 \,-\,({\cal L}_{(v_L - v_R)}\overline{\eta^a})g_{\bar{a}b}\vartheta^{\star b}
   }
 ""
]@list[
 @f{\left\{\;
           S_{\rm cl}
           \;,\;
           \int_{\Sigma}\;\iota_{\rho^{\star}_a}\iota_v\vartheta^{\star a}
    \;\right\} \;=\;
   }
 @f{\left\{\;
           \int_{\Sigma}\; - *d\overline{\eta^a}\wedge \rho^a + \vartheta_a d\rho^a
           \;,\;
           \int_{\Sigma}\;\iota_{\rho^{\star}_a}\iota_v\vartheta^{\star a}
    \;\right\}\;=\;
   }
 ""
]@list[
 @f{\;=\;}
 @f{\int_{\Sigma}\;\langle (\iota_v d\rho^a) , \rho^{\star}_a\rangle\;+\;(d\vartheta_a + * d\overline{\eta^a}) \wedge \iota_v\vartheta^{\star a} \;=\;}
 ""
]@list[
 @f{\;=\;}
 @f{\int_{\Sigma}\;\langle (\iota_v d\rho^a) , \rho^{\star}_a\rangle \;+\; ({\cal L}_v\vartheta_a)\vartheta^{\star a} \;+\; ({\cal L}_{(v_L-v_R)}\overline{\eta^a})\vartheta^{\star a}}
 ""
]
]
@fsize=[]

@section{Closedness of @f{\Pi\Delta{\cal F}}}
We need to prove:
@e{
\{\{S_{\rm BV},\Phi\langle w\rangle\},\Phi\langle v\rangle\} = \Phi\langle [w,v]\rangle
}
The only nontrivial computation is the bracket of the last term in Eq. (@ref{Phi}) with the last line of (@ref{GeneratorOfDiffeomorphisms}):
@align[r.l.n @list[
 ""
 @f{
    \left\{
      \int_{\Sigma} \iota_{\rho^{\star}_a}\iota_v\vartheta^{\star a}\,,\,
      \int_{\Sigma} - *d\overline{x^a} \wedge {\cal L}_w\rho^a - ({\cal L}_w \overline{x^a}) d*\rho^a
   \right\}
   \;=\;
   }
 ""
]@list[
 @f{\;=\;}
 @f{\int_{\Sigma} - * d\overline{x^a}\wedge {\cal L}_w\iota_v\vartheta^{\star a} \;-\; ({\cal L}_w\overline{x^a})d * \iota_v\vartheta^{\star a} \;=\;}
 ""
]@list[
 @f{\;=\;}
 @f{\int_{\Sigma} - * d\overline{x^a}\wedge {\cal L}_w\iota_v\vartheta^{\star a} \;-\; *d({\cal L}_w\overline{x^a}) \iota_v\vartheta^{\star a}}
 @label{CommutatorA}
]
]
and the bracket of the term @f{- ({\cal L}_{(v_L - v_R)}\overline{x^a}) \vartheta^{\star a}} in Eq. (@ref{Phi}) with @f{\widehat{\cal L}_w}:
@align[r.l.n @list[
 ""
 @f{
    \left\{
      \int_{\Sigma} -\iota_v *d\overline{x^a} \vartheta^{\star a}\;,\;\widehat{\cal L}_w
    \right\}\;=\;
   }
 ""
]@list[
 @f{\;=\;}
 @f{
    \left\{
      \int_{\Sigma} -*d\overline{x^a}\wedge\iota_v \vartheta^{\star a}\;,\;\widehat{\cal L}_w
    \right\}\;=\;
   }
 ""
]@list[
 @f{\;=\;}
 @f{
    \int_{\Sigma}  * d\overline{x^a}\wedge \iota_v{\cal L}_w\vartheta^{\star a} \;+\; *d({\cal L}_w\overline{x^a}) \iota_v\vartheta^{\star a}
   }
 @label{CommutatorB}
]
]
Eqs. (@ref{CommutatorA}) and (@ref{CommutatorB}) combine into @f{\int_{\Sigma} *d\overline{x^a}\wedge \iota_{[w,v]}\vartheta^{\star a}} which
is  the required term @f{- ({\cal L}_{([w,v]_L - [w,v]_R)}\overline{x^a})\vartheta^{\star a}} in @f{\Phi\langle [w,v]\rangle}

}

@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection bystro-conf)

@(bystro-close-connection bystro-conf)
@disconnect[formula-database]

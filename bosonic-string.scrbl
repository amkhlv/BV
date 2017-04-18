#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define bystro-conf   
   (bystro (bystro-connect-to-server (build-path (find-system-path 'home-dir) ".config" "amkhlv" "latex2svg.xml"))
           "bosonic-string/formulas.sqlite"  ; name for the database
           "bosonic-string" ; directory where to store image files of formulas
           25  ; formula size
           (list 255 255 255) ; formula background color
           (list 0 0 0) ; formula foreground color
           2   ; automatic alignment adjustment
           0   ; manual alignment adjustment
           ))
@(define singlepage-mode #t)
@(bystro-def-formula "formula-enormula-humongula!")

@(bystro-dump-LaTeX #f)

@title[#:style '(no-toc no-sidebar)]{Bosonic string}



@bystro-ribbon[]

@hyperlink["../index.html"]{Return to index}

@table-of-contents[]

@hyperlink["../index.html"]{Return to index}

@bystro-ribbon[]

@slide["Solution of Master Equation" #:tag "SolutionOfMasterEqn" #:showtitle #t]{
The fundamental fields of the worldsheet theory are: matter fields @f{x^m}, 
@hyperlink["../worldsheet-complex-structure/worldsheet-complex-structure.html"]{complex structure} @f{I^{\alpha}_{\beta}}
and the diffeomorphism ghosts @f{c^{\alpha}}.
The matter part of the action depends on matter fields and complex structure:
@equation{
    S_{\rm mat}[I,x] = {1\over 2}\int \partial_+ x^m \wedge \partial_- x^m
}
Following the @hyperlink["../omega/Case_Of_Standard_BRST.html#(part._.Brief.Review.Of.Standard.B.R.S.T)"]{general scheme}, we find the solution of the Master Equation:
@equation[#:label "BosonicMasterAction"]{
    S_{\rm BV} = S_{\rm mat} \;+\; \int \;
           \langle {\cal L}_c I , I^{\star}\rangle + \langle {\cal L}_c x , x^{\star}\rangle + {1\over 2}\langle [c,c],c^{\star}\rangle
}
Remember that there is a constraint on @f{I^2 = -1}. In components @f{I^{\alpha}_{\beta}I^{\beta}_{\gamma} = - \delta^{\alpha}_{\gamma}}. 
The antifield @f{I^{\star}} can be identified with a symmetric tensor @f{I^{\star}_{\alpha\beta} = I^{\star}_{\beta\alpha}} with
only nonzero components @f{I^{\star}_{++}} and @f{I^{\star}_{--}} (which are also denoted @f{I^{\star}_{zz}} and @f{I^{\star}_{\bar{z}\bar{z}}}.)
The coupling to @f{\delta I} is defined as follows:
@equation[#:label "PairingI"]{
    \int \langle I^{\star}, \delta I\,\rangle \;=\; \int \, dz^{\alpha}\wedge dz^{\beta}\;I^{\star}_{\alpha\gamma}\delta I^{\gamma}_{\beta}
}

}


@slide["Lagrangian submanifold" #:tag "LagrangianSubmanifold" #:showtitle #t]{
@table-of-contents[]
@section{Motivation for changing polarization}
Notice that the dependence of @f{S_{\rm BV}} on the antifields (letters with @f{\star}) 
is at most 
linear. Indeed, this @f{S_{\rm BV}} corresponds to ``just the usual BRST operator''
of the form @f{c^At_A + {1\over 2}f^A_{BC}c^Bc^C{\partial\over\partial c^A}}. 

It would seem to be natural
to choose the Lagrangian submanifold setting all the antifields to zero. However,
the restriction of @f{S_{\rm BV}} to this Lagrangian submanifold (@italic{i.e.} @f{S_{\rm cl}}) 
turns
out to be very complicated (the Nambu-Goto string). The standard approach in
bosonic string is to switch to a different Lagrangian submanifold so that the restriction of @f{S_{\rm BV}} 
to this new Lagrangian submanifold is quadratic. However there is some price to pay: 
BRST operator is only nilpotent on-shell, resulting in a complicated @f{L_{\infty}} structure.

@section{Proceed with changing polarization}
Let us choose some reference complex structure  @f{I^{(0)}} parametrize the nearby complex structures
by their corresponding Dolbeault cocycles, which we denote @f{b^{\star}}. Locally it is possible
to choose @f{I = \left(\begin{array}{cc} i & 0 \cr 0 & -i \end{array}\right)}.
To summarize:

@align[r.l.n 
@list[
@f{I \;=\;} @f{I(b^{\star})} 
""
]@list[
@f{b^{\star}\;\in\;} @f{H^1_{\overline{\partial}}(T^{1,0})}
""
]@list[
@f{I^z_{\bar{z}}(b^{\star}) \;=\; } @f{(b^{\star})^z_{\bar{z}} + o(b^{\star})} 
""
]@list[
@f{I^z_z(b^{\star})\;=\;} @f{i + o(b^{\star})}
""
]
]
The other components are:
@equation{
I^{\bar{z}}_{\bar{z}} = \overline{I^z_z}\;,\quad I^{\bar{z}}_z = \overline{I^z_{\bar{z}}}
}
And we rename @f{I^{\star}} as @f{b}:
@equation{
b_{\alpha\beta} \;=\; I^{\star}_{\alpha\beta}
}
We have just @spn[attn]{changed the polarization}; @f{I^{\star}} is now a field (called @f{b}) and @f{I} an antifield (called @f{b^{\star}}).

The action can be written in the new coordinates:
@align[r.l.n @list[
 @f{S_{\rm BV}\;=\;}
 @f{S_{\rm mat}[I(b^{\star})\,,\, x] \;+\; \int\;\langle {\cal L}_c(I(b^{\star})), \, b\rangle 
    + \langle {\cal L}_c x,\, x^{\star} \rangle + \left\langle {1\over 2}[c,c],\, c^{\star}\right\rangle}
 @label{BVBosonic}
]]

@section[#:tag "sectionStandardLagrangianSubmanifold"]{Lagrangian submanifold}
We now choose the Lagrangian submanifold in the following way:
@align[r.n @list[
@f{b^{\star} = x^{\star} = c^{\star} = 0}@label{LagrangianAlongB}
]]
On this Lagrangian submanifold the action is quadratic. 
In particular:
@equation{\int \langle b,{\cal L}_c(I(b^{\star}))\rangle\quad\mbox{\tt\small becomes}\quad \int (b_{++}\partial_-c^+ + c.c)}

@section{BRST structure}
The BRST operator @f{Q_{\rm BRST}} of the bosonic string can be understood as follows.
We expand @f{S_{\rm BV}} in powers of the antifields @f{x^{\star}, c^{\star}, b^{\star}} and consider only the 
linear term. The corresponding Hamiltonian vector field preserves the 
Lagrangian submanifold and is the symmetry of the restriction of @f{S_{\rm BV}} on the 
Lagrangian submanifold. There are also higher order terms,
because the dependence on @f{b^{\star}} is nonlinear;  @f{\int b^{\star\,\gamma}_{\alpha}T_{\gamma\beta}\;dz^{\alpha}\wedge dz^{\beta}} is just the linear 
approximation. In constructing the @f{Q_{\rm BRST}} we simply neglect those higher
order terms. This leads to @f{Q_{\rm BRST}} being nilpotent only on-shell. The explicit formula for @f{Q_{\rm BRST}} can be
read from Eq. (@ref{BVBosonic}):
@align[r.l.n @list[
@f{Q_{\rm BRST} \;=\; }
@f{  T_{\alpha\beta}{\partial\over\partial b_{\alpha\beta}} 
   + (c^{\alpha}\partial_{\alpha}x^m) {\partial\over\partial x^m} 
   + [c,c]^{\alpha}{\partial\over\partial c^{\alpha}}
}
""
]]



@section{Ghost numbers}
@tbl[#:orient 'vert @list[
 @list[
   @f{x}  @f{x^{\star}}   @f{I}  @f{b}   @f{c}  @f{c^{\star}} 
]@list[
   @f{0}  @f{-1}  @f{0}   @f{-1}  @f{1}  @f{-2} 
]
]]
}


@slide["Integration over family of Lagrangian submanifolds" #:tag "IntegrationOverFamily" #:showtitle #t]{
@short-intro{
Here we will first use @hyperlink["omega/Equivariant_Form.html#(part._.The_equivariant_version_of_)"]{our prescription}
to construct the equivariant analogue of @f{\Omega}, depending on some motivated choice of the subspace @f{{\cal F}\subset \mbox{Fun}(M)}.
We will then implement @hyperlink["../equivariant-cohomology/From_Cartan_To_Base.html"]{the standard procedure} 
to construct a closed form on @f{(\exp(\Pi\Delta {\cal F}))\backslash {\rm LAG}} with some @f{\cal F}.  
}

@table-of-contents[]

@section[#:tag "ChoiceOfF"]{Choice of @f{\cal F}}
We will here make use of @hyperlink["../omega/Case_Of_Standard_BRST.html"]{the standard choice of @f{\cal F} always applicable in the BRST case}.

We will choose @f{\cal F} so that @f{\Pi\Delta {\cal F}} is 
@bold{the algebra of diffeomorphisms of the worldsheet}:
@equation[#:label "DefPhi"]{
   \Phi = \int c^*_{\alpha} \xi^{\alpha}
}
where @f{\xi^{\alpha} = \xi^{\alpha}(z,\bar{z})} is a vector field on the worldsheet.

@section{Equivariant form @f{\Omega^{\cal C}_{{\rm Vect}(\Sigma)\oplus{\rm Weyl}}}}
The resulting equivariant form is:
@equation{
   \Omega^{\tt C}_{{\rm Vect}(\Sigma)\oplus {\rm Weyl}}({\bf t}) = 
   \int_{gL} \exp\left(
      S_{\rm BV} + \int \langle dI\,,\, b\rangle  + \int c^{\star}_{\alpha} {\bf t}^{\alpha}
   \right)
}
where the term @f{\int \langle dI\,,\, b \rangle} comes from @f{dg g^{-1}} and 
@f{\int c^{\star}_{\alpha}{\bf t}^{\alpha}} from @f{\Phi} of Eq. (@ref{DefPhi}).
The pairing @f{\langle dI\,,\,b\rangle} is as in Eq.@~(@ref{PairingI}).


@section{Recovery of the standard approach}
Usually in the literature, the integration cycle is chosen so that @f{c^{\star}=0}, and
therefore the term  @f{\int c^{\star}_{\alpha}{\bf t}^{\alpha}} vanishes. Moreover, we do not even need to 
do the horizonthal projection of @f{dgg^{-1}}. This is a consequence of the following
general statement. Suppose that @f{\{\Phi,\Phi\}=0} and the integration cycle in the moduli space of 
Lagrangian submanifolds is such that:
@align[r.l.n @list[
@f{\Phi|_{gL}=\;}@f{0}@label{PhiIsZero}
]
]
In this case the construction simplifies:
@equation{
\Omega_{{\rm Vect}(\Sigma)} = \Omega
}
We can now use the @hyperlink["../picture-changing/Baranov-Schwarz.html"]{Baranov-Schwarz transform} 
and interpret the integration of @f{\Omega} as the integration of @f{e^S} over some new Lagrangian 
submanifold, which can be described as follows. 

Consider {\em any} @f{3g-3}-dimensional surface in the space of metrics @f{g_{\cdot\cdot}} 
parametrized by @f{(s_1,\ldots,s_{3g-3})}:
@equation{
   S\subset {\rm MET}\;,\quad \mbox{dim}S = 3g-3
}
(no need to require any holomorphicity). Let us consider a submanifold 
@equation{
{\cal N}_S\subset \Pi T^*{\rm MET}
}
defined as follows: it is the bundle over @f{S} whose fiber at a point @f{s\in S} 
consists of the subspace of @f{\Pi T^*_s{\rm MET}} orthogonal to the tangent space to @f{S} at 
that point. Notice that this submanifold is Lagrangian. We will promote @f{{\cal N}_S} to
a Lagrangian submanifold @f{\widehat{\cal N}_S} in the BV phase space of the bosonic string by 
adding @f{x} and @f{c^{\cdot}} (and keeping @f{x^{\star}=0} and @f{c^{\star}_{\cdot}=0}). We have:
@equation[#:label "BosonicStringSingleLagrangian"]{
   \int_S\Omega = \int_{\widehat{\cal N}_S} e^{S_{\rm BV}}
}
Notice that we can use @f{\Omega} instead of @f{\Omega_{\cal B}} because Eq. (@ref{PhiIsZero}) 
is satisfied in this case. Indeed, @f{\Phi\langle\xi\rangle = \int \xi^{\alpha}c^{\star}_{\alpha}} and we choose the Lagrangian
submanifolds so that @f{c_{\cdot}^*=0}; this proves Eq. (@ref{PhiIsZero}).

@section{What is ``base integral form''?}
When some part of @f{\widehat{\cal N}_S} contains a gauge-trivial direction @f{\dot{g}_{\alpha\beta} = 2\nabla_{(\alpha}\xi_{\beta)}}, then
the integral of @f{e^{S_{\rm BV}}} over that part is automatically zero. Indeed, in this
case all the  @f{b^{\cdot\cdot}\in\Pi T^*_s{\rm MET}} orthogonal to the tangent space to @f{S} satisfy in
particular @f{b^{\alpha\beta}\nabla_{\alpha}\xi_{\beta}=0} and therefore the integral of @f{e^{S_{\rm BV}}} over @f{c^{\cdot}} will give 
zero (because of the zero mode @f{c^{\alpha}\simeq \xi^{\alpha}}). In this sense, @f{e^{S_{\rm BV}}} is a ``base integral form''.


@section[#:tag "sectionStandardIntegrationCycle"]{Standard integration cycle}
We will now discuss the ``usual'' (in the bosonic string theory) integration cycle on the moduli space of Lagrangian submanifolds.
Remember that our @seclink{ChoiceOfF} is such that @f{\Pi\Delta{\cal F}} is the algebra of diffeomorphisms of the worldsheet.
@bold{This allows us} to construct the base form on the space of Lagrangian submanifolds modulo diffeomorphisms.

@comment{In order to be able to construct a closed cycle, we need to factor out by large (not only small) diffeomorphisms.
Notice that  @f{\mbox{exp}(\Pi\Delta{\cal F})} only provides @bold{small} diffeomorphisms. But then, why do we need this
@f{\Pi\Delta{\cal F}}? Technically it would probably be possible to factor out only large diffeomorphisms without including
small ones. (For example, by restricting to constant curvature metrics. However, this would appear quite unnatural.}

Remember that on a Lagrangian submanifold from the @seclink["sectionStandardLagrangianSubmanifold"]{standard family} the
metric @f{g_{\alpha\beta}} (same thing as @f{b^{\star\alpha\beta}}) is fixed, and the path integral goes over @f{b^{\alpha\beta},c^{\alpha},x^m}.
This picture explains why we can identify metric with its pullback by a diffeomorphism:

@image{graphics/two-Lagrangean-submanifolds.svg}
}


@slide["Using metric instead of complex structure" #:tag "UsingMetric" #:showtitle #t]{
@short-intro{
It is also possible to use the worldsheet metric, instead of complex structure, as a dynamical variable. 
This requires Weyl invariance. We will just list the formulas here.
}

@table-of-contents[]

@section{Solution of Master Equation}

@equation{
   S_{\rm mat}[g,x] = {1\over 2}\int 
   \sqrt{g}g^{\alpha\beta}\;\partial_{\alpha}x^m \partial_{\beta}x^m
}
(the subindex @f{\rm mat} stands for ``matter'', although this action also 
involves the dynamical metric @f{g_{\alpha\beta}}). Let @f{\cal X} denote the space parametrized
by @f{g_{\alpha\beta}} and @f{x^m}. 

It follows from the @hyperlink["../omega/Case_Of_Standard_BRST.html"]{general theory}, that the following functional on 
@f{\Pi T^*{\cal X}\times \Pi T^*({\rm Diff}\times {\rm Weyl})} solves the Master Equation:
@align[r.l.n @list[
@f{S_{\rm BV} = \;}@f{S_{\rm mat}[g,x] +}@label{BosonicMasterActionUsingMetric}
]@list[
@f{}@f{+ \int \Big(
   ({\cal L}_cg)_{\alpha\beta}g^{\star\alpha\beta}
   + \zeta g_{\alpha\beta} g^{\star\alpha\beta}
   + ((c^{\alpha}\partial_{\alpha})x^m)x_m^{\star} 
   + {1\over 2}[c,c]^{\alpha}c^{\star}_{\alpha}
   + ({\cal L}_c\zeta)\zeta^{\star}
   \Big)}""
]]
where @f{\zeta} is the ghost for the Weyl transformations. 

@section{Changing polarization}
Let us choose some reference metric @f{g^{(0)}} and change the coordinates in the following way:
@align[r.l @list[
@f{g_{\alpha\beta} \;=}@v+[6 @f{\; g^{(0)}_{\alpha\beta} + b^{\star}_{\alpha\beta}}]
]@list[
@f{g^{\star\alpha\beta} =}@f{\; b^{\alpha\beta}}
]]
This is just the definition of the new pair of canonically conjugate fields
@f{b^{\star}_{\alpha\beta}} and @f{b^{\alpha\beta}} which replace @f{g_{\alpha\beta}} and @f{g^{\star\alpha\beta}}. 
With these new notations, the action becomes:
@align[r.l.n @list[
@f{S_{\rm BV} = \;}@f{S_{\rm mat}[\,g^{(0)}_{\cdot\cdot} + b^{\star}_{\cdot\cdot}\,,\;x\,] \;+}@label{BVBosonicUsingMetric}
]@list[
@f{}@f{+ \int 
   \zeta (g_{\alpha\beta}^{(0)} + b^{\star}_{\alpha\beta})b^{\alpha\beta} \;+}""
]@list[
@f{}@f{+ \int \Big(
   ({\cal L}_c (g^{(0)} + b^{\star}))_{\alpha\beta}b^{\alpha\beta}
   + ((c^{\alpha}\partial_{\alpha})x^m)x_m^{\star} + {1\over 2}[c,c]^{\alpha}c^{\star}_{\alpha}
   + [c,\zeta]\zeta^{\star}
   \Big)}""
]]
(Notice that in the computation of @f{\nabla_{\alpha}c_{\beta}} we have to use the metric @f{g_{\alpha\beta}^{(0)} + b^{\star}_{\alpha\beta}}.)

@section[#:tag "sec:standard-lagr-using-metric"]{Lagrangian submanifold}
We now choose the Lagrangian submanifold in the following way:
@align[r.n @list[
@f{b^{\star} = x^{\star} = c^{\star} = \zeta^{\star} = 0}@label{LagrangianAlongBUsingMetric}
]]
On this Lagrangian submanifold the action is quadratic. Indeed, first notice that 
the integral over @f{\zeta} makes @f{b^{\alpha\beta}} traceless with respect to @f{g_{\alpha\beta}^{(0)}}. 
Then in the last line of Eq. (@ref{BVBosonicUsingMetric}) 
only the first term survives and becomes @f{\int (b_{++}\partial_-c^+ + c.c)}

@section{Singularities of correlation functions}
@equation{
\langle \partial X(z) \;X(0) \rangle =  {1\over 2z} + \mbox{\tt\small regular }
}
@comment{
This follows from the variation of the action under the infinitesimal shift @f{\delta X = u}:
@align[r.l.n @list[
  ""
  @f{\int [dX] \exp\left( - {1\over 2\pi}\int {1\over 2} dX\wedge *dX \right) (X(0)+u)\;=\;}
  ""
]@list[
  @f{=\;}
  @f{\int [dX] \exp\left( - {1\over 2\pi}\int {1\over 2} d(X-u\theta(|z|<\epsilon))\wedge *d(X-u\theta(|z|<\epsilon)) \right) X(0)\;=\;}
  ""
]@list[
  @f{=\;}
  @f{\int [dX] \exp\left( - {1\over 2\pi}\int dX\wedge *dX\;-\;{1\over 2\pi}u\oint_{|z|=\epsilon} *dX \right)X(0)\;=\;}
  ""
]@list[
  @f{=\;}
  @f{\int [dX] \exp\left( -{1\over 2\pi}\int dX\wedge *dX\;-\;{1\over 2\pi}u\oint_{|z|=\epsilon} (idz\,\partial_z X\,-\,id\bar{z}\,\partial_{\bar{z}}X)  \right)X(0)}
  ""
]
]
}
@section{Insertions of unintegrated vertices}
@subsection{Massless states}
The case of massless states is special, because the corresponding vertex operators are free of divergencies
and do not require regularization. Consider the scattering of @f{N} gravitons, which are parametrized
by their momenta @f{k^{(i)}} and polarizations @f{E^{(i)}_{\mu\nu}}. The corresponding insertion is:
@align[r.l.n @list[
  @f{U\;=\;}
  @f{\prod_{i=1}^N E^{(i)}_{\mu\nu}\;c\partial X^{\mu}(z_i,\bar{z}_i)\;\bar{c}\bar{\partial} X^{\nu}(z_i,\bar{z}_i)\; e^{k^{(i)}_{\nu} X^{\nu}(z_i,\bar{z}_i)}}
  ""
]@list[
  ""
  @f{E^{(i)}_{\mu\nu}k^{(i)\nu} =0\;\mbox{ \tt and }\;(k^{(i)}\cdot k^{(i)}) =0}
  @label{conditions-for-massless-vertex}
]
]
Eq. (@ref{conditions-for-massless-vertex}) implies that there are no divergencies. Straightforward calculations gives:
@equation{
\{S_{\rm BV},U\} \;=\; Q_{\rm BRST} U \;=\; 0
}
in ether classical or quantum theory. The matter part of the path integral:
@equation{
{\int [dX] e^{-\int_{\Sigma}\partial X\wedge \bar{\partial} X}U\over \int [dX] e^{-\int_{\Sigma}\partial X\wedge \bar{\partial} X}}
}
can be computed exactly using Wick theorem (as the theory is free), and the result is a finite expression. The computation is
explicitly Weyl-invariant.

Now we will proceed to tachyons, which are the simples example of massive state.

@subsection{Tachyons}
Let us regularize @f{e^{(k\cdot X)}} by a point-splitting procedure,
splitting by a small @f{\epsilon} @bold{as measured with the worldsheet metric}.
In other words, let us define the insertion of @f{N} tachyon vertices as the  @f{\epsilon\to 0} limit of the following expression:
@align[r.l.n @list[
  @f{U(\epsilon)\;=\;}
  @v-[1 @f{
           \left(\prod_{i=1}^N g_{z\bar{z}}c^z(z_i) c^{\bar{z}} (\bar{z}_i)\right)
           \exp\left(\sum_{i=1}^N \left[- {k_i^2\over 2}\log\epsilon 
                     + w_i(\epsilon) \int_{\Sigma} \sqrt{g}d^2z \; (k_i\cdot X(z))\; \exp\left(- {1\over\epsilon^2}{\rm dist}(z,z_i)^2
               \right) \right]\right)}]
  @label{regularized-vertex}
]@list[
  @elem[#:style 'no-break]{where @hspace[1]}
  @f{w_i(\epsilon) = \left(\int_{\Sigma} \sqrt{g}d^2z\; \exp\left(- {1\over\epsilon^2}{\rm dist}(z,z_i)^2\right)\right)^{-1}}
  ""
]
]
This regularization breaks diffeomorphisms to the stabilizer of @f{\{z_1,\ldots,z_N\}}.
On the other hand, the breaking of the Weyl symmetry is much worse; but assuming that @f{k^2\neq 0}, we
observe the following facts:
@itemlist[
@item{In the classical theory, the expression (@ref{regularized-vertex}) does not have a good limit when @f{\epsilon\to 0}}
@item{But in quantum theory (@italic{i.e.} inside the path integral) the limit @f{\epsilon\to 0} of the expression (@ref{regularized-vertex}) @bold{is} well-defined}
]


Moreover:
@align[r.l.n @list[
  @f{\lim_{\epsilon\to 0} \left( \{S_{\rm BV},\_\}  - \sum_{i=1}^N (1 + k_i^2) \zeta(z_i,\bar{z}_i) \right)\;U(\epsilon)\;=\;}
  @f{0}
  ""
]
]
where @f{\zeta} is the Weyl ghost.  
To prove this facts, we observe that we can explicitly evaluate the matter path integral:
@align[r.l.n @list[
  ""
  @f{{\int [dX] e^{-\int_{\Sigma}\partial X\wedge \bar{\partial} X}U(\epsilon)\over \int [dX] e^{-\int_{\Sigma}\partial X\wedge \bar{\partial} X}}\;=\;}
  ""
]@list[
  @f{=\;}
  @f{
     \exp\left(\sum_{i=1}^N\left[-{k_i^2\over 2}\log\epsilon\right] + 
     \sum_{i,j=1}^N w_iw_j(k_i\cdot k_j)\int \sqrt{g}d^2 u \int \sqrt{g}d^2 v\; G(u,v)\exp \left(-{{\rm dist}(u,z_i)^2 +{\rm dist}(v,z_j)^2\over\epsilon^2}\right)
     \right)
    }
  ""
]@list[
  ""
  @elem[#:style 'no-break]{where @f{G(u,v)} is the scalar propagator}
  ""
]
]
Consider the following expression:
@align[r.l.n @list[
  @f{f[g](z) \;=\;}
  @f{\int \sqrt{g}d^2 u \int \sqrt{g}d^2 v\; G(u,v)\exp \left(-{{\rm dist}(u,z)^2 +{\rm dist}(v,z)^2\over\epsilon^2}\right)}
  ""
]
]
It depens on the metric @f{g} through explicit factors @f{\sqrt{g}} and also because the distances @f{{\rm dist}(u,z)} and @f{{\rm dist}(v,z)}
are measured using @f{g}. Notice that:
@equation{
\lim_{\epsilon\to 0} \left(f[e^{\varphi}g] - f[g]\right) = \varphi
}

}

@slide["Bosonic string quartet" #:tag "BRST quartet" #:showtitle #t]{
@short-intro{We will now show how to integrate over metrics keeping the BRST operator nilpotent off-shell}

@table-of-contents[]

@section{Introducing additional fields}
Let us return to our solution of Master Equation given by Eq. (@ref{BosonicMasterAction}).
Let us add the ``BRST quartet'' @f{\bar{c}^{\alpha}_{\beta},\pi^{\alpha}_{\beta},\bar{c}^{\star}_{\alpha}^{\beta}\pi^{\star}_{\alpha}^{\beta}}
and modify  Eq. (@ref{BosonicMasterAction}) by adding @f{\int \pi^{\alpha}_{\beta}\bar{c}^{\star}_{\alpha}^{\beta}}:

@equation[#:label "BosonicMasterActionWithQuartet"]{
    S_{\rm BV} = S_{\rm mat} \;+\; \int \;
           \langle {\cal L}_c I , I^{\star}\rangle + \langle {\cal L}_c x , x^{\star}\rangle + {1\over 2}\langle [c,c],c^{\star}\rangle
           \;+\;\langle \pi,\bar{c}^{\star} \rangle
}
The standard choice of Lagrangian submanifold:
@equation{
x^{\star} = c^{\star} = I^{\star} = \bar{c}^{\star} = \pi^{\star} = 0
}
leads to degenerate action funcional. 
Now let us shift it using the gauge fermion: 
@equation[#:label "gauge-fermion-for-string-quartet"]{\Psi = \bar{c}^{\alpha}_{\beta}(I^{\beta}_{\alpha} - I^{(0)}{}^{\beta}_{\alpha})}
This gives the family of Lagrangian submanifolds:
@align[r.l.n @list[
  @f{x^{\star} = c^{\star} = \pi^{\star} \;=\;} @f{0} ""
]@list[
  @f{I^{\star} \;=\;} @f{\bar{c}} ""
]@list[
  @f{\bar{c}^{\star} \;=\;} @f{I  - I^{(0)}} ""
]
]

@section{BRST operator is nilpotent off-shell}
It is straightforward to construct the new Darboux coordinates compatible with the new Lagrangian submanifold;
all we need to do is to shift:
@align[r.l.n @list[
  @f{I^{\star}\;=\;} @f{I^{\star}_{\rm new} + \bar{c}} ""
]@list[
  @f{\bar{c}^{\star}\;=\;} @f{\bar{c}^{\star}_{\rm new} + I - I^{(0)}} ""
]
]
In terms of these new variables:
@align[r.l.n @list[
  @f{S_{\rm BV} \;=\;} 
  @f{S_{\rm mat}(I,x) \;+\; \int \;\langle {\cal L}_c I , \bar{c}\rangle \;+\; \langle \pi\,,\,I-I^{(0)}\rangle \;+ }
  @label{master-action-shifted}
]@list[
  ""
  @f{+\;\langle {\cal L}_cI, I^{\star}\rangle + \langle {\cal L}_c x , x^{\star}\rangle + {1\over 2}\langle [c,c],c^{\star}\rangle\;+\;\langle \pi,\bar{c}^{\star} \rangle}
  ""
]
]
@comment{The first line does not depend on antifields, and the second line is linear in antifields; we omitted the ``@f{\rm new}'' labels on antifields.}

We observe that:
@itemlist[
@item{@f{\pi} is the Lagrange multiplier for  @f{I = I^{(0)}}}
@item{@f{\bar{c}} plays the role of @f{b}-ghost}
@item{The Master Action of Eq. (@ref{master-action-shifted})
depends on antifields only up to first power} 
]
Therefore, the BRST operator is nilpotent:
@align[r.l.n @list[
  @f{Q_{\rm BRST}\;\; x \;\;=\;} @f{{\cal L}_c x} ""
]@list[
  @f{Q_{\rm BRST}\;\; I \;\;=\;} @f{{\cal L}_c I} ""
]@list[
  @f{Q_{\rm BRST}\;\; c \;\;=\;} @f{{1\over 2} [c,c]} ""
]@list[
  @f{Q_{\rm BRST}\;\; \bar{c}\;\;=\;} @f{\pi} ""
]@list[
  @f{Q_{\rm BRST}\;\; \pi \;\;=\;} @f{0} ""
]
]

@section{Form @f{\Omega}}


Since @f{Q_{\rm BRST}} is nilpotent off-shell, we can use @hyperlink["../omega-BRST/Form__.html"]{our procedure for constructing @f{\Omega} in BRST formalism}.

@subsection{For standard family of Lagrangian submanifolds}
For the standard family, generated by the family of gauge fermions @f{\Psi} parametrized by @f{I^{(0)}} as in Eq. (@ref{gauge-fermion-for-string-quartet}),
@hyperlink["../omega-BRST/Form__.html#(elem._def-omega)"]{our formula} gives:
@equation[#:label "quartet-omega-for-standard-family"]{
\Omega(I^{(0)},dI^{(0)}) \;=\; \int [dx\,dc\,d\bar{c}\,dI\,d\pi] \exp\left(\; S_{\rm cl}^{\{I^{(0)}\}}(x,c,\bar{c},I,\pi) \quad + \quad \bar{c}dI^{(0)}\;\right)
}
where @f{S_{\rm cl}^{\{I^{(0)}\}}} is the first line of Eq. (@ref{master-action-shifted}).

@subsection{Generic family of Lagrangian submanifolds}
For the general family we have to use @hyperlink["../omega-BRST/Form__.html#(elem._def-omega)"]{our general formula};
there is no further simplification.

@subsection{Equivariant @f{\Omega}}
We will define diffeomorphisms in the usual way:
@equation{
{\cal D}_{\xi} = \left[Q_{\rm BRST}\,,\,\xi^{\alpha}{\partial\over\partial c^{\alpha}}\right]
}

For the case of standard Lagrangian submanifold, 
@f{\Omega(I^{(0)},dI^{(0)})} of Eq. (@ref{quartet-omega-for-standard-family}) is already base. 
For the general case, we have to use 
@hyperlink["../omega-BRST/Equivariant__.html#(elem._equivariant-omega-in-.B.R.S.T-formalism)"]{our general formula for equivariant @f{\Omega} in BRST formalism}
with @f{\zeta = \xi^{\alpha}{\partial\over\partial c^{\alpha}}}. There is nothing particularly specific to bosonic string, except for:
@align[r.l.n @list[
  @f{\varphi\;=\;} @f{(x,I,\bar{c},\pi)} ""
]@list[
  @f{\zeta \;=\;} @f{\xi^{\alpha}{\partial\over\partial c^{\alpha}}} ""
]
]

Notice that there are two kinds of symmetries: diffeomorphisms parametrized by @f{\xi^{\alpha}} and @f{F}-shifts parametrized 
by arbitrary @f{c}-independent functionals @f{F=F(x,\bar{c},I,\pi)}.

@comment{That @f{F} should be @f{c}-independent follows from @f{{\cal L}_{\zeta}F=0}}

It seems that we now have a larger symmetry group: instead of just diffeomorphisms we have diffeomorphisms
plus @f{F}-shifts. This is probably related to adding additional fields.

}




@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection bystro-conf)

@(bystro-close-connection bystro-conf)
@disconnect[formula-database]

#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define bystro-conf   
   (bystro (bystro-connect-to-server (build-path (find-system-path 'home-dir) ".config" "amkhlv" "latex2svg.xml"))
           "equivariant-cohomology/formulas.sqlite"  ; name for the database
           "equivariant-cohomology" ; directory where to store image files of formulas
           25  ; formula size
           (list 255 255 255) ; formula background color
           (list 0 0 0) ; formula foreground color
           2   ; automatic alignment adjustment
           0   ; manual alignment adjustment
           ))
@(define singlepage-mode #f)
@(bystro-def-formula "formula-enormula-humongula!")


@(bystro-dump-LaTeX #f)

@title[#:style '(no-toc no-sidebar)]{Equivariant Cohomology}



@bystro-ribbon[]

@hyperlink["../index.html"]{Return to index}

@table-of-contents[]

@hyperlink["../index.html"]{Return to index}

@bystro-ribbon[]

@slide["Wavy Lie algebra and its Koszul dual" #:tag "Wavy Lie Algebra" #:showtitle #t]{
@table-of-contents[]
@section{Wavy Lie algebra}

Let @f{G} be a Lie group. It is possible to introduce the structure of a Lie group on @f{\Pi TG}.
In fact:
@equation{
\Pi T G = \mbox{Map}({\bf R}^{0|1},G)
}
and the structure of the group is introduced by pointwise multiplication. Consider the corresponding Lie superalgebra:
@equation{
\widetilde{\bf g} = \mbox{Lie}(\Pi TG)
}
We can interpret @f{\widetilde{\bf g}} as the algebra of maps from @f{{\bf R}^{0|1}} to @f{\bf g};
therefore the elements of @f{\widetilde{\bf g}} are @f{\bf g}-valued functions @f{f(\theta)} of an odd
parameter @f{\theta\in {\bf R}^{0|1}}.
It is possible to extend @f{\widetilde{\bf g}} by an extra odd element @f{\partial_{\theta}} with the following
commutation relations:
@equation{
[\partial_{\theta},f(\theta)] = {\partial\over\partial\theta} f(\theta)
}
We will call this extended algebra @f{\widetilde{\bf g}'}. 

@section[#:tag "sectionKoszulDualToWavy"]{Koszul dual to wavy Lie algebra}
Let us consider the universal enveloping @f{U\,\widetilde{\bf g}} and look at it as a quadratic-linear
algebra. The dual algebra is a differential algebra; it has a nonzero differential because the
original algebra was quadratic-linear; the differential corresponds to the commutator. 
We will call it @f{W_G}:
@equation{
W_G = \left( U\,\widetilde{\bf g} \right)^!
}
This is generated by the linear space: @f{\Pi \widetilde{\bf g}^*}.

Let  @f{\{e_a\,|\,a\in \{1,\ldots,{\rm dim}\,{\bf g}\}\}} be the basis of @f{\bf g} as a linear space.
Then @f{\widetilde{\bf g}^*} is generated 
by odd elements  @f{A^a} and even elements @f{F^a}:
@align[r.l.n @list[
 @f{\langle e_a\;,\;A^b \rangle =} @f{\delta_a^b} ""
]@list[
 @f{\langle \theta e_a\;,\;F^b \rangle =} @f{\delta_a^b} ""
]
]
As a dual to a non-homogeneous quadratic-linear algebra,
the supercommutative algebra @f{W_G} comes with the differential:
@align[r.l.n @list[
 @f{d_{\rm Lie} A^e = } @f{{1\over 2}f^e{}_{ab} A^aA^b} @label{DLieA}
]@list[
 @f{d_{\rm Lie} F^e = } @f{f^e{}_{ab}A^aF^b} @label{DLieF}
]
]
But since @f{\widetilde{\bf g}} was actually a DLA, the differential being @f{\partial_{\theta}},
the dual map @f{\partial_{\theta}^*} defines the second  differential on @f{W_G}:
@align[r.l.n @list[
 @f{\partial_{\theta}^* A^a =} @f{F^a} ""
]@list[
 @f{\partial_{\theta}^* F^a =} @f{0} ""
]
]
These two differentials commute:
@equation{
\partial_{\theta}^* d_{\rm Lie} + d_{\rm Lie}  \partial_{\theta}^* = 0
}
The total differential is called @f{d_W}:
@equation[#:label "DW"]{
d_W = d_{\rm Lie} + \partial_{\theta}^*
}
Schematically:
@align[r.l.n @list[
 @f{\partial^*_{\theta} \;=\;} @f{F^a{\partial\over\partial A^a}} ""
]@list[
 @f{d_{\rm Lie} \;=\;} 
 @f{{1\over 2}f^a_{bc} A^b A^c {\partial\over\partial A^a} + f^a_{bc} A^b F^c{\partial\over\partial F^a}} 
 ""
]
]
Notice that:
@equation{
d_{\rm Lie} \;=\; - \left[\partial_{\theta}^*\;,\;{1\over 2}f^a_{bc}A^bA^c{\partial\over\partial F^c}\right]
}
The cohomology of @f{d_W} is @f{\bf C}; this can be proven using the homotopy operator:
@equation[#:label "HomotopyOperator"]{
h = A^a {\partial\over\partial F^a}
}
}



@slide["Equivariant cohomology" #:tag "Equivariant Cohomology" #:showtitle #t]{
@table-of-contents[]

@section{Equivariant cohomology as a relative Lie algebra cohomology}
To define the equivariant cohomology, we need to remember that @f{\widetilde{\bf g}} is actually a @bold{differential} Lie algebra. 
It has a differentiation @f{\partial_{\theta}}. In our definition of the cohomology, we have not yet used @f{\partial_{\theta}}.
The way to use it is to consider a larger algebra @f{\widetilde{\bf g}'}, which is obtained from @f{\widetilde{\bf g}} by
adding @f{\partial_{\theta}} as an extra generator. 

The Koszul dual of @f{U\widetilde{\bf g}'} has an additional generator which we call @f{c}. The differential on
@f{(U\widetilde{\bf g}')^!} (which comes from the non-homogeneity of @f{U\widetilde{\bf g}'}) acts as follows:
@align[r.l.n @list[
 @f{d_{W} A^e = } @f{{1\over 2}f^e{}_{ab} A^aA^b + cF^e} @label{DWeylA}
]@list[
 @f{d_{W} F^e = } @f{f^e{}_{ab}A^aF^b} @label{DWeylF}
]
]
Notice that @f{dc} is zero. We will simply put @f{c=1}. Then the differential formally coincides with the @f{d_W} given by Eq. (@ref{DW}).
This is called @spn[attn]{Weyl algebra} (a commutative differential superalgebra).

@bold{Definition @defn-num{defEquivariantViaRelative}} We define the equivariant cohomology of @f{M} 
as the relative Lie algebra cohomology:
@equation{
H^n(\widetilde{\bf g}' \,,\,{\bf g}\,;\, \Omega^{\bullet}M\,)
}
The ordinary (not relative) cohomology of @f{\widetilde{\bf g}'} with coefficients in @f{\Omega^{\bullet}(M)} is computed as follows:
@align[r.l.n @list[
 @f{H^n(\widetilde{\bf g}' \,,\, \Omega^{\bullet}M\,) \;=\; } 
 @f{H^n\;\mbox{Hom}_{U\,\widetilde{\bf g}'} \left( (U\widetilde{\bf g}')^¡_{\bullet} \otimes U\widetilde{\bf g}' \,,\, \Omega^{\bullet}M\,\right) = H^n(W_G\otimes \Omega^{\bullet}M\,)}
 ""
]
]
with the differential acting as follows:
@equation{
A^a\rho(e_a) + F^a\rho(\theta e_a) + c d_M \quad + \quad \left(c F^a + {1\over 2}f^a_{bc}A^b A^c\right) {\partial\over\partial A^a} + 
f^a_{bc}A^bF^c {\partial\over\partial F^a} 
}
where @f{c=1} and @f{\rho(e_a)  = {\cal L}_{v_a}} and @f{\rho(\theta e_a) = \iota_{v_a}}.
@comment{
This is the usual BRST-like operator defining Lie algebra cohomology.
We have visually separated the terms into two groups: the first three terms account for the action of @f{\widetilde{\bf g}'} on @f{\Omega^{\bullet}M},
and the rest for the structure constants of @f{\widetilde{\bf g}'}.
}
To define the @bold{relative} cohomology, we restrict to the subspace of cochains @f{\psi} which are:
@align[r.l.n @list[
@elem{@f{\bf g}-horizonthal:@hspace[3]} @f{{\partial\over \partial A^a}\psi \;=\;0} ""
]@list[
@elem[#:style 'no-break]{and @f{\bf g}-invariant:@hspace[3]} @f{\left(\rho(e_a) + f^b_{ac}F^c{\partial\over\partial F^b} \right)\;\psi\;=\; 0} ""
]
]
Now our cochains to not depend on @f{A} and are @f{\bf g}-invariant; the differential becomes:
@equation{
d_{\tt C} = d_M + F^a\rho(\theta e_a) \;=\; d_M + F^a\iota_{v_a}
}
This is the @bold{Cartan model} of equivariant cohomology.

@section{Weyl model}
To pass to the Weyl model, we act on cochains by @f{e^{A^a\iota_{v_a}}}. This does not change the condition of invariance,
but changes the condition of horizonthality:
@align[r.c.l @list[
@f{{\partial\over\partial A^a}\psi = 0\quad} @elem{becomes} @f{\quad\left({\partial\over\partial A^a} + \iota_{v_a}\right)\psi = 0}
]
]
and @f{d_{\tt C}} gets replaced with:
@equation{
d_M + d_{W_G}
}

}

@slide["Theory of connections" #:tag "Theory Of Connections" #:showtitle #t]{

@table-of-contents[]

@section{What is De Rham differential?}
A PDF on @f{M} is a function on @f{\Pi TM = {\rm Map}({\bf R}^{0|1},M)}.
Therefore a vector field @f{\partial_{\theta}} on @f{{\rm Map}({\bf R}^{0|1},M)}
induces a differentiation of PDFs. This is the De Rham differential:
@centered{
@spn[redbox]{De Rham differential is induced by @f+0+2{\partial_{\theta}}}
}


@section{Action of wavy Lie algebra on PDF}
Suppose that @f{G} acts on a manifold @f{M}. Then, naturally, 
@f{\Pi TG = {\rm Map}({\bf R}^{0|1},G)} acts on @f{\Pi TM = {\rm Map}({\bf R}^{0|1},M)}.
This implies that @f{\tilde{\bf g}'} acts on PDF on @f{M}. 


@section{Definition of connection}
@subsection{Algebraic interpretation}
Connection on a @f{G}-bundle @f{P} is the same as homomorphism of @f{\widetilde{\bf g}'}-modules: 
@equation{W_G \rightarrow {\rm PDF}(P\,)}

@subsection{Geometrical interpretation as a lift}
A @bold{connection} @f{\theta} on @f{P}:
@align[r.l.n @list[
@f{}@f{\theta:\; TP\to TP/M}""
]@list[
@f{}@f{{\cal L}_{v(\xi)}\theta\;=0\quad \forall \xi\in {\bf g}}@label{InvarianceOfTheta}
]@list[
@f{}@f{\theta|_{TP/M}=\mbox{id}}""
]]
Eq. (@ref{InvarianceOfTheta}) can be interpreted as the condition that the action of @f{\theta} on the
vector fields commutes with the action of @f{{\bf g}}:
@equation{
   {\cal L}_{v(\xi)}(\theta(w)) = \theta({\cal L}_{v(\xi)}w)\quad 
   \mbox{ \tt\small for all } \xi\in {\bf g} \mbox{ \tt\small and } w\in \mbox{Vect}(P\,)
}
In other words, having a connection is equivalent having a ``lift'':
@equation{
   {\bf u}:\;\mbox{Vect}(M\,) \to \mbox{Vect}(P\,)
}
such that vor any @f{w\in \mbox{Vect}(M)}: @f{[{\bf u}(w),v(\xi)]=0} @f{\forall \xi\in {\bf g}}. In other words, it 
is the same as the split of the exact sequence of algebroids over @f{M}:
@equation{
   0\rightarrow \mbox{Inv}_{\bf g}(\Gamma(TP/M\,)) \rightarrow 
   \mbox{Inv}_{\bf g}(\mbox{Vect}(P\,)) \xrightarrow{\pi_*}
   \mbox{Vect}(M\,)\rightarrow 0
}
@comment{
usually @f{\mbox{Inv}_{\bf g}(\mbox{Vect}(P))} is called ``Atiyah algebroid''; the projection @f{\pi_*} is its anchor
} 
The relation between @f{{\bf u}} and @f{\theta} is:
@equation[#:label "DefConn"]{
   {\bf u}(\pi_*w) = w + \theta(w)
}
(This is the subtraction of the vertical component; @f{-\theta(w)} is called the  
``vertical component'' of @f{w}.) Notice that @f{\mbox{Inv}_{\bf g}(\Gamma(TP/M))} is an @italic{ideal} in the Lie algebra of vector fields. 
The @italic{curvature} @f{f} is defined as follows:
@align[r.l.n @list[
@f{}@f{f\in \mbox{Hom}_{C^{\infty}(M)}(\Lambda^2TP,\;  TP/M)}@label{TypeOfCurvature}
]@list[
@f{}@f{[{\bf u}(\pi_*w_1),{\bf u}(\pi_*w_2)] = {\bf u}(\pi_*[w_1,w_2]) + f(w_1,w_2)}@label{DefOfCurvature}
]]
It is straightforward to verify that @f{f(\phi w_1,w_2)=\phi f(w_1,w_2)} where @f{\phi} is
a function on @f{M} (but not on @f{P}, because @f{w_1} should commute with the action of @f{\bf g}!);
this implies that the type of @f{f} is indeed (@ref{TypeOfCurvature}). Also notice that @f{f} is automatically 
horizonthal. The Jacobi identity implies for any triple of vector fields @f{w_0,w_1,w_2}:
@equation{
   f(w_0,[w_1,w_2]) + [w_0,f(w_1,w_2)] + [\theta(w_0),f(w_1,w_2)] 
   + \mbox{\tt\small cycl}(1,2,3) = 0
}
This is the same as:
@equation{
   df + [\theta,f\,] = 0
}
@comment{we identified @f{f(w_0,[w_1,w_2]) + [w_0,f(w_1,w_2)] + \mbox{cycl}} as @f{df(w_0,w_1,w_2)}; it was important that @f{w_0} is @f{{\bf g}}-invariant; if it
were not invariant, then we would not have been able to identify @f{[w_0,f(w_1,w_2)]} 
with the Lie derivative of @f{f(w_1,w_2)} along @f{w_0}, because actually @f{f(w_1,w_2)} is
not an @f{\bf R}-valued function but a @f{TP/M}-valued}
We can also substitute (@ref{DefConn}) into (@ref{DefOfCurvature}) and get:
@align[r.l @list[
@f{f =}@f{\; d\theta + {1\over 2}[\theta\wedge\!\!\!,\;\theta]}
]]
where the commutator is the commutator of the vector fields in @f{TP/M}. This 
concludes our short review of the connections in the principal bundle.


}

@slide["Cartan form plus exact is base" #:tag "Base is Cartan plus exact" #:showtitle #t]{
Suppose that @f{\alpha} represents a cohomology class in the Cartan model:
@align[r.l.n @list[
 "" @f{d_{\tt C} \,\alpha = 0} ""
]@list[
 "where " @v-[2 @f{\;d_{\tt C} = d_M + F^a\iota_{v_a}}] "" 
]
]
When @f{\bf g} acts freely on @f{M}, we can find a @f{d_{\tt C}}-exact form @f{d_{\tt C}\beta} such that:
@align[r.r.l.n @list[
 "" @f{\alpha + d_{\tt C}\beta} @v+[1 @elem[#:style 'no-break]{@hspace[1] is horizonthal, @italic{i.e.}}] ""
]@list[
 "" @f{\iota_{v_a}(\alpha + d_{\tt C}\beta)\;=\;} @f{0} ""
]@list[
 @v+[2 @elem[#:style 'no-break]{and therefore @hspace[1]}] @f{d_M (\alpha + d_{\tt C}\beta) \;=\;} @f{0} ""
]
]
This @f{\alpha + d_{\tt C}\beta} is the corresponding base form.

This is easier to see using the Weyl model. They Weyl complex is @f{(W_G\otimes \Omega^{\bullet}(M\,))^{\widetilde{\bf g}}}. 
The existence of the homotopy operator @f{(A^a + \theta^a){\partial\over\partial F^a}} (@italic{cp.} Eq. (@ref{HomotopyOperator})) implies that this complex has the same
cohomology as @f{(\Omega^{\bullet}(M\,))^{\widetilde{\bf g}}}. 
@comment{
Notice that we need the connection @f{\theta}, in order to build the @bold{horizonthal combination} @f{A^a + \theta^a}.
}
More explicitly:
@align[r.l.n @list[
  ""
  @f{\left[(A^a + \theta^a){\partial\over\partial F^a}\,,\,d_W + d_M\right]\;=\;}
  @label{homotopy-in-Weyl-complex}
]@list[
  @f{\;=\;}
  @f{(A^a + \theta^a){\partial\over\partial A^a} + \left(F^a + {1\over 2}f^a{}_{bc}A^bA^c + d\theta^a - f^a{}_{bc}A^b(A^c +\theta^c)\right){\partial\over\partial F^a}\;=\;}
  ""
]@list[
  @f{\;=\;}
  @f{(A^a + \theta^a){\partial\over\partial A^a} + 
      \left(F^a - {1\over 2}f^a{}_{bc}(A^b + \theta^b)(A^c + \theta^c) + d\theta^a + {1\over 2} f^a{}_{bc}\theta^b\theta^c\right){\partial\over\partial F^a}}
  ""
]
]
Introduce new variables:
@align[r.l.n @list[
  @f{\widetilde{A}^a\;=\;} @v-[5 @f{A^a + \theta^a}] ""
]@list[
  @f{\widetilde{F}^a\;=\;} @v-[5 @f{F^a - {1\over 2}f^a{}_{bc}\widetilde{A}^b\widetilde{A}^c + d\theta^a + {1\over 2}f^a{}_{bc}\theta^b\theta^c}] ""
]
]
Eq. (@ref{homotopy-in-Weyl-complex}) implies that we can remove @f{A^a} and @f{F^a} from the cocycle, by adding a @f{d_W + d_M}-exact expression,
effectively replacing @f{A^a} with @f{-\theta^a} and @f{F^a} with @f{-d\theta^a - {1\over 2}f^a{}_{bc}\theta^b\theta^c}.

Because of the @f{\bf g}-invariance, replacement of @f{A^a} with @f{-\theta^a} corresponds to the @bold{horizonthal projection}.

On the @seclink["From Cartan To Base"]{next page} we will give the explicit formula for passing to the base form.

}



@slide["From Cartan to base forms" #:tag "From Cartan To Base" #:showtitle #t]{

Consider a principal @f{G}-bundle @f{ P \stackrel{\pi}{\rightarrow} B}. A differential form on @f{B} of rank @f{n} can be 
described as a @bold{local} map:
@align[r.l @list[
@f{\omega\;:\;}@f{\Pi\mbox{Vect}(B) \rightarrow \mbox{Fun}(B)}
]]
where ``local'' means that the value of the function @f{\omega(c)} at point @f{x} only
depends on the value of @f{c} at point @f{x}. In this language, the de Rham differential is: 
@equation{
   (d\omega)(c)(x) = ({\cal L}_c\omega(c))(x) 
   - \left({1\over 2}[c,c]{\partial\over\partial c}\omega(c)\right)(x)
}
where @f{{\cal L}_c\omega(c)} is the Lie derivative along @f{c} of a function @f{\omega(c)\in \mbox{Fun}(B)}.
Similarly, a Cartan cocycle provides us with a @f{G}-invariant (@italic{i.e.} respecting the action
of @f{G}) local map:
@align[r.l @list[
@f{\omega^{\tt C} \;:\;}@f{(\Pi\mbox{Vect}(P\,))\times {\bf g}\;\rightarrow\; \mbox{Fun}(P\,)}
]]
The @bold{connection} is a @f{\underline{\bf lift}}:
@equation{
   \underline{\bf lift}\;:\;\mbox{Vect}(B)\to (\mbox{Vect}(P\,))^G
}
where @f{(\mbox{Vect}(P))^G} denotes @f{\bf g}-invariant vector fields on @f{P}. Generally speaking @f{\underline{\bf lift}} does not 
respect the operation of commutator. But the difference between @f{[\underline{\bf lift}(c),\underline{\bf lift}(c)]} and @f{\underline{\bf lift}([c,c])} is 
necessarily a @f{G}-invariant vertical vector field. Since we have assumed that @f{G} acts freely, 
we can present it in the following form:
@equation[#:label "DefineCurvature"]{
   [\underline{\bf lift}(c),\underline{\bf lift}(c)] - \underline{\bf lift}([c,c]) \;=\; 2a_*(F\,(c))
}
where @f{F} is the curvature of @f{\underline{\bf lift}}:
@equation[#:label "TypeOfCurvatureAsMapVect"]{
F\;:\; \Pi \mbox{Vect}(B) \rightarrow 
   ({\bf g}\otimes \mbox{Fun}(P\,))^G
}
and
@align[l @list[
@f{a\;:\; G\rightarrow \mbox{Diff}(P\,)}
]@list[
@f{a_*\;:\; {\bf g}\rightarrow \mbox{Vect}(P\,)}
]]
is the action of @f{G}. Notice that @f{F(fc)=f^2F(c)} for all @f{f\in\mbox{Fun}(B)}, and in this
sense @f{F} is a form of rank 2. It is essentially a 2-form on @f{B} with values in the vector 
bundle @f{{\bf g}\times_G P}. We observe the following:
@align[r.l.n @list[
@f{}@f{-[\underline{\bf lift}(c),\underline{\bf lift}([c,c])]\;=\;[\underline{\bf lift}(c),a_*(F(c))]\;=\;
   2a_*\left({\cal L}_{\underline{\bf lift}(c)}F(c)\right)}""
]@list[
@f{\mbox{\tt\small and }}@f{[\underline{\bf lift}(c),\underline{\bf lift}([c,c])]\;=\;\underline{\bf lift}([c,[c,c]]) 
   -  a_*\left([c,c]{\partial\over\partial c}F(c)\right)\;=\;}""
]@list[
@f{}@f{=\;-  a_*\left([c,c]{\partial\over\partial c}F(c)\right)}""
]@list[
@f{\mbox{\tt\small therefore }}@f{{\cal L}_{\underline{\bf lift}(c)} (F(c)) - {1\over 2} [c,c]{\partial\over\partial c} F(c) \;=\; 0}@label{JacobiIdentity}
]]
For every Cartan @f{\omega^{\tt C}} we can construct the base @f{\omega} as follows:
@align[l @list[
@f{\omega^{\tt base}(c) = \omega^{\tt C}(\underline{\bf lift}(c),F(c))}
]]
It follows from @f{G}-invariance of @f{\omega^{\tt C}} and  Eq. (@ref{TypeOfCurvatureAsMapVect}) that @f{\omega^{\tt C}(\underline{\bf lift}(c),F(c))}
is a @f{G}-invariant function on @f{P}, @italic{i.e.} can be considered as a function on @f{B}. 

The proof that so defined @f{\omega} is a closed form goes as follows. We start with the definition
of de Rham differential on @f{B}:
@align[r.l @list[
@f{(d\omega^{\tt base})(c_B) \;=\;}@f{\left(
      {\cal L}_{c_B} \;- \;
      {1\over 2}[c_B,c_B]{\partial\over\partial c_B}
   \right)
   \omega^{\tt C}(\underline{\bf lift}(c_B),F(c_B))}
]]
In the formula above we consider @f{\omega^{\tt C}(\underline{\bf lift}(c_B),F(c_B))} a function on @f{B}.
Let us now consider it a @f{G}-invariant function on @f{P}, and also use Eq. (@ref{DefineCurvature})
to present @f{\underline{\bf lift}([c_B,c_B])} as @f{[\underline{\bf lift}(c_B),\underline{\bf lift}(c_B)] - 2a_*(F(c_B))}. We get:
@align[r.l.n @list[
@f{(d\omega^{\tt base})(c_B) \;=\;}@f{\left.\left(
         {\cal L}_{c_P} - {1\over 2}[c_P,c_P]{\partial\over\partial c_P} 
         + a_*(F(c_B)){\partial\over\partial c_P}
      \right)\right|_{c_P = \underline{\bf lift}(c_B)} \omega^{\tt C}(c_P,F(c_B)) \;-}""
]@list[
@f{}@f{-{1\over 2}[c_B,c_B]\left.{\partial\over\partial \tilde{c}_B}\right|_{\tilde{c}_B = c_B}
   \omega^{\tt C}(\underline{\bf lift}(c_B),F(\tilde{c}_B))}@label{IntermediateDOmegaBase}
]]
The first line can be presented as follows:
@equation{
   (d_{\tt C} \omega^{\tt C}) 
   + \left(
      \left({\cal L}_{\underline{\bf lift}(c_B)}F(c_B)\right){d\over d{\bf t}}
   \right)
   \omega^{\tt C}(\underline{\bf lift}(c_B),{\bf t})
}
The first term vanishes because we assumed that @f{\omega^{\tt C}} is a Cartan cocycle; the second 
term cancels with the second line of Eq. (@ref{IntermediateDOmegaBase}) using Eq. (@ref{JacobiIdentity}). This completes the proof 
of @f{\omega^{\tt base}} being a closed form.  

}

@slide[@elem{Straightforward proof of closedness} #:tag "Direct Computation" #:showtitle #t]{
The formula for the basic form @f{\underline{\alpha}} is:  
@align[r.n @list[
@f{\underline{\alpha} = (\exp(\iota_{v(\theta)})\;\alpha)(f)}@label{DefUnderlineAlpha}
]]
This expression should be understood as follows. Notice that @f{\exp(\iota_{v(\theta)})\omega} is
an element of @f{\Omega^{\bullet}P\otimes S^{\bullet}\mbox{Hom}({\bf g}\;,\;{\bf C})}, @italic{i.e.} an inhomogeneous differential 
form on @f{P} with values in polynomial functions on @f{{\bf g}}. We then evaluate the 
function on @f{f}; for example the polynomial @f{e_ie_je_k} evaluates as follows:
@equation{
   (e_i e_j e_k)(f) = \langle e_i, f\,\rangle \wedge \langle e_j, f\,\rangle \wedge \langle e_k,f\,\rangle
}
We have to prove that @f{\underline{\alpha}\in \Omega^{\bullet}P} defined in Eq. (@ref{DefUnderlineAlpha}) is horizonthal and closed. 
The horizonthality follows immediately from the definition, because:
@itemlist[
@item{ @f{\exp(\iota_{v(\theta)}\alpha)} is essentially the projector on the horizonthal forms and }
@item{ @f{f} is automatically horizonthal }
]
It remains to prove that @f{\underline{\alpha}} is a closed form. We have:
@align[r.l.n @list[
@f{d(\exp(\iota_{v(\theta)})\;\alpha(f))\;=}@f{\;(\exp(\iota_{v(\theta)})\;d\alpha)(f) \;+
}""
]@list[
@f{}@f{\; + 
     {\small\bf Symm}\left(
        ({\cal L}_{v(\theta)} + \iota_{v(f-{1\over 2}[\theta,\theta])})
        \exp(\iota_{v(\theta)})
     \right)\alpha(f)\;-
}""
]@list[
@f{}@f{\; - [\theta,f]{\partial\over\partial f}
  \left((\exp(\iota_{v(\theta)})\;\alpha)(f)\right)\;-
}""
]@list[
@f{}@f{\;- \left(\exp(\iota_{v(\theta)}) \iota_{v(f)}\alpha\right)(f) \; = 0}@label{VerifyClosedness}
]]
where the following notations are assumed: 
@itemlist[
@item{the symbol @f{{\small\bf Symm}} denotes the symmetrically ordered expression: 
@equation{
   {\small\bf Symm}(ae^b) = \int_0^1 dt \;e^{(1-t)b} \;a\; e^{tb}
}
}
@item{in the first line, the @f{{\cal L}_{v(\theta)}} acts on everything that is 
   (after symmetrization) to the right of it
}
]
@comment{in particular, it acts on @f{f}, giving @f{[\theta,f]}, which cancels with the second line}

}

@slide[@elem{Case of coset space @f{H\backslash G}} #:tag "Coset Space" #:showtitle #t]{

@short-intro{Here we will consider the case of a coset space as an example}

@table-of-contents[]

Remember that @f{H\backslash G} means that we identify @f{g} and @f{hg} for @f{h\in H}.

Let @f{{\bf f}\subset {\bf g}} be a subspace of @f{\bf g} which is transversal to @f{{\bf h}}
and satisfies:
@align[r.l.n @list[
 @f{{\bf f} + {\bf h} \;=\; } @f{\bf g} ""
]@list[
 @f{{\bf f} \cap {\bf h} \;=\; } @f{0} ""
]@list[
 @f{[{\bf h},{\bf f}\,]\;\subset\;} @f{\bf f} @label{ConditionOnF}
]
]

@section[#:tag "sec:CartanComplexOfG"]{The Cartan complex of @f{G}}
Consider @f{dgg^{-1}} --- the the right-invariant @f{{\bf g}}-valued 1-form on @f{G} with values
in @f{{\bf g}}. Notice that the contraction with @f{T\in {\bf h}} acts as follows:
@equation{
   \iota_T (dgg^{-1}) = T
}
The action of the Cartan differential on functions @f{\phi(g,\; dgg^{-1},\; T)} is:
@align[r.l @list[
@f{d_{\cal C}T \;=}@f{\; 0}
]@list[
@f{d_{\cal C}g \;=}@f{\; dg }
]@list[
@f{d_{\cal C}(dg g^{-1}) \; =}@f{\; dgg^{-1}\wedge dgg^{-1} + T}
]]
In order for @f{d_{\cal C}} to be nilpotent, we require the @f{{\bf h}}-invariance of @f{f}:
@equation[#:label "InvarianceInCartanModel"]{
   \left.{d\over dt}\right|_{t=0}\phi\left(
      e^{t\,\eta}g,\;e^{t\;{\rm ad}(\eta)}dg g^{-1},\;e^{t\,{\rm ad}(\eta)}T
   \right) = 0\quad\mbox{\tt\small for }\; \eta\in {\bf h}
}

@section{Connection in the principle bundle @f{H\backslash G}}


@subsection{Definition of a connection}
We can construct a connection in @f{H\backslash G} in the following way. Let us consider
horizonthal those vectors @f{v\in T_gG} which are orthogonal to the fibers:
@equation{
   v \mbox{ \tt\small is  horizonthal}\quad\Leftrightarrow\quad dgg^{-1}(v)\in {\bf f}
}
The so defined distribution of horizonthal planes is 
@f{H}-invariant if Eq. (@ref{ConditionOnF}) is satisfied. The @bold{connection form} is a @f{\bf h}-valued form on @f{G}.
It computes for every vector its vertical component:
@align[r.l.n @list[
 @f{{\cal A} \;=\;} @f{(dg g^{-1})^{\parallel}} @label{ConnectionForm}
]@list[
 @f{\mbox{\tt\small where } \alpha^{\perp} \mbox{ \tt\small is defined by:}}
 @f{\alpha^{\parallel} \in {\bf h},\; \alpha - \alpha^{\parallel} \in {\bf f}}
 ""
]]

@subsection{Computation of curvature}
Since the curvature is a tensor, it is enough to compute it on left-invariant
vector fields. For @f{\xi_1\in {\bf g}} and @f{\xi_2\in {\bf g}} we have the corresponding left-invariant
vector fields @f{L_{\xi_1}} and @f{L_{\xi_2}}, which are defined as follows:
@equation{
   dgg^{-1}(L_{\xi}) = \mbox{Ad}(g)\xi 
}
The commutator of the two left-invariant vector fields is given by:
@equation{
   [L_{\xi_1},L_{\xi_2}] = L_{[\xi_1,\xi_2]}
}
Let us project and then lift:
@align[r.l @list[
@f{{\bf u}(\pi_*L_{\xi}) =}@f{\; L_{{\rm Ad}(g^{-1})({\rm Ad}(g)\xi)^{\perp}}}
]@list[
@f{\mbox{\tt\small where } \alpha^{\perp} \mbox{ \tt\small is defined by:}}@f{\;\;
   \alpha^{\perp} \in {\bf f},\; \alpha - \alpha^{\perp} \in {\bf h}}
]]
This can be also written as follows:
@equation{
   dgg^{-1}\left({\bf u}(\pi_*L_{\xi})\right) = \left(\mbox{Ad}(g)\xi\right)^{\perp}
}
We will now compute the curvature using the definition Eq. (@ref{DefOfCurvature}), in the 
following way. Notice that for any two vector fields @f{w_1} and @f{w_2} we have:
@align[r.l @list[
@f{(d(dg g^{-1}))(w_1,w_2) =}@f{\; 
   {\cal L}_{w_1}(dg g^{-1}(w_2)) - {\cal L}_{w_2}(dg g^{-1}(w_1)) - 
   dg g^{-1} ( [w_1,w_2])=}
]@list[
@f{=}@f{\; (dg g^{-1}\wedge dg g^{-1})(w_1,w_2)}
]]
and therefore:
@align[r.l.n @list[
@f{}@f{dg g^{-1}([w_1,w_2]) =}@label{dGGinvOnCommutator}
]@list[
@f{=\;}
@f{{\cal L}_{w_1}(dg g^{-1}(w_2)) - {\cal L}_{w_2}(dg g^{-1}(w_1)) - 
   (dg g^{-1}\wedge dg g^{-1})(w_1,w_2)\;=}
""
]@list[
@f{=\;}
@f{{\cal L}_{w_1}(dg g^{-1}(w_2)) - {\cal L}_{w_2}(dg g^{-1}(w_1)) - 
   [dg g^{-1}(w_1), dg g^{-1}(w_2)]}
""
]]
Let us define the right-invariant vector fields by the formula:
@equation[#:label "DefRightInvariant"]{
dgg^{-1}(R_{\xi}) = \xi
}
@comment{
Now, as a check of Eq. (@ref{dGGinvOnCommutator}), it implies for the 
right-invariant fields:
@f{[R_{\xi_1},R_{\xi_2}] = - R_{[\xi_1,\xi_2]}}
}
This implies:
@align[r.l @list[
@f{}@f{dg g^{-1}\left([{\bf u}(\pi_*L_{\xi_1}),{\bf u}(\pi_*L_{\xi_2})]\right)=}
]@list[
@f{=}@f{\; \left(
      ([(\mbox{Ad}(g)\xi_1)^{\perp},\mbox{Ad}(g)\xi_2])^{\perp} - 
      (1\leftrightarrow 2)
   \right) - [(\mbox{Ad}(g)\xi_1)^{\perp},
   (\mbox{Ad}(g)\xi_1)^{\perp}]}
]]
Therefore the curvature on the left-invariant vector fields is determined by 
the following formula:
@equation{
   dgg^{-1}(f(L_{\xi_1},\;L_{\xi_2})) = - [(\mbox{Ad}(g)\xi_1)^{\perp},\;(\mbox{Ad}(g)\xi_2)^{\perp}]^{||} 
}
Since the curvature is a tensor, we can now compute it for arbitrary vector
fields. Given two vector fields @f{w_1} and @f{w_2}, we have:
@equation{
   dg g^{-1}(f(w_1,w_2)) = - [(dg g^{-1}(w_1))^{\perp},(dg g^{-1}(w_2))^{\perp}]^{||}
}
In other words:
@equation{
   f = - R_{[(dg g^{-1})^{\perp}\,,\; (dg g^{-1})^{\perp}]^{||}}
}
where @f{R} is defined in Eq. (@ref{DefRightInvariant}).

@section{From Cartan model to base forms}
Let us consider a class of the Cartan model represented by @f{\phi\left(
      g,\;dg g^{-1},\;T
   \right)} 
satisfying the conditions described in 
@seclink["sec:CartanComplexOfG"]{the description of Cartan complex of @f{G}}. We will construct @f{\underline{\phi}} as
follows (with  @f{R} is defined in Eq. (@ref{DefRightInvariant})):
@equation{
   \underline{\phi} = \phi\left(
      g,\; (dg g^{-1})^{\perp},\; - R_{[(dg g^{-1})^{\perp}\,,\; (dg g^{-1})^{\perp}]^{||}}
   \right)
}
We claim that this is a base form. The horizonthality is obvious, because 
the differentials only enter through @f{dg g^{-1}}. The invariance is also 
straightforward  using Eq. (@ref{InvarianceInCartanModel}). It remains to verify that @f{\underline{\phi}}
is closed. This should follow from the general theory using 
Eq. (@ref{VerifyClosedness}). Let us verify it directly. It is useful to interpret 
@f{d} as a differentiation over an odd parameter @f{\zeta}:
@align[r.l.n @list[
 @f{d\underline{\phi} = }
 @f|{{\partial\over\partial \zeta} \phi\left(
      e^{\zeta(dgg^{-1})^{\perp}}g\,,\; 
      (dg g^{-1})^{\perp} + \zeta{1\over 2}[(dgg^{-1})^{\perp},(dgg^{-1})^{\perp}]^{\perp}\,,\; 
      - R_{[(dg g^{-1})^{\perp}\,,\; (dg g^{-1})^{\perp}]^{||}}
   \right)}|
 @label{DunderlinePhi}
]]
@comment{The differentiation over @f{\zeta} is not a trick, but actually a @bold{definition} of the
de Rham operator @f{d}. Indeed, pseudo-differential forms  on @f{M} are defined as functions on 
@f{\Pi TM}. Notice that @f{\Pi TM = \mbox{Map}({\bf R}^{0|1},M)}. Then our @f{\zeta} is the coordinate
on @f{{\bf R}^{0|1}}}
Now consider this expression:
@align[r.l.n @list[
 ""
 @f|{{\partial\over\partial \zeta}\phi\left(
  e^{\zeta(dgg^{-1})^{\perp}}g\,,\; 
      (dg g^{-1})^{\perp} + \zeta{1\over 2}[(dgg^{-1})^{\perp},(dgg^{-1})^{\perp}]\,,\; 
       - R_{[(dg g^{-1})^{\perp}\,,\; (dg g^{-1})^{\perp}]^{||}}
  \right)
  }|
 @label{DwrtZeta}
]
]
(the only difference with the RHS of Eq. (@ref{DunderlinePhi}) being 
@f{\zeta{1\over 2}[(dgg^{-1})^{\perp},(dgg^{-1})^{\perp}]^{\perp}
   \mapsto
   \zeta{1\over 2}[(dgg^{-1})^{\perp},(dgg^{-1})^{\perp}]}
It can be interpreted as the result of application of the de Rham @f{d} to the
equivariant form @f{\phi(g,dgg^{-1},T\,)}, following by the substitution 
@f|{T\mapsto - R_{[(dg g^{-1})^{\perp}\,,\; (dg g^{-1})^{\perp}]^{||}}}|. 
Because @f{d_{\cal C}\phi=0}, we know that (@ref{DwrtZeta}) is equal to
@f{-\iota_T\phi(g,dgg^{-1},T\,)}, with the same substitution for @f{T}.
This substitution has the effect of turning 
@f{\zeta{1\over 2}[(dgg^{-1})^{\perp},(dgg^{-1})^{\perp}]}
into @f{\zeta{1\over 2}[(dgg^{-1})^{\perp},(dgg^{-1})^{\perp}]^{\perp}} 
and therefore @f{d\underline{\phi}=0}.

}



@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection bystro-conf)

@(bystro-close-connection bystro-conf)
@disconnect[formula-database]

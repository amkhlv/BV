#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define bystro-conf   
   (bystro (bystro-connect-to-server (build-path (find-system-path 'home-dir) ".config" "amkhlv" "latex2svg.xml"))
           "BV-formalism/formulas.sqlite"  ; name for the database
           "BV-formalism" ; directory where to store image files of formulas
           25  ; formula size
           (list 255 255 255) ; formula background color
           (list 0 0 0) ; formula foreground color
           2   ; automatic alignment adjustment
           0   ; manual alignment adjustment
           ))
@(define singlepage-mode #f)
@(bystro-def-formula "formula-enormula-humongula!")

@(bystro-dump-LaTeX #f)
@title[#:style '(no-toc no-sidebar)]{BV formalism}



@bystro-ribbon[]

@hyperlink["../index.html"]{Return to index}

@table-of-contents[]

@hyperlink["../index.html"]{Return to index}

@bystro-ribbon[]

@slide["Odd symplectic manifolds" #:tag "Odd symplectic manifolds" #:showtitle #t]{
@table-of-contents[]

@section[#:tag "sec:contraction-and-Lie-derivative"]{Contraction and Lie derivative}
We define @f{\iota_V} for a vector field @f{V} as follows. If @f{V} is even, we pick
a Grassmann odd parameter @f{\epsilon} and define:
@equation{
(\iota_V\, \omega)(Z,dZ) = {\partial\over\partial\epsilon} \omega(Z, dZ +\epsilon V\,)
}
@comment{
Remember that @f{dZ} parametrizes a point in the fiber of @f{\Pi TM} over the point @f{Z} in @f{M}.
Then @f{dZ + \epsilon  V} is a new point in the same fiber, linearly depending on @f{\epsilon}.
}
If @f{V} is odd, we define @f{\iota_V} as follows: @f{\iota_V\,\omega = {\partial\over\partial \epsilon}\iota_{\epsilon V}\,\omega}.
In coordinates: 
@equation{\iota_V = V^A{\partial\over\partial dZ^A}}
The relation to Lie derivative:
@equation{
[\iota_V,d] = {\cal L}_V
}

@section{Symplectic structure and Poisson structure}

Consider a supermanifold @f{M}, with local coordinates @f{Z^A}, equipped with an @bold{odd} Poisson bracket 
of the form:
@equation{
\{F,G\}\;=\; 
F\stackrel{\leftarrow}{\partial\over\partial Z^A} ^A\pi^B {\partial\over\partial Z^B} G
}
The Poisson bivector @f{^A\pi^B} should be symmetric in the following sense:
@equation{
^A\pi^B = (-)^{\bar{A}\bar{B} + \bar{A} + \bar{B}} \;^B\pi^A
}
The odd symplectic form @f{\omega} can be @bold{defined} from the following equation:
@equation{
dF = (-)^{\bar{F} + 1}\iota_{\{F,\_\}} \omega
}

@section{Darboux coordinates}

In Darboux coordinates:
@align[r.l.n @list[
 @f{\{F,G\}\;=\;}
 @f{F\left(
       \stackrel{\leftarrow}{\partial\over\partial \phi^{\star}_A}\;{\partial\over\partial\phi^A} \;-\;
       \stackrel{\leftarrow}{\partial\over\partial \phi^A}\;{\partial\over\partial\phi^{\star}_A} 
     \right)G }
 @label{DarbouxCoordinates}
]@list[
 @f{\omega\;=\;}
 @f{(-1)^A d\phi^A d\phi^{\star}_A}
 ""
]
]

}

@slide["Odd Laplace operator" #:tag "OddLaplace" #:showtitle #t]{

@table-of-contents[]

@section{Definition}
Let @f{M} denote the BV phase space.
A @f{P}-structure (@italic{i.e.} an odd Poisson bracket on @f{M})  defines a canonical 
second order differential operator on @bold{half-densities}, which we will call 
@f{\Delta_{\rm can}}. 
It is defined in the following way. Any half-density @f{\rho_{1\over 2}} 
defines a measure on a Lagrangian submanifold @f{L} @cite{Schwarz:1992nx,Schwarz:1992gs}, which we will  
denote @f{\left.\rho_{1\over 2}\right|_L}, or some times simply just @f{\rho_{1\over 2}}. 
Given a smooth function @f{H}, let us consider the variation of @f{\int_L\rho_{1\over 2}}
under the variation of @f{L} specified by the Hamiltonian vector field @f{\xi_H} 
corresponding to @f{H}. It can only depend on the restriction of @f{H} on @f{L} (this 
restriction may be called the ``infinitesimal generating function'' of the
variation of @f{L}). Therefore it should be of the form:
@equation[#:label "MeasureMu"]{
   \delta_{\{H,\_\}} \int_L\left.\rho_{1\over 2}\right|_L \; = \,\int_L H\; \mu_L[\rho_{1\over 2}]
}
where @f{\mu_L[\rho_{1\over 2}]} is @bold{some integral form} on @f{L} (which of course depends on @f{\rho_{1\over 2}}). 
We will now argue that @bold{exists some half-density on} @f{M},
which we will denote @f{\Delta_{\rm can}\rho_{1\over 2}}, such that:
@equation{
\mu_L[\rho_{1\over 2}] = - \left.\left(\Delta_{\rm can}\rho_{1\over 2}\right)\right|_L
}
In other words: 

@bold{Theorem @th-num{th:ExistsDeltaCanonical}:}
given a half-density @f{\rho_{1\over 2}}, exists another half-density 
@f{\Delta_{\rm can}\rho_{1\over 2}}, such that for any @f{H\in\mbox{Fun}(M)} and any Lagrangian @f{L\subset M}:
@equation[#:label "DeltaCanonical"]{
   \delta_{\{H,\_\}} \int_L\left.\rho_{1\over 2}\right|_L \; = \,
   - \int_L H\; \left.\left(\Delta_{\rm can}\rho_{1\over 2}\right)\right|_L
}
Eq. (@ref{DeltaCanonical}) is the definition of @f{\Delta_{\rm can}} 
(as was discovered in @cite{Khudaverdian:1999}).

An equivalent definition is through the Lie derivative along the Hamiltonian
vector field @f{\xi_H = \{H,\,\_\}}:
@equation[#:label "ViaLieDerivative"]{
   {\cal L}_{\{H,\,\_\}}\rho_{1\over 2} = 
   (-)^{\bar{H}}\Delta_{\rm can}\left(
      H\rho_{1\over 2}
   \right) -
   H\Delta_{\rm can}\rho_{1\over 2}
}

@bold{Lemma} 
@equation[#:label "EquivarianceOfMu"]{g^* \mu_{gL}[\rho_{1\over 2}] = \mu_L[g^* \rho_{1\over 2}]}
@bold{Proof}
For any @f{H\in {\rm Fun}(M)}:
@align[r.l.n @list[
@f{\int_L (H\circ g) \; g^*(\mu_{gL}[\rho_{1\over 2}])\;=\;}
""
""
]@list[
@f{=\;\int_{gL} H \mu_{gL}[\rho_{1\over 2}] \;=\;}
@f{\left.{d\over dt}\right|_{t=0}\int_{e^{t\{H,\_\}}gL}\left.\rho_{1\over 2}\right|_L\;=\;}
""
]@list[
@f{\;=\;}
@f{\left.{d\over dt}\right|_{t=0}\int_L g^*\left(e^{t\{H,\_\}}\right)^*\rho_{1\over 2}\;=\;
\left.{d\over dt}\right|_{t=0}\int_L \left(\exp(t\{H\circ g,\_\})\right)^*g^* \rho_{1\over 2}\;=\;}
""
]@list[
@f{=\;\int_L (H\circ g) \mu_L[g^*\rho_{1\over 2}]}
""
""
]]

@bold{Proof of Theorem.} 
We can in any case @bold{define} @f{\sigma_{1\over 2}[L,\rho_{1\over 2}]} by the formula:
@equation{
\left.\sigma_{1\over 2}[L,\rho_{1\over 2}] \right|_L \;=\; \mu_L[\rho_{1\over 2}]
}
What we have to prove is that so defined @f{\sigma_{1\over 2}[L,\rho_{1\over 2}]} does not depend on @f{L}.
In other words, consider any @f{x\in M} and a Lagrangian submanifold @f{L\subset M} such that @f{x\in L} and
@f{e_1,\ldots,f^1,\ldots} in @f{T_xM} such that @f{e_1,\ldots } are tangent to @f{L} and @f{\omega(f_i,e^j) = \delta_i^j}.
Then, by definition:
@equation{
\sigma_{1\over 2}[L,\rho_{1\over 2}] (x,\,e_1,\ldots,f^1,\ldots) \;=\; \mu_L[\rho_{1\over 2}](x)(e_1,\ldots)
}
Eq. (@ref{EquivarianceOfMu}) implies, that for any @f{g\in G} such that @f{g(x)=x}, and @f{g^*\rho_{1\over 2} = \rho_{1\over 2}} we have:
@equation[#:label "SigmaRotated"]{
\sigma_{1\over 2}[gL,\rho_{1\over 2}](x,\, g_*e_1,\ldots, g_*f^1,\ldots)\;=\;
\sigma_{1\over 2}[L,\rho_{1\over 2}](x,\,e_1,\ldots, f^1,\ldots)
}
Since @f{g} preserves @f{\rho_{1\over 2}} and the point, @f{x}, the linear transformation @f{g_*} of the tangent space
to @f{x} has unit superdeterminant; therefore Eq. (@ref{SigmaRotated}) implies:
@equation[#:label "sigma-is-L-independent"]{
\sigma_{1\over 2}[gL,\rho_{1\over 2}](x,\, e_1,\ldots, f^1,\ldots)\;=\;
\sigma_{1\over 2}[L,\rho_{1\over 2}](x,\,e_1,\ldots, f^1,\ldots)
}
The group of special canonical transformations preserving the point @f{x} acts
locally transitively on Lagrangian submanifolds passing through the point @f{x}.
Therefore Eq. (@ref{sigma-is-L-independent}) implies that @f{\sigma_{1\over 2}} does not depend on @f{L}.

@section{Relation to odd Poisson bracket}
Let @f{X} and @f{Y} be two @bold{odd} Hamiltonians (so that the corresponding Hamiltonian
vector fields @f{\xi_X = \{X,\_\}} and @f{\xi_Y = \{Y,\_\}} are both @bold{even}).
Also suppose that the restriction of @f{Y} on @f{L} is zero:
@equation{Y|_L=0}
Consider the following chain of equalities, containing a constant odd parameter @f{\epsilon}:
@align[r.l.n @list[
 ""
 @f{\int_L \Big(- \epsilon \Delta_{\rm can} (XY\rho_{1\over 2}) - \epsilon X\Delta_{\rm can}(Y\rho_{1\over 2}) 
    \Big)\;=\; \delta_{\{X,\_\}} \int\epsilon Y\rho_{1\over 2} \;=\; -\int \{X,Y\,\}\epsilon\rho_{1\over 2}}
 @label{DerivingLeibnitzForDelta}
]]
We will define the operator @f{\Delta_{\rho_{1\over 2}}} on functions as follows:
@equation[#:label "OperatorDelta"]{
   (\Delta_{\rho_{1\over 2}} F\,) \rho_{1\over 2} \;=\; \Delta_{\rm can}(F\,\rho_{1\over 2} )- (-)^{\bar{F}}F\Delta_{\rm can}\rho_{1\over 2} \;=\;
(-)^{\bar{F}}{\cal L}_{\{F,\_\}}\rho_{1/2}
}
Usually there is some obvious implicit half-density; then we will abbreviate:
@equation{
\Delta = \Delta_{\rho_{1\over 2}}
}
Eq. (@ref{DerivingLeibnitzForDelta}) implies:
@equation[#:label "BVStructure"]{
\Delta(XY\,) = (\Delta X)Y + (-)^{\overline{X}}X\Delta Y + (-)^{\overline{X}}\{X,Y\,\}
}

@section{In coordinates}
@subsection{Leading symbol}
The @bold{leading symbol} of @f{\Delta} does not depend on @f{\rho_{1\over 2}}:
@equation{
\Delta =\;(-)^A{\;}  {1\over 2}{\partial\over\partial Z^A}\;^A\pi^B {\partial\over\partial Z^B} +\ldots
}
In Darboux coordinates (defined by Eq. (@ref{DarbouxCoordinates})):
@equation{
\Delta\;=\;
(-1)^{\bar{A}+1}{\partial\over\partial\phi^{\star}_A}{\partial\over\partial\phi^A}
}
@comment{
Let us verify that @f{\Delta} transforms correctly when we go to different Darboux coordinates.
An infinitesimal change of Darboux coordinates is generated by a Hamiltonian flux @f{\{\Psi,\_\}}; for an infinitesimal @f{\Psi}:
@align[r.l.n @list[
  @f{{\partial\over\partial \widetilde{\phi}^A} \;=\;} 
  @f{{\partial\over\partial\phi^A} + \left[{\partial\over\partial\phi^A},\{\Psi,\_\}\right]}
  ""
]@list[
  @f{{\partial\over\partial \widetilde{\phi}^{\star}_A} \;=\;} 
  @f{{\partial\over\partial\phi^{\star}_A} + \left[{\partial\over\partial\phi^{\star}_A},\{\Psi,\_\}\right]}
  ""
]
]
Let us assume that @f{\Psi} is odd. We have:
@equation[#:label "difference-of-deltas"]{
(-1)^{\bar{A}+1}\left(
  {\partial\over\partial\tilde{\phi}^{\star}_A}{\partial\over\partial\tilde{\phi}^A}\;-\;
  {\partial\over\partial\phi^{\star}_A}{\partial\over\partial\phi^A}
\right)\;=\;\{\Delta\Psi,\_\}
}
On the other hand, the additional term which comes from @f{\rho_{1\over 2}} varying as a density is:
@equation{
\Delta((\Delta \Psi)\rho_{1\over 2})\;=\;\{\Delta\Psi\,,\,\rho_{1\over 2}\}
}
This cancels with Eq. (@ref{difference-of-deltas})  @spn[attn]{TODO:} check sign
}


@subsection[#:tag "sec:QuantumPartOfDelta"]{The ``quantum part'' @f{\Delta^{(0)}}}
Consider the case when @f{M} is an odd cotangent bundle: @f{M=\Pi T^*N}. Let us introduce
the coordinates @f{(x^1,\ldots,\theta^1,\ldots)} on @f{N}. Let @f{x_1^{\star},\ldots,\theta_1^{\star},\ldots}
be the corresponding dual coordinates in the fiber of @f{\Pi T^*N\longrightarrow N}.
The odd Poisson bracket is:
@equation{
\{H,F\,\} =
H\left(
  \stackrel{\longleftarrow}{\partial\over\partial x^{\star}_a}
  \stackrel{\longrightarrow}{\partial\over\partial x^a}
  -
  \stackrel{\longleftarrow}{\partial\over\partial x^a}
  \stackrel{\longrightarrow}{\partial\over\partial x^{\star}_a}
\right)F +
H\left(
  \stackrel{\longleftarrow}{\partial\over\partial \theta^{\star}_{\alpha}}
  \stackrel{\longrightarrow}{\partial\over\partial \theta^{\alpha}}
  -
  \stackrel{\longleftarrow}{\partial\over\partial \theta^{\alpha}}
  \stackrel{\longrightarrow}{\partial\over\partial \theta^{\star}_{\alpha}}
\right)F 
}
With respect to these coordinates, we can define the ``constant'' volume element:
@equation{
\mbox{vol}^{(0)} = (dx^1\wedge\cdots)\wedge(d\theta^{\star}_1\wedge\cdots)\;
\left({\partial\over\partial x^{\star}_1}\cdots\right)
\left({\partial\over\partial\theta^1}\cdots\right)
}
and the constant half-density:
@equation{
\rho_{1\over 2}^{(0)} = \sqrt{\mbox{vol}^{(0)}}
}
We will introduce the following notation:
@equation[#:label "DeltaZero"]{
\Delta^{(0)} = \Delta_{\rho^{(0)}_{1\over 2}}
}
Obviously, this notation only makes sense with a choice of coordinates.


@section{Example: purely even @f{N}}
As an example, consider the case when @f{N} has dimension @f{1|0}. A sufficiently generic 
Lagrangian submanifold is given by the equation:
@equation[#:label "ExampleOfLagrangianSubmanifoldCaseEvenN"]{
x^{\star} = \psi(x)
}
The integral of a half-density @f{\rho_{1\over 2} = w(x,x^{\star})\rho^{(0)}} over this
Lagrangian submanifold is:
@equation{
\int_{-\infty}^{+\infty} dx\; w(x,\psi(x))
}
To compute the variation of this integral under the Hamiltonian vector field @f{\{H,\,\_\} \,=\, H\left(
  -
  \stackrel{\longleftarrow}{\partial\over\partial x^{\star}}
  \stackrel{\longrightarrow}{\partial\over\partial x}
  +
  \stackrel{\longleftarrow}{\partial\over\partial x}
  \stackrel{\longrightarrow}{\partial\over\partial x^{\star}}
\right)}, we just have to take into account the variation of the Lagrangian submanifold (@ref{ExampleOfLagrangianSubmanifoldCaseEvenN}), 
which is encoded in the following variation of @f{\psi(x)}:
@equation[#:label "VariationOfPsi"]{
\delta \psi(x) = \left.\left(
 {\partial H(x,x^{\star})\over\partial x} + \left(H(x,x^{\star})\stackrel{\leftarrow}{\partial\over\partial x^{\star}}\right){\partial\psi\over\partial x}
\right)\right|_{x^{\star}=\psi(x)} =\;  {d\over dx} H(x,\psi(x))
}
After integration by parts, we get:
@equation{
\delta \int_{-\infty}^{+\infty} dx\; w(x,\psi(x)) = 
- \int_{-\infty}^{+\infty} dx\;H{\partial\over \partial x}\left.{\partial\over\partial x^{\star}}\right|_{x^{\star}=\psi(x)} w(x,\psi(x))
}
Therefore, we have:
@equation{
\Delta_{\rm can} \left(w(x,x^{\star})\rho^{(0)}\right) = - \left({\partial^2\over\partial x \partial x^{\star}} w(x,x^{\star})\right)\rho^{(0)}
}
This is in agreement with Eqs. (@ref{DeltaCanonical}) and (@ref{BVStructure}). (Remember that in this case @f{(-)^{\overline{H}} = -1} , see Eq. (@ref{VariationOfPsi}).)


}

@slide["Master Equation" #:tag "MasterEquation" #:showtitle #t]{
We will always assume that @f{\rho_{1\over 2}} satisfies the Master Equation:
@equation{
   \Delta_{\rm can}\rho_{1\over 2} = 0
}
Under this assumption, the operator @f{\Delta} defined in Eq. (@ref{OperatorDelta}) is nilpotent:
@equation{
   \Delta^2 = 0
}
while @f{\Delta_{\rm can}} is always nilpotent.
}

@slide["Inifinite-dimensional case" #:tag "Infinite dimensional case" #:showtitle #t]{

@table-of-contents[]

@section{Problem}
We want to apply the BV formalism for a field-theoretic system (the string worldsheet theory).
Unfortunately, we do not know how to rigorously define @f{\Delta_{\rm can}} in this case.
The main problem is the appearence of ill-defined expressions when acting by the ``quantum part'' @f{\Delta^{(0)}}
@bold{on local functionals}:
@equation[#:label "DeltaIsUndefined"]{
\Delta^{(0)} \int \phi(x)\phi^{\star}(x) = \int \delta(0)
}
Sometimes the result of application of @f{\Delta^{(0)}} is ``obviously zero'', for example with two flavours of
scalar fields:
@equation[#:label "DeltaIsZero"]{
\Delta^{(0)} \int \phi_1(x)\phi_2^{\star}(x) = 0
}
We feel that in such cases it is justified to assume that @f{\Delta^{(0)}} acts as zero.
When acting on @bold{local} functionals, the result seems to be either undefined (as in Eq. (@ref{DeltaIsUndefined}))
or just zero (as in Eq. (@ref{DeltaIsZero})). It seems to be impossible to obtain any meaningful
result other than zero. 

At the same time, the application @f{\Delta^{(0)}} to @bold{multilocal} functionals, generally speaking, does lead to meaningful
nonzero results, for example:
@equation[#:label "DeltaOnProductOfLocal"]{
\Delta^{(0)}\left(\int \phi_1(x)\phi_2^{\star}(x) \int \phi_2(y)\phi_1^{\star}(y) \right) \;=\; \int \phi_1(x)\phi_1^{\star}(x) + (-)^{\bar{\phi_1} + \bar{\phi_2} + 1} \phi_2(x)\phi_2^{\star}(x)
}

@section{Potentially unsafe operations}
Operators @f{\Delta_{\rm can}} and @f{\Delta} are, generally speaking, unsafe, because they
contain @f{\Delta^{(0)}}.

The Lie derivative defined @f{{\cal L}_{\{H,\,\_\}}\rho_{1\over 2}} defined in Eq. (@ref{ViaLieDerivative}) 
is safe as a function of @f{\rho_{1\over 2}}, but unsafe in @f{H}.

We will give an @hyperlink["../omega/Unsafe_operations.html"]{example of a computation where this is important}.

@section{How to be safe}
@div[redbox]{
The Lie derivative @f{{\cal L}_{\{H,\,\_\}}\rho_{1\over 2}} is completely safe if @f{H} depends only on
fields, but not on antifields (or @italic{vice versa}).
}
Obviously, @bold{all such @f{H} are in involution with one another}.

There could be other methods of safe restriction. 

Notice that both @f{\int \phi_1(x)\phi_2^{\star}(x)} and @f{\int \phi_2(x)\phi_1^{\star}(x)} in Eq. (@ref{DeltaOnProductOfLocal}) 
appear safe, and the product of them safe, but their antibracket is unsafe.

}




@slide["Classical BV formalism" #:tag "Classical BV" #:showtitle #t]{
@table-of-contents[]

@section{Expansion in Planck constant}

Let us substitute the following ansatz for @f{\rho_{1\over 2}}:
@equation{
\rho_{1\over 2} \;=\; \exp\left({1\over\hbar} S_{\rm BV}\right)\rho_{1\over 2}^{(0)}
}
where @f{\rho_{1\over 2}^{(0)}} was @seclink["sec:QuantumPartOfDelta"]{defined previously}.
In this case:
@equation{
\hbar\Delta  = \hbar\Delta^{(0)}  + \{S_{\rm BV}\,,\,\_\,\}
}
In the ``classical'' BV formalism, we want to just drop the first term @f{\Delta^{(0)}}, but we have to
be careful. Notice that we are dealing with multilocal expressions, basically products
of integrals. By definition, we will consider such expression to be @bold{classical},
if the power of @f{\hbar^{-1}} is equal to the number of integrals:
@equation[#:label "ClassicalExpression"]{
{1\over\hbar^n}\int F_1\cdots\int F_n
}
where each @f{F_j} is a local expression of the form:
@equation{
F_j = f_j(z,\bar{z}) {\cal O}_j\quad\mbox{\small\tt where } {\cal O}_j \mbox{ \tt\small is a local operator composed from } \phi \mbox{ \tt\small and } \phi^{\star}
}
On such expressions, we define the @bold{classical} action of @f{\hbar \Delta} as follows:

@bold{Definition @defn-num{def:ClassicalDelta}:}
@align[r.l.n @list[
 @f{(\hbar\Delta)_{\rm classical}  \left({1\over\hbar^n}\int F_1\cdots\int F_n\right) \;=\;}
 @f{{1\over\hbar^n}\sum_{i=1}^n \int F_1\cdots\left\{S_{\rm BV},\int F_i\right\}\cdots\int F_n \;+\;}
 ""
]@list[
 ""
 @f{+\;{1\over \hbar^{n-1}}\sum_{i<j} \left\{\int F_i \;,\int F_j\right\}\,\int F_1\cdots\widehat{\int F_i}\cdots\widehat{\int F_j}\cdots\int F_n}
 @label{classical-delta}
]
]
Notice that:
@itemlist[
@item{Both terms on the right hand side are equally classical: the power of @f{1\over\hbar} is the same as the number of integrals.}
@item{The term with @f{\left\{\int F_i \;,\int F_j\right\}} came from the application of @f{\Delta^{(0)}}. The lesson is that we can (and should) only neglect @f{\Delta^{(0)}}
when acting on expressions with single integration. When acting on the multilocal expression @f{\Delta^{(0)}} is essential.}
]

@section{Generalization and algebraic interpretation}
We might need a small generalization (basically, a completion) of the space of expressions of the form (@ref{ClassicalExpression}):
@equation{
{1\over\hbar^n}\int d^2z_1\cdots \int d^2z_n\;G(z_1,\bar{z}_1,\ldots,z_n,\bar{z}_n)\;{\cal O}_1(z_1,\bar{z}_1)\cdots {\cal O}_n(z_n,\bar{z}_n)
}
The generalization of Eq. (@ref{classical-delta}) is straightforward:
@align[r.l.n @list[
 ""
 @f{(\hbar\Delta)_{\rm classical}\left(
      {1\over\hbar^n}\int d^2z_1\cdots \int d^2z_n\;G(z_1,\bar{z}_1,\ldots,z_n,\bar{z}_n)\;{\cal O}_1(z_1,\bar{z}_1)\cdots {\cal O}_n(z_n,\bar{z}_n)
    \right)\;=\;
   }
 @label{classical-completed-delta}
]@list[
 @f{\;=\;}
 @f{{1\over\hbar^n}\sum_{i=1}^n\int d^2z_1\cdots\int d^2z_n \;G(z_1,\bar{z}_1,\ldots,z_n,\bar{z}_n)\;
    {\cal O}_1(z_1,\bar{z}_1)\cdots \{S_{\rm BV},{\cal O}_i(z_i,\bar{z}_i)\}\cdots {\cal O}_n(z_n,\bar{z}_n)\;+\;}
 ""
]@list[
 ""
 @f{\;+\;{1\over\hbar^{n-1}}\sum_{i<j}  \int d^2z_1\cdots\int d^2z_n \;
   }
 ""
]@list[
 ""
 @f{\quad\quad G(z_1,\bar{z}_1,\ldots,z_n,\bar{z}_n)\;
    \{{\cal O}_i(z_i,\bar{z}_i)\,,\,{\cal O}_j(z_j,\bar{z}_j)\}\;
    {\cal O}_1(z_1,\bar{z}_1)\cdots \widehat{{\cal O}_i(z_i,\bar{z}_i)}\cdots \widehat{{\cal O}_j(z_j,\bar{z}_j)}\cdots {\cal O}_n(z_n,\bar{z}_n)
   }
 ""
]
]
This construction has the following Lie-algebraic interpretation. Notice that the space of expressions of the form 
@f{\int d^2z \;f(z,\bar{z}) {\cal O}(z,\bar{z})} is closed under the odd Poisson bracket. Let us call this space @f{\cal A}.
The odd Poisson bracket determines therefore the Lie superalgebra structure on @f{\Pi{\cal A}}. 
The standard Lie algebra homology complex of @f{\Pi{\cal A}} has the canonical BV structure with the BV generator
given by Eq. (@ref{classical-completed-delta}).

@comment{
Consideration of arbitrary smooth functions @f{G(z_1,\bar{z}_1,\ldots,z_n,\bar{z}_n)} requires some 
completion of the tensor product @f{{\cal A}^{\otimes n}}. Simple linear-algebraic tensor product
leads to finite sums of products of functions of @f{(z_1,\bar{z}_1)}, … ,@f{(z_n,\bar{z}_n)}. We feel that
this is actually even enough for our purposes.
}

}

@slide["Moment map" #:tag "MomentMap" #:showtitle #t]{

@table-of-contents[]
@section{Notations}

Let @f{G} denote the group of canonical transformations of @f{M}. 
Let us denote @f{G_L} 
and @f{G_R} the group of left and right shifts on @f{G} (both @f{G_L} and @f{G_R} are
naturally isomorphic to @f{G}). Both left and right shifts naturally lift to 
@f{\Pi TG}. Let @f{\bf g} be the Lie algebra corresponding to @f{G}. 

@section[#:tag "CentralExtension"]{Central extension}
Let @f{C^{\infty}M} denote the space of functions on @f{M}. Notice that @f{\Pi C^{\infty}M} is a 
Lie superalgebra under the Poisson bracket. It is a central extension of @f{\bf g}:
@equation[#:label "DefHatG"]{
   \widehat{\bf g} = \Pi C^{\infty}M
}
Let @f{\widehat{G}} denote the corresponding Lie group. 

@section{Moment map}
As usual, we consider the right-invariant differential form on @f{\widehat{G}} with values 
in @f{\widehat{\bf g}}, which is denoted @f{d\hat{g}\hat{g}^{-1}}. Because of (@ref{DefHatG}), we can consider it as a
differential 1-form with values in @f{\Pi C^{\infty}M}. There is some invariance under
the left and right shifts, which can be summarized as follows:
@align[r.l.n @list[
 @f{d\widehat{g}\widehat{g}^{-1}\;\in\;} 
 @f{C^{\infty}\left( 
      (\Pi T\widehat{G})\times_{\widehat{G}_L\times \widehat{G}_R} M
   \right)
   }
 @label{moment-map-type}
]@list[
 @f{d\widehat{g}\widehat{g}^{-1} \;=\;} 
 @f{(d\widehat{g}\widehat{g}^{-1})_A{\cal H}^A}
 @label{moment-map-in-coordinates}
]@list[
 @f{d_{(g)} F(gx) \;=\;}
 @f{\{d\widehat{g}\widehat{g}^{-1}\,,\,F\,\}(gx)}
 @label{moment-map-derivative-of-f}
]
]
where:
@itemlist[
@item{the action of @f{\widehat{G}_L\times \widehat{G}_R} on @f{\Pi T\widehat{G}} is induced from the
      following action on @f{\widehat{G}}:
      @equation{
         (g_L,g_R) \; g \;= g_Lgg^{-1}_R
      }}
@item{the action of @f{\widehat{G}_L\times \widehat{G}_R} on @f{M} is:
      @equation{
         (g_L,g_R) \; m \;= g_Lm
      }}
]


}

@slide["Quantomorphisms" #:tag "Quantomorphisms" #:showtitle #t]{
Let us promote the BV phase space @f{M}
to the @f{{\bf R}^{0|1}}-bundle over @f{M}, which we will call @f{\widehat{M}}:
@equation{
\widehat{M} \stackrel{\widehat{\pi}}{\longrightarrow} M
}
We have the exact sequence:
@equation{
   0\rightarrow \mbox{Inv}_{{\bf R}^{0|1}}(\Gamma(T\widehat{M}/M\,)) \rightarrow 
   \mbox{Inv}_{{\bf R}^{0|1}}(\mbox{Vect}(\widehat{M}\,)) \xrightarrow{\widehat{\pi}_*}
   \mbox{Vect}(M\,)\rightarrow 0
}
which can be thought of as an exact sequence of algebroids over @f{M}, 
or just of Lie superalgebras. 
It involves the Atiyah algebroid @f{\mbox{Inv}_{{\bf R}^{0|1}}(\mbox{Vect}(\widehat{M}))} whose anchor is  @f{\widehat{\pi}_*}. The kernel of @f{\widehat{\pi}_*}
is the @f{0|1}-dimensional space @f{\mbox{Inv}_{{\bf R}^{0|1}}(\Gamma(T\widehat{M}/M\,))}. A connection is a split:
@equation{
\underline{\rm lift}\;:\; \mbox{Vect}(M)\rightarrow \mbox{Inv}_{{\bf R}^{0|1}}(\mbox{Vect}(\widehat{M}))
}
Suppose that we can find a ``symplectic potential'' @f{\alpha} such that @f{\omega = d\alpha}. Then we can use it 
to construct the connections satisfying:
@equation{
[\underline{\rm lift}(v_1),\underline{\rm lift}(v_2)]\;=\;
\underline{\rm lift}([v_1,v_2]) + \omega(v_1,v_2) \partial_{\vartheta}
}
where @f{\partial_{\vartheta}} is the vector field arizing from the action of @f{{\bf R}^{0|1}} on @f{\widehat{M}}.  (We can think of @f{\vartheta} as 
a coordinate in the fiber; it is only defined locally, but @f{\partial_{\vartheta}} is globally well-defined.) 
Explicitly:
@equation[#:label "ConnectionAsLift"]{
\underline{\rm lift}(v) = v + (\iota_v\alpha)\partial_{\vartheta}
}
Let us consider the subalgebra @f{{\bf g}\subset \mbox{Vect}(M)} consisting of Hamiltonian vector fields. 
For every even (we will restrict to even vector fields for simplicity) @f{\{H,\_\}\in {\bf g}} consider the following vector field on @f{\widehat{M}}:
@equation[#:label "DefHHat"]{
\hat{\xi}_H \;=\; \{H,\_\} + (\iota_{\{H,\_\}}\alpha + H) \partial_{\vartheta}
}
It is defined to preserve the connection. An explicit calculation shows that the
@seclink["sec:contraction-and-Lie-derivative"]{Lie derivative} vanishes:
@equation{
{\cal L}_{\hat{\xi}_H} (d\theta - \alpha) = 0
}
By construction, the space of vector fields of this form is closed under commutator. 
We can check it directly, using the formula:
@align[r.l @list[
@f{}@f{\left[\;
   \{H,\_\} + (\iota_{\{H,\_\}}\alpha + H)\partial_{\vartheta}\;,\;
   \{F,\_\} + (\iota_{\{F,\_\}}\alpha + F)\partial_{\vartheta}
\;\right]\;=\;}
]@list[
@f{\;=\;}@f{\{\{H,F\},\_\}\;+\; \left(
   {\cal L}_{\{H,\_\}}(\iota_{\{F,\_\}}\alpha) - {\cal L}_{\{F,\_\}}(\iota_{\{H,\_\}}\alpha)
   + 2\{H,F\}
\right)\partial_{\vartheta}}
]@list[
@f{\;=\;}@f{\{\{H,F\}\,,\,\_\}\;+\; \left(\iota_{\{\{H,F\},\_\}}\alpha + \{H,F\}\right)\partial_{\theta}}
]
]
As a Lie algebra
this is @f{\Pi\mbox{Fun}(M)}. It integrates to the group of automorphisms of the fiber bundle @f{\hat{M}\to M}
which preserve the connection defined in Eq. (@ref{ConnectionAsLift}). 


}



@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection bystro-conf)

@(bystro-close-connection bystro-conf)
@disconnect[formula-database]
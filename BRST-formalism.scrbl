#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define bystro-conf   
   (bystro (bystro-connect-to-server (build-path (find-system-path 'home-dir) ".config" "amkhlv" "latex2svg.xml"))
           "BRST-formalism/formulas.sqlite"  ; name for the database
           "BRST-formalism" ; directory where to store image files of formulas
           25  ; formula size
           (list 255 255 255) ; formula background color
           (list 0 0 0) ; formula foreground color
           2   ; automatic alignment adjustment
           0   ; manual alignment adjustment
           ))
@(define singlepage-mode #f)
@(bystro-def-formula "formula-enormula-humongula!")

@(bystro-dump-LaTeX #f)

@title[#:style '(no-toc no-sidebar)]{BRST formalism}


@bystro-ribbon[]

@hyperlink["../index.html"]{Return to index}

@table-of-contents[]

@hyperlink["../index.html"]{Return to index}

@bystro-ribbon[]

@slide["Construction" #:tag "Construction" #:showtitle #t]{
@table-of-contents[]
@subpage[1 @elem{Ghosts} #:tag "sec-Ghosts"]
One starts with the ``classical action'' @f{S_{\rm cl}} which is invariant under some @bold{gauge symmetry}.
Let @f{X} be the ``classical'' space of fields, @italic{e.g.} for Yang-Mills theory the fields are @f{A_{\mu}(x)}.
Suppose the gauge symmetry is @f{H}, with the Lie algebra @f{{\bf h} = \mbox{Lie}(H)}.

Then we should introduce ghost fields, geometrically:
@align[r.l.n @list[
  @elem[#:style 'no-break]{fields and ghosts }
  @f{\in {\Pi TH\times X\over H}}
  ""
]
]
where the action of @f{h_0\in H} is via @bold{right shift} on @f{H}:
@e{
h_0 (dh,h,x) = (dhh_{0}^{-1}, hh_0^{-1}, h_0.x)
}
@comment{
We use the coordinates @f{dh,h} on @f{\Pi TH} (denoting ``@f{dh}'' the coordinate on the fiber @f{\Pi T_hH}) and @f{x} on @f{X}.
}
Notice that this commutes with @f{Q_{\rm BRST} = dh {\partial\over\partial h}}. 
We can always find a representative with @f{h=1} (@italic{i.e.} choose @f{h_0 = h^{-1}}).
Then, with the standard notation @f{c = dh}:
@e[#:label "standard-BRST-operator"]{
Q_{\rm BRST} = {1\over 2}f_{AB}{}^Cc^A c^B{\partial\over\partial c^C} + c^A v_A^i{\partial\over\partial x^i}
}
@comment{
Functions on @f{\Pi TH\times X\over H} satisfy:
@align[r.l.n @list[
  @f{f(dhh_0^{-1}, hh_0^{-1}, h_0 x)\;=\;} 
  @f{f(dh,h,x)}
  ""
]@list[
  @f{(Q_{\rm BRST}f)(dh,1,x)\;=\;}
  @f{{\partial\over\partial\epsilon}f(dh,\, 1 + \epsilon dh,\, x) = {\partial\over\partial\epsilon}f(dh + \epsilon dh dh,\, 1,\, (1 + \epsilon dh)x)}
  ""
]
]

}

@subpage[1 @elem{Integration measure} #:tag "sec:integration-measure"]
We assume that @f{X/H} comes with some integration measure:
@e{\mu = e^{S_{\rm cl}(x)}}
This should be understood as an integration measure, @italic{i.e.} a density of weight @f{1} (rather than a function of @f{x}).
The product of this measure with the canonical measure on @f{\Pi TH} gives us a measure on @f{\Pi TH\times X\over H}
which we will call @f{\mu_{\rm BRST}}. Notice that @f{Q_{\rm BRST}} preserves this measure.
This can be proven as follows. For any function @f{f\in\mbox{Fun}\left({\Pi TH\times X\over H}\right)}:
@e{
\int_{\Pi TH\times X\over H}\mu_{\rm BRST}\; Q_{\rm BRST}f \;=\;0
}
because @f{Q_{\rm BRST}} comes from the canonical odd vector field on @f{\Pi TH}.



@subpage[1 @elem{Lift of symmetries to BRST configuration space} #:tag "sec:lift-of-symmetry-to-BRST"]
Original gauge symmetries can be lifted to the BRST field space as @bold{left shifts} on @f{H}:
@align[r.l.n @list[
  @f{h_0.(dh,h,x) \;=\;} @f{(h_0dh,\, h_0h,\, x)} @label{lift-of-symmetry}
]
]
Notice the following properties of left shifts:
@itemlist[#:style 'ordered
@item{They commute with @f{Q_{\rm BRST}}}
@item{Infinitesimal symmetries of the form Eq. (@ref{lift-of-symmetry}) are actually @f{Q_{\rm BRST}}-exact. 
Indeed, they come from infinitesimal left shifts on @f{H}, and @f{Q_{\rm BRST}} comes from the de Rham differential.}
@item{The measure on @f{\Pi TH\times X\over H} is invariant.}
]
}

@slide["BV from BRST" #:tag "BV from BRST" #:showtitle #t]{
@table-of-contents[]

@subpage[1 @elem{Definition of the BV phase space} #:tag "sec:bv-phase-space"]
The BV phase space is:
@e{
M = \Pi T^* \left({\Pi TH\times X\over H}\right)
}
The zero section @f{\Pi TH\times X\over H} is a Lagrangian submanifold. It comes with @seclink["sec:integration-measure"]{the integration measure},
which lifts to a half-density on @f{M} of the form @f{e^{S_{\rm BV}}}, where:
@e{
S_{\rm BV} = 
S_{\rm cl}(x) + (Q_{\rm BRST}c^A)c^{\star}_A + (Q_{\rm BRST}x^i)x_i^{\star}
} 
where @f{Q_{\rm BRST}} is as defined in Eq. (@ref{standard-BRST-operator}).
@comment{
We can imagine a more general situation when we have a functional @f{S_{\rm cl}} with 
an odd symmetry @f{Q_{\rm BRST}} nilpotent off-shell. 
But, just to describe the ``standard BRST formalism'', we explicitly break the fields 
into @f{c^A} and @f{x^i}.
}


@subpage[1 @elem{Lifting the symmetries to BV phase space} #:tag "sec-Lifting-the-symmetries-to-BV-phase-space"]
We have realized @seclink["sec:lift-of-symmetry-to-BRST"]{the gauge algebra @f{\bf h} as symmetries of the BRST configuration space}
as left shifts on @f{\Pi TH}.
Since the BV phase space is the odd cotangent bundle, we can further lift them to the BV phase space.
The symmetry corresponding to the infinitesimal @bold{left} shift (@ref{lift-of-symmetry}) is generated by the BV Hamiltonian:
@align[r.l.n @list[
  @f{H\langle\xi\rangle\;=\;} @f{\Delta(\xi^{\alpha}c^{\star}_{\alpha})} ""
]
]
Notice that in the BRST case @f{\Delta} coincides with @f{\{S_{\rm BV},\_\}}.

}


@slide["Family of Lagrangian submanifolds" #:tag "Family of Lagrangian submanifolds" #:showtitle #t]{
@short-intro{
Here we will describe a family of Lagrangian submanifolds which is a generalization of
the construction used in @hyperlink["../bosonic-string/index.html"]{bosonic string theory}
}

@table-of-contents[]

@subpage[1 @elem{Conormal bundle} #:tag "sec-Conormal-bundle"]

Let @f{\cal Y} be some family of submanifolds @f{Y\subset X} closed under the action of the gauge symmetry
@comment{
``closed under the action'' means that if @f{Y_1\in {\cal Y}} then for any gauge 
transformation @f{h}, @f{hY_1\in {\cal Y}} 
}
For each @f{Y \in {\cal Y}}, the @bold{odd conormal bundle} of @f{Y} (denoted @f{\Pi(TY)^{\perp}}) is a subbundle 
of the odd cotangent bundle @f{\Pi T^* X|_Y} which consists of those covectors which evaluate to zero 
on vectors tangent to @f{Y}. For each @f{Y\subset X}, the corresponding odd conormal bundle is a  
Lagrangian submanifold. Given such a family @f{\cal Y}, let us define a family of Lagrangian 
submanifolds in the BV phase space in the following way: for every @f{Y}, the corresponding 
Lagrangian submanifold is the odd conormal bundle of @f{Y}, times the space of @f{c}-ghosts:
@e[#:label "rotated-lag"]{
L(Y) \;=\; \Pi(TY)^{\perp}\times \mbox{[$c$-ghosts]}\;=\; \Pi(TY)^{\perp}\times \Pi {\bf h}
}

@subpage[1 @elem{Non-degeneracy} #:tag "sec-Non-degeneracy"]

Let us ask the following question: under what conditions 
the restriction of @f{S_{\rm BV}} to each @f{L(Y\,)} is non-degenerate? 
Or, in case if it is degenerate, how can we characterize the degeneracy? We have:
@e{
\left. S_{\rm BV} \right|_{L(Y\,)} \;=\; \left.S_{\rm cl}(\varphi)\;\right|_{\varphi\in Y} \;+\; T_A^ic^A\varphi^{\star}_i\;|_{\varphi^{\star}\in \Pi(T\,Y\,)^{\perp}}
}
@comment{
The second term @f{T_A^ic^A\varphi^{\star}_i} is the evaluation of the covector @f{\varphi^{\star}} on the tangent vector 
@f{Q\varphi\in TX}.
}
Let us assume that the restriction of @f{S_{\rm BV}} to any @f{L(Y\,)}  has a critical 
point, and study the @bold{quadratic terms} in the expansion of @f{\left. S_{\rm BV} \right|_L} around a critical point.
@comment{
To define the perturbation theory,
we need already the quadratic terms to be non-degenerate.
}
Assuming that the critical point is at @f{\varphi=0}: 
@e{
S_{\rm cl}(\varphi) = k_{ij}\varphi^i\varphi^j + o(\varphi^2)
}
Suppose that all degeneracies of @f{S_{\rm cl}} and of @f{k} are due to symmetries. In other words:
@align[r.l @list[
@f{\mbox{ker}\;k\;=\;}@f{\mbox{im}\;\tau}
]@list[
@f{\mbox{\tt\small where } \tau}@f{\;:\; {\bf h} \rightarrow TX}
]@list[
@f{\tau^i(\xi)}@f{\;= \; T^i_A\xi^A}
]]
Let @f{s} be the quadratic part of @f{\left. S_{\rm BV} \right|_L}: 
@e{
s\;=\; \left. k_{ij}\varphi^i\varphi^j \right|_{\varphi\in T\,Y} \;+\; 
\left. \tau^i(c)\varphi^{\star}_i\;\right|_{\varphi^{\star}\in (T\,Y\,)^{\perp}}
}
The degeneracy is characterized by the isotropic subspace of @f{s} which we denote @f{\mbox{ker}\;s}: 
@align[r.c.c.c.c.c.c.c.n @list[
 @f{\mbox{ker}\;s\;=\;}
 @f{(\mbox{im}\,\tau \cap T\,Y\,)}
 @f{\oplus \;\Pi\Big(}
 @f{(\mbox{im}\,\tau \cap T\,Y\,)}
 @f{\oplus\;}
 @f{\mbox{ker}\,\tau}
 @f{\;\oplus \;\;}
 @f{(\mbox{im}\,\tau\;+T\,Y\,)^{\perp}\Big)}
 ""
]@list[
 @elem[#:style 'no-break]{from@hspace[1]}
 @f{\phi}
 ""
 @f{c}
 ""
 @f{c}
 ""
 @f{\phi^{\star}}
 ""
]
]
Let us make the following assumptions:
@itemlist[#:style 'ordered 
@item{The space @f{\mbox{im}\,\tau \cap T\,Y\,} is zero, in other words @f{Y} is transverse to the orbits of @f{H}. 
This is a constraint on the choice of @f{Y}}
@item{The next term, @f{\mbox{ker}\,\tau}, is also zero. This kernel being nonzero corresponds to ``reducible'' gauge
symmetries.}
]
But the last term @f{\Pi \left(\mbox{im}\,\tau\;+T\,Y\,\right)^{\perp}} is essentially nonzero. 
It can be identified with the cotangent space to our family:
@e{
\left(\mbox{im}\,\tau\;+T\,Y\,\right)^{\perp} \;=\; T^*_Y\left({\cal Y}/H\right) 
}
where @f{\cal Y} is the moduli space of submanifolds @f{Y\subset X}. Therefore the quadratic part of @f{S_{\rm BV}}
@bold{is} degenerate. However this degeneration is removed by 
@hyperlink["../omega/Definition.html"]{the factor @f{e^{d\widehat{g}\widehat{g}^{-1}}}} 
Indeed, in this case:
@e{
d\widehat{g}\widehat{g}^{-1} \;=\; \varphi^{\star}_i dy^i
}
When we integrate over @f{{\cal Y}/H}, the differentials @f{dy^i} span the complement of @f{\mbox{im}\tau} in 
@f{TX/T\,Y}. Since we require that the family @f{\cal Y} be @f{H}-closed, @f{\tau} defines a map 
@f{{\bf h} \rightarrow TX/T\,Y} which  we denote @f{[\tau]}. With these notations:
@e[#:label "factor-tau"]{
\left(\mbox{im}\,\tau\;+T\,Y\,\right)^{\perp} = (\mbox{coker}\,[\tau])^*
}
In 
@hyperlink["../bosonic-string/IntegrationOverFamily.html"]{the case of bosonic string} @f{\mbox{dim} \;\mbox{coker}\,[\tau] \;=\; 3g-3}
and @f{e^{d\widehat{g}\widehat{g}^{-1}}} contributes
@f{\prod_{i=1}^{3g-3} b^{\alpha\beta}\delta g_{\alpha\beta}^{(0)}}

}

@slide["Faddeev-Popov integration" #:tag "Faddeev-Popov integration" #:showtitle #t]{
@short-intro{
Now we will consider a special case when tangent vectors to orbits of @f{H} generate
the entire @f{TX/T\,Y}, or, @hyperlink["Family_of_Lagrangian_submanifolds.html#(elem._factor-tau)"]{with our notations},
@f{\mbox{coker}[\tau] = 0}. We will show that in this case the integration over
the ``rotated'' Lagrangian submanifold of Eq. (@ref{rotated-lag}) is equivalent to integration
over some family of Lagrangian submanifolds, more precisely over a family of sections of
@f{\Pi T^*X\rightarrow X}. We reproduce the Faddeev-Popov integration formula, Eq. (@ref{FaddeevPopovIntegration})
}

Suppose that @f{Y\subset X} is specified by the equation:
@align[r.l.n @list[
 @f{F(x) \;=\;} @f{0} ""
]@list[
 @f{F\;:\;} @f{X\rightarrow V} ""
]]
where @f{V} is some vector space. Consider the following family of Lagrangian submanifolds of @f{\Pi T^* X} parametrized by
@f{\bar{c}\in \Pi V^*}. For every @f{\bar{c}\in \Pi V^*}, the corresponding Lagrangian submanifold is given by
the following section of @f{\Pi T^*X \rightarrow X} naturally associated to any @f{F\;:\;X\rightarrow V}:
@align[r.l.n @list[
 @f{L(\bar{c}) = }
 @f{\left\{ (x,x^{\star})\in \Pi T^*X\;|\; x^{\star} = (F_*(x))^*\bar{c}\right\}}
 ""
]@list[
 @elem[#:style 'no-break]{where @f{F_*(x):}} 
 @elem[#:style 'no-break]{@f{T_xX\rightarrow V} is a derivative map}
 ""
]
]
@comment{
We use @f{\bar{c}} to denote elements of @f{\Pi V^*} in order to agree with the standard notations in BRST formalism.
At this point it has nothing to do with the complex conjugate of the Faddeev-Popov ghost @f{c}.
}
We therefore have a family of Lagrangian submanifolds parametrized by elements of the vector space @f{\Pi V^*}.
The generating function of the infinitesimal variation of the Lagrangian submanifold from @f{L(\bar{c})} to
@f{L(\bar{c} + \delta\bar{c})} is  @f{\langle \delta\bar{c},F\,\rangle}.
@comment{
Indeed: @f{
d_M\langle \delta\bar{c},F\,\rangle
\;=\; \langle \delta\bar{c},d_XF\,\rangle 
\;=\; \langle \delta\bar{c}, F_* dx\rangle 
\;=\; \langle (F_*)^*\delta\bar{c}, dx\rangle
\;=\; \iota_{(F_*)^*\delta\bar{c}} \langle dx^{\star},dx\rangle
\;=\; \iota_{(F_*)^*\delta\bar{c}} \,\omega
}
}
@hyperlink["../omega/index.html"]{Therefore the form @f{\Omega}} is given by:
@e{
\Omega(\bar{c},d\bar{c}) = \int_{L(\bar{c})} \exp\left(S_{\rm BV} + \langle d\bar{c},F\,\rangle\right)
}
The corresponding integral form is obtained by the Baranov-Schwarz transform:
@e{
I(\bar{c}) = \int_{L(\bar{c})} \delta(F\,)\,e^{S_{\rm BV}}
}
Let us integrate @f{\Omega} over the whole @f{\Pi V^*}:
@e[#:label "integrate-over-pi-v-dual"]{
\int_{\Pi V^*} [d\bar{c}] \int_{L(\bar{c})} \delta(F\,)\,e^{S_{\rm BV}}
}
This result coincides with the @seclink["Family of Lagrangian submanifolds"]{integration over the conormal bundle of @f{F=0}}.

Given the @seclink["sec:bv-phase-space"]{explicit form of @f{S_{\rm BV}}}, its restriction to @f{L(\bar{c})} is:
@e[#:label "FaddeevPopovIntegration"]{
\left.S_{\rm BV}\right|_{L(\bar{c})} \;=\; S_{\rm cl}(x) + \langle Q_{\rm BRST} x , (F_*(x))^*\bar{c} \rangle\;=\;
S_{\rm cl} +  c^A T^i_A\partial_iF^a\bar{c}_a
}


This integral is @italic{a priori} divergent, because we integrate over the noncompact space @f{\Pi V^*}.
Sometimes, it can be made convergent by a special choice of the integration contour --- see 
@seclink["Yang-Mills"]{the example of the Yang-Mills theory}.
}

@slide["Yang-Mills theory" #:tag "Yang-Mills" #:showtitle #t]{
@align[r.l.n @list[
 @f{S_{\rm cl} \;=\;} @f{\int d^4x\,\mbox{tr}\, (\partial_{\mu}A_{\nu} - \partial_{\nu}A_{\mu} + [A_{\mu},A_{\nu}])^2} ""
]@list[
 @f{Q_{\rm BRST} A_{\mu} \;=\;} @f{D_{\mu}c} ""
]@list[
 @f{Q_{\rm BRST} c \;=\;} @f{{1\over 2}[c,c]} "" 
]
]
The Landau gauge corresponds to the following @seclink["Faddeev-Popov integration"]{function @f{F\;:\;X\rightarrow V}}, 
where @f{V} is the space of functions on the four-dimensional spacetime:
@e{
F(A) = \partial^{\mu}A_{\mu}
}
In this case @f{(F_*)^*\bar{c}} is @f{A^{\star\mu} = \partial^{\mu}\bar{c}} and Eq. (@ref{FaddeevPopovIntegration}) becomes:
@e{
\left.S_{\rm BV}\right|_{L(\bar{c})} \;=\; S_{\rm cl}(x) + D_{\mu}c\,\partial^{\mu}\bar{c}
}
The integration contour is @f{\bar{c}} complex conjugate to @f{c}. 
Don't forget to insert @f{\delta(F\,)} --- see Eq. (@ref{integrate-over-pi-v-dual}) !
(This is usually done by means of a Lagrange multiplier.)

}


@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection bystro-conf)
@disconnect[formula-database]

#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define bystro-conf   
   (bystro (bystro-connect-to-server (string->path "/var/www/bystroConf.xml"))
           "boundary/formulas.sqlite"  ; name for the database
           "boundary" ; directory where to store .png files of formulas
           25  ; formula size
           (list 255 255 255) ; formula background color
           (list 0 0 0) ; formula foreground color
           2   ; automatic alignment adjustment
           0   ; manual alignment adjustment
           ))
@(set-bystro-extension! bystro-conf "svg")
@; This controls the single page mode:
@(define singlepage-mode #t)
@(bystro-def-formula "formula-enormula-humongula!")

@(bystro-dump-LaTeX #f)

@title[#:style '(no-toc no-sidebar)]{Worldsheet with boundary}


@bystro-ribbon[]

@hyperlink["../index.html"]{Return to index}

@table-of-contents[]

@hyperlink["../index.html"]{Return to index}

@bystro-ribbon[]


@slide["Inserting states on a Riemann surface" #:tag "Space of states" #:showtitle #t]{

@image{boundary/graphics/insertion-of-operators-inside-disk.svg}
@image{boundary/graphics/state-on-the-boundary.svg}

@image{boundary/graphics/Riemann-surface-with-a-boundary.svg}
@image{boundary/graphics/Riemann-surface-with-state.svg}
}

@slide["Variation of Lagrangian submanifold" #:tag "Variation of Lagrangian submanifold" #:showtitle #t]{

@table-of-contents[]

@section{Excision of disk}

We use the fact that the odd symplectic form  is given by a single integral 
over the worldsheet: @f{\int d^2z\; \delta \phi\wedge\delta \phi^{\star}}.

This allows us to discuss the choice of Lagrangian submanifold locally on the worldsheet.
We can agree to only change the Lagrangian submanifold (for example, metric), inside some
limited compact region on the Riemann surface:


@image{boundary/graphics/variation-of-metric.svg}

As we vary the metric, the state on the boundary (marked red) remains 
@bold{the same state in the same theory}. This is possible because we do not change the theory
in the region of insertion.

If we limit the variations of the Lagrangian submanifold in this way, then we can
construct @hyperlink["../omega/index.html"]{the form @f{\Omega}} 
(and its @hyperlink["omega/Base_Form.html"]{base analogue}) in the same way as we did 
on the closed Riemann surface. In this case the form @f{\Omega} is not
closed:
@equation[#:label "DOmegaPsi"]{
d\Omega^{\tt base}_{\Psi} = \Omega^{\tt base}_{Q_{\rm BRST}\Psi}
}
If we restrict ourselves with the insertions of only physical operators @f{\Psi},
then the form @f{\Omega^{\tt base}_{\Psi}} @bold{is} closed.

We will prove  Eq. (@ref{DOmegaPsi}) in @seclink{sec:ProofOfDOmegaPsi}.


@section{Variation of wave function}

Let us study the quantum theory on a region @f{D} with the boundary @f{\partial D}.
@comment{
On the picture, @f{D} is the @bold{complement} of the disk; notice that there are
no operator insertions inside @f{D}.
}
Let us bring our theory to some first order formalism, 
so that the Lagrangian is of the form @f{p\dot{q} - H}.
Fix the Lagrangian submanifold @f{L}. 
Fix some polarization in the restriction of the fields to @f{\partial D}, for example
the standard polarization where the leaves have constant @f{q}.  Let us consider the
wave function:
@align[r.l.n @list[
 @f{\Psi(q) \;=\;} @f{\int_L \rho_{1/2}} @label{DefPsi}
]
]
--- the integration is over the field configurations inside @f{D}, and @f{q} enters
through boundary conditions.
More generally, let @f{\Psi_{\cal O}(q)} denote the wave function obtained by the path integration with the insertion
of some operator @f{\cal O} with compact support, not touching the boundary:
@align[r.l.n @list[
 @f{\Psi_{\cal O}(q) \;=\;} @f{\int_L {\cal O}\rho_{1/2}} @label{DefPsiWithInsertion}
]
]


@bold{Theorem @th-num{th:OddLaplacianWithBoundary}}
Suppose that @f{\rho_{1\over 2}} satisfies the Master Equation.

Any functional @f{\Xi} on the odd phase space, with compact support, determines the operator
insertion, just by its restriction on the Lagrangian submanifold. We will denote it @f{\Xi_0}. 
Let us assume that @f{\Xi} is such that @f{{\cal L}_{\Xi} \rho_{1\over 2}} is well-defined
(as discussed
@hyperlink["../omega/Definition.html#(part._.Infinite-dimensional_case)"]{here}
and 
@hyperlink["../BV-formalism/Infinite_dimensional_case.html"]{here}).
Then we have:
@equation[#:label "VariationOfPsiGeneral"]{
 \Psi_{Q_{\rm BRST} \Xi_0}(q) \;=\; - \int_L {\cal L}_{\Xi} \rho_{1\over 2}
}
where @f{\Xi_0} is the restriction of @f{\Xi} to @f{L} and @f{{\cal L}_{\Xi}} is the Lie derivative
of the half-density @f{\rho_{1\over 2}} along the Hamiltonian vector field @f{\{\Xi,\_\}}.


@bold{Proof:}  Let us introduce some Darboux coordinates near @f{L}, so that @f{L} is given by the
equation @f{\phi^{\star}  = 0}. Let us expand @f{\Xi} in powers of @f{\phi^{\star}}. Let us first 
assume that only a constant in antifields term is present:
@equation{
\Xi = \Xi_0(\phi)
}
In this case the Lie derivative is equivalent to inserting @f{Q_{\rm BRST}\Xi_0} into the path integral,
giving Eq. (@ref{VariationOfPsiGeneral}).

If @f{\Xi} also depends on antifields, then we have to be careful restricting ourselves
to such @f{\Xi} that the Lie derivative @f{{\cal L}_{\Xi} \rho_{1\over 2}} is well-defined, because
otherwise Eq. (@ref{VariationOfPsiGeneral}) does not make sense. This assumption must include
the vanishing of the integration by parts:
@equation{
\int_L {\partial\over\partial\phi}{\partial\over\partial\phi^{\star}} \left(\Xi_1\phi^{\star} \rho_{1\over 2}\right) = 0
}
This is equivalent to the linear term not contributing to the RHS of Eq. (@ref{VariationOfPsiGeneral}).

@bold{Theorem @th-num{th:OddLaplacianWithBoundaryWithoutMasterEq}}
Eq. (@ref{VariationOfPsiGeneral}) actually holds even without assuming that @f{\rho_{1\over 2}} satisfies
the Master Equation. In this case we define 
@f{Q_{\rm BRST}} using the expansion of @f{\rho_{1\over 2}} in Darboux coordinates: @f{\rho_{1\over 2} = e^{S_{\rm cl} + Q_{\rm BRST}^a\phi^{\star}_a + \ldots}}.

@bold{Proof:} nothing in the proof of @th-ref{th:OddLaplacianWithBoundary} requires the use of Master Equation.

@bold{Definition @defn-num{def:BRSTCurrent}}
Suppose that @f{\rho_{1\over 2}} satisfies the Master Equation sufficiently close to the boundary, in the sense that
@f{\{S_{BV},S_{BV}\}} has compact support which does not touch the boundary. 
Then @f{Q_{\rm BRST}} defined as in @th-ref{th:OddLaplacianWithBoundaryWithoutMasterEq}
becomes a symmetry of @f{S_{\rm BV}|_L} sufficiently close to the boundary.
Let us define @f{\widehat{Q}_{\rm BRST}\Psi_{{\cal O}}} @italic{via} the insertion of the BRST current near the boundary:
@equation[#:label "insert-brst-current"]{
\widehat{Q}_{\rm BRST}\Psi_{{\cal O}} = 
\int_{\rm\scriptstyle {path\atop integral}} [d\phi] \; 
\left(\oint_{\rm\scriptstyle {near\phantom{n}the\atop boundary}} j_{\rm BRST}\right) {\cal O} \left.\rho_{1\over 2}\right|_L
}

@bold{Theorem @th-num{th:BRSTCurrent}}
Suppose that @f{\rho_{1\over 2} = e^{S_{\rm BV} + a}} where @f{S_{\rm BV}} satisfies the Master Equation and @f{a} vanishes
near the boundary. Then:
@align[r.l.n @list[
  @f{\widehat{Q}_{\rm BRST}\Psi_{\Xi_0} (q) \;= \;}
  @f{- \int_L {\cal L}_{\Xi}\rho_{1\over 2}  - \int_L  \left(\{S_{\rm BV}, a\} + {1\over 2} \{a,a\}\right)\Xi\rho_{1\over 2}}
  @label{variation-via-BRST-current}
]
]
@bold{Comment:}
This equation actually involves a @hyperlink["../BV-formalism/Infinite_dimensional_case.html#(part._.How_to_be_safe)"]{potentially ill-defined}
operation @f{\Delta e^a}. One obvious way to make it well-defined is to assume that @f{a} depends either only on fields,
or only on antifields. That would also imply @f{\{a,a\}=0}. When we apply @th-ref{th:BRSTCurrent} 
@hyperlink["../omega/Equivariant_Form.html#(elem._summary-of-equivariant-omega)"]{to construction of the base form},
the assumption that @f{a} only depends on the antifields is valid for 
@hyperlink["../bosonic-string/IntegrationOverFamily.html#(part._.Choice.Of.F)"]{bosonic} and NSR strings. But for the
case of @hyperlink["../pure-spinor/Diffeomorphism_Hamiltonian.html"]{pure spinor string} @f{a} depends on both fields 
and antifields, so our assumption is @bold{not valid}. We feel that the validity of Eq. (@ref{insert-brst-current})
in such cases depends on additional physical assumption. Roughly speaking:
@centered[
@spn[redbox]{the symmetry generated by the @f{b}-ghost should be nonanomalous}
]
The validity of this assumption is model-dependent; it is probably stronger than the vanishing of the BRST anomaly.


@bold{Proof:} in order to pass from Eq. (@ref{VariationOfPsiGeneral}) to Eq. (@ref{variation-via-BRST-current}) we need to 
do a field redefinition @f{\phi \mapsto \phi + \varepsilon Q_{\rm BRST} \phi}  in the path integral, where @f{Q_{\rm BRST}}
is defined as in @th-ref{th:OddLaplacianWithBoundaryWithoutMasterEq}. But since @f{\rho_{1\over 2} = e^{S_{\rm BV} + a}}
only satisfies the Master Equation near the boundary, this field redefinition is not a symmetry of 
@f{\left.\rho_{1\over 2}\right|_L}.  In fact the second term in Eq. (@ref{variation-via-BRST-current}) arizes as the variation 
of @f{\left.\rho_{1\over 2}\right|_L} under this field redefinition. 

@section[#:tag "sec:ProofOfDOmegaPsi"]{Proof of Eq. (@ref{DOmegaPsi})}
@subsection{Old form @f{\Omega}}
Now we are ready to prove Eq. (@ref{DOmegaPsi}). Let us first study the usual ``old'' (not equivariant) form @f{\Omega} with the boundary.
The derivation parallels the 
@hyperlink["../omega/Definition.html"]{case with no boundary}:
@align[r.l.n @list[
  "" 
  @f{d\int_{gL} {\cal M}(d\widehat{g}\widehat{g}^{-1})\;\rho_{1\over 2} \; = \;} 
  @label{d-omega-with-boundary}
]@list[
  @f{\;=\;}
  @f{\int_{gL}\left(
                       d({\cal M}(d\widehat{g}\widehat{g}^{-1}))\,\rho_{1\over 2} \;+\;
                       {\cal L}_{d\widehat{g}\widehat{g}^{-1}}\left({\cal M}(d\widehat{g}\widehat{g}^{-1})\rho_{1\over 2}\right)
                 \right) \; =}
  ""
]@list[
  @f{\;=\;}
  @f{\int_{gL}\left(
                       {1\over 2} \{{\cal M}({\cal H}),{\cal M}({\cal H})\}\,\rho_{1\over 2} \;+\;
                       {\cal L}_{d\widehat{g}\widehat{g}^{-1}}\left({\cal M}(d\widehat{g}\widehat{g}^{-1})\rho_{1\over 2}\right)
                 \right) \; =}
  ""
]@list[
  ""
  @elem[#:style 'no-break]{here we use @hyperlink["../omega/Definition.html#(elem._.Interpretation.Using.Lie.Derivative)"]{equation for Lie derivative} 
  with @f{f({\cal H})=\int{\cal M}({\cal H})d{\cal H}}}
  ""
]@list[
  @f{\;=\;}
  @f{\int_{gL} \;
      \mbox{\tt\small Lie derivative of } \rho_{1\over 2} \mbox{\tt\small along the Hamiltonian flux of }\left.\int d{\cal H}{\cal M}({\cal H})\right|_{{\cal H} = d\hat{g} \hat{g}^{-1}} \;=\;
    }
  ""
]@list[
  @f{\;=\;}
  @f{Q_{\rm BRST}\left[q\mapsto 
     \int_{gL}\left(
       \left.\int d{\cal H}{\cal M}({\cal H})\right|_{{\cal H} = d\hat{g} \hat{g}^{-1}}\;\rho_{1\over 2}
     \right)
   \right]
   }
  ""
]
]
We should choose @f{{\cal M}({\cal H}) = \exp({\cal H})}; in this case @f{\int d{\cal H}{\cal M}({\cal H}) = {\cal M}({\cal H}) = e^{\cal H}}.

@subsection{Interpretation of @f{\Omega} as an intertwiner in the presence of a boundary}
Remember that the equivariant @f{\Omega^{\tt C}} is
@hyperlink["../omega/Equivariant_Form.html#(elem._summary-of-equivariant-omega)"]{a particular case of} 
@f{\Omega\langle e^a \rangle}. The computation of @f{d\Omega\langle e^a \rangle} parallels Eq. (@ref{d-omega-with-boundary})
and uses Eq. (@ref{variation-via-BRST-current}):
@align[r.l.n @list[
  ""
  @f{d\int_{gL} {\cal M}(d\widehat{g}\widehat{g}^{-1})\;\rho_{1\over 2} \; = \;} 
  @label{d-omega-Cartan-with-boundary}
]@list[
  @f{\;=\;}
  @f{- \int_{gL}\left(\int d{\cal H}{\cal M}({\cal H})\right)
       \left(\{S_{\rm BV},a\} + {1\over 2}\{a,a\}\right)\rho_{1\over 2} \;+\;}
  ""
]@list[
  ""
  @f{+\;Q_{\rm BRST}\left[q\mapsto 
     \int_{gL}\left(
       \left.\int d{\cal H}{\cal M}({\cal H})\right|_{{\cal H} = d\hat{g} \hat{g}^{-1}}\;\rho_{1\over 2}
     \right)
   \right]
   }
  ""
]
]
@div[redbox]{As we already discussed, for this equation to hold we need to impose additional requirement on @f{a},
that @f{a} is in some sense non-anomalous. This is separate from BRST symmetry being non-anomalous.}
This implies that the presence of a boundary modifies the @hyperlink["../omega/As_Intertwiner.html"]{intertwiner property}
of @f{\Omega}. 
This is a particular case of the following general construction. Let @f{\rho\;:\;\widetilde{\bf g}'\to \mbox{End}(V\,)} be a representation
of of the wavy Lie superalgebra. Then any complex @f{K, d_K} defines a new representation
of @f{\widetilde{\bf g}'}:
@align[r.l.n @list[
  @f{\rho_1\;:\;}
  @f{\widetilde{\bf g}'\to \mbox{End}(V\otimes K\,)}
  ""
]@list[
  @f{\rho_1(d) \;=\;}
  @f{\rho(d) + d_K}
  ""
]@list[
  @f{\left.\rho_1\right|_{\widetilde{\bf g}} \;=\;}
  @f{\left.\rho\right|_{\widetilde{\bf g}}}
  ""
]
]
In our case @f{K} is the Hilbert space of states on the boundary, with @f{d_K = Q_{\rm BRST}}.

@section{Base form}
Returning to the base form, in the presence of a boundary Eq. (@ref{d-omega-Cartan-with-boundary}) implies that 
@hyperlink["../omega/Equivariant_Form.html#(elem._summary-of-equivariant-omega)"]{our construction of the base form}
does @bold{not} give a closed form:
@equation{
d\Psi^{\tt base} = Q_{\rm BRST}\Psi^{\tt base}
}
At the same time, @f{\Psi^{\tt base}} is still horizontal and invariant.
Horizontality follows from the construction, as we obtain our base form from 
the equivariant form by horizontal projection. Invariance follows from the fact that
@f{d\Psi^{\tt base}} is also horizontal.

For our constructions presented in this part, it is important that we restrict to only
those variations of the complex structure which are zero at the boundary. Otherwise, the variation
would change the Hilbert space of states. In such case it would be nontrivial to even
define @f{d\Psi}, as we would need a connection on the bundle of Hilbert spaces.

}

@slide["Relation to the approach of Sen" #:tag "Approach of Sen" #:showtitle #t]{
In @hyperlink["../bosonic-string/index.html"]{approach to bosonic string}, we integrate over
worldsheet complex structures.

The approach of Sen in @cite{Sen:2014pia} uses patches and integration over transition functions.

We will now outline the derivation of Sen's approach from our approach. It turns out that the 
derivation is not completely straightforward.

Locally all complex structures are the same. This means that, on a small enought patch, we can
undo the variation of the complex structure by applying a diffeomorphism. Generally speaking, this
diffeomorphism does not vanish on the boundary of the patch, but becomes a conformal
transformation (this is under the assumption that the variation of the complex structure is only nonzero
in a compact region inside the patch, @italic{i.e.} vanishes near the boundary of the patch). 
This means that we have a map:
@align[r.l.l.n @list[
 @elem[#:style 'no-break]{[variations of the complex structure] @hspace[2]} 
 @f{\stackrel{\pi}{\longrightarrow}}
 @elem[#:style 'no-break]{@hspace[2] [variations of the transition functions]}
 @label{from-metrics-to-transition-functions}
]
]
@comment{
Here we must consider the variations of the transition functions modulo those which can
be extended to conformal transformation inside the patch.
}

In other words: 
@div[redbox]{
one can always undo the variation of the metric by applying a diffeomorphism, but at the 
price of changing the transition functions between patches. 
}
Under this map @f{\pi} our @f{\Omega} becomes the measure used in @cite{Sen:2014pia}.

We, however, face a subtlety: the map (@ref{from-metrics-to-transition-functions}) is only a surjection.
This raizes a question:
@itemlist[
@item{can we lift Sen's integration cycles to closed integration cycles in the space of metrics?}
]
This requires factoring out large diffeomorphisms. 

}



@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection bystro-conf)
@disconnect[formula-database]

  

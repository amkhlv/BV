#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define bystro-conf   
   (bystro (bystro-connect-to-server (build-path (find-system-path 'home-dir) ".config" "amkhlv" "latex2svg.xml"))
           "notations/formulas.sqlite"  ; name for the database
           "notations" ; directory where to store image files of formulas
           25  ; formula size
           (list 255 255 255) ; formula background color
           (list 0 0 0) ; formula foreground color
           2   ; automatic alignment adjustment
           0   ; manual alignment adjustment
           ))
@(define singlepage-mode #t)
@(bystro-def-formula "formula-enormula-humongula!")

@(bystro-dump-LaTeX #f)
@title[#:style '(no-toc no-sidebar)]{Notations}



@bystro-ribbon[]
@bystro-toc[]

@section[#:tag "sec-Odd-symplectic-manifold"]{Odd symplectic manifold}

@tbl[#:orient 'vert @list[
 @list[ 
  @f{M} 
  @f{G} 
  @f{\bf g}
  @f{\rho_{1\over 2}}
  @f{SG}
  @f{\bf sg}
]@list[
  @elem{odd symplectic manifold, the "BV phase space"}
  @elem{odd canonical transformations}
  @f{\mbox{Lie}(G)}
  @elem{half density on @f{M}; assumed to satisfy the @hyperlink["../BV-formalism/MasterEquation.html"]{Master Equation}}
  @elem{subgroup of @f{G} preserving @f{\rho_{1\over 2}}}
  @f{\mbox{Lie}(SG)}
]
]]

@tbl[#:orient 'vert @list[
 @list[
  @f{\Delta_{\rm can}}
  @smaller{@f{\Delta_{\rho_{1\over 2}}} (or just @f{\Delta})}
  @f{\Delta^{(0)}}
]@list[
  @elem{canonical @hyperlink["../BV-formalism/OddLaplace.html#(part._.Definition)"]{odd Laplacian on half-densities}}
  @elem{@f{f\mapsto \rho_{1\over 2}^{-1}\Delta_{\rm can}\left(f\,\rho_{1\over 2}\right)} @hyperlink["../BV-formalism/OddLaplace.html#(elem._.Operator.Delta)"]{[here]}}
  @elem{@f{(-)^{\bar{A}}{\partial^2\over\partial\phi^A\partial\phi_A^{\star}}}
        @hyperlink["../BV-formalism/OddLaplace.html#(elem._.Delta.Zero)"]{[here]}}
]
]]  

@hyperlink["../BV-formalism/OddLaplace.html"]{Explanations}

@section[#:tag "sec-Moment-map"]{Moment map}
@tbl[#:orient 'vert @list[
 @list[
  @f{\widehat{\bf g}}
  @f{\widehat{\bf sg}}
  @f{d\widehat{g}\widehat{g}^{-1}}
]@list[
  @f{\Pi C^{\infty}M}
  @elem{@f{\Pi\left(\mbox{ker}\Delta_{\rho_{1\over 2}} \subset C^{\infty}M\right)}}
  @elem{the @hyperlink["../BV-formalism/MomentMap.html"]{moment map} for the action of @f{\widehat{G}} on @f{M}}
]
]]    
@hyperlink["../BV-formalism/MomentMap.html"]{Explanations}

@section[#:tag "sec-Integration-over-families-of-Lagrangian-submanifolds"]{Integration over families of Lagrangian submanifolds}
@tbl[#:orient 'vert @list[
 @list[
  @elem{@f{\Omega} and @f{\Omega\langle F\,\rangle}}
  @f{\cal F}
  @f{{\bf h} = \Pi\Delta{\cal F}}
  @elem{@f{\Omega^{\tt C}_{\Pi\Delta{\cal F}}}}
  @elem{@f{\Omega^{\tt base}_{\Pi\Delta{\cal F}}}}
]@list[
  @hyperlink["../omega/When___is_exponent.html"]{here}
  @hyperlink["../omega/Subalgebra_F.html"]{here}
  @smaller{@f{\simeq {\cal F}} (this is the embedding of @f{\cal F} into @f{\widehat{\bf g}})}
  @hyperlink["../omega/Equivariant_Form.html#(part._.The_equivariant_version_of_)"]{equivariant form constructed from @f{\Omega}}
  @hyperlink["../omega/Base_Form.html"]{base form constructed from @f{\Omega}}
]
]]

@section[#:tag "sec-Equivariant-cohomology"]{Equivariant cohomology}
@tbl[#:orient 'vert @list[
 @list[
  @smaller{@f{\widetilde{\bf g}} and @f{\widetilde{\bf g}'} (for any Lie superalgebra @f{\bf g})}
]@list[
  @hyperlink["../equivariant-cohomology/Equivariant_Cohomology.html#(part._.Equivariant_cohomology_as_a_relative_.Lie_algebra_cohomology)"]{wavy Lie superalgebra}
]
]]

@bystro-ribbon[]

@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection bystro-conf)

@disconnect[formula-database]

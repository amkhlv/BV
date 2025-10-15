#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define bystro-conf   
   (bystro (bystro-connect-to-server (build-path (find-system-path 'home-dir) ".config" "amkhlv" "latex2svg.xml"))
           "worldsheet-complex-structure/formulas.sqlite"  ; name for the database
           "worldsheet-complex-structure" ; directory where to store image files of formulas
           25  ; formula size
           (list 255 255 255) ; formula background color
           (list 0 0 0) ; formula foreground color
           2   ; automatic alignment adjustment
           0   ; manual alignment adjustment
           ))
@(define singlepage-mode #t)
@(bystro-def-formula "formula-enormula-humongula!")

@(bystro-dump-LaTeX #f)
@title[#:style '(no-toc no-sidebar)]{Worldsheet complex structure}



@bystro-ribbon[]
@bystro-toc[]


Eigenvectors of @f{I} on @f{T\Sigma}:
@align[r.l.n @list[
 @f{I^{[\mu]}\left({\partial\over\partial z} + \mu^{\bar{z}}_z {\partial\over\partial\bar{z}}\right)\;=\;}
 @f{i\left({\partial\over\partial z} + \mu^{\bar{z}}_z {\partial\over\partial\bar{z}}\right)}
 ""
]@list[
 @f{I^{[\mu]}\left({\partial\over\partial \bar{z}} + \mu^z_{\bar{z}} {\partial\over\partial z}\right)\;=\;}
 @f{-i\left({\partial\over\partial \bar{z}} + \mu^z_{\bar{z}} {\partial\over\partial z}\right)}
 ""
]
]
On functions only:
@align[r.n @list[
 @f{\partial^{[\mu]}\;=\;{1\over 1-\mu^z_{\bar{z}}\mu^{\bar{z}}_z}\,(dz-\mu^z_{\bar{z}}d\bar{z})\left({\partial\over\partial z} + \mu^{\bar{z}}_z{\partial\over\partial\bar{z}}\right)}
 ""
]@list[
 @f{\bar{\partial}^{[\mu]}\;=\;{1\over 1-\mu^z_{\bar{z}}\mu^{\bar{z}}_z}\,(d\bar{z}-\mu^{\bar{z}}_zdz)\left({\partial\over\partial\bar{z}} + \mu^z_{\bar{z}}{\partial\over\partial z}\right)}
 ""
]@list[
 @f{\mbox{\tt\small (on functions only)}} ""
]
]
We will sometimes write @f{\partial^{[\mu]}_+} and @f{\partial^{[\mu]}_-} instead of @f{\partial^{[\mu]}} and @f{\bar{\partial}^{[\mu]}}.
@comment{Such notations may be useful because they provide a natural shortcut @f{\partial_{\alpha}}, @f{\alpha = \pm}}
For a one-form @f{\omega}, we will introduce the following notations. Let @f{\omega(\partial_+)} denote the following one-form:
@e{
\omega(\partial^{[\mu]}_+) = {dz - \mu^z_{\bar{z}} d\bar{z}\over 1-\mu^z_{\bar{z}}\mu^{\bar{z}}_z}(\omega_z + \mu^{\bar{z}}_z\omega_{\bar{z}})
}
The definition of @f{\omega(\partial^{[\mu]}_+)} is completely analogous.
@comment{This is a natural notation; for @f{\omega\in \Gamma(T^{\star}\Sigma)} and 
@f{\partial^{[\mu]}_+\in \Gamma((T\otimes T^{\star})\Sigma)}, the combination @f{\omega(\partial^{[\mu]}_+)}
can only mean one thing}
@comment{In physics literature it it common to write @f{P_+\omega} instead of @f{\omega(\partial_+)}; this
is the projector on the left-moving component}



@bystro-ribbon[]

@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection bystro-conf)

@disconnect[formula-database]

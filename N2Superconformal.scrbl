#lang scribble/base
@(require racket scribble/core scribble/base scribble/html-properties)
@(require "defs.rkt" bystroTeX/common bystroTeX/slides (for-syntax bystroTeX/slides_for-syntax))
@; ---------------------------------------------------------------------------------------------------
@; User definitions:
@(bystro-set-css-dir (build-path (find-system-path 'home-dir) "a" "git" "amkhlv" "profiles" "writeup"))
@(define bystro-conf   
   (bystro (bystro-connect-to-server (build-path (find-system-path 'home-dir) ".config" "amkhlv" "latex2svg.xml"))
           "N2Superconformal/formulas.sqlite"  ; name for the database
           "N2Superconformal" ; directory where to store image files of formulas
           25  ; formula size
           (list 255 255 255) ; formula background color
           (list 0 0 0) ; formula foreground color
           2   ; automatic alignment adjustment
           0   ; manual alignment adjustment
           ))
@(define singlepage-mode #f)
@(bystro-def-formula "formula-enormula-humongula!")

@(bystro-dump-LaTeX #f)
@title[#:style '(no-toc no-sidebar)]{Notes on N=2 superconformal symmetry}



@bystro-ribbon[]

@hyperlink["../index.html"]{Return to index}

@short-intro{
We will for now only consider the @bold{left sector}. The worldsheet coordinates are @f{z,\theta} --- this is
the ``usual'' @f{N=1} worldsheet, which we will denote just @f{\Sigma^{1|1}}. 
}

@bystro-toc[]


@hyperlink["../index.html"]{Return to index}

@bystro-ribbon[]

@slide["Duality Functor" #:tag "Duality Functor" #:showtitle #t]{
Consider the @f{1|1} dimensional supermanifold @f{\Sigma^{1|1}}. We will slightly change the notations
and instead of @f{z,\theta} denote the coordinates as follows:
@e{
z_{\rm ch} \,,\; \theta^+
}
Moreover, once we changed the notations for coordinates, we will also rename the supermanifold itself:
@e{
\mbox{\small\tt rename }\; \Sigma^{1|1} \mbox{ \tt\small to } \Sigma^{1|1}_{\rm ch}
}
The @spn[attn]{duality functor} @f{\tt Dual} is an autofunctor on the category of @f{1|1}-dimensional 
supermanifolds. To every supermanifold @f{\Sigma^{1|1}} it associates a dual supermanifold
@f{{\tt Dual}\,\Sigma^{1|1}} which is the moduli space of @f{0|1}-dimensional submanifolds in 
@f{\Sigma^{1|1}}. We will denote it @f{\Sigma^{1|1}_{\rm ach}}:
@e{
\Sigma^{1|1}_{\rm ach} \;=\; {\tt Dual}\, \Sigma^{1|1}_{\rm ch}
}

}

@slide[@elem{@f{N=2} superspace} #:tag "N=2 Superspace" #:showtitle #t]{
The @f{N=2} superspace @f{\Sigma^{1|2}_{N=2}} is somewhat similar to the Flag manifold in twistor theory.
It is the moduli space of all @f{0|1}-dimensional submanifolds in 
@f{\Sigma^{1|1}_{\rm ch}} with a marked point. Therefore there are projections:
@e[#:label "DoubleFibration"]{
\Sigma^{1|1}_{\rm ch} \;\xleftarrow{\pi_{\rm ch}}\; \Sigma^{1|2}_{N=2} \;\xrightarrow{\pi_{\rm ach}}\; \Sigma^{1|1}_{\rm ach}
}
@bold{Theorem @th-num{th:BerN2}:}  @f{\mbox{Ber}\,\Sigma^{1|2}_{N=2}} is
trivial:
@e{
\mbox{Ber}\,\Sigma^{1|2}_{N=2} \;=\; {\bf C}
}

@bold{Proof} @spn[attn]{TODO} 

}

@slide["Duality in coordinates" #:tag "Duality In Coordinates" #:showtitle #t]{
Let us introduce some coordinates @f{z_{\rm ch}, \theta^+} on @f{\Sigma_{\rm ch}}.

A generic @f{0|1}-dimensional submanifold can be defined by the following equation,
depending on an odd parameter @f{\theta^-} and an even parameter @f{z_{\rm ach}}:
@e{
z_{\rm ch} = z_{\rm ach} + \theta^+\theta^-
}
We conclude that @f{\Sigma^{1|1}_{\rm ach} \;=\; {\tt Dual}\, \Sigma^{1|1}_{\rm ch}} may be 
coordinatized with @f{z_{\rm ach}} and @f{\theta^-}. 

Since @f{\tt Dual} is a functor, a vector field on @f{\Sigma_{\rm ch}} should automatically define
some vector field on  @f{\Sigma_{\rm ach}}.
@bold{Theorem @th-num{th:DualVectorField}:} The following vector field @f{{\cal V}_{\rm ch}}  on @f{\Sigma_{\rm ch}}:
@e[#:label "ChiralN2"]{
{\cal V}_{\rm ch} = 
\left(v(z_{\rm ch}) + \theta^+\xi^-(z_{\rm ch})\right)
{\partial\over\partial z_{\rm ch}} +
\left(\xi^+(z_{\rm ch}) + \theta^+u^+_+(z_{\rm ch})\right)
{\partial\over\partial \theta^+}
}
defines the following vector field on @f{{\cal V}_{\rm ach}}:
@e[#:label "AntiChiralN2"]{
{\cal V}_{\rm ach} = 
   \left(v(z_{\rm ach}) + \theta^-\xi^+(z_{\rm ach})\right)
   {\partial\over\partial z_{\rm ach}} +
   \left(\xi^-(z_{\rm ach}) + \theta^-u^-_-(z_{\rm ach})\right)
   {\partial\over\partial\theta^-}
}
where @f{u^-_-} is defined as follows:
@e[#:label "u-vs-v"]{
u^+_+ + u^-_- + \partial v = 0
}

@bold{Proof:}
@e{
   \left.
      \left(
         ({\cal V}_{\rm ch} + {\cal V}_{\rm ach})(z_{\rm ch} - z_{\rm ach} - \theta^+\theta^-)
      \right)
   \right|_{z_{\rm ch} - z_{\rm ach} - \theta^+\theta^- = 0} =  0
}



}

@slide["Superfields and their components" #:tag "Superfields" #:showtitle #t]{
We think of the superfields as functions on @f{\Sigma^{1|2}_{N=2}}. In particular, those which lift from 
@f{\Sigma^{1|1}_{\rm ch}} are called @bold{chiral} and those which lift from @f{\Sigma^{1|1}_{\rm ach}}
are called @bold{antichiral}.

@bystro-local-toc[]

@subpage[1 @elem{Matter fields} #:tag "sec-Matter-fields"]

The @bold{matter fields} are five chiral and five antichiral:
@align[r.l @list[
@f{X^a(z_{\rm ch},\theta^+) =\;}@f{x^a(z_{\rm ch}) + \theta^+\psi^a(z_{\rm ch})}
]@list[
@f{\overline{X^a}(z_{\rm ach},\theta^-) =\;}@f{\overline{x^a}(z_{\rm ach}) + \theta^- \overline{\psi^a}(z_{\rm ach})}
]]
Here the index @f{a} runs in @f{\{1,2,3,4,5\}}; we assume that the target space is a complex five-dimensional manifold.

@subpage[1 @elem{Action for matter fields} #:tag "sec-Action-for-matter-fields"]
Let us concentrate on the heterotic case. In this case, we have to remember about the right
(``antiholomorphic'') coordinate @f{\tilde{z}}. @th-ref{th:BerN2} tells us that the holomorphic
part of the Berezinian is trivial; therefore we can just integrate @f{\overline{X^a}\partial_{\tilde{z}}X^a}:
@e[#:label "MatterActionN2Superspace"]{
S_{\rm mat}  \;=\; \int_{\Sigma_{N=2}} \overline{X^a}\,\partial_{\tilde{z}} X^a d\tilde{z}
}

@subpage[1 @elem{@f{N=2} superconformal transformations of superfields} #:tag "sec-f-N-2-superconformal-transformations-of-superfields"]
By definition, the action (@ref{MatterActionN2Superspace}) is invariant finite @f{N=2} transformations:
@align[r.n @list[
@f{X^a(z_{\rm ch},\theta^+) \mapsto X^a(g(z_{\rm ch},\theta^+))}@label{TransformXa}
]@list[
@f{\overline{X^a}(z_{\rm ach},\theta^-) \mapsto \overline{X^a}({\tt Dual}(g)(z_{\rm ach},\theta^-))}@label{TransformBarXa}
]]
These transformations can be understood as the result of integrating the vector fields (@ref{ChiralN2}), (@ref{AntiChiralN2}).
Explicitly:
@align[r.n @list[
@f{(\mbox{\tt\small new } X^a\,)(z, \theta)= 
   X^a( Z(z) + \theta \Xi(z)\,,\;\Theta(z) + \theta F(z))}@label{GeneralCoordinate}
]]
In components:
@align[r.l @list[
@f{(\mbox{\tt\small new } x^a\,)(z)  =\;}@f{x^a(Z(z)) + \Theta(z)\psi^a(Z(z))}
]@list[
@f{(\mbox{\tt\small new } \psi^a\,)(z) =\;}@f{\Xi(z)\partial_Z x^a(Z(z)) + 
   F(z)\psi^a(Z(z))}
]]
and for antichirals:
@align[r.l @list[
@f{(\mbox{\tt\small new } \overline{x^a}\,)(z)  =\;}@f{\overline{x^a}(Z(z)) + 
   \Xi(z)\overline{\psi^a}(Z(z))}
]@list[
@f{(\mbox{\tt\small new } \overline{\psi^a}\,)(z) =\;}@f{\Theta(z)\partial_Z\overline{x^a}(Z(z)) + 
   {d Z(z)\over dz}{1\over F(z)}\overline{\psi^a}(Z(z))}
]]


}

@slide[@elem{@f{N=1} structure} #:tag "N=1 Structure" #:showtitle #t]{
@bystro-local-toc[]

@subpage[1 @elem{Definition} #:tag "sec-Definition-3"]
In the @f{N=2} language, we will define the @f{N=1} superconformal structure as a 
distribution @f{{\cal D}_{\rm ch}\subset T\Sigma_{\rm ch}}. Such a distribution defines a map:
@e[#:label "MapFromSigmaToSigmaDualType"]{
   F^{\{{\cal D}_{\rm ch}\}}\;:\; \Sigma_{\rm ch} \rightarrow \Sigma_{\rm ach}
}
We can always choose coordinates on @f{\Sigma_{\rm ch}} so that @f{{\cal D}_{\rm ch}} is denerated by @f{D_{\rm ch}} given by:
@e[#:label "DefDch"]{
   D_{\rm ch} = {\partial\over\partial\theta^+} + \theta^+{\partial\over\partial z_{\rm ch}}
}
The map @f{F^{\{{\cal D}_{\rm ch}\}}} is defined as follows: it brings a point @f{(z_{\rm ch},\theta^+)\in \Sigma_{\rm ch}} to
the @f{0|1}-dimensional submanifold of @f{\Sigma_{\rm ch}} which is the trajectory of a superparticle 
passing through the point @f{(z_{\rm ch},\theta^+)} with the velocity @f{D_{\rm ch}}. 

@subpage[1 @elem{Normal form of @f{N=1} structure} #:tag "sec-Normal-form-of-f-N-1-structure"]
@align[r.l.n @list[
@f{F^{{\{\cal D}_{\rm ch}\}} (z_{\rm ch},\theta^+) =\;}@f{(z_{\rm ach},\theta^-)}@label{MapFromSigmaToSigmaDual}
]@list[
@f{\mbox{\tt\small where } z_{\rm ach}=\;}@f{z_{\rm ch}}""
]@list[
@f{\theta^- =\;}@f{\theta^+}""
]]
This can be seen by solving:
@align[r.l @list[
@f{z_{\rm ch} - z_{\rm ach} - \theta^+\theta^-  =\;}@f{0}
]@list[
@f{D_{\rm ch} \left( z_{\rm ch} - z_{\rm ach} - \theta^+\theta^- \right) =\;}@f{0}
]]
@spn[attn]{TODO:} clarify

@subpage[1 @elem{Categorical interpretation of @f{N=1} structure} #:tag "sec-Categorical-interpretation-of-f-N-1-structure"]
To define an @f{N=1} structure is to define a natural transformation from the identity
functor to @f{\tt Dual}. In other words the correspondence @f{\Sigma_{\rm ch}\mapsto \Sigma_{\rm ach}} comes with an actual
map from @f{\Sigma_{\rm ch}} to its dual @f{\Sigma_{\rm ach}} given by Eqs. (@ref{MapFromSigmaToSigmaDualType}), (@ref{MapFromSigmaToSigmaDual}). 

}

@slide["Breaking of the Lorentz symmetry" #:tag "Lorentz Symmetry" #:showtitle #t]{
@f{N=2} superconformal transformations @bold{break} the Lorentz symmetry @f{SO(10)} down to @f{U(5)}. 
But @f{N=1} superconformal transformations @bold{preserve} the full Lorentz symmetry.

To understand the Lorentz symmetry, we define @bold{ten} superfields @f{{\bf X}^{\mu}} in the following way:
@align[r.l.n @list[
   @f{X^a(z_{\rm ch},\theta^+) \;=\;} 
   @f{ {\bf X}^{2a}(z_{\rm ch},\theta^+) + i {\bf X}^{2a+1}(z_{\rm ch},\theta^+)}
   @label{DefXa}
]@list[
   @f{\overline{X^a}(z_{\rm ach},\theta^-) \;=\;}
   @f{{\bf X}^{2a}(F^{\{{\cal D}_{\rm ch}\} -1}(z_{\rm ach},\theta^-)) -
   i {\bf X}^{2a+1}(F^{\{{\cal D}_{\rm ch}\} -1}(z_{\rm ach},\theta^-))}
   @label{DefOverlineXa}
]]
@comment{
simply speaking, to define @f{\overline{X^a}(z_{\rm ach},\theta^-)}, we take @f{{\bf X}^{2a}(z_{\rm ch},\theta^+) - i{\bf X}^{2a+1}(z_{\rm ch},\theta^+)} 
and substitute @f{z_{\rm ch}\mapsto z_{\rm ach}} and @f{\theta^+ \mapsto \theta^-}
}
A characteristic property of @f{N=1} superconformal transformations (as a subgroup of @f{N=2}) is that
they commute with the standard action of the Lorentz group on @f{{\bf X}^{\mu}}.


}


@slide[@elem{Moduli space of @f{N=2} structures} #:tag "Moduli Space Of N=2" #:showtitle #t]{
The tangent space to the moduli space of @f{N=2} superconformal structures is the first cohomology
of the tangent sheaf @f{\cal T} (= the sheaf of holomorphic vector fields):
@e{
T{\cal M}_{N=2} = H^1(\Sigma_{\rm ch},\,{\cal T}\;)
}
Remember that @f{N=1} superconformal vector fields are sections of @f{{\cal D}_{\rm ch}^2}. We have:
@e{
0 \rightarrow {\cal D}_{\rm ch}^2 \rightarrow {\cal T} \rightarrow {\cal T}/{\cal D}_{\rm ch}^2 \rightarrow 0
}
and therefore:
@e{
0 \rightarrow H^0({\cal D}_{\rm ch}^2) \rightarrow H^0({\cal T}\;) \rightarrow H^0({\cal T}/{\cal D}_{\rm ch}^2) 
  \rightarrow H^1({\cal D}_{\rm ch}^2) \rightarrow H^1({\cal T}\;) \rightarrow H^1({\cal T}/{\cal D}_{\rm ch}^2) \rightarrow \ldots
}
For sufficiently high genus, we have:
@align[r.c.c.c.l.n @list[
@f{0 \rightarrow }
@elem{@bystro-bg[255 255 200] @f{H^0({\cal T}/{\cal D}_{\rm ch}^2)} @bystro-bg[255 255 255]}
@f{\rightarrow}
@f{H^1({\cal D}_{\rm ch}^2)\rightarrow}
@f{H^1({\cal T}\;) \rightarrow \ldots}
@label{TermsOfLongExactSequence}
]
]
}


@; ---------------------------------------------------------------------------------------------------
@(bystro-close-connection bystro-conf)

@disconnect[formula-database]

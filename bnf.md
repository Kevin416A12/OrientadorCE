<programa> ::= <base_conocimiento> <hechos_usuario> <reglas> <consulta>

<base_conocimiento> ::= <hecho_profesion> | <base_conocimiento> <hecho_profesion>
                      | <hecho_afinidad> | <base_conocimiento> <hecho_afinidad>
                      | <hecho_antagonia> | <base_conocimiento> <hecho_antagonia>

<hecho_profesion> ::= profesion(<identificador>).

<hecho_afinidad> ::= afinidad(<identificador>, <preferencia>).

<hecho_antagonia> ::= antagonia(<identificador>, <preferencia>).

<hechos_usuario> ::= <hecho_gusta> | <hechos_usuario> <hecho_gusta>
                   | <hecho_no_gusta> | <hechos_usuario> <hecho_no_gusta>

<hecho_gusta> ::= gusta(<preferencia>).

<hecho_no_gusta> ::= no_gusta(<preferencia>).

<reglas> ::= <regla_puntaje> <regla_evaluar> <regla_mejor> <regla_recomendar>

<regla_puntaje> ::= puntaje_profesion(<identificador>, <numero>).

<regla_evaluar> ::= evaluar_profesiones(<lista>).

<regla_mejor> ::= mejor(<lista>, <numero>, <identificador>).

<regla_recomendar> ::= recomendar(<identificador>).

<consulta> ::= ?- recomendar(<variable>).
             | ?- mostrar_recomendacion.
             | ?- mostrar_puntajes.

<identificador> ::= <letra> | <identificador> <letra> | <identificador> "_"
<preferencia> ::= <identificador>
<variable> ::= <letra_mayuscula> | <variable> <letra>

<numero> ::= <digito> | <numero> <digito>
<lista> ::= [] | [<elementos>]
<elementos> ::= <elemento> | <elemento> , <elementos>

<elemento> ::= <numero>-<identificador>

<letra> ::= a | b | ... | z
<letra_mayuscula> ::= A | B | ... | Z
<digito> ::= 0 | 1 | ... | 9
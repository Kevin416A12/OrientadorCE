# Gramática BNF - Orientador Vocacional CE

<entrevista> ::= <pregunta> <respuesta>

<pregunta> ::= "Te gustan las personas?"
             | "Te gusta la salud?"
             | "Te gusta la tecnologia?"
             | "Te gustan las matematicas?"
             | "Te gusta programacion?"
             | "Te gusta resolver problemas?"
             | "Te gustan los negocios?"

<respuesta> ::= <respuesta_simple>
              | <respuesta_simple> <conector> <respuesta>

<respuesta_simple> ::= <afirmacion>
                     | <negacion>

<afirmacion> ::= "si"
               | "sí"
               | "si" <extra_afirmacion>
               | "sí" <extra_afirmacion>
               | "me gusta" <preferencia>
               | "me gustan" <articulo> <preferencia>

<extra_afirmacion> ::= ε
                     | "y" <afirmacion>
                     | "tambien" <afirmacion>
                     | "ademas" <afirmacion>

<conector> ::= "pero"
             | "y"

<afirmacion> ::= "si"
               | "sí"
               | "me gusta" <preferencia>
               | "me gustan" <articulo> <preferencia>

<negacion> ::= "no"
             | "no me gusta" <preferencia>
             | "odio" <preferencia>

<articulo> ::= "las"
             | "los"
             | "la"
             | "el"
             | ε

<preferencia> ::= "personas"
                | "salud"
                | "tecnologia"
                | "matematicas"
                | "programacion"
                | "resolver problemas"
                | "negocios"
                | "creatividad"
                | "diseno"
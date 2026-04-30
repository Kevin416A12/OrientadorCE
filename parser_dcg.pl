:- consult('logic.pl').
:- use_module(library(readutil)).

% ============================
% LEER RESPUESTA
% ============================

leer_respuesta(Tokens) :-
    read_line_to_string(user_input, Input),
    string_lower(Input, Lower),
    split_string(Lower, " ", ".,!?;", Strings),
    maplist(atom_string, Tokens, Strings).

% ============================
% PROCESAR RESPUESTA
% ============================

procesar_respuesta :-
    leer_respuesta(Tokens),
    (
        phrase(respuesta, Tokens)
        ->
        true
        ;
        write('No entendi tu respuesta. Intenta de nuevo.'), nl,
        procesar_respuesta
    ).

% ============================
% GRAMATICA PRINCIPAL
% ============================

respuesta --> respuesta_simple.
respuesta --> respuesta_simple, conector, respuesta.

respuesta_simple --> afirmacion.
respuesta_simple --> negacion.

conector --> [y].
conector --> [pero].
conector --> [ademas].
conector --> [tambien].
conector --> [también].
conector --> [y, tambien].
conector --> [y, también].

% ============================
% AFIRMACIONES (TODO JUNTO)
% ============================

afirmacion -->
    [si], afirmacion_con_contenido.

afirmacion -->
    [sí], afirmacion_con_contenido.

afirmacion -->
    [tambien], afirmacion_con_contenido.

afirmacion -->
    [también], afirmacion_con_contenido.

afirmacion -->
    afirmacion_con_contenido.


afirmacion_con_contenido -->
    [me], [gusta], modificador, articulo, preferencia(X),
    {assert_si_no_existe(gusta(X))}.

afirmacion_con_contenido -->
    [me], [gustan], modificador, articulo, preferencia(X),
    {assert_si_no_existe(gusta(X))}.

afirmacion_con_contenido -->
    [amo], modificador, articulo, preferencia(X),
    {assert_si_no_existe(gusta(X))}.

afirmacion_con_contenido -->
    [disfruto], modificador, articulo, preferencia(X),
    {assert_si_no_existe(gusta(X))}.

extra_afirmacion --> [].

extra_afirmacion --> [y], afirmacion.
extra_afirmacion --> [tambien], afirmacion.
extra_afirmacion --> [también], afirmacion.
extra_afirmacion --> [y], [tambien], afirmacion.
extra_afirmacion --> [y], [también], afirmacion.

% ============================
% NEGACIONES (TODO JUNTO)
% ============================

negacion -->
    [no], negacion_con_contenido.

negacion -->
    negacion_con_contenido.


negacion_con_contenido -->
    [me], [gusta], modificador, articulo, preferencia(X),
    {assert_si_no_existe(no_gusta(X))}.

negacion_con_contenido -->
    [me], [gustan], modificador, articulo, preferencia(X),
    {assert_si_no_existe(no_gusta(X))}.

negacion_con_contenido -->
    [odio], modificador, articulo, preferencia(X),
    {assert_si_no_existe(no_gusta(X))}.

negacion_con_contenido -->
    [detesto], modificador, articulo, preferencia(X),
    {assert_si_no_existe(no_gusta(X))}.

extra_negacion --> [].
extra_negacion --> [pero], afirmacion.

% ============================
% ARTICULOS OPCIONALES
% ============================

articulo --> [las].
articulo --> [los].
articulo --> [la].
articulo --> [el].
articulo --> [].

% ============================
% PREFERENCIAS
% ============================                  

modificador --> [mucho].
modificador --> [bastante].
modificador --> [demasiado].
modificador --> [].

preferencia(personas) --> [personas].
preferencia(salud) --> [salud].
preferencia(tecnologia) --> [tecnologia].
preferencia(matematicas) --> [matematicas].
preferencia(programacion) --> [programacion].
preferencia(negocios) --> [negocios].
preferencia(creatividad) --> [creatividad].
preferencia(diseno) --> [diseno].
preferencia(arte) --> [arte].
preferencia(numeros) --> [numeros].
preferencia(resolver_problemas) --> [resolver], [problemas].

% ============================
% EVITAR DUPLICADOS
% ============================

assert_si_no_existe(Hecho) :-
    call(Hecho), !.

assert_si_no_existe(Hecho) :-
    assert(Hecho).

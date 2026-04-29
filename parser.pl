:- consult('logic.pl').
:- use_module(library(readutil)).

% ------------------------------------------------------------------------
% Lee las palabras del usuario y las procesa para obtener recomendaciones
% ------------------------------------------------------------------------
leer_palabras(Palabras) :-
    write('Escribe tus gustos: '), nl,
    read_line_to_string(user_input, Input),
    string_lower(Input, Lower),
    split_string(Lower, " ", ".,", Strings),
    maplist(atom_string, Palabras, Strings).

% ------------------------------------------------------------------------
% Toma el texto ingresado por el usuario, lo separa en frases usando 
% "pero" y "y" como separadores, e interpreta cada frase para obtener recomendaciones
% ------------------------------------------------------------------------
procesar_texto :-
    limpiar,
    leer_palabras(Palabras),
    separar_frases(Palabras, Frases),
    interpretar_lista(Frases),
    mostrar_recomendacion.

separar_frases(Palabras, ListaFrases) :-
    dividir(Palabras, [pero, y], ListaFrases).


% Esto para dividir una lista de palabras en partes usando "pero" y "y" como separadores.
dividir([], _, []).

dividir(Palabras, Separadores, [Parte | Resto]) :-
    tomar_hasta(Palabras, Separadores, Parte, Restante),
    quitar_sep(Restante, NuevoRestante),
    dividir(NuevoRestante, Separadores, Resto).

tomar_hasta([], _, [], []).

tomar_hasta([X|R], Separadores, [], [X|R]) :-
    member(X, Separadores), !.

tomar_hasta([X|R], Separadores, [X|Parte], Final) :-
    tomar_hasta(R, Separadores, Parte, Final).

quitar_sep([_|R], R).
quitar_sep([], []).

% Esta funcionalidad es para interpretar múltiples gustos.
interpretar_lista([]).

interpretar_lista([Frase|Resto]) :-
    interpretar(Frase),
    interpretar_lista(Resto).

% Detectar polaridad, es decir si la frase es positiva o negativa, y extraer los gustos

interpretar(Palabras) :-
    detectar_negativo(Palabras, X), !,
    assert(no_gusta(X)).

interpretar(Palabras) :-
    detectar_positivo(Palabras, X), !,
    assert(gusta(X)).

% Detecta los patrones y clasisfica los gustos como positivos o negativos.
detectar_negativo(Palabras, Gusto) :-
    (member(no, Palabras); member(odio, Palabras)),
    member(X, Palabras),
    mapear(X, Gusto).

detectar_positivo(Palabras, Gusto) :-
    member(gusta, Palabras),
    member(X, Palabras),
    mapear(X, Gusto).

detectar_positivo(Palabras, Gusto) :-
    member(X, Palabras),
    mapear(X, Gusto).


mapear(tecnologia, tecnologia).
mapear(matematicas, matematicas).
mapear(programacion, programacion).
mapear(personas, personas).
mapear(salud, salud).
mapear(arte, arte).
mapear(creatividad, creatividad).
mapear(negocios, negocios).
mapear(numeros, numeros).


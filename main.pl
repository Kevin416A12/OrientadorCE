:- consult('logic.pl').

iniciar :-
    limpiar,
    preguntar(tecnologia),
    preguntar(matematicas),
    preguntar(personas),
    preguntar(creatividad),
    preguntar(salud),
    preguntar(negocios),
    preguntar(arte),
    preguntar(comunicacion),
    preguntar(construccion),
    preguntar(numeros),
    mostrar_recomendacion.

preguntar(X) :-
    write('Te gusta '), write(X), write('? (si/no): '),
    read(Respuesta),
    procesar_respuesta(Respuesta, X).

procesar_respuesta(si, X) :-
    assert(gusta(X)).

procesar_respuesta(no, X) :-
    assert(no_gusta(X)).
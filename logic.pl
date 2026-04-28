:- consult('bd.pl').

% Hechos dinamicos para almacenar las preferencias del usuario
:- dynamic gusta/1.
:- dynamic no_gusta/1.

% Limpiar respouestas
limpiar :-
    retractall(gusta(_)),
    retractall(no_gusta(_)).


% Puntaje de una profesión basado en las afinidades y antagonias del usuario


puntaje_profesion(Profesion, Puntaje) :-
    findall(Puntos, puntos_respuesta(Profesion, Puntos), ListaPuntos),
    sum_list(ListaPuntos, Puntaje).


% Una afinidad que al usuario le gusta suma 2
puntos_respuesta(Profesion, 2) :-
    gusta(X),
    afinidad(Profesion, X).

% Una afinidad que al usuario NO le gusta resta
puntos_respuesta(Profesion, -2) :-
    no_gusta(X),
    afinidad(Profesion, X).

% Una antagonia que al usuario sí le gusta resta 3
puntos_respuesta(Profesion, -3) :-
    gusta(X),
    antagonia(Profesion, X).

% Una antagonia que al usuario NO le gusta suma 1
puntos_respuesta(Profesion, 1) :-
    no_gusta(X),
    antagonia(Profesion, X).


% Evaluar todas las profesiones 
evaluar_profesiones(Lista) :-
    findall(
        Puntaje-Profesion,
        (
            profesion(Profesion),
            puntaje_profesion(Profesion, Puntaje)
        ),
        Lista
    ).


% Mejor profecion basada en el puntaje
mejor([P-C], C, P).

mejor([P1-C1, P2-C2 | Resto], MejorC, MejorP) :-
    (P1 >= P2 ->
        mejor([P1-C1 | Resto], MejorC, MejorP)
    ;
        mejor([P2-C2 | Resto], MejorC, MejorP)
    ).


% Recomendar la mejor carrera basada en el puntaje
recomendar(Carrera) :-
    evaluar_profesiones(Lista),
    mejor(Lista, _, MejorPuntaje),
    profesiones_empatadas(MejorPuntaje, Empatadas),
    desempatar(Empatadas, Carrera).

profesiones_empatadas(Puntaje, Empatadas) :-
    evaluar_profesiones(Lista),
    findall(
        Carrera,
        member(Puntaje-Carrera, Lista),
        Empatadas
    ).



% Desempate entre carreras 
desempatar([Carrera], Carrera).

desempatar(Empatadas, MejorCarrera) :-
    findall(
        Coincidencias-Carrera,
        (
            member(Carrera, Empatadas),
            contar_afinidades_positivas(Carrera, Coincidencias)
        ),
        Lista
    ),
    sort(Lista, Ordenada),
    reverse(Ordenada, [_-MejorCarrera | _]).


contar_afinidades_positivas(Carrera, Conteo) :-
    findall(
        1,
        (
            gusta(X),
            afinidad(Carrera, X)
        ),
        Lista
    ),
    length(Lista, Conteo).



% Mostrar recomendación al usuario

mostrar_recomendacion :-
    recomendar(Carrera),
    write('Dadas tus preferencias te recomendaria: '),
    write(Carrera), nl.



% Debug: Mostrar puntajes de todas las profesiones
mostrar_puntajes :-
    evaluar_profesiones(L),
    write(L), nl.
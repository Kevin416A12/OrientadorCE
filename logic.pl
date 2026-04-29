:- consult('bd.pl').

% ============================
% Hechos dinámicos (respuestas del usuario)
% ============================

:- dynamic gusta/1.
:- dynamic no_gusta/1.


% ============================
% LIMPIAR RESPUESTAS
% ============================

limpiar :-
    retractall(gusta(_)),
    retractall(no_gusta(_)).


% ============================
% PUNTAJE DE UNA PROFESIÓN
% ============================

puntaje_profesion(Profesion, Puntaje) :-
    findall(1, (gusta(X), afinidad(Profesion, X)), Afinidades),
    length(Afinidades, Positivos),

    findall(1, (no_gusta(X), afinidad(Profesion, X)), Negativos1),
    findall(1, (gusta(X), antagonia(Profesion, X)), Negativos2),

    length(Negativos1, N1),
    length(Negativos2, N2),

    Negativos is N1 + N2,

    Puntaje is Positivos - Negativos.


% ============================
% EVALUAR TODAS LAS PROFESIONES
% ============================

evaluar_profesiones(Lista) :-
    findall(
        Puntaje-Profesion,
        (
            profesion(Profesion),
            puntaje_profesion(Profesion, Puntaje)
        ),
        Lista
    ).


% ============================
% MEJOR PROFESIÓN
% ============================

mejor([P-C], C, P).

mejor([P1-C1, P2-C2 | Resto], MejorC, MejorP) :-
    (P1 >= P2 ->
        mejor([P1-C1 | Resto], MejorC, MejorP)
    ;
        mejor([P2-C2 | Resto], MejorC, MejorP)
    ).


% ============================
% RECOMENDAR
% ============================

recomendar(Carrera) :-
    evaluar_profesiones(Lista),
    mejor(Lista, Carrera, _).


% ============================
% MOSTRAR RESULTADO
% ============================

mostrar_recomendacion :-
    recomendar(Carrera),
    write('Dadas tus preferencias te recomendaria: '),
    write(Carrera), nl.


% ============================
% DEBUG (para defensa)
% ============================

mostrar_puntajes :-
    evaluar_profesiones(L),
    write(L), nl.
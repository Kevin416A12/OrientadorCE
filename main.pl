:- consult('parser_dcg.pl').

% ============================
% INICIO
% ============================

iniciar :-
    limpiar,
    nl,
    write('=============================='), nl,
    write(' ORIENTADOR VOCACIONAL '), nl,
    write('=============================='), nl,
    write('Responde de forma natural.'), nl,
    nl,
    entrevista,
    nl,
    mostrar_recomendacion.

% ============================
% ENTREVISTA
% ============================

entrevista :-
    preguntar('Te gustan las personas?'),
    preguntar('Te gusta la salud?'),
    preguntar('Te gusta la tecnologia?'),
    preguntar('Te gustan las matematicas?'),
    preguntar('Te gusta programacion?'),
    preguntar('Te gusta resolver problemas?'),
    preguntar('Te gustan los negocios?'),
    preguntar('Te gusta creatividad?'),
    preguntar('Te gusta diseno?').

% ============================
% HACER PREGUNTA
% ============================

preguntar(Texto) :-
    nl,
    write(Texto), nl,
    procesar_respuesta.
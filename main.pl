:- consult('parser_dcg.pl').

iniciar :-
    limpiar,
    nl,
    write('Hola, soy OrientadorCE.'), nl,
    write('Voy a hacerte algunas preguntas sobre tus gustos.'), nl,
    write('Responde con frases como: me gusta tecnologia, no me gusta matematicas.'), nl,
    nl,

    preguntar(tecnologia, 'Te gusta la tecnologia?'),
    preguntar(matematicas, 'Te gustan las matematicas?'),
    preguntar(programacion, 'Te gusta la programacion?'),
    preguntar(resolver_problemas, 'Te gusta resolver problemas?'),
    preguntar(personas, 'Te gustan las personas?'),
    preguntar(salud, 'Te gusta la salud?'),
    preguntar(creatividad, 'Te gusta la creatividad?'),
    preguntar(negocios, 'Te gustan los negocios?'),
    preguntar(arte, 'Te gusta el arte?'),
    preguntar(numeros, 'Te gustan los numeros?'),

    nl,
    mostrar_recomendacion.

preguntar(_, Pregunta) :-
    write(Pregunta), nl,
    procesar_respuesta.
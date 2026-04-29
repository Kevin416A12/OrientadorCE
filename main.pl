:- consult('parser.pl').

iniciar :-
    nl,
    write('Hola, soy OrientadorCE.'), nl,
    write('Escribe tus gustos o rechazos en lenguaje natural.'), nl,
    write('Ejemplo: me gusta tecnologia y matematicas pero no personas'), nl,
    nl,
    procesar_texto.
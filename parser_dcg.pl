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

% Lista de preferencias en una misma frase
lista_preferencias([X]) -->
    preferencia(X).

lista_preferencias([X|Resto]) -->
    preferencia(X),
    conector,
    lista_preferencias(Resto).

assert_lista_gusta([]).

assert_lista_gusta([X|Resto]) :-
    assert_si_no_existe(gusta(X)),
    assert_lista_gusta(Resto).


assert_lista_no_gusta([]).

assert_lista_no_gusta([X|Resto]) :-
    assert_si_no_existe(no_gusta(X)),
    assert_lista_no_gusta(Resto).

conector --> [y].
conector --> [pero].
conector --> [ademas].
conector --> [tambien].
conector --> [también].
conector --> [y, tambien].
conector --> [y, también].

% ============================
% AFIRMACIONES
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
    verbo_positivo, modificadores, rellenos, lista_preferencias(Lista), modificador_final,
    {assert_lista_gusta(Lista)}.


% Verbos positivos 
verbo_positivo --> [me], [gusta].
verbo_positivo --> [me], [gustan].
verbo_positivo --> [me], [encanta].
verbo_positivo --> [me], [encantan].
verbo_positivo --> [me], [interesa].
verbo_positivo --> [me], [interesan].
verbo_positivo --> [amo].
verbo_positivo --> [disfruto].
verbo_positivo --> [prefiero].
verbo_positivo --> [me], [llama], [la], [atencion].
verbo_positivo --> [me], [llama], [la], [atención].
verbo_positivo --> [soy], [bueno], [en].
verbo_positivo --> [soy], [buena], [en].
verbo_positivo --> [soy], [habil], [en].
verbo_positivo --> [soy], [hábil], [en].
verbo_positivo --> [soy], modificador, [habil].
verbo_positivo --> [soy], modificador, [hábil].
verbo_positivo --> [soy], modificador, [bueno].
verbo_positivo --> [soy], modificador, [buena].
verbo_positivo --> [adoro].
verbo_positivo --> [me], [agrada].
verbo_positivo --> [me], [agradan].
verbo_positivo --> [me], [divierte].
verbo_positivo --> [me], [divierten].
verbo_positivo --> [me], [inclino], [por].
verbo_positivo --> [me], [gustaria].
verbo_positivo --> [me], [gustaría].
verbo_positivo --> [me], [motiva].
verbo_positivo --> [me], [motivan].
verbo_positivo --> [me], [apasiona].
verbo_positivo --> [me], [apasionan].
verbo_positivo --> [me], [emociona].
verbo_positivo --> [me], [emocionan].
verbo_positivo --> [soy], [bueno], [con].
verbo_positivo --> [soy], [buena], [con].
verbo_positivo --> [soy], [habil], [con].
verbo_positivo --> [soy], [hábil], [con].
verbo_positivo --> [se], [me], [facilita].
verbo_positivo --> [se], [me], [facilitan].
verbo_positivo --> [tengo], [habilidad], [para].
verbo_positivo --> [tengo], [facilidad], [para].
verbo_positivo --> [quiero], [aprender].
verbo_positivo --> [me], [gustaria], [aprender].
verbo_positivo --> [me], [gustaría], [aprender].
verbo_positivo --> [me], [interesa], [aprender].
verbo_positivo --> [me], [interesa], [estudiar].
verbo_positivo --> [quiero], [estudiar].
verbo_positivo --> [me], [veo], [estudiando].
verbo_positivo --> [me], [veo], [trabajando], [en].
verbo_positivo --> [soy], [fan], [de].
verbo_positivo --> [me], [atrae].
verbo_positivo --> [me], [atraen].
verbo_positivo --> [me], [parece], [interesante].
verbo_positivo --> [me], [parecen], [interesantes].




% ============================
% NEGACIONES
% ============================

negacion -->
    [no], negacion_con_contenido.

negacion -->
    negacion_con_contenido.

negacion_con_contenido -->
    verbo_negativo, modificadores, rellenos, lista_preferencias(Lista), modificador_final,
    {assert_lista_no_gusta(Lista)}.


% Verbos negativos 
verbo_negativo --> [me], [gusta].
verbo_negativo --> [me], [gustan].
verbo_negativo --> [me], [interesa].
verbo_negativo --> [me], [interesan].
verbo_negativo --> [me], [agrada].
verbo_negativo --> [me], [agradan].
verbo_negativo --> [odio].
verbo_negativo --> [detesto].
verbo_negativo --> [rechazo].
verbo_negativo --> [aborrezco].
verbo_negativo --> [desprecio].
verbo_negativo --> [no], [soporto].
verbo_negativo --> [no], [me], [gusta].
verbo_negativo --> [no], [me], [gustan].
verbo_negativo --> [no], [me], [interesa].
verbo_negativo --> [no], [me], [interesan].
verbo_negativo --> [no], [me], [agrada].
verbo_negativo --> [no], [me], [agradan].
verbo_negativo --> [no], [me], [llama], [la], [atencion].
verbo_negativo --> [no], [me], [llama], [la], [atención].
verbo_negativo --> [no], [soy], [bueno], [en].
verbo_negativo --> [no], [soy], [buena], [en].
verbo_negativo --> [no], [soy], [habil], [en].
verbo_negativo --> [no], [soy], [hábil], [en].
verbo_negativo --> [no], [soporto].
verbo_negativo --> [no], [tolero].
verbo_negativo --> [no], [aguanto].
verbo_negativo --> [soy], modificador, [habil].
verbo_negativo --> [soy], modificador, [hábil].
verbo_negativo --> [soy], modificador, [bueno].
verbo_negativo --> [soy], modificador, [buena].
verbo_negativo --> [no], [me], [siento], [comodo], [con].
verbo_negativo --> [no], [me], [siento], [cómodo], [con].
verbo_negativo --> [no], [me], [siento], [comoda], [con].
verbo_negativo --> [no], [me], [siento], [cómoda], [con].
verbo_negativo --> [no], [prefiero].
verbo_negativo --> [prefiero], [no].
verbo_negativo --> [no], [disfruto].
verbo_negativo --> [no], [me], [divierte].
verbo_negativo --> [no], [soy], [fan], [de].
verbo_negativo --> [no], [me], [atrae].
verbo_negativo --> [no], [me], [gustaria].
verbo_negativo --> [no], [me], [gustaría].
verbo_negativo --> [nunca], [me], [ha], [gustado].
verbo_negativo --> [nunca], [me], [gustaron].
verbo_negativo --> [no], [mucho].
verbo_negativo --> [no], [tanto].


% Palabras opcionales 
% ============================
% MODIFICADORES EXPANDIDOS
% ============================

% Intensidad alta
modificador --> [mucho].
modificador --> [muchos].
modificador --> [muchisimo].
modificador --> [muchísimo].
modificador --> [demasiado].
modificador --> [super].
modificador --> [súper].
modificador --> [extremadamente].
modificador --> [increiblemente].
modificador --> [increíblemente].
modificador --> [totalmente].
modificador --> [completamente].
modificador --> [bastante].
modificador --> [considerablemente].
modificador --> [suficiente].
modificador --> [poco].
modificador --> [un], [poco].
modificador --> [poquito].
modificador --> [algo].
modificador --> [ligeramente].
modificador --> [medianamente].
modificador --> [a], [veces].
modificador --> [frecuentemente].
modificador --> [seguido].
modificador --> [ocasionalmente].
modificador --> [raramente].
modificador --> [menos].
modificador --> [tanto].
modificador --> [tan].
modificador --> [realmente].
modificador --> [honestamente].
modificador --> [sinceramente].
modificador --> [personalmente].
modificador --> [un], [monton].
modificador --> [un], [montón].
modificador --> [un], [poco], [de].
modificadores --> [].
modificadores --> modificador, modificadores.



% Modificador al final 
modificador_final --> modificador.
modificador_final --> [].



% Rellenos


relleno --> [la].
relleno --> [las].
relleno --> [el].
relleno --> [los].
relleno --> [un].
relleno --> [una].
relleno --> [unos].
relleno --> [unas].
relleno --> [a].
relleno --> [con].
relleno --> [de].
relleno --> [del].
relleno --> [sobre].
relleno --> [en].
relleno --> [para].
relleno --> [por].
relleno --> [hacia].
relleno --> [entre].
relleno --> [hablar].
relleno --> [trabajar].
relleno --> [estar].
relleno --> [hacer].
relleno --> [usar].
relleno --> [ver].
relleno --> [tener].
relleno --> [llevar].
relleno --> [estudiar].
relleno --> [aprender].
relleno --> [practicar].
relleno --> [dedicarme].
relleno --> [dedicar].
relleno --> [hacerlo].
relleno --> [hacerlas].
relleno --> [cosas].
relleno --> [temas].
relleno --> [areas].
relleno --> [áreas].
relleno --> [actividades].
relleno --> [trabajos].
relleno --> [proyectos].
relleno --> [tipo].
relleno --> [como].
relleno --> [relacionado].
relleno --> [relacionada].
relleno --> [relacionados].
relleno --> [relacionadas].
relleno --> [que].
relleno --> [porque].
relleno --> [ya].
relleno --> [aunque].
relleno --> [cosas], [de].
relleno --> [temas], [de].
relleno --> [cosas], [relacionadas], [con].
rellenos --> [].
rellenos --> relleno, rellenos.


% ============================
% PREFERENCIAS Y SINONIMOS
% ============================

preferencia(tecnologia) --> [tecnologia].
preferencia(tecnologia) --> [tecnología].
preferencia(tecnologia) --> [computadoras].
preferencia(tecnologia) --> [computadora].
preferencia(tecnologia) --> [computacion].
preferencia(tecnologia) --> [computación].
preferencia(tecnologia) --> [informatica].
preferencia(tecnologia) --> [informática].
preferencia(tecnologia) --> [sistemas].
preferencia(tecnologia) --> [software].
preferencia(tecnologia) --> [hardware].
preferencia(tecnologia) --> [tecnologia], [digital].
preferencia(tecnologia) --> [inteligencia], [artificial].
preferencia(tecnologia) --> [ia].
preferencia(tecnologia) --> [datos].
preferencia(tecnologia) --> [bases], [de], [datos].

preferencia(matematicas) --> [matematicas].
preferencia(matematicas) --> [matemáticas].
preferencia(matematicas) --> [mates].
preferencia(matematicas) --> [numeros].
preferencia(matematicas) --> [números].
preferencia(matematicas) --> [calculos].
preferencia(matematicas) --> [cálculos].
preferencia(matematicas) --> [ecuaciones].
preferencia(matematicas) --> [algebra].
preferencia(matematicas) --> [álgebra].
preferencia(matematicas) --> [estadistica].
preferencia(matematicas) --> [estadística].

preferencia(programacion) --> [programacion].
preferencia(programacion) --> [programación].
preferencia(programacion) --> [programar].
preferencia(programacion) --> [programando].
preferencia(programacion) --> [programo].
preferencia(programacion) --> [codigo].
preferencia(programacion) --> [código].
preferencia(programacion) --> [codificar].
preferencia(programacion) --> [codificando].
preferencia(programacion) --> [desarrollar], [software].
preferencia(programacion) --> [desarrollo], [software].
preferencia(programacion) --> [crear], [programas].
preferencia(programacion) --> [hacer], [programas].
preferencia(programacion) --> [crear], [apps].
preferencia(programacion) --> [aplicaciones].
preferencia(programacion) --> [programacion], [web].
preferencia(programacion) --> [backend].
preferencia(programacion) --> [frontend].

preferencia(resolver_problemas) --> [resolver], [problemas].
preferencia(resolver_problemas) --> [solucionar], [problemas].
preferencia(resolver_problemas) --> [resolver], [ejercicios].
preferencia(resolver_problemas) --> [pensar], [soluciones].
preferencia(resolver_problemas) --> [logica].
preferencia(resolver_problemas) --> [lógica].
preferencia(resolver_problemas) --> [analizar].
preferencia(resolver_problemas) --> [analisis].
preferencia(resolver_problemas) --> [análisis].
preferencia(resolver_problemas) --> [problemas].
preferencia(resolver_problemas) --> [pensar], [soluciones], [a], [problemas].
preferencia(resolver_problemas) --> [buscar], [soluciones].
preferencia(resolver_problemas) --> [buscar], [soluciones], [a], [problemas].
preferencia(resolver_problemas) --> [encontrar], [soluciones].
preferencia(resolver_problemas) --> [encontrar], [soluciones], [a], [problemas].




preferencia(personas) --> [personas].
preferencia(personas) --> [gente].
preferencia(personas) --> [humanos].
preferencia(personas) --> [interactuar].
preferencia(personas) --> [socializar].
preferencia(personas) --> [relacionarme].
preferencia(personas) --> [hablar], [personas].
preferencia(personas) --> [trabajar], [personas].
preferencia(personas) --> [estar], [con], [personas].
preferencia(personas) --> [ayudar], [personas].
preferencia(personas) --> [escuchar], [personas].

preferencia(salud) --> [salud].
preferencia(salud) --> [medicina].
preferencia(salud) --> [hospital].
preferencia(salud) --> [hospitales].
preferencia(salud) --> [doctor].
preferencia(salud) --> [doctores].
preferencia(salud) --> [pacientes].
preferencia(salud) --> [cuidar], [personas].
preferencia(salud) --> [atender], [personas].
preferencia(salud) --> [biologia].
preferencia(salud) --> [biología].
preferencia(salud) --> [anatomia].
preferencia(salud) --> [anatomía].

preferencia(creatividad) --> [creatividad].
preferencia(creatividad) --> [crear].
preferencia(creatividad) --> [imaginar].
preferencia(creatividad) --> [inventar].
preferencia(creatividad) --> [ideas].
preferencia(creatividad) --> [innovar].
preferencia(creatividad) --> [diseñar].

preferencia(negocios) --> [negocios].
preferencia(negocios) --> [empresa].
preferencia(negocios) --> [empresas].
preferencia(negocios) --> [administracion].
preferencia(negocios) --> [administración].
preferencia(negocios) --> [emprender].
preferencia(negocios) --> [emprendimiento].
preferencia(negocios) --> [liderazgo].
preferencia(negocios) --> [liderar].
preferencia(negocios) --> [gestion].
preferencia(negocios) --> [gestión].

preferencia(arte) --> [arte].
preferencia(arte) --> [dibujar].
preferencia(arte) --> [dibujo].
preferencia(arte) --> [pintar].
preferencia(arte) --> [pintura].
preferencia(arte) --> [ilustrar].
preferencia(arte) --> [escultura].
preferencia(arte) --> [arte], [visual].

preferencia(diseno) --> [diseno].
preferencia(diseno) --> [diseño].
preferencia(diseno) --> [disenar].
preferencia(diseno) --> [diseñar].
preferencia(diseno) --> [diseño], [grafico].
preferencia(diseno) --> [diseño], [gráfico].
preferencia(diseno) --> [crear], [imagenes].
preferencia(diseno) --> [interfaces].

preferencia(numeros) --> [numeros].
preferencia(numeros) --> [números].
preferencia(numeros) --> [contabilidad].
preferencia(numeros) --> [finanzas].
preferencia(numeros) --> [dinero].
preferencia(numeros) --> [cuentas].
preferencia(numeros) --> [presupuesto].
preferencia(numeros) --> [economia].
preferencia(numeros) --> [economía].


% ============================
% EVITAR DUPLICADOS
% ============================

assert_si_no_existe(Hecho) :-
    call(Hecho), !.

assert_si_no_existe(Hecho) :-
    assert(Hecho).

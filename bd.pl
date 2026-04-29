% ============================
% Base de Conocimiento - BD.pl
% OrientadorCE
% ============================

% profesion(NombreCarrera).

profesion(ingenieria_computadores).
profesion(psicologia).
profesion(medicina).
profesion(arquitectura).
profesion(derecho).
profesion(administracion_empresas).
profesion(diseno_grafico).
profesion(educacion).
profesion(ingenieria_civil).
profesion(contabilidad).

% afinidad(Profesion, Preferencia).
% Representa gustos o intereses positivos relacionados con la carrera.

afinidad(ingenieria_computadores, tecnologia).
afinidad(ingenieria_computadores, matematicas).
afinidad(ingenieria_computadores, resolver_problemas).
afinidad(ingenieria_computadores, programacion).
afinidad(ingenieria_computadores, logica).


afinidad(psicologia, personas).
afinidad(psicologia, escuchar).
afinidad(psicologia, ayudar).
afinidad(psicologia, comportamiento_humano).
afinidad(psicologia, comunicacion).

afinidad(medicina, salud).
afinidad(medicina, ayudar).
afinidad(medicina, biologia).
afinidad(medicina, personas).
afinidad(medicina, resolver_problemas).

afinidad(arquitectura, diseno).
afinidad(arquitectura, creatividad).
afinidad(arquitectura, dibujo).
afinidad(arquitectura, espacios).
afinidad(arquitectura, matematicas).

afinidad(derecho, lectura).
afinidad(derecho, argumentar).
afinidad(derecho, justicia).
afinidad(derecho, personas).
afinidad(derecho, comunicacion).

afinidad(administracion_empresas, negocios).
afinidad(administracion_empresas, liderazgo).
afinidad(administracion_empresas, organizacion).
afinidad(administracion_empresas, economia).
afinidad(administracion_empresas, trabajo_equipo).

afinidad(diseno_grafico, creatividad).
afinidad(diseno_grafico, arte).
afinidad(diseno_grafico, tecnologia).
afinidad(diseno_grafico, comunicacion_visual).
afinidad(diseno_grafico, diseno).

afinidad(educacion, ensenar).
afinidad(educacion, personas).
afinidad(educacion, comunicacion).
afinidad(educacion, paciencia).
afinidad(educacion, ayudar).

afinidad(ingenieria_civil, construccion).
afinidad(ingenieria_civil, matematicas).
afinidad(ingenieria_civil, fisica).
afinidad(ingenieria_civil, resolver_problemas).
afinidad(ingenieria_civil, estructuras).

afinidad(contabilidad, numeros).
afinidad(contabilidad, orden).
afinidad(contabilidad, finanzas).
afinidad(contabilidad, analisis).
afinidad(contabilidad, organizacion).

% fortaleza(Profesion, Fortaleza).
% Representa habilidades útiles para esa carrera.

fortaleza(ingenieria_computadores, pensamiento_logico).
fortaleza(psicologia, empatia).
fortaleza(medicina, responsabilidad).
fortaleza(arquitectura, vision_espacial).
fortaleza(derecho, pensamiento_critico).
fortaleza(administracion_empresas, liderazgo).
fortaleza(diseno_grafico, creatividad).
fortaleza(educacion, paciencia).
fortaleza(ingenieria_civil, analisis_estructural).
fortaleza(contabilidad, atencion_detalle).

% antagonia(Profesion, PreferenciaNegativa).
% Representa gustos o rechazos que pueden alejar al usuario de esa carrera.


% Ingeniería en Computadores
antagonia(ingenieria_computadores, no_tecnologia).
antagonia(ingenieria_computadores, no_matematicas).
antagonia(ingenieria_computadores, no_programacion).
antagonia(ingenieria_computadores, no_logica).

% Psicología
antagonia(psicologia, no_personas).
antagonia(psicologia, no_escuchar).
antagonia(psicologia, no_ayudar).
antagonia(psicologia, no_comunicacion).

% Medicina
antagonia(medicina, no_salud).
antagonia(medicina, no_biologia).
antagonia(medicina, no_personas).
antagonia(medicina, miedo_sangre).

% Arquitectura
antagonia(arquitectura, no_diseno).
antagonia(arquitectura, no_creatividad).
antagonia(arquitectura, no_dibujo).
antagonia(arquitectura, no_matematicas).

% Derecho
antagonia(derecho, no_lectura).
antagonia(derecho, no_argumentar).
antagonia(derecho, no_justicia).
antagonia(derecho, no_hablar_publico).

% Administración de Empresas
antagonia(administracion_empresas, no_negocios).
antagonia(administracion_empresas, no_liderazgo).
antagonia(administracion_empresas, no_organizacion).
antagonia(administracion_empresas, no_trabajo_equipo).

% Diseño Gráfico
antagonia(diseno_grafico, no_creatividad).
antagonia(diseno_grafico, no_arte).
antagonia(diseno_grafico, no_diseno).
antagonia(diseno_grafico, no_comunicacion_visual).

% Educación
antagonia(educacion, no_ensenar).
antagonia(educacion, no_personas).
antagonia(educacion, no_paciencia).
antagonia(educacion, no_comunicacion).

% Ingeniería Civil
antagonia(ingenieria_civil, no_construccion).
antagonia(ingenieria_civil, no_matematicas).
antagonia(ingenieria_civil, no_fisica).
antagonia(ingenieria_civil, no_estructuras).

% Contabilidad
antagonia(contabilidad, no_numeros).
antagonia(contabilidad, no_orden).
antagonia(contabilidad, no_finanzas).
antagonia(contabilidad, no_analisis).
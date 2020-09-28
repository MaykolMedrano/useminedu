{smcl}
{* *! version 1.0.0 10jan2020}{...}

{title:Titulo}

{p2colset 5 16 20 2}{...}
{p2col :{cmd:useminedu} {hline 1}} Modulo para descargar datos de ESCALE (Ministerio de Educación) en Stata.{p_end}
{p2colreset}{...}

{title:Sintaxis}

{p 8 16 2}
{cmd:useminedu censo}
{cmd:,}
{opt modulo(ID_modulo)}
{opt año(año)}

{title:Descripción}

{pstd}
{cmd:useminedu} es un comando que permite descargar datos del censo educativo (Ministerio de Educación) en Stata.


{cmd:ID_modulo}: enumera los modulos disponibles en el censo educativo.

	     ID modulo      	 Descripción del modulo of modulo
           {hline 80}
	      {cmd:01}		 01+Padron
              {cmd:02}		 02+Matricula_01
              {cmd:03}		 03+Matricula_02
              {cmd:04}		 04+Matricula_03
              {cmd:05}		 05+Matricula_04
              {cmd:06}		 06+Docentes_01
              {cmd:07}		 07+Docentes_02
              {cmd:08}		 08+Docentes_03
              {cmd:09}		 09+Docentes_04
              {cmd:10}		 10+Secciones
              {cmd:11}		 11+Multiedad
              {cmd:12}		 12+Recursos
              {cmd:13}		 13+Otras_caracteristicas_S100
              {cmd:14}		 14+Modelo_servicio
              {cmd:15}		 15+C3as_cuadro805
              {cmd:16}		 16+Tabgence_01
              {cmd:17}		 17+Tabgence_02
              {cmd:18}		 18+Horarios
              {cmd:19}		 19+Porcentaje_Region
              {cmd:20}		 20+Periodos_eba
              {cmd:21}		 21+Saanee
              {cmd:22}		 22+Carreras_autorizadas
              {cmd:23}		 23+loc_Lineal
              {cmd:24}		 24+loc_Sec112
              {cmd:25}		 25+loc_Sec206
              {cmd:26}		 26+loc_Sec207
              {cmd:27}		 27+loc_Sec300
              {cmd:28}		 28+loc_Sec400
              {cmd:29}		 29+loc_Sec405
              {cmd:30}		 30+loc_Sec500
              {cmd:31}		 31+loc_Sec611
              {cmd:32}		 32+loc_Sec700
              {cmd:33}		 33+loc_Sec800
              {cmd:34}		 34+loc_Pronoei
            {hline 80}
		  
{cmd:año}: enumera el año que el usuario desea descargar para el módulo en cuestión; Por lo general, debería ser entre 2017-2020.

	       año      	Descripción de modulo
           {hline 80}
              {cmd:2017}		
              {cmd: ..}		
              {cmd: ..}		
              {cmd:2020}		
          {hline 80}		  
{marker examples}{...}
{title:Ejemplos}
{pstd}

Seleccione un módulo de interés y año. Ejemplos:

{pstd}{inp:useminedu censo, modulo(01) año(2019)}{p_end}
{pstd}{inp:useminedu censo, modulo(02) año(2018)}{p_end}


Si desea descargar más de un módulo de un solo año de interes. Ejemplo:

{pstd}
{inp:foreach i in 01 02 03 04 {
useminedu censo, modulo(`i') año(2019)
}}
{p_end}

Si desea descargar más de un año y un módulo de interés. Ejemplo:
{pstd}
{inp:forvalues j = 2017/2019 {
useminedu censo, modulo(01) año(`j')
}}
{p_end}

Si desea descargar más de un módulo y varios años. Ejemplo:
{pstd}
{inp:foreach i in 01 02 03 04 {
forvalues j = 2017/2019 {
useminedu censo, modulo(`i') año(`j')
}}
{p_end}


{title:Notas}
{pstd}

Si quieres saber más sobre los datos puedes verlos en {browse "http://escale.minedu.gob.pe/inicio"}.

{title:Ver también}

{psee}
En linea:  {manhelp copy G}, {help usebcrp}, {help enahodata}.

{title:Autor}

{pstd}
Maykol Medrano, Ministerio de Educación. {browse "mailto:maykolmedrano35@gmail.com":maykolmedrano35@gmail.com}
{p_end}



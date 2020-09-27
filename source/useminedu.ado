*! useminedu:  
*! Version 1.0.0: 2020/14/06
*! Author: Maykol Medrano
*! Ministry of Education
*! maykolmedrano35@gmail.com

capture program drop useminedu
program define useminedu
	vers 15.0
	set more off
	
	
syntax name(id="censo"  ), 	              ///
						MODulo(string)		  	  ///
						año(string)               ///
								 	              ///
						[						  ///
								year(numlist) 	  ///
								PREServe		  ///
								condition(string) ///
						]

if length("`preserve'") != 0 {
		tempfile init
		cap save `init', replace
}

clear


if length(`"`place'"') != 0 {
		local place `place'

}

if length(`"`modulo'"') != 0 {
		local id_modulo `id_modulo'
}		

********************************************************************************
*** CODIGO DE CENSO EDUCATIVO POR AÑO
********************************************************************************
	// Intercambiamos el codigo por el año de los censos 

	if "`año'"=="2019" {
		local año 5336482
		local year 2019
	}
	else if "`año'"=="2018" {
		local año 4594303
		local year 2018
	}
	else if "`año'"=="2017" {
		local año 4028089
		local year 2017
	}
	
	if "`modulo'"=="01"{
	local modulo "01+Padron.zip" | modulo "18+Padron.zip"
		local mod 01
	}
	else if "`modulo'"=="02" {
	local modulo "02+Matricula_01.zip"
		local mod 02
	}
	else if "`modulo'"=="03" {
	local "modulo03+Matricula_02.zip"
		local mod 03
	}
	else if "`modulo'"=="04"{
	local modulo "04+Matricula_03.zip"
	l	local mod 04
	}
	else if "`modulo'"=="05"{
	local modulo "05+Matricula_04.zip"
		local mod 05
	}
	else if "`modulo'"=="06"{
	local modulo "06+Docentes_01.zip"
		local mod 06
	}
	else if "`modulo'"=="07"{
	local modulo "07+Docentes_02.zip"
		local mod 07
	}
	else if "`modulo'"=="08"{
	local modulo "08+Docentes_03.zip"
		local mod 08
	}
	else if "`modulo'"=="09"{
	local modulo "09+Docentes_04.zip"
	local mod 09
	}
	else if "`modulo'"=="10"{
	local modulo "10+Secciones.zip"
		local mod 10
	}
	else if "`modulo'"=="11"{
	local modulo "11+Multiedad.zip"
		local mod 11
	}
	else if "`modulo'"=="12"{
	local modulo "12+Recursos.zip"
		local mod 12
	}
	else if "`modulo'"=="13"{
	local modulo "13+Otras_caracteristicas_S100.zip"
		local mod 13
	}
	else if "`modulo'"=="14"{
	local modulo "14+Modelo_servicio.zip"
		local mod 14
	}
	else if "`modulo'"=="15"{
	local modulo "15+C3as_cuadro805.zip"
		local mod 15
	}
	else if "`modulo'"=="16"{
	local modulo "16+Tabgence_01.zip"
		local mod 16
	}
	else if "`modulo'"=="17"{
	local modulo "17+Tabgence_02.zip"
		local mod 17
	}
	else if "`modulo'"=="18"{
	local modulo "18+Horarios.zip"
		local mod 18
	}
	else if "`modulo'"=="19"{
	local modulo "19+Porcentaje_Region.zip"
		local mod 19
	}
	else if "`modulo'"=="20"{
	local modulo "20+Periodos_eba.zip"
		local mod 20
	}
	else if "`modulo'"=="21"{
	local modulo "21+Saanee.zip"
		local mod 21
	}
	else if "`modulo'"=="22"{
	local modulo "22+Carreras_autorizadas.zip"
		local mod 22
	}
	else if "`modulo'"=="23"{
	local modulo "23+Local_Lineal.zip"
		local mod 23
	}
	else if "`modulo'"=="24"{
	local modulo "24+Local_Sec112.zip"
		local mod 24
	}
	else if "`modulo'"=="25"{
	local modulo "25+Local_Sec206.zip"
		local mod 25
	}
	else if "`modulo'"=="26"{
	local modulo "26+Local_Sec207.zip"
		local mod 26
	}
	else if "`modulo'"=="27"{
	local modulo "27+Local_Sec300.zip"
		local mod 27
	}
	else if "`modulo'"=="28"{
	local modulo "28+Local_Sec400.zip"
		local mod 28
	}
	else if "`modulo'"=="29"{
	local modulo "29+Local_Sec405.zip"
		local mod 29
	}
	else if "`modulo'"=="30"{
	local modulo "30+Local_Sec500.zip"
		local mod 30
	}
	else if "`modulo'"=="31"{
	local modulo "31+Local_Sec611.zip"
		local mod 31
	}
	else if "`modulo'"=="32"{
	local modulo "32+Local_Sec700.zip"
		local mod 32
	}
	else if "`modulo'"=="33"{
	local modulo "33+Local_Sec800.zip"
		local mod 33
	}
	else if "`modulo'"=="34"{
	local modulo "34+Local_Pronoei.zip"
	local mod 34
	}
	
********************************************************************************
*** Remplazamos los valores de sintaxis
********************************************************************************
//Usamos el comando nativo copy para descargar los datos
copy "http://escale.minedu.gob.pe/documents/10156/`año'/`modulo'" id_`modulo'.zip

di in green "Descargando modulo_`modulo'_`year'"
di in green "Descarga exitosa"

sleep 2000
qui unzipfile id_`modulo'.zip
erase "id_`modulo'.zip"

di in green "Convirtiendo .dbf en dta."

local filelist: dir . files "*.dbf"
foreach file of local filelist {
	import dbase using "`file'", clear case(lower)
	sleep 1000
	qui save "`file'_`year'.dta", replace
}

local dbfiles: dir . files "*.dbf"
foreach file of local dbfiles {
	qui erase "`file'" 
}

di in green "{text}Consulte por más datos aquí:{browse www.escale.minedu.gob.pe:ESCALE - Ministerio de Educación}"
	
end


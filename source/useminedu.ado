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
		loc place `place'

}

if length(`"`modulo'"') != 0 {
		loc id_modulo `id_modulo'
}		

********************************************************************************
*** CODIGO DE CENSO EDUCATIVO POR AÑO
********************************************************************************
	// Intercambiamos el codigo por el año de los censos 

	if "`año'"=="2019" {
		loc año 5336482
		loc year 2019
	}
	else if "`año'"=="2018" {
		loc año 4594303
		loc year 2018
	}

	else if "`año'"=="2017" {
		loc año 4028089
		loc year 2017
	}
	if "`modulo'"=="01"{
	loc modulo "01+Padron"
		loc mod 01
	}
	else if "`modulo'"=="02" {
	loc modulo "02+Matricula_01"
		loc mod 02
	}
	else if "`modulo'"=="03" {
	loc modulo "modulo03+Matricula_02"
		loc mod 03
	}
	else if "`modulo'"=="04"{
	loc modulo "04+Matricula_03"
		loc mod 04
	}
	else if "`modulo'"=="05"{
	loc modulo "05+Matricula_04"
		loc mod 05
	}
	else if "`modulo'"=="06"{
	loc modulo "06+Docentes_01"
		loc mod 06
	}
	else if "`modulo'"=="07"{
	loc modulo "07+Docentes_02"
		loc mod 07
	}
	else if "`modulo'"=="08"{
	loc modulo "08+Docentes_03"
		loc mod 08
	}
	else if "`modulo'"=="09"{
	loc modulo "09+Docentes_04"
		loc mod 09
	}
	else if "`modulo'"=="10"{
	loc modulo "10+Secciones"
		loc mod 10
	}
	else if "`modulo'"=="11"{
	loc modulo "11+Multiedad"
		loc mod 11
	}
	else if "`modulo'"=="12"{
	loc modulo "12+Recursos"
		loc mod 12
	}
	else if "`modulo'"=="13"{
	loc modulo "13+Otras_caracteristicas_S100"
		loc mod 13
	}
	else if "`modulo'"=="14"{
	loc modulo "14+Modelo_servicio"
		loc mod 14
	}
	else if "`modulo'"=="15"{
	loc modulo "15+C3as_cuadro805"
		loc mod 15
	}
	else if "`modulo'"=="16"{
	loc modulo "16+Tabgence_01"
		loc mod 16
	}
	else if "`modulo'"=="17"{
	loc modulo "17+Tabgence_02"
		loc mod 17
	}
	else if "`modulo'"=="18"{
	loc modulo "18+Horarios"
		loc mod 18
	}
	else if "`modulo'"=="19"{
	loc modulo "19+Porcentaje_Region"
		loc mod 19
	}
	else if "`modulo'"=="20"{
	loc modulo "20+Periodos_eba"
		loc mod 20
	}
	else if "`modulo'"=="21"{
	loc modulo "21+Saanee"
		loc mod 21
	}
	else if "`modulo'"=="22"{
	loc modulo "22+Carreras_autorizadas"
		loc mod 22
	}
	else if "`modulo'"=="23"{
	loc modulo "23+loc_Lineal"
		loc mod 23
	}
	else if "`modulo'"=="24"{
	loc modulo "24+loc_Sec112"
		loc mod 24
	}
	else if "`modulo'"=="25"{
	loc modulo "25+loc_Sec206"
		loc mod 25
	}
	else if "`modulo'"=="26"{
	loc modulo "26+loc_Sec207"
		loc mod 26
	}
	else if "`modulo'"=="27"{
	loc modulo "27+loc_Sec300"
		loc mod 27
	}
	else if "`modulo'"=="28"{
	loc modulo "28+loc_Sec400"
		loc mod 28
	}
	else if "`modulo'"=="29"{
	loc modulo "29+loc_Sec405"
		loc mod 29
	}
	else if "`modulo'"=="30"{
	loc modulo "30+loc_Sec500"
		loc mod 30
	}
	else if "`modulo'"=="31"{
	loc modulo "31+loc_Sec611"
		loc mod 31
	}
	else if "`modulo'"=="32"{
	loc modulo "32+loc_Sec700"
		loc mod 32
	}
	else if "`modulo'"=="33"{
	loc modulo "33+loc_Sec800"
		loc mod 33
	}
	else if "`modulo'"=="34"{
	loc modulo "34+loc_Pronoei"
		loc mod 34
	}
	
********************************************************************************
*** Remplazamos los valores de sintaxis
********************************************************************************
//Usamos el comando nativo copy para descargar los datos
copy "http://escale.minedu.gob.pe/documents/10156/`año'/`modulo'.zip" .

di in green "Descargando modulo_`modulo'_`year'"
di in green "Descarga exitosa"
id_02+Matricula_01
sleep 2000
qui unzipfile "id_`modulo'.zip.zip"
erase "id_`modulo'.zip"

di in green "Convirtiendo .dbf en .dta"

loc filelist: dir . files "*.dbf"
foreach file of loc filelist {
	import dbase using "`file'", clear case(lower)
	sleep 1000
	qui gen stub = "`file'" in 1
	qui split stub, p(.)
	loc filename = stub1 [`n']
	qui save "`filename'_`year'.dta", replace
	drop stub*
}

loc dbfiles: dir . files "*.dbf"
foreach file of loc dbfiles {
	qui erase "`file'" 
}

di in green "{text}Consulte por más datos aquí:{browse www.escale.minedu.gob.pe:ESCALE - Ministerio de Educación}"
	
end

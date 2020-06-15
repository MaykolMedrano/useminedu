# useminedu
# `useminedu` : Modulo para descargar datos de  ESCALE (Ministerio de Educación) en Stata - Perú.

## Descripción

El presente modulo descarga, descomprime y transforma lo datos (Censo Educativo) de la Unidad de Estadística Educativa del Ministerio de Educación del Perú.

## Instalación

```
cap ado uninstall useminedu 
net install useminedu, from(https://github.com/MaykolMedrano/enahodata/raw/master/source/)
```

## Uso

Seleccione un módulo de interés y año:

```stata
 useminedu censo, modulo(01) año(2019)
 useminedu censo, modulo(34) año(2018)
```

## Nota

Es necesario crear previamente un folder para descargar los datos.

- Mas información en el archivo de ayuda.

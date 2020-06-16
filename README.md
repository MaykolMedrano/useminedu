# `useminedu` : Modulo para descargar datos de  ESCALE (Ministerio de Educación) en Stata - Perú.

## Descripción

El presente modulo descarga, descomprime y transforma lo datos (Censo Educativo) de la Unidad de Estadística Educativa del Ministerio de Educación del Perú.

## Instalación

Copie el siguiente codigo en Stata y ejecute.

```
cap ado uninstall useminedu 
net install useminedu, from(https://github.com/MaykolMedrano/useminedu/raw/master/source/)
```

## Uso

Seleccione un módulo de interés y año:

```stata
 useminedu censo, modulo(01) año(2019)
 useminedu censo, modulo(34) año(2018)
```

Si desea descargar más de un módulo

```stata
foreach i in 01 02 03 04 {
useminedu censo, modulo(`i') año(2019)
}
```

Si desea descargar más de un año y un módulo de interés

```stata
forvalues j = 2017/2019 {
useminedu censo, modulo(01) año(`j')
}
```
Si desea descargar más de un módulo y de diferentes años.

```stata
foreach i in 01 02 03 04 {
forvalues j = 2017/2019 {
useminedu censo, modulo(`i') año(`j')
}
```
## Nota

Es necesario crear previamente un folder para descargar los datos.

- Mas información en el archivo de ayuda.

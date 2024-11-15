# Indicaciones
## Crear la carpeta de trabajo
Elijan una ubicación en donde se creará la carpeta del repositorio

Abran una terminal y escriban `cd <direccion elegida>`

Por ejemplo, si elegí una carpeta en mi escritorio llamada `test`, entoces escribiré : `cd Desktop/test`

Ahora escriban `git clone https://github.com/Infamous1991/POO-Proyecto.git`

Si la terminal les pide usuario y contraseña, escriban su nombre de usuario y en el apartado de contraseña deben de escribir el [token de acceso](https://github.com/settings/tokens) que hallan generado anteriormente. **NO ES LA CONTRASEÑA DE SU CUENTA**
>Al crear el token, elijan el token clásico

>Marquen el recuadro que dice `repo` mientras estén creando el token

>Una vez creado, copien y guarden el token, **no podran volver a verlo otra vez (y si lo olvidan tendrán que crear otro nuevo)**

Hecho esto, deberia de generarse una carpeta en la dirección que escogieron, en el caso del ejemplo anterior se deberia de haber creado la carpeta: `Desktop/test/POO-Proyecto`

Ya podrían cerrar la terminal por ahora


## Como Trabajar
En primera, la carpeta que se creó la pueden utilizar como deseen. Pueden agregar carpetas, archivos o lo que quieran; lo complicado es gestionarlo para que se sincronize con el repositorio online y que no elimine su propio trabajo o el de otros, por lo que incluso si estoy escribiendo esto como guia, pueden hacer cualquier consulta si tienen dudas de que hacer.
Para empezar a trabajar, cada uno trabaja en una **rama** (branch en inglés) distinta. Vean a su rama como su area de trabajo personal, donde los cambios que hagan no afectarán al resto.

**CREACION DE RAMA PERSONAL**
```
git cd .../.../POO-Proyecto     //Moverse a la carpeta del proyecto
git checkout -b <nombre> main   //Crear tu rama con el nombre que quieras
```

Usa vez creaste tu rama, puedes trabajar como desees. Lo que debes hacer periodicamente, es guardar tu trabajo en tu rama. Este proceso no subira tus archivos y cambios al repositorio, solo los guardará localmente en tu rama.

**Guardar datos en tu rama**
```
git cd .../.../POO-Proyecto   //No es necesario si ya estas ahí
git checkout <nombre>         //checkout sirve para moverse entre ramas
git add .                     //Le dices que agregue todos los documentos que fueron modificados
git commit -m "<mensaje>"     //Explicas que cambios hiciste (No es necesario escribir nada tampoco, puedes dejarlo como "")
```

Luego de que avance bastante con tu trabajo, querras subir tu avance al repositorio, para eso seguiras los siguientes pasos

**Subir tus datos al repositorio**
```
(Asegurate de haber guardado tus datos en tu rama)
git cd .../.../POO-Proyecto   //No es necesario si ya estas ahí
git checkout main             //Te mueves a tu rama base
git pull                      //Sincronizas los datos de la rama main de tu pc con la del repositorio
git merge <nombre de tu rama> //Unes los datos de tu rama con la de la rama base
git push                      //Subes los datos al repositorio online
```


## Recomendaciones
Cuando empiezes una nueva seción de trabajo, es decir, cuado vuelvas a modificar archivos despues de un tiempo, te recomiedo antes que nada sincronizar los datos de tu PC con los del repositorio.
```
git cd .../.../POO-Proyecto   //No es necesario si ya estas ahí
git checkout main             //Te mueves a tu rama base
git pull                      //Sincronizas los datos de la rama main de tu pc con la del repositorio
git checkout <nombre>         //El nombre de tu rama de trabajo
git merge main                //Actualiza tu rama personal con los datos de la rama principal
```
Hacer esto te evitará problemas de compatibilidad al querer subir tus archivos

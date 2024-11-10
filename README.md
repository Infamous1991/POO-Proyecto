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
Para empezar a trabajar, cada uno trabaja en una **rama** (branch en inglés) distinta, y su origen cambia según la función que deseen. Vean a su rama como su area de trabajo personal, donde los cambios que hagan no afectarán al resto. Lo que sigue es compartir esos cambios.

Esta parte puede ser más o menos confusa, pero lo intentaré explicar de la forma más sensilla posible. Primero lo dividiré en 3: Como trabajar con el código (servicios), la base de datos (sql) y el resto (word y ppt).


### Trabajar con la base de datos
Empezemos creando tu **rama** personal. Por seguridad se crearon 2 ramas de base (puedes verlas en repositorio) llamadas : sql y dev. Tu rama personal partirá de la rama sql, por lo que primero deberas dirigirte a la carpeta del proyecto con la terminal, usando el ejemplo anterior sería : `cd Desktop/test/POO-Proyecto`, pero tú tendrás que usar la dirección que elegiste. Una vez ahí crearás tu rama con el comando: `git checkout -b <nombre> sql` El nombre puede ser el que quieras, lo importante es que esto es solo para crearlo. El comando `checkout` te permite moverte entre ramas, así que la siguiente vez que quieras conectarte a tu rama solo escribiras: `git checkout <nombre>`.

A partir de aquí puedes trabajar libremente, puedes crear una carpeta para almacenar tus codigos sql, o notas de lo que necesites. Cuando termines una sesion de trabajo, es recomendable guardar tu trabajo en tu rama (No se publicará, eso lo indico más adelante). Para guardar tus cambios debes dirigirte (con una terminal) a la carpeta del proyecto, es decir `cd .../..../POO-Proyecto` (si no estabas ya ahí), luego moverte a tu rama `git checkout <nombre>` (si tampoco estabas ahí). Una vez ahí tienes que escribir lo siguiente:
```
git add .                 //Esto es para decirle a tu rama que cambios quieres agregar, el punto significa: todo lo que cambió
git commit -m "<mensaje>" //Esto es para explicar que cambios hiciste, no es necesario que agregues nada en el mensaje
```
Y con eso los cambios estarían guardados localmente en tu rama, ahora explicaré como subir esos cambios al repositorio online.

Primero asegurate de que tus cambios se hallan guardado en tu rama, luego necesitas moverte a tu rama base, es decir a **sql** con el comando: `git checkout sql`. Cuando hagas esto, no te alarmes si ves que tus archivos en los que trabajaste desaparecen, eso porque lo que estas viendo es como se ve la rama **sql** (y tus archivos siguen guardados en tu rama). Primero sincronizaremos la rama base con el repositorio, usando el comando: `git pull`. Luego lo que haremos será unir (merge en inglés) tu rama personal con la rama base, con el comando: `git merge <nombre de tu rama personal> -m "<mensaje>"` (El menasaje es opcional, solo no te olvides de las comillas y deja un espacio vacio). Con esto, la rama base copio tus archivos y es momento de eviarlo al repositorio, con el comando final: `git push`. 

Con eso deberia de estar hecho y deberias de ser capaz de ver tus archivos en el repositorio online (en la rama **sql** no en la rama **main**).


### Trabajar con el código
Igual que el caso anterior, usando la terminal nos dirgimos a la carpeta del proyecto `cd .../.../.../POO-Proyecto`, y ahora creamos nuestra rama de trabajo con el nombre que tú desees: `git checkout -b <nombre> dev`, **dev** es la rama base de tu rama personal y el comando `checkout` permite moverse entre ramas, cuando quieras moverte a otra rama escribe `git checkout <rama>`. 

Ahora puedes comenzar a trabajar en la carpeta, agrega los documentos y carpetas que quieras. Cuando termines una sesion de trabajo, es recomendable guardar tu trabajo en tu rama personal (No se publicará, eso lo indico más adelante). Para guardar tus cambios debes dirigirte (con una terminal) a la carpeta del proyecto, es decir `cd .../..../POO-Proyecto` (si no estabas ya ahí), luego moverte a tu rama `git checkout <nombre>` (si tampoco estabas ahí). Una vez ahí tienes que escribir lo siguiente:
```
git add .                 //Esto es para decirle a tu rama que cambios quieres agregar, el punto significa: todo lo que cambió
git commit -m "<mensaje>" //Esto es para explicar que cambios hiciste, no es necesario que agregues nada en el mensaje
```
Y con eso los cambios estarían guardados localmente en tu rama, ahora explicaré como subir esos cambios al repositorio online.

Ahora si quieres subirlo al repositorio online, deberas primero asegurarte que guardastes tu trabajo en tu rama personal. Una vez lo tengas hecho, cambia a la rama base `git checkout dev`, no te alarmes si ves que tus archivos en los que trabajaste desaparecen, eso porque lo que estas viendo es como se ve la rama **dev** (y tus archivos siguen guardados en tu rama). Sincroniza la rama base con el repositorio online con `git pull` (para asegurarte que la rama base en tu computadora tenga los mismos datos que la rama base en el repositorio). Ahora uniremos (merge en inglés) la rama base con tu rama personal: `git merge <nombre de tu rama> -m "<mensaje>"` (El menasaje es opcional, solo no te olvides de las comillas y deja un espacio vacio). Con esto, la rama base copio tus archivos y es momento de eviarlo al repositorio, con el comando final: `git push`. 

Con eso deberia de estar hecho y deberias de ser capaz de ver tus archivos en el repositorio online (en la rama **dev** no en la rama **main**).


### Trabajar con documentos
Estas indicaciones son para sincronizar con el repositorio cualquier documento que quieran subir (word, ppt, notas, etc). Las indicaciones son similares a los dos anteriores casos, por lo que lo explicaré más rápido esta vez.

**CREACION DE RAMA PERSONAL**
```
git cd .../.../POO-Proyecto     //Moverse a la carpeta del proyecto
git checkout -b <nombre> main   //Crear tu rama con el nombre que quieras
```
**Guardar datos en tu rama**
```
git cd .../.../POO-Proyecto   //No es necesario si ya estas ahí
git checkout <nombre>         //checkout sirve para moverse entre ramas
git add .                     //Le dices que agregue todos los documentos que fueron modificados
git commit -m "<mensaje>"     //Explicas que cambios hiciste (No es necesario escribir nada tampoco, puedes dejarlo como "")
```
**Subir tus datos al repositorio**
```
(Asegurate de haber guardado tus datos en tu rama)
git cd .../.../POO-Proyecto   //No es necesario si ya estas ahí
git checkout main             //Te mueves a tu rama base
git pull                      //Sincronizas los datos de la rama de tu pc con la del repositorio
git merge <nombre de tu rama> //Unes los datos de tu rama con la de la rama base
git push                      //Subes los datos al repositorio online
```

## Recomendaciones

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

Con eso deberia de estar hecho y deberias de ser capaz de ver tus archivos en el repositorio online.

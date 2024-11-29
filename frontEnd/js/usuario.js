
function toggleScreen(){
    const target= document.getElementById("agregar");
    const line = document.getElementById("line");
    target.classList.toggle("show");
    line.classList.toggle("show");
}

function agregarFila() {
    const contenedor = document.getElementById("movimientosContenedor");
    const index = contenedor.children.length;

    // Crear un nuevo div para la fila
    const fila = document.createElement("div");
    fila.setAttribute("class", "movimiento");
    fila.innerHTML = `
        <p>Pedido #${index + 1}</p>
        <input type="hidden" name="lista[${index}].id" value="1">
        <input type="hidden" name="lista[${index}].pedidoId" value="1">
        <input type="number" name="lista[${index}].productoId" value="2" required />
        <input type="number" name="lista[${index}].cantidad" value="3" required />
        <input type="number" name="lista[${index}].monto" value="4" required />
        <button type="button" onclick="eliminarFila(this)">Eliminar</button>
    `;
    contenedor.appendChild(fila);
}

function eliminarFila(boton) {
    const fila = boton.parentElement;
    fila.remove();
    actualizarNumeracion();
}

function actualizarNumeracion() {
    const filas = document.querySelectorAll(".movimiento");
    filas.forEach((fila, index) => {
        const pedidoLabel = fila.querySelector("p");
        pedidoLabel.textContent = `Pedido #${index + 1}`;

        const inputs = fila.querySelectorAll("input");
        inputs[0].setAttribute("name", `movimientos[${index}].cantidad`);
        inputs[1].setAttribute("name", `movimientos[${index}].monto`);
    });
}
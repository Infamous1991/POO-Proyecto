
$(document).ready(function () {
    $('#formularioBusqueda').on('keydown', 'input', function(event){
        if (event.which == 13){ event.preventDefault(); getOrder();}
    })
});

function toggleScreen(){
    const target= document.getElementById("agregar");
    target.classList.toggle("show");
}

function agregarFila() {
    const contenedor = document.getElementById("listaNuevosMovimientos");
    const index = contenedor.children.length;

    // Crear un nuevo div para la fila
    const fila = document.createElement("tr");
    fila.setAttribute("class", "movimiento");
    fila.innerHTML = `
        <td><input type="number" value="${index}" class="MovId"></td>
        <td><input type="number" value="${index}" class="MovProductoId"></td>
        <td><input type="number" value="${index}" class="MovCantidad"></td>
        <td><input type="number" value="${index}" class="MovMonto"></td>
        <td><button form="placeHolder" onclick="eliminarFila(this)">ELIMINAR</button></td>
        <input type="hidden" value="0" class="MovPedidoId">
    `;
    contenedor.appendChild(fila);
}

function eliminarFila(boton) {
    const fila = boton.parentElement.parentElement;
    fila.remove();
    actualizarNumeracion();
}

function actualizarNumeracion() {
    const filas = document.querySelectorAll(".movimiento");
    filas.forEach((fila, index) => {
        const inputs = fila.querySelectorAll("input");
        inputs[0].setAttribute("name", `lista[${index}].cantidad`);
        inputs[1].setAttribute("name", `lista[${index}].monto`);
    });
}


function getOrder(){
    const pedido = document.getElementsByClassName('pedidosData')[0];
    const movimientos= document.getElementById('listaMovimientos');
    pedido.innerHTML="";
    movimientos.innerHTML="";

    $.ajax({
        type: "GET",
        url: "http://localhost:8080/pedido/" + $('#inputBusqueda').val(),
        dataType: "json",
        success: function (response) {
            pedido.innerHTML =`
            <div class="id">${response.id}</div>
            <div class="estado">${response.estado}</div>
            <div class="fechaInicio">${response.fechaInicio}</div>
            `;
        }
    });

    $.ajax({
        type: "GET",
        url: "http://localhost:8080/movimiento/" + $('#inputBusqueda').val(),
        dataType: "json",
        success: function (response) {
            response.forEach((move) => {
                console.log(move);
                var dat= document.createElement('tr');
                dat.setAttribute('class', 'movimientoResult')
                dat.innerHTML= `
                <td>${move.productoId}</td>
                <td>${move.descripcion}</td>
                <td>${move.cantidad}</td>
                <td>S/.${move.monto}</td>
                `;
                movimientos.appendChild(dat);
            })
        }
    });
}

function nuevoPedido(){
    var nuevo={
        usuario : {
            id : $('#usuarioId').val(),
            nombre : $('#usuarioNombre').val(),
            email : $('#usuarioEmail').val(),
            telefono : $('#usuarioTelefono').val(),
            direccion : $('#usuarioDireccion').val()
        },
        movimientos: []
    }
    document.querySelectorAll('.movimiento').forEach( (movement) =>{
        nuevo.movimientos.push({
            id: movement.querySelector('.MovId').value,
            pedidoId: movement.querySelector(".MovPedidoId").value,
            productoId: movement.querySelector(".MovProductoId").value,
            cantidad: movement.querySelector(".MovCantidad").value,
            monto: movement.querySelector(".MovMonto").value,
        })
    })
    console.log(nuevo)
    $.ajax({
        type: "POST",
        url: "http://localhost:8080/usuario/agregar",
        contentType: 'application/json',
        data: JSON.stringify(nuevo),
        success: function (response) {
            console.log(response);
        }
    });
}


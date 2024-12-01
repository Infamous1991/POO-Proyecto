
const tableKey= "productosTabla";

$(document).ready(function () {
    //Cargar la tabla productos
    if(!sessionStorage.getItem(tableKey)){
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/producto/todo",
            dataType: "json",
            success: function (response) {
                sessionStorage.setItem(tableKey, JSON.stringify(response));
            }
        });
    }
    //Permitir al usuario hacer la solicitud presionando ENTER
    $('#formularioBusqueda').on('keydown', 'input', function(event){
        if (event.which == 13){
            event.preventDefault();
            getOrder(); 
            if($('#resultados').is(':hidden')) {
                $('#resultados').show();
            }
        }
    })
    $('#botonDeBuscar').one('click', function (event) {
        $('#resultados').show();
    })
});

function toggleScreen(){
    const screen= document.getElementById("agregar");
    const header= document.getElementById("header");
    header.classList.toggle("start");
    screen.classList.toggle("show");
}

//Para nuevos pedidos
function agregarFila() {
    const contenedor = document.getElementById("listaNuevosMovimientos");
    // Crear un nuevo div para la fila
    const fila = document.createElement("tr");
    fila.setAttribute("class", "movimiento");
    fila.innerHTML = `
        <td><input type="text" value="" class="MovProductoNombre"></td>
        <td><input type="text" inputmode="numeric" value="0" class="MovCantidad"></td>
        <td><input type="text" inputmode="numeric" value="0" class="MovMonto" readonly></td>
        <td><button form="placeHolder" onclick="eliminarFila(this)">ELIMINAR</button></td>
        <input type="hidden" inputmode="numeric" value="0" class="MovProductoId">
        <input type="hidden" value="0" class="MovPedidoId">
        <input type="hidden" value="0" class="MovId">
    `;
    contenedor.appendChild(fila);
    const tabla = JSON.parse(sessionStorage.getItem(tableKey));
    $('.MovProductoNombre').autocomplete({ //Función de Autocompletado
        source: tabla.map(producto=> producto.descripcion),
        select: function(event, ui){
            const textField= ui.item.value;
            const producto = tabla.find( p => p.descripcion === textField);
            if (producto){
                $(this).closest('tr').find('.MovProductoId').attr('value', producto.id);
            }
            $(this).blur();
        }
    }).on('change', function() { //Para el input manual del usuario
        $(this).blur();
        const input = $(this).val().toLowerCase();
        const producto = tabla.find(p => p.descripcion.toLowerCase() === input);
    
        if (producto) {
            $(this).closest('tr').find('.MovProductoId').attr('value', producto.id);
        } else {
            productoNoValido($(this));
        }
    });

    $('.MovCantidad').on('input', function (event) { //Modificar el precio automáticamente
        // Verificar si .MovProductoId existe
        const productoIdElement = $(this).closest("tr").find('.MovProductoId');
        if (!productoIdElement.length) {
            console.error('No se encontró el campo .MovProductoId en la fila');
            return;
        }
        // Obtener el valor del ID del producto
        const productoId = productoIdElement.val();
        if (!productoId) {
            console.error('El campo .MovProductoId no tiene un valor válido');
            return;
        }
        // Buscar el producto en la tabla
        const producto = tabla.find(p => p.id === parseInt(productoId, 10));
        if (!producto) {
            console.error('Producto no encontrado para el ID:', productoId);
            return;
        }
        // Calcular y actualizar el monto
        const cantidad = parseFloat($(this).val()) || 0;
        $(this).closest('tr').find('.MovMonto').val(cantidad * producto.precio);
    });
    if ($('#meEstoyQuedandoSinIdeas').is(':hidden')) { $('#meEstoyQuedandoSinIdeas').show()}
}

function eliminarFila(boton) {
    const fila = boton.parentElement.parentElement;
    fila.remove();
    actualizarNumeracion();
}

// function actualizarNumeracion() {
//     const filas = document.querySelectorAll(".movimiento");
//     filas.forEach((fila, index) => {
//         const inputs = fila.querySelectorAll("input");
//         inputs[0].setAttribute("name", `lista[${index}].cantidad`);
//         inputs[1].setAttribute("name", `lista[${index}].monto`);
//     });
// }

//Solicitar el pedido con ID
function getOrder(){
    const pedido = document.getElementsByClassName('pedidosData')[0];
    const movimientos= document.getElementById('listaMovimientos');
    const table= JSON.parse(sessionStorage.getItem(tableKey));
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
            <div class ="fechaFinal">${response.fechaFinal}</div>
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
                var producto= table.find( p => p.id === parseInt(move.productoId,10));
                var dat= document.createElement('tr');
                dat.setAttribute('class', 'movimientoResult')
                dat.innerHTML= `
                <td>${move.productoId}</td>
                <td>${producto.descripcion}</td>
                <td>${move.cantidad}</td>
                <td>S/.${move.monto}</td>
                `;
                movimientos.appendChild(dat);
            })
        }
    });
    if($('#resultados').is(':hidden')) {
        $('#resultados').show();
    }
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
        url: "http://localhost:8080/pedido/agregar",
        contentType: 'application/json',
        data: JSON.stringify(nuevo),
        success: function (response) {
            console.log(response);
        }
    });
}


//Para nuevos pedidos
function agregarFila() {
    const contenedor = document.getElementById("listaNuevosMovimientos");
    // Crear un nuevo div para la fila
    const fila = document.createElement("tr");
    fila.setAttribute("class", "movimiento");
    fila.innerHTML = `
        <td><input type="text" value="" class="MovProductoNombre"></td>
        <td><input type="text" value="" class="MovCantidad"></td>
        <td><input type="text" value="" class="MovMonto" readonly></td>
        <td><div class="mainButton" onclick="eliminarFila(this)"><img class="dltButton" src="img/delete.svg"></div></td>
        <input type="hidden" inputmode="numeric" value="0" class="MovProductoId">
    `;
    contenedor.appendChild(fila);
    const tabla = JSON.parse(sessionStorage.getItem(tableKey));
    $('.MovProductoNombre').autocomplete({ //Función de Autocompletado
        source: tabla.map(producto=> producto.descripcion),
        select: function(event, ui){
            const textField= ui.item.value;
            const producto = tabla.find( p => p.descripcion === textField);
            if (producto){
                $(this).closest('tr').find('.MovProductoId').val(producto.id);
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
            $(this).closest('tr').find('.MovProductoId').attr('value', 0);
        }
    });

    $('.MovCantidad').on('input', function (event) { //Modificar el precio automáticamente
        // Verificar si .MovProductoId existe
        const productoIdElement = $(this).closest("tr").find('.MovProductoId');
        if (!productoIdElement.length) { return; }
        // Obtener el valor del ID del producto
        const productoId = productoIdElement.val();
        if (!productoId) { return; }
        // Buscar el producto en la tabla
        const producto = tabla.find(p => p.id === parseInt(productoId, 10));
        if (!producto) { return; }
        // Calcular y actualizar el monto
        const cantidad = parseFloat($(this).val()) || 0;
        $(this).closest('tr').find('.MovMonto').val(cantidad * producto.precio);
    });
    if ($('#meEstoyQuedandoSinIdeas').is(':hidden')) { $('#meEstoyQuedandoSinIdeas').show()}
}

function eliminarFila(boton) {
    const fila = boton.parentElement.parentElement;
    fila.remove();
}

function nuevoPedido(){

    if(!dataValidate()) { 
        return;
    }

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
        if(!(movement.querySelector('.MovProductoId').value === '0')){
            nuevo.movimientos.push({
                id: "0",
                pedidoId: "0",
                productoId: movement.querySelector(".MovProductoId").value,
                cantidad: movement.querySelector(".MovCantidad").value,
                monto: movement.querySelector(".MovMonto").value,
            })
        }
    })
    console.log(nuevo)
    $.ajax({
        type: "POST",
        url: "http://localhost:8080/pedido/agregar",
        contentType: 'application/json',
        data: JSON.stringify(nuevo),
        success: function (response) {
            showExito(response);
        }
    });
}

function dataValidate(){
    const tabla = JSON.parse(sessionStorage.getItem(tableKey));
    var valTele = true;
    var valMov = true;
    var fullMessage= '';

    if(isNaN($('#usuarioTelefono').val())) { 
        valTele = false; 
        fullMessage+= 'Teléfono no válido<br>';
    }
    document.querySelectorAll('.movimiento').forEach((element, index) => {

        const prId= element.querySelector('.MovProductoId').value;
        const prCantidad= element.querySelector('.MovCantidad').value;

        if (isNaN(prId)){
            valMov = false;
            fullMessage+= `Movimiento ${index} no valido. Producto inválido<br>`;
            return;
        };
        if (element.querySelector('.MovProductoId').value === '0'){
            valMov = false;
            fullMessage+= `Movimiento ${index} no valido. Producto Invalido(0)<br>`;
            return;
        }
        if (isNaN(prCantidad)){
            valMov = false;
            fullMessage+= `Movimiento ${index} no valido. Cantidad Inválida<br>`;
            return;
        }
        if (prCantidad < 1){
            valMov = false;
            fullMessage+= `Movimiento ${index} no valido. Debe Especificar la Cantidad<br>`;
            return;
        }
        if (prCantidad > tabla.find(p => p.id == prId).stock){
            valMov = false;
            fullMessage+= `Movimiento ${index} no valido. Cantidad por Encima del Stock Actual<br>`;
            return;
        }
    });
    const answ= valTele && valMov;
    if (!answ) {showFail(fullMessage)}
    return answ;
}

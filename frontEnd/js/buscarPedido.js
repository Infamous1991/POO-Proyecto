
$(document).ready(function () {
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

//Solicitar el pedido con ID
function getOrder(){
    const movimientos= document.getElementById('listaMovimientos');
    const table= JSON.parse(sessionStorage.getItem(tableKey));
    movimientos.innerHTML="";

    $.ajax({
        type: "GET",
        url: "http://localhost:8080/pedido/" + $('#inputBusqueda').val(),
        dataType: "json",
        success: function (response) {
            console.log(response);
            $('#nombCliente').html(response.usuario.nombre);
            $('#estadoPedido').html(response.pedido.estado);
            $('#fi').html(response.pedido.fechaInicio);
            if (!response.pedido.fechaFinal) {$('#ff').html("Pedido en Proceso");}
            else {$('#ff').html(response.pedido.fechaFinal);}
        }
    });

    $.ajax({
        type: "GET",
        url: "http://localhost:8080/movimiento/" + $('#inputBusqueda').val(),
        dataType: "json",
        success: function (response) {
            response.forEach((move) => {
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
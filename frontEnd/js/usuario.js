
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
});

function toggleScreen(){
    const screen= document.getElementById("agregar");
    const header= document.getElementById("header");
    header.classList.toggle("start");
    screen.classList.toggle("show");
}

function showExito(mensajeCodigo){
    $('#popUp').show();
    $('#popUp>.exito').toggleClass('show');
    $('#popUp>.exito>.message').html(mensajeCodigo);
}

function showFail(mensajeError){
    $('#popUp').show();
    $('#popUp>.error').addClass('show');
    $('#popUp>.error>.message').html(mensajeError);
}

function hidePopUp(){
    $('#popUp').hide();
    $('#popUp>.error').removeClass('show');
    $('#popUp>.error>.message').html('');
    $('#popUp>.exito').removeClass('show');
    $('#popUp>.exito>.message').html('');
}

function setInit(stat){
    const ds = document.getElementById("main");

    if (stat === true){
        ds.classList.add("Init")
    } else{
        ds.classList.remove("Init")
    }
}

function toggleLogin(){
    const target= document.getElementById("empleado");
    target.classList.toggle("showLogin")
}

function login(){
    test= {
        userName: $('#usnm').val(), 
        password: $('#pssw').val()
    }
    console.log(test);
    $.ajax({
        type: "POST",
        url: "http://localhost:8080/login",
        contentType: 'application/json',
        data: JSON.stringify(test),
        success: function (response) {
            window.location.replace("empleado.html");
            console.log("si")
        },
        error: function (response){
            console.error("fail");
        }
        
    });
}
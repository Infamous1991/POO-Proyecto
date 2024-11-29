
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
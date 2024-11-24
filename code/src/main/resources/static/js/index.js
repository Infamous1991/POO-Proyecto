
function setInit(stat){
    const ds = document.getElementById("main");

    if (stat === true){
        ds.classList.remove("Init")
    } else{
        ds.classList.add("Init")
    }
}
package com.app.dto;

// public class Usuario {

//     private int id;
//     private String nombre;
//     private String email;
//     private String telefono;
//     private String direccion;
    
//     public Usuario(int id, String nombre, String email, String telefono, String direccion){
//         this.id = id; 
//         this.nombre = nombre; 
//         this.email = email; 
//         this.telefono = telefono; 
//         this.direccion = direccion;  
//     }
//     public Usuario(){
//         this.id=12;
//     }

//     public void setId(int nw) { this.id = nw;}
//     public void setNombre(String nw) { this.nombre = nw;}
//     public void setEmail(String nw) { this.email = nw;}
//     public void setTelefono(String nw) { this.telefono = nw;}
//     public void setDireccion(String nw) { this.direccion = nw;}

//     public int getId() { return this.id;}
//     public String getNombre() { return this.nombre;}
//     public String getEmail() { return this.email;}
//     public String getTelefono() { return this.telefono;}
//     public String getDireccion() { return this.direccion;}

//     public boolean equals(Usuario user){
//         if (user.id == this.id &&
//             user.nombre == this.nombre &&
//             user.email == this.email &&
//             user.telefono == this.telefono &&
//             user.direccion == this.direccion
//         ){
//             return true;
//         }
//         return false;
//     }
    
//     @Override
//     public String toString() {
//         return """
//                 id: %d
//                 nombre: %s
//                 email: %s
//                 telefono: %s
//                 direccions: %s """.formatted(this.id, this.nombre, this.email, this.telefono, this.direccion);
//     }
// }

public record Usuario(int id, String nombre, String email, String telefono, String direccion) {

    public Usuario(){
        this(0, null, null, null, null);
    }

    public boolean equals(Usuario user){
        if (user.id == this.id &&
            user.nombre == this.nombre &&
            user.email == this.email &&
            user.telefono == this.telefono &&
            user.direccion == this.direccion
        ){
            return true;
        }
        return false;
    }
    @Override
    public String toString() {
        return """
            id: %d
            nombre: %s
            email: %s
            telefono: %s
            direccions: %s \
        """.formatted(this.id, this.nombre, this.email, this.telefono, this.direccion);
    }
}

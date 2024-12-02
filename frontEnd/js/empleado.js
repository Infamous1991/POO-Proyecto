
function loadTable(tabla) {
    $.ajax({
        type: "GET",
        url: "http://localhost:8080/" + tabla + "/todo",
        dataType: "json",
        success: function (response) {

            const container = document.getElementById("table-container");

            if (!response || response.length === 0) {
                container.innerHTML = "<p>No hay datos disponibles para esta tabla.</p>";
                return;
            }

            let tableHTML = "<table><thead><tr>";
            Object.keys(response[0]).forEach(header => {
                tableHTML += `<th>${header}</th>`;
            });
            tableHTML += "</tr></thead><tbody>";

            response.forEach(fila => {
                tableHTML += "<tr>";
                Object.values(fila).forEach(dato => {
                    tableHTML += `<td>${dato}</td>`;
                });
                tableHTML += "</tr>";
            });
            tableHTML += "</tbody></table>";

            container.innerHTML = tableHTML;
            filtrarOrdenar();
        },
        error: function () {
            const container = document.getElementById("table-container");
            container.innerHTML = "<p>Error al cargar los datos. Inténtelo más tarde.</p>";
        }
    });
}
function filtrarOrdenar() {
    const tableContainer = document.getElementById("table-container");
    const table = tableContainer.querySelector("table");

    // Validar si existe una tabla
    if (!table) return;

    const headers = table.querySelectorAll("thead th");

    headers.forEach((header, columnIndex) => {
        header.style.cursor = "pointer";

        header.addEventListener("click", () => {
            // Si ya existe un input o flechas, no duplicar elementos
            if (header.querySelector(".filter-controls")) return;

            // Crear contenedor para controles
            const controlsDiv = document.createElement("div");
            controlsDiv.className = "filter-controls";
            controlsDiv.style.display = "flex";
            controlsDiv.style.alignItems = "center";
            controlsDiv.style.marginTop = "5px";

            // Crear campo de entrada para el filtro
            const input = document.createElement("input");
            input.type = "text";
            input.placeholder = `Filtrar ${header.textContent}`;
            input.style.width = "70%";
            input.style.marginRight = "5px";

            // Crear botones para ordenar
            const ascButton = document.createElement("button");
            ascButton.innerHTML = "&#9650;"; // Flecha hacia arriba
            ascButton.style.border = "none";
            ascButton.style.background = "transparent";
            ascButton.style.cursor = "pointer";

            const descButton = document.createElement("button");
            descButton.innerHTML = "&#9660;"; // Flecha hacia abajo
            descButton.style.border = "none";
            descButton.style.background = "transparent";
            descButton.style.cursor = "pointer";

            // Insertar controles en el header
            controlsDiv.appendChild(input);
            controlsDiv.appendChild(ascButton);
            controlsDiv.appendChild(descButton);
            header.appendChild(controlsDiv);

            // Evento para filtrar dinámicamente
            input.addEventListener("input", () => {
                const filterValue = input.value.toLowerCase();
                const rows = table.querySelectorAll("tbody tr");

                rows.forEach(row => {
                    const cell = row.cells[columnIndex];
                    if (cell && cell.textContent.toLowerCase().includes(filterValue)) {
                        row.style.display = ""; // Mostrar fila
                    } else {
                        row.style.display = "none"; // Ocultar fila
                    }
                });
            });

            // Evento para ordenar de forma ascendente
            ascButton.addEventListener("click", () => {
                ordenarTabla(table, columnIndex, true);
            });

            // Evento para ordenar de forma descendente
            descButton.addEventListener("click", () => {
                ordenarTabla(table, columnIndex, false);
            });

            // Evento para ocultar controles al hacer clic fuera
            document.addEventListener("click", (event) => {
                if (!header.contains(event.target)) {
                    header.removeChild(controlsDiv);
                }
            }, { once: true });
        });
    });
}

// Función para ordenar la tabla
function ordenarTabla(table, columnIndex, ascending) {
    const rows = Array.from(table.querySelectorAll("tbody tr"));

    rows.sort((a, b) => {
        const cellA = a.cells[columnIndex].textContent.trim().toLowerCase();
        const cellB = b.cells[columnIndex].textContent.trim().toLowerCase();

        if (!isNaN(cellA) && !isNaN(cellB)) {
            // Comparación numérica
            return ascending ? cellA - cellB : cellB - cellA;
        }

        // Comparación alfabética
        return ascending ? cellA.localeCompare(cellB) : cellB.localeCompare(cellA);
    });

    // Reordenar las filas en la tabla
    const tbody = table.querySelector("tbody");
    rows.forEach(row => tbody.appendChild(row));
}

var headerCount = 1; // Contador para asignar identificadores únicos

function addHeader() {
    var headerContainer = document.getElementById("headerContainer");

    // Crear los elementos de encabezado
    var headerDiv = document.createElement("div");
    var headerId = "header" + headerCount;
    headerDiv.id = headerId;
    headerDiv.classList.add("d-flex", "flex-row", "align-items-center", "mb-2");

    var input = document.createElement("input");
    input.type = "text";
    input.classList.add("form-control", "me-2");
    headerDiv.appendChild(input);

    var saveButton = document.createElement("button");
    saveButton.type = "button";
    saveButton.classList.add("btn", "btn-primary", "me-2");
    saveButton.textContent = "Guardar";
    saveButton.onclick = function () {
        if (input.value.trim() === "") {
            alert("No se pueden guardar campos vacíos.");
        } else {
            input.disabled = true; // Desactivar el input al hacer clic en Guardar
            saveButton.disabled = true; // Desactivar el botón Guardar
            deleteButton.disabled = true; // Desactivar el botón Eliminar
        }
    };
    headerDiv.appendChild(saveButton);

    var deleteButton = document.createElement("button");
    deleteButton.type = "button";
    deleteButton.classList.add("btn", "btn-danger");
    deleteButton.textContent = "Eliminar";
    deleteButton.onclick = deleteHeader; // Llamar directamente a la función deleteHeader
    headerDiv.appendChild(deleteButton);

    // Agregar los elementos al contenedor
    headerContainer.appendChild(headerDiv);

    // Incrementar el contador
    headerCount++;
}

function deleteHeader() {
    // Obtener el encabezado a eliminar
    var headerToRemove = this.parentNode;

    // Eliminar el encabezado del DOM
    headerToRemove.remove();
}

function sendFormDataToServlet() {
    var nombreInventario = document.getElementById("inventoryName").value;
    var autoIdentifiers = document.getElementById("autoIdentifiers").checked;
    var visibility = document.getElementById("visibility").checked;

    var headers = [];
    var headerInputs = document.querySelectorAll("#headerContainer input[type='text']");
    headerInputs.forEach(function (input) {
        headers.push(input.value);
    });

    var data = {
        nombreInventario: nombreInventario,
        autoIdentifiers: autoIdentifiers,
        visibility: visibility,
        headers: headers
    };

    // Enviar los datos al servlet
    fetch('http://localhost:8080/sistema_de_gestion/datosInventario', { // Reemplaza 'ruta_del_servlet' con la URL de tu servlet
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    }).then(response => {
        if (response.ok) {
            return response.json();
        }
        throw new Error('Error en la solicitud. servlet no encontrado');
    }).then(data => {
        // Manejar la respuesta del servlet si es necesario
        console.log(data);
    }).catch(error => {
        console.error('Error:', error.toString());
    });
}


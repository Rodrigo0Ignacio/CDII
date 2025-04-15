var headerCount = 1; // Contador para asignar identificadores únicos

function createHeaderElements() {
    // Crear los elementos de encabezado
    var headerDiv = document.createElement("div");
    var headerId = "header" + headerCount;
    headerDiv.id = headerId;
    headerDiv.classList.add("d-flex", "flex-row", "align-items-center", "mb-2");

    // Crear el label para el select
    var selectLabel = document.createElement("label");
    selectLabel.textContent = "Tipo de campo:";
    selectLabel.setAttribute("for", "transporte");
    selectLabel.classList.add("col-1");
    headerDiv.appendChild(selectLabel);

    // Crear el select
    var select = document.createElement("select");
    select.name = "tipo_variable";
    select.classList.add("form-select", "me-2");

    // Crear opciones
    var options = ["Cadena", "Decimal", "Entero", "Fecha"];
    options.forEach(function (optionText) {
        var option = document.createElement("option");
        option.text = optionText;
        select.appendChild(option);
    });

    headerDiv.appendChild(select);

    // Crear el label para el input
    var inputLabel = document.createElement("label");
    inputLabel.textContent = "Nombre de columna: ";
    inputLabel.setAttribute("for", "descripcion");
    inputLabel.classList.add("col-1");
    headerDiv.appendChild(inputLabel);

    // Crear el input
    var input = document.createElement("input");
    input.type = "text";
    input.name = "descripcion";
    input.classList.add("form-control", "me-2");
    headerDiv.appendChild(input);

    // Imprimir los valores de los select e input creados
    console.log("Encabezado creado: ", {
        selectOptions: options,
        inputName: input.name
    });

    return headerDiv;
}

function addHeader() {
    var headerContainer = document.getElementById("headerContainer");

    // Crear los elementos de encabezado
    var headerDiv = createHeaderElements();

    var saveButton = document.createElement("button");
    saveButton.type = "button";
    saveButton.classList.add("btn", "btn-primary", "me-2");
    saveButton.textContent = "Guardar";
    saveButton.onclick = function () {
        var select = headerDiv.querySelector('select');
        var input = headerDiv.querySelector('input');

        // Imprimir los valores del select y input cuando se guarda
        console.log("Guardando encabezado con valores: ", {
            tipoCampo: select.value,
            descripcion: input.value
        });

        if (select.value.trim() === "" || input.value.trim() === "") {
            alert("Selecciona un tipo de campo y proporciona un nombre de columna.");
        } else {
            select.disabled = true;
            input.disabled = true;
            saveButton.disabled = true;
            deleteButton.disabled = true;
        }
    };
    headerDiv.appendChild(saveButton);

    var deleteButton = document.createElement("button");
    deleteButton.type = "button";
    deleteButton.classList.add("btn", "btn-danger");
    deleteButton.textContent = "Eliminar";
    deleteButton.onclick = deleteHeader;
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

    // Imprimir los datos del formulario antes de enviarlos
    console.log("Datos del formulario: ", {
        nombreInventario: nombreInventario,
        autoIdentifiers: autoIdentifiers,
        visibility: visibility
    });

    if (nombreInventario.trim() === "" || nombreInventario.includes(' ')) {
        alert("El nombre del inventario no debe estar vacío ni contener espacios.");
        return;
    }

    var headers = [];
    var headerInputs = document.querySelectorAll("#headerContainer input[type='text']");
    var hasSpaces = false;
    var isEmpty = false;

    headerInputs.forEach(function (input) {
        if (input.value.trim() === "") {
            isEmpty = true;
        }
        if (input.value.includes(' ')) {
            hasSpaces = true;
        }
        headers.push(input.value);
    });

    if (isEmpty) {
        alert("Los encabezados no deben estar vacíos.");
        return;
    }

    if (hasSpaces) {
        alert("Los encabezados no deben contener espacios.");
        return;
    }

    if (hasDuplicates(headers)) {
        alert("No se permiten valores duplicados en los encabezados.");
        return;
    }

    var selectValues = [];
    var selectInputs = document.querySelectorAll("#headerContainer select");
    selectInputs.forEach(function (select) {
        selectValues.push(select.value);
    });

    // Imprimir los valores de los select
    console.log("Valores de los select: ", selectValues);

    var data = {
        nombreInventario: nombreInventario,
        autoIdentifiers: autoIdentifiers,
        visibility: visibility,
        headers: headers,
        selectValues: selectValues
    };

    fetch('http://localhost:8080/sistema_de_gestion/Creacion_Inventario', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    }).then(response => {
        if (response.redirected) {
            window.location.href = response.url;
            return;
        }
        return response.json().catch(() => {
            throw new Error("La respuesta no es un JSON válido.");
        });
    }).then(data => {
        if (data) {
            console.log("Respuesta del servidor: ", data);
            if (data.status && data.status === "exists") {
                alert("La tabla ya existe.");
            } else {
                alert("La tabla se creó correctamente.");
            }
        }
    }).catch(error => {
        console.error('Error:', error.toString());
        alert('Ocurrió un error al procesar la solicitud. Consulte la consola para más detalles.');
    });
}

function hasDuplicates(array) {
    return new Set(array).size !== array.length;
}

//Exportar los libros

/*$(document).ready(function() {
    // Hacer la solicitud AJAX al servidor PHP
    $.ajax({
        url: 'consulta_libros.php',
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            // Llenar la tabla con los datos recibidos
            var tableBody = $('#table_body');
            response.forEach(function(libro) {
                tableBody.append('<tr><td>' + libro.Titulo + '</td><td>' + libro.Autor + '</td><td>' + libro.Genero + '</td><td>' + libro.Paginas + '</td></tr>');
            });
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    });
});

//Exportar los autores

$(document).ready(function() {
    $.ajax({
        url: 'consulta_autores.php',
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            // Llenar la tabla con los datos recibidos
            var tableBody = $('#table_author tbody');
            response.forEach(function(autor) {
                tableBody.append('<tr><td>' + autor.Nombre + '</td><td>' + autor.Apellido + '</td><td>' + autor.Nacionalidad + '</td><td>' + autor.Cantidad_Libros + '</td></tr>');
            });
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    });
});

//Obtener los comentarios y guardar los comentarios

$(document).ready(function() {
    // Evento de clic para el botón de enviar
    $('#submit_btn').click(function(e) {
        e.preventDefault(); // Evitar que el formulario se envíe de manera predeterminada
        
        // Obtener los valores del formulario
        var name = $('#name').val();
        var email = $('#email').val();
        var text = $('#text').val();
        var message = $('#message').val();
        
        // Enviar los valores al servidor PHP para guardar el comentario
        $.ajax({
            url: 'insertar_comentario.php',
            type: 'POST',
            data: {
                name: name,
                email: email,
                text: text,
                message: message
            },
            success: function(response) {
                // Después de guardar el comentario, obtener los comentarios actualizados y mostrarlos en la tabla
                obtenerComentarios();
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    });

    // Función para obtener los comentarios y mostrarlos en la tabla
    function obtenerComentarios() {
        $.ajax({
            url: 'obtener_comentarios.php',
            type: 'GET',
            dataType: 'json',
            success: function(response) {
                // Limpiar la tabla antes de llenarla con los nuevos comentarios
                $('#table_comments tbody').empty();

                // Llenar la tabla con los comentarios recibidos
                response.forEach(function(comentario) {
                    $('#table_comments tbody').append('<tr><td>' + comentario.Nombre + '</td><td>' + comentario.Comentario + '</td></tr>');
                });
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    }

    // Llamar a la función para obtener los comentarios cuando se cargue la página por primera vez
    obtenerComentarios();
});


//Filtrar libro en la busqueda

$(document).ready(function() {
    // Función para filtrar libros mientras se escribe en el campo de búsqueda
    $('#search_input').on('input', function() {
        var searchText = $(this).val().toLowerCase(); // Obtener el texto ingresado y convertirlo a minúsculas
        
        $('.book').each(function() {
            var bookTitle = $(this).find('h2').text().toLowerCase(); // Obtener el título del libro y convertirlo a minúsculas
            
            // Mostrar o ocultar el libro según si el título contiene el texto de búsqueda
            if (bookTitle.includes(searchText)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    });
});


//filtrar autor en la busqueda
$(document).ready(function() {
    // Función para filtrar libros por autor mientras se escribe en el campo de búsqueda
    $('#author_search_input').on('input', function() {
        var searchAuthor = $(this).val().toLowerCase(); // Obtener el nombre del autor ingresado y convertirlo a minúsculas
        
        $('.book').each(function() {
            var bookAuthor = $(this).find('.author').text().toLowerCase(); // Obtener el nombre del autor del libro y convertirlo a minúsculas
            
            // Mostrar u ocultar el libro según si el autor coincide con el texto de búsqueda
            if (bookAuthor.includes(searchAuthor)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    });
});
*/
//Mostrar la lista de libros en el carrito
function addToCart(book) {
    var cartItems = localStorage.getItem('cartItems');
    if (!cartItems) {
        cartItems = [];
    } else {
        cartItems = JSON.parse(cartItems);
    }
    cartItems.push(book);
    localStorage.setItem('cartItems', JSON.stringify(cartItems));
    alert("¡Agregado al carrito!");
}

// Función para mostrar la alerta personalizada
function showAlert(message) {
    var alertBox = document.createElement('div');
    alertBox.classList.add('custom-alert');
    alertBox.innerHTML = '<p>' + message + '</p>';
    document.body.appendChild(alertBox);
    setTimeout(function () {
        document.body.removeChild(alertBox);
    }, 3000); // La alerta desaparecerá después de 3 segundos (3000 milisegundos)
}
let tecladosStorage = JSON.parse(localStorage.getItem('teclados'));
let teclados = [];


const cargarAppTeclados = () =>
{
    if (tecladosStorage === null) 
    {
        teclados = 
        [
            new Teclado('USB', 'E-Touch'),
            new Teclado('Bluetooth', 'Razer'),
        ]

        localStorage.setItem('teclados', JSON.stringify(teclados));
    } 
    else 
    {
        let data = JSON.parse(localStorage.getItem('teclados'));
        for(let teclado of data)
        {
            teclados.push(new Teclado(teclado._tipoEntrada, teclado._marca))
        }
    }

    cargarTeclados();
}


const cargarTeclados = () =>
{
    let tablaTeclados = '';
    
    for(let teclado of teclados)
    {
        tablaTeclados += cargarTablaTeclados(teclado);
    }

    document.getElementById('table-keyboards').innerHTML = tablaTeclados;

    localStorage.setItem('teclados', JSON.stringify(teclados));
}


const cargarTablaTeclados = (teclado) =>
{
    let datosTabla = `
        <tr>
            <th scope="row">${teclado.id}</th>
            <td>${teclado.tipoEntrada}</td>
            <td>${teclado.marca}</td>
            <td>
                <button onclick="eliminarTeclado(${teclado.id})" class="btn btn-danger">
                    <i class="fas fa-trash"></i>
                </button>
                <button type="button" data-bs-toggle="offcanvas" data-bs-target="#editKeyboard" aria-controls="editMonitor" onclick="buscarTeclado(${teclado.id})" class="btn btn-warning">
                    <i class="fas fa-pencil"></i>
                </button>
            </td>
        </tr>
    `;

    return datosTabla;
}


const agregarDatoTeclado = () =>
{
    event.preventDefault();
    let form = document.forms['form-add'];
    let tipoEntrada = form['tipo_entrada'];
    let marca = form['marca'];

    if(tipoEntrada.value !== '' & marca.value !== '')
    {
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: 'Teclado Agregado Exitosamente',
            showConfirmButton: false,
            timer: 1000
        });
        
        teclados.push(new Teclado(tipoEntrada.value, marca.value));
        cargarTeclados();

        tipoEntrada.value = '';
        marca.value = '';
    }
    else
    {
        Swal.fire({
            position: 'center',
            icon: 'error',
            title: 'Debe Ingresar Datos',
            showConfirmButton: false,
            timer: 1000
            });
    }
}


const buscarTeclado = (id) =>
{
    let tecladoEncontrado = teclados.find(teclado => teclado.id === id);

    document.getElementById('edit_id').value = tecladoEncontrado.id;
    document.getElementById('edit_id').setAttribute("disabled", true);
    document.getElementById('edit_tipo_entrada').value = tecladoEncontrado.tipoEntrada;
    document.getElementById('edit_marca').value = tecladoEncontrado.marca;

    document.getElementById('div_update').innerHTML = `
        <button id="send_form" onclick="sendUpdateTeclado(${id})" type="button" class="btn btn-success me-2">
            <i class="fa-solid fa-rotate"></i> 
            Actualizar
        </button>
        <button type="button" class="btn btn-danger ms-2" data-bs-dismiss="offcanvas">
            <i class="fa-solid fa-xmark"></i>
            Cancelar
        </button>
    `
}


const eliminarTeclado = (id) =>
{
    let elementoEliminar = teclados.findIndex(teclado => teclado.id === id);
    teclados.splice(elementoEliminar, 1);
    Swal.fire({
        position: 'center',
        icon: 'success',
        title: 'Teclado Eliminado Exitosamente',
        showConfirmButton: false,
        timer: 1000
    });
    cargarTeclados();
}


const sendUpdateTeclado = (id) =>
{
    let elementoEditar = teclados.find(teclado => teclado.id === id);

    let form = document.forms['form-edit'];
    let tipoEntrada = form['edit_tipo_entrada'];
    let marca = form['edit_marca'];

    if(tipoEntrada.value !== '' && marca.value !== '')
    {
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: 'Teclado Editado Exitosamente',
            showConfirmButton: false,
            timer: 1000
        });

        elementoEditar.tipoEntrada = tipoEntrada.value;
        elementoEditar.marca = marca.value;

        buscarTeclado(id);
        cargarTeclados();
    }
    else
    {
        Swal.fire({
            position: 'center',
            icon: 'error',
            title: 'Debe Ingresar Datos',
            showConfirmButton: false,
            timer: 1000
        });
    }
} 
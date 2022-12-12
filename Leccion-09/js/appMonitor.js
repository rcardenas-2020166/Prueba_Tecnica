let monitoresStorage = JSON.parse(localStorage.getItem('monitores'));
let monitores = [];
const cargarAppMonitores = () =>
{
    if(monitoresStorage === null)
    {
        monitores = 
        [
            new Monitor('DELL', 45),
            new Monitor('Samsung', 60)
        ]
        localStorage.setItem('monitores', JSON.stringify(monitores));
    }
    else
    {
        let data = JSON.parse(localStorage.getItem('monitores'));
        for(let monitor of data)
        {
            monitores.push(new Monitor(monitor._marca, monitor._tamano))
        }
    }

    cargarMonitores();
}

const cargarTablaMonitores = (monitor) => 
{
    let datosTabla = `
        <tr>
            <th scope="row">${monitor.id}</th>
            <td>${monitor.marca}</td>
            <td>${monitor.tamano}</td>
            <td>
                <button onclick="eliminarMonitor(${monitor.id})" class="btn btn-danger">
                    <i class="fas fa-trash"></i>
                </button>
                <button type="button" data-bs-toggle="offcanvas" data-bs-target="#editMonitor" aria-controls="editMonitor" onclick="buscarMonitor(${monitor.id})" class="btn btn-warning">
                    <i class="fas fa-pencil"></i>
                </button>
            </td>
        </tr>
    `;

    return datosTabla;
}

const cargarMonitores = () =>
{
    let tablaMonitores = ''

    for(let monitor of monitores)
    {
        tablaMonitores += cargarTablaMonitores(monitor);
    }

    document.getElementById('table-monitores').innerHTML = tablaMonitores;
    localStorage.setItem('monitores', JSON.stringify(monitores));
}


const agregarDatoMonitores = () =>
{
    event.preventDefault();

    let formulario = document.forms['form-add'];
    let marcaMonitor = formulario['marca'];
    let tamanoMonitor = formulario['tamano'];

    if(marcaMonitor.value !== '' && tamanoMonitor.value !== '')
    {
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: 'Monitor Agregado Exitosamente',
            showConfirmButton: false,
            timer: 1000
            });
        monitores.push(new Monitor(marcaMonitor.value, tamanoMonitor.value));
        cargarMonitores();

        marcaMonitor.value = '';
        tamanoMonitor.value = '';
        //document.getElementById('btn_agregar').setAttribute("data-bs-dismiss", "modal");
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


const eliminarMonitor = (id) =>
{
    let indiceEliminar = monitores.findIndex(monitor => monitor.id === id);
    Swal.fire({
        position: 'center',
        icon: 'success',
        title: 'Monitor Eliminado Exitosamente',
        showConfirmButton: false,
        timer: 1000
        });
    monitores.splice(indiceEliminar, 1);
    cargarMonitores();
}

const buscarMonitor = (id) =>
{
    let elementoEditar = monitores.find(monitor => monitor.id === id);
    
    document.getElementById('edit_id').value = elementoEditar.id;
    document.getElementById('edit_id').setAttribute("disabled", true);
    document.getElementById('edit_marca').value = elementoEditar.marca;
    document.getElementById('edit_tamano').value = elementoEditar.tamano;

    document.getElementById('div_update').innerHTML = `
        <button id="send_form" onclick="sendUpdateMonitor(${id})" type="button" class="btn btn-success me-2">
            <i class="fa-solid fa-rotate"></i> 
            Actualizar
        </button>
        <button type="button" class="btn btn-danger ms-2" data-bs-dismiss="offcanvas">
            <i class="fa-solid fa-xmark"></i>
            Cancelar
        </button>
    `
}

const sendUpdateMonitor = (id) =>
{
    let formulario = document.forms['form-edit'];
    let marcaMonitor = formulario['edit_marca'];
    let tamanoMonitor = formulario['edit_tamano'];
    let elementoEditar = monitores.find(monitor => monitor.id === id);

    if(marcaMonitor.value !== '' && tamanoMonitor.value !== '')
    {
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: 'Monitor Editado Exitosamente',
            showConfirmButton: false,
            timer: 1000
            });
        elementoEditar.marca = marcaMonitor.value;
        elementoEditar.tamano = tamanoMonitor.value;
        buscarMonitor(id);
        cargarMonitores();
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
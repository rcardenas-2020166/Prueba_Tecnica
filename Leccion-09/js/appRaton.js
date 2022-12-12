let ratonesStorage = JSON.parse(localStorage.getItem('ratones'));
let ratones = [];

const cargarAppRatones = () =>
{
    if(ratonesStorage === null)
    {
        ratones = 
        [
            new Raton('USB', 'HP'),
            new Raton('Bluetooth', 'DELL')
        ]
        localStorage.setItem('ratones', JSON.stringify(ratones));
    }
    else
    {
        let data = JSON.parse(localStorage.getItem('ratones'));
        for(let raton of data)
        {
            ratones.push(new Raton(raton._tipoEntrada, raton._marca))
        }
    }

    cargarRatones();
}

const cargarRatones = () =>
{
    let tablaRatones = '';
    
    for(let raton of ratones)
    {
        tablaRatones += cargarTablaRatones(raton);
    }

    document.getElementById('table-mouses').innerHTML = tablaRatones;
    localStorage.setItem('ratones', JSON.stringify(ratones));

}

const cargarTablaRatones = (raton) =>
{
    let datosTabla = `
        <tr>
            <th scope="row">${raton.id}</th>
            <td>${raton.tipoEntrada}</td>
            <td>${raton.marca}</td>
            <td>
                <button onclick="eliminarRaton(${raton.id})" class="btn btn-danger">
                    <i class="fas fa-trash"></i>
                </button>
                <button type="button" data-bs-toggle="offcanvas" data-bs-target="#editMouse" aria-controls="editMonitor" onclick="buscarRaton(${raton.id})" class="btn btn-warning">
                    <i class="fas fa-pencil"></i>
                </button>
            </td>
        </tr>
    `;

    return datosTabla;
}

const agregarDatoRatones = () =>
{
    event.preventDefault();

    let form = document.forms['form-add'];
    let tipoEntrada = form['tipo_entrada'];
    let marca = form['marca'];

    if(tipoEntrada.value !== '' && marca.value!== '')
    {
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: 'Mouse Agregado Exitosamente',
            showConfirmButton: false,
            timer: 1000
        });

        ratones.push(new Raton(tipoEntrada.value, marca.value));
        cargarRatones();

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

const eliminarRaton = (id) => 
{
    let elementoEliminar = ratones.findIndex(raton => raton.id === id);

    Swal.fire({
        position: 'center',
        icon: 'success',
        title: 'Mouse Eliminado Exitosamente',
        showConfirmButton: false,
        timer: 1000
    });

    ratones.splice(elementoEliminar, 1);
    cargarRatones();
}

const buscarRaton = (id) => 
{
    let buscarRaton = ratones.find(raton => raton.id === id);
    document.getElementById('edit_id').value = buscarRaton.id;
    document.getElementById('edit_id').setAttribute("disabled", true);
    document.getElementById('edit_tipo_entrada').value = buscarRaton.tipoEntrada;
    document.getElementById('edit_marca').value = buscarRaton.marca;


    document.getElementById('div_update').innerHTML = `
        <button id="send_form" onclick="sendUpdateRaton(${id})" type="button" class="btn btn-success me-2">
            <i class="fa-solid fa-rotate"></i> 
            Actualizar
        </button>
        <button type="button" class="btn btn-danger ms-2" data-bs-dismiss="offcanvas">
            <i class="fa-solid fa-xmark"></i>
            Cancelar
        </button>
    `
}

const sendUpdateRaton = (id) =>
{
    let form = document.forms['form-edit'];
    let tipoEntrada = form['edit_tipo_entrada'];
    let marca = form['edit_marca'];

    let elementoEditar = ratones.find(raton => raton.id === id);

    if(tipoEntrada.value !== '' && marca.value!== '')
    {
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: 'Mouse Editado Exitosamente',
            showConfirmButton: false,
            timer: 1000
        });

        elementoEditar.tipoEntrada = tipoEntrada.value;
        elementoEditar.marca = marca.value
        buscarRaton(id);
        cargarRatones();
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
const ingresos = 
[
    new Ingreso('Salario', 2100.00),
    new Ingreso('Venta Coche', 1500.00),
    new Ingreso('Horas Extras', 2850.00),
];

const egresos =
[
    new Egreso('Alquiler', 900.00),
    new Egreso('Ropa', 400),
]

let cargarApp = () =>
{
    cargarCabecero();
    cargarIngresos();
    cargarEgresos();
}

let cargarCabecero = () =>
{
    let presupuesto = totalIngresos() - totalEgresos();
    let porcentajeEgreso = totalEgresos()/totalIngresos();

    document.getElementById('presupuesto').innerHTML = formatoMoneda(presupuesto);
    document.getElementById('porcentaje').innerHTML = formatoPorcentaje(porcentajeEgreso);
    document.getElementById('ingresos').innerHTML = formatoMoneda(totalIngresos());
    document.getElementById('egresos').innerHTML = formatoMoneda(totalEgresos());
}

let totalIngresos = () =>
{
    let totalIngreso = 0;

    for(let ingreso of ingresos)
    {
        totalIngreso += ingreso.valor;
    }

    return totalIngreso;
}

let totalEgresos = () =>
{
    let totalEgreso = 0;

    for(let egreso of egresos)
    {
        totalEgreso += egreso.valor;
    }

    return totalEgreso;
}

let formatoMoneda = (valor) =>
{
    return valor.toLocaleString('es-GT',
    {
        style: 'currency', 
        currency:'GTQ',
        minimumFractionDigits: 2,
    });
}

let formatoPorcentaje = (valor) =>
{
    return valor.toLocaleString('es-GT',
    {
        style: 'percent', 
        minimumFractionDigits: 2,
    });
}

const cargarIngresos = () => 
{
    let ingresosHTML = '';
    for(let ingreso of ingresos)
    {
        ingresosHTML += crearIngresoHTML(ingreso);
    }
    document.getElementById('lista-ingresos').innerHTML = ingresosHTML;
}

const cargarEgresos = () => 
{
    let egresoHTML = '';
    for(let egreso of egresos)
    {
        egresoHTML += crearEgresosHTML(egreso);
    }
    document.getElementById('lista-egresos').innerHTML = egresoHTML;
}

const crearIngresoHTML = (ingreso) =>
{
    let ingresoHTML = `
        <div class="elemento limpiarEstilos">
            <div class="elemento_descripcion">${ingreso.descripcion}</div>
            <div class="derecha limpiarEstilos">
                <div class="elemento_valor">+ ${formatoMoneda(ingreso.valor)}</div>
                <div class="elemento_eliminar">
                    <button class="elemento_eliminar--btn">
                        <ion-icon name="close-circle-outline"
                            onclick='eliminarIngreso(${ingreso.id})'
                        ></ion-icon>
                    </button>
                </div>
            </div>
        </div>
    `;
    return ingresoHTML;
}

const crearEgresosHTML = (egreso) => 
{

    let egresoHTML = `
        <div class="elemento limpiarEstilos">
            <div class="elemento_descripcion">${egreso.descripcion}</div>
            <div class="derecha limpiarEstilos">
                <div class="elemento_valor">- ${formatoMoneda(egreso.valor)}</div>
                <div class="elemento_porcentaje">${formatoPorcentaje(egreso.valor/totalEgresos())}</div>
                <div class="elemento_eliminar">
                    <button class="elemento_eliminar--btn">
                        <ion-icon name="close-circle-outline"
                            onclick='eliminarEgreso(${egreso.id})'
                        ></ion-icon>
                    </button>
                </div>
            </div>
        </div>
    `;

    return egresoHTML;
}


const eliminarIngreso = (id) =>
{
    let indiceEliminar = ingresos.findIndex(ingreso => ingreso.id  === id);
    ingresos.splice(indiceEliminar, 1);
    cargarCabecero();
    cargarIngresos();
}

const eliminarEgreso = (id) =>
{
    let indiceElimnar = egresos.findIndex(egreso => egreso.id === id);
    egresos.splice(indiceElimnar, 1);
    cargarCabecero();
    cargarEgresos();
}

let agregarDato = () =>
{
    let forma = document.forms['forma'];
    let tipo = forma['tipo'].value;
    let descripcion = forma['descripcion'].value;
    let valor = forma['valor'].value;

    if(descripcion !== '' && valor !== '')
    {
        if(tipo === 'ingreso')
        {
            ingresos.push(new Ingreso(descripcion, Number(valor)));

        }
        else if(tipo === 'egreso')
        {
            egresos.push(new Egreso(descripcion, Number(valor)));
        }

        cargarCabecero();
        cargarIngresos();
        cargarEgresos();
    }
}



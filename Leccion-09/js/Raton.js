class Raton extends DispositivoEntrada
{
    static contador = 0;

    constructor(tipoEntrada, marca)
    {
        super(tipoEntrada, marca);
        this._id = ++Raton.contador;
    }

    get id()
    {
        return this._id;
    }

}
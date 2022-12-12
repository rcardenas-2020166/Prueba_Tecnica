class Monitor
{
    static contador = 0;

    constructor(marca, tamano)
    {
        this._id = ++Monitor.contador;
        this._marca = marca;
        this._tamano = tamano;
    }

    get id()
    {
        return this._id;
    }

    get marca()
    {
        return this._marca;
    }

    set marca(marca)
    {
        this._marca = marca;
    }

    get tamano()
    {
        return this._tamano;
    }

    set tamano(tamano)
    {
        this._tamano = tamano;
    }
}